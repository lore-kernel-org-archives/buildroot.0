From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 Dec 2020 22:27:59 +0100
Subject: [Buildroot] [git commit] package/boost: add BR2_PACKAGE_BOOST_NOWIDE
Message-ID: <20201228211056.2605982DE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=118d2c298bd57570df60eff64fdc5c62e14ad7e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

nowide library has been added in version 1.73.0 and is enabled by
default

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/boost/Config.in | 5 +++++
 package/boost/boost.mk  | 5 +++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 121650b8bc..ba5bffd94e 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -253,6 +253,11 @@ config BR2_PACKAGE_BOOST_MPI
 	  Message Passing Interface library, for use in
 	  distributed-memory parallel application programming.
 
+config BR2_PACKAGE_BOOST_NOWIDE
+	bool "boost-nowide"
+	help
+	  Library for cross-platform, unicode aware programming.
+
 config BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	bool "boost-program_options"
 	help
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 82fe42d6b2..365d4342b8 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -19,8 +19,8 @@ BOOST_IGNORE_CVES += CVE-2009-3654
 HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
 	--without-libraries=$(subst $(space),$(comma),atomic chrono context \
 	contract coroutine date_time exception filesystem graph graph_parallel \
-	iostreams locale log math mpi program_options python random regex \
-	serialization system test thread timer type_erasure wave)
+	iostreams locale log math mpi nowide program_options python random \
+	regex serialization system test thread timer type_erasure wave)
 
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_ATOMIC),,atomic)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
@@ -39,6 +39,7 @@ BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_LOCALE),,locale)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_LOG),,log)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_MATH),,math)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_MPI),,mpi)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_NOWIDE),,nowide)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_PROGRAM_OPTIONS),,program_options)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_PYTHON),,python)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_RANDOM),,random)
