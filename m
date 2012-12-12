From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 12 Dec 2012 09:54:50 +0100
Subject: [Buildroot] [git commit] boost: bump to version 1.52.0
Message-ID: <20121212085524.4C59B9A1AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3bb1188b66c654c5a1841e14c46fbde1cadfe285
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: merge largefile comment with C++ one]
Signed-off-by: Victor Hiairrassary <victor.hiairrassary.ml@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 (x86_64 Sourcery toolchain)
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/boost/Config.in |    5 +++--
 package/boost/boost.mk  |    4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 8798367..fb5360e 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -1,9 +1,10 @@
-comment "boost requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "boost requires a toolchain with C++ and large file support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE
 
 config BR2_PACKAGE_BOOST
 	bool "boost"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_LARGEFILE
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_ZLIB
 	help
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 64856bc..005c7ca 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-BOOST_VERSION = 1.49.0
+BOOST_VERSION = 1.52.0
 BOOST_FILE_VERSION = $(subst .,_,$(BOOST_VERSION))
 BOOST_SOURCE = boost_$(BOOST_FILE_VERSION).tar.bz2
 BOOST_SITE = http://downloads.sourceforge.net/project/boost/boost/$(BOOST_VERSION)
@@ -15,7 +15,7 @@ TARGET_CC_VERSION = $(shell $(TARGET_CC) -dumpversion)
 BOOST_DEPENDENCIES = bzip2 zlib
 
 BOOST_FLAGS =
-BOOST_WITHOUT_FLAGS = python
+BOOST_WITHOUT_FLAGS = python context
 
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_DATE_TIME),,date_time)
