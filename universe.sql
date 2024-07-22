--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    anz_stars bigint,
    age_in_mil numeric(10,0),
    durchmesser_ly integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(100) NOT NULL,
    is_spiral boolean NOT NULL,
    is_elliptical boolean,
    description text
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    earth_masses double precision,
    radius double precision
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    earth_masses double precision,
    anz_moons integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    anz_planets integer,
    age_in_mil numeric(10,0),
    dist_from_earth_ly numeric(10,2)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milchstrasse', 100000000000, 13600, 105700);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1000000000000, 10100, 220000);
INSERT INTO public.galaxy VALUES (3, 'Magellansche Wolken', 30000000, 13000, 14000);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 40000000, 13600, 60000);
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 1200000000000, 13000, 980000);
INSERT INTO public.galaxy VALUES (6, 'Sombrero-Galaxie', 800000000000, 13000, 49000);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral', true, NULL, NULL);
INSERT INTO public.galaxy_type VALUES (2, 'Elliptical', false, NULL, NULL);
INSERT INTO public.galaxy_type VALUES (3, 'Irregular', false, NULL, NULL);
INSERT INTO public.galaxy_type VALUES (4, 'Spiral', true, false, NULL);
INSERT INTO public.galaxy_type VALUES (5, 'Elliptical', false, true, NULL);
INSERT INTO public.galaxy_type VALUES (6, 'Irregular', false, false, NULL);
INSERT INTO public.galaxy_type VALUES (7, 'Lenticular', false, true, NULL);
INSERT INTO public.galaxy_type VALUES (8, 'Dwarf', false, false, NULL);
INSERT INTO public.galaxy_type VALUES (9, 'Spiral', true, false, 'A galaxy with a spiral structure.');
INSERT INTO public.galaxy_type VALUES (10, 'Elliptical', false, true, 'A galaxy with an ellipsoidal shape.');
INSERT INTO public.galaxy_type VALUES (11, 'Irregular', false, false, 'A galaxy with no regular shape.');
INSERT INTO public.galaxy_type VALUES (12, 'Lenticular', false, true, 'A galaxy with a lens-like shape.');
INSERT INTO public.galaxy_type VALUES (13, 'Dwarf', false, false, 'A small galaxy with few stars.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Mond', 0.0123, 1737.1);
INSERT INTO public.moon VALUES (2, 4, 'Phobos', 1.8e-08, 11.2667);
INSERT INTO public.moon VALUES (3, 4, 'Deimos', 1.8e-09, 6.2);
INSERT INTO public.moon VALUES (4, 1, 'Europa', 0.008, 1560.8);
INSERT INTO public.moon VALUES (5, 1, 'Ganymed', 0.025, 2634.1);
INSERT INTO public.moon VALUES (6, 1, 'Io', 0.015, 1821.6);
INSERT INTO public.moon VALUES (7, 2, 'Callisto', 0.018, 2410.3);
INSERT INTO public.moon VALUES (8, 5, 'Titan', 0.0225, 2574.73);
INSERT INTO public.moon VALUES (9, 5, 'Rhea', 0.002306, 763.8);
INSERT INTO public.moon VALUES (10, 5, 'Iapetus', 0.000181, 734.5);
INSERT INTO public.moon VALUES (11, 6, 'Triton', 0.0036, 1353.4);
INSERT INTO public.moon VALUES (12, 6, 'Nereid', 4.3e-07, 170);
INSERT INTO public.moon VALUES (13, 7, 'Oberon', 0.000277, 761.4);
INSERT INTO public.moon VALUES (14, 7, 'Titania', 0.00035, 788.4);
INSERT INTO public.moon VALUES (15, 8, 'Umbriel', 0.000121, 584.7);
INSERT INTO public.moon VALUES (16, 8, 'Ariel', 0.000179, 578.9);
INSERT INTO public.moon VALUES (17, 8, 'Miranda', 6.6e-05, 235.8);
INSERT INTO public.moon VALUES (18, 9, 'Enceladus', 0.00018, 252.1);
INSERT INTO public.moon VALUES (19, 9, 'Mimas', 3.5e-05, 198.2);
INSERT INTO public.moon VALUES (20, 10, 'Hyperion', 1.5e-05, 135);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Merkur', 0.055, 0);
INSERT INTO public.planet VALUES (2, 1, 'Venus', 0.815, 0);
INSERT INTO public.planet VALUES (3, 1, 'Erde', 1, 1);
INSERT INTO public.planet VALUES (4, 1, 'Mars', 0.107, 2);
INSERT INTO public.planet VALUES (5, 2, 'Proxima b', 1.27, 0);
INSERT INTO public.planet VALUES (6, 3, 'Alpha Centauri Bb', 1.1, 0);
INSERT INTO public.planet VALUES (7, 3, 'Alpha Centauri Bc', 0.92, 0);
INSERT INTO public.planet VALUES (8, 4, 'Andromeda A I', 2.3, 1);
INSERT INTO public.planet VALUES (9, 4, 'Andromeda A II', 3.5, 2);
INSERT INTO public.planet VALUES (10, 5, 'Andromeda B I', 0.98, 0);
INSERT INTO public.planet VALUES (11, 6, 'Andromeda C I', 1.6, 3);
INSERT INTO public.planet VALUES (12, 6, 'Andromeda C II', 4.2, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sonne', 8, 4600, 0.00);
INSERT INTO public.star VALUES (2, 1, 'Proxima Centauri', 1, 4850, 4.24);
INSERT INTO public.star VALUES (3, 1, 'Alpha Centauri A', 3, 4850, 4.37);
INSERT INTO public.star VALUES (4, 2, 'Andromeda A', 5, 5000, 2537000.00);
INSERT INTO public.star VALUES (5, 2, 'Andromeda B', 2, 5200, 2537000.00);
INSERT INTO public.star VALUES (6, 2, 'Andromeda C', 4, 5300, 2537000.00);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, true);


--
-- Name: galaxy_type_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_type_id_seq', 13, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: galaxy_type galaxy_type_type_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_type_id_key UNIQUE (galaxy_type_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

