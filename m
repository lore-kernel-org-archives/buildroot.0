From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 24 Oct 2017 11:15:06 -0400
Subject: [Buildroot] [PATCH 2/2] boost: add help messages to libraries
In-Reply-To: <20171024151506.18116-1-aduskett@gmail.com>
References: <20171024151506.18116-1-aduskett@gmail.com>
Message-ID: <20171024151506.18116-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All of the help messages come from http://www.boost.org/doc/libs/1_65_1/

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/boost/Config.in | 102 +++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 101 insertions(+), 1 deletion(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index e69e6c64af..8610932248 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -52,12 +52,18 @@ config BR2_PACKAGE_BOOST_LAYOUT
 
 config BR2_PACKAGE_BOOST_ATOMIC
 	bool "boost-atomic"
+	help
+	  C++11-style atomic<>.
 
 config BR2_PACKAGE_BOOST_CHRONO
 	bool "boost-chrono"
+	help
+	  Useful time utilities. C++11.
 
 config BR2_PACKAGE_BOOST_CONTAINER
 	bool "boost-container"
+	help
+	  Standard library containers and extensions.
 
 # see
 # http://www.boost.org/doc/libs/1_59_0/libs/context/doc/html/context/architectures.html
@@ -68,37 +74,64 @@ config BR2_PACKAGE_BOOST_CONTEXT
 	depends on ((BR2_arm || BR2_armeb) && BR2_ARM_CPU_HAS_ARM) || \
 		BR2_i386 || BR2_mips || BR2_mipsel || BR2_powerpc || BR2_x86_64
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+	help
+	  C++11 context switching library.
 
 config BR2_PACKAGE_BOOST_COROUTINE
 	bool "boost-coroutine"
 	depends on BR2_PACKAGE_BOOST_CONTEXT
+	help
+	  deprecated coroutine library, the non-depricated coroutine2
+	  library is a header-only library and does not need to be
+	  selected.
 
 config BR2_PACKAGE_BOOST_DATE_TIME
 	bool "boost-date_time"
+	help
+	  A set of date-time libraries based on generic programming
+	  concepts.
 
 config BR2_PACKAGE_BOOST_EXCEPTION
 	bool "boost-exception"
+	help
+	  The Boost Exception library supports transporting of arbitrary
+	  data in exception objects, and transporting of exceptions
+	  between threads.
 
 config BR2_PACKAGE_BOOST_FIBER
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	bool "boost-fiber"
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	help
+	  C++11 userland threads library.
 
 comment "boost-fiber needs a toolchain w/ NPTL"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
 config BR2_PACKAGE_BOOST_FILESYSTEM
 	bool "boost-filesystem"
+	help
+	  The Boost Filesystem Library provides portable facilities to
+	  query and manipulate paths, files, and directories.
 
 config BR2_PACKAGE_BOOST_GRAPH
 	bool "boost-graph"
+	help
+	  The BGL graph interface and graph components are generic, in
+	  the same sense as the the Standard Template Library (STL).
 
 config BR2_PACKAGE_BOOST_GRAPH_PARALLEL
 	bool "boost-graph_parallel"
+	help
+	  The PBGL graph interface and graph components are generic, in
+	  the same sense as the the Standard Template Library (STL).
 
 config BR2_PACKAGE_BOOST_IOSTREAMS
 	bool "boost-iostreams"
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_ZLIB
+	help
+	  Boost.IOStreams provides a framework for defining streams,
+	  stream buffers and i/o filters.
 
 config BR2_PACKAGE_BOOST_LOCALE
 	bool "boost-locale"
@@ -112,6 +145,8 @@ config BR2_PACKAGE_BOOST_LOCALE
 	# details.
 	depends on !(BR2_STATIC_LIBS && BR2_PACKAGE_ICU)
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	help
+	  Provide localization and Unicode handling tools for C++.
 
 comment "boost-locale needs a toolchain w/ dynamic library"
 	depends on BR2_PACKAGE_ICU
@@ -123,6 +158,8 @@ config BR2_PACKAGE_BOOST_LOG
 	# for some reason, uClibc on PowerPC fails to build the boost
 	# log module
 	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC)
+	help
+	  Logging library.
 
 comment "boost-log needs a toolchain w/ NPTL"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -130,33 +167,79 @@ comment "boost-log needs a toolchain w/ NPTL"
 
 config BR2_PACKAGE_BOOST_MATH
 	bool "boost-math"
+	help
+	  Boost.Math includes several contributions in the domain of
+	  mathematics:
+
+	  The Greatest Common Divisor and Least Common
+	  Multiple library provides run-time and compile-time evaluation
+	  of the greatest common divisor (GCD) or least common multiple
+	  (LCM) of two integers.
+
+	  The Special Functions library currently provides eight
+	  templated special functions, in namespace boost.
+
+	  The Complex Number Inverse Trigonometric Functions are the
+	  inverses of trigonometric functions currently present in the
+	  C++ standard.
+
+	  Quaternions are a relative of complex numbers often used to
+	  parameterise rotations in three dimentional space.
+
+	  Octonions, like quaternions, are a relative of complex
+	  numbers.
 
 config BR2_PACKAGE_BOOST_METAPARSE
 	bool "boost-metaparse"
 	depends on BR2_USE_MMU # boost-test
 	select BR2_PACKAGE_BOOST_TEST
+	help
+	  A library for generating compile time parsers parsing embedded
+	  DSL code as part of the C++ compilation process
 
 config BR2_PACKAGE_BOOST_MPI
 	bool "boost-mpi"
+	help
+	  Message Passing Interface library, for use in
+	  distributed-memory parallel application programming.
 
 config BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	bool "boost-program_options"
+	help
+	  The program_options library allows program developers to
+	  obtain program options, that is (name, value) pairs from the
+	  user, via conventional methods such as command line and config
+	  file.
 
 config BR2_PACKAGE_BOOST_PYTHON
 	bool "boost-python"
 	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	help
+	  The Boost Python Library is a framework for interfacing Python
+	  and C++. It allows you to quickly and seamlessly expose C++
+	  classes functions and objects to Python, and vice-versa,
+	  using no special tools -- just your C++ compiler.
 
 config BR2_PACKAGE_BOOST_RANDOM
 	bool "boost-random"
+	help
+	  A complete system for random number generation.
 
 config BR2_PACKAGE_BOOST_REGEX
 	bool "boost-regex"
+	help
+	  A new infrastructure for generic algorithms that builds on top
+	  of the new iterator concepts.
 
 config BR2_PACKAGE_BOOST_SERIALIZATION
 	bool "boost-serialization"
+	help
+	  Serialization for persistence and marshalling.
 
 config BR2_PACKAGE_BOOST_SIGNALS
 	bool "boost-signals"
+	help
+	  Managed signals & slots callback implementation.
 
 config BR2_PACKAGE_BOOST_STACKTRACE
 	bool "boost-stacktrace"
@@ -169,24 +252,41 @@ comment "boost-stacktrace needs a toolchain w/ dynamic library"
 
 config BR2_PACKAGE_BOOST_SYSTEM
 	bool "boost-system"
+	help
+	  Operating system support, including the diagnostics support
+	  that will be part of the C++0x standard library.
 
 config BR2_PACKAGE_BOOST_TEST
 	bool "boost-test"
 	depends on BR2_USE_MMU # fork()
+	help
+	  Support for simple program testing, full unit testing, and for
+	  program execution monitoring.
 
 config BR2_PACKAGE_BOOST_THREAD
 	bool "boost-thread"
+	help
+	  Portable C++ multi-threading. C++11, C++14.
 
 config BR2_PACKAGE_BOOST_TIMER
 	bool "boost-timer"
+	help
+	  Event timer, progress timer, and progress display classes.
 
 config BR2_PACKAGE_BOOST_TYPE_ERASURE
 	bool "boost-type_erasure"
+	help
+	  Runtime polymorphism based on concepts.
 
 config BR2_PACKAGE_BOOST_WAVE
 	bool "boost-wave"
 	# limitation of assembler for coldfire
 	# error: Tried to convert PC relative branch to absolute jump
 	depends on !BR2_m68k_cf
+	help
+	  The Boost.Wave library is a Standards conformant, and highly
+	  configurable implementation of the mandated C99/C++
+	  preprocessor functionality packed behind an easy to use
+	  iterator interface.
 
 endif
-- 
2.13.6
