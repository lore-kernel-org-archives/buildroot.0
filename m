From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue,  9 Jan 2018 23:46:01 +0100
Subject: [Buildroot] [PATCH] boost: bump to version 1.66.0
Message-ID: <20180109224601.29891-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop the metaparse module as it is header only library now. No need for
legacy handling as the module is available unconditionally in Boost.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/boost/Config.in  | 8 --------
 package/boost/boost.hash | 4 ++--
 package/boost/boost.mk   | 3 +--
 3 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 8925982ba8..0755d9c010 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -192,14 +192,6 @@ config BR2_PACKAGE_BOOST_MATH
 	  Octonions, like quaternions, are a relative of complex
 	  numbers.
 
-config BR2_PACKAGE_BOOST_METAPARSE
-	bool "boost-metaparse"
-	depends on BR2_USE_MMU # boost-test
-	select BR2_PACKAGE_BOOST_TEST
-	help
-	  A library for generating compile time parsers parsing embedded
-	  DSL code as part of the C++ compilation process
-
 config BR2_PACKAGE_BOOST_MPI
 	bool "boost-mpi"
 	help
diff --git a/package/boost/boost.hash b/package/boost/boost.hash
index 6e40c0d3b4..7eb675d5b1 100644
--- a/package/boost/boost.hash
+++ b/package/boost/boost.hash
@@ -1,5 +1,5 @@
-# From http://www.boost.org/users/history/version_1_65_1.html
-sha256 9807a5d16566c57fd74fb522764e0b134a8bbe6b6e8967b83afefd30dcd3be81  boost_1_65_1.tar.bz2
+# From http://www.boost.org/users/history/version_1_66_0.html
+sha256 5721818253e6a0989583192f96782c4a98eb6204965316df9f5ad75819225ca9  boost_1_66_0.tar.bz2
 
 # Locally computed
 sha256 c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE_1_0.txt
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 864a07f789..9ad83d5aeb 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOST_VERSION = 1.65.1
+BOOST_VERSION = 1.66.0
 BOOST_SOURCE = boost_$(subst .,_,$(BOOST_VERSION)).tar.bz2
 BOOST_SITE = http://downloads.sourceforge.net/project/boost/boost/$(BOOST_VERSION)
 BOOST_INSTALL_STAGING = YES
@@ -34,7 +34,6 @@ BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_IOSTREAMS),,iostreams)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_LOCALE),,locale)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_LOG),,log)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_MATH),,math)
-BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_METAPARSE),,metaparse)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_MPI),,mpi)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_PROGRAM_OPTIONS),,program_options)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_PYTHON),,python)
-- 
2.15.1
