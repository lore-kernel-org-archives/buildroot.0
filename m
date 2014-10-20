From: Yannick Kiekens <yannickkiekens@gmail.com>
Date: Mon, 20 Oct 2014 15:27:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/boost: enable building of boost_log
Message-ID: <1413811644-28525-1-git-send-email-yannickkiekens@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yannick Kiekens <yannickkiekens@gmail.com>
---
 package/boost/Config.in | 3 +++
 package/boost/boost.mk  | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index a15b849..5ac1d0e 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -85,6 +85,9 @@ config BR2_PACKAGE_BOOST_LOCALE
 comment "boost-locale needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
 
+config BR2_PACKAGE_BOOST_LOG
+        bool "boost-log"
+
 config BR2_PACKAGE_BOOST_MATH
 	bool "boost-math"
 
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 46a98e8..06969b4 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -25,8 +25,7 @@ HOST_BOOST_FLAGS = --without-icu \
 
 # atomic library compile only with upstream version, wait for next release
 # coroutine breaks on some weak toolchains and it's new for 1.54+
-# log breaks with some toolchain combinations and it's new for 1.54+
-BOOST_WITHOUT_FLAGS = atomic coroutine log
+BOOST_WITHOUT_FLAGS = atomic coroutine
 
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTEXT),,context)
@@ -37,6 +36,7 @@ BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_GRAPH),,graph)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_GRAPH_PARALLEL),,graph_parallel)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_IOSTREAMS),,iostreams)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_LOCALE),,locale)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_LOG),,log)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_MATH),,math)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_MPI),,mpi)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_PROGRAM_OPTIONS),,program_options)
-- 
1.9.1
