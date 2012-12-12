From: victor.hiairrassary.ml at gmail.com <victor.hiairrassary.ml@gmail.com>
Date: Wed, 12 Dec 2012 08:50:11 +0100
Subject: [Buildroot] [PATCH] boost: bump to version 1.52.0
In-Reply-To: <1355298611-1770-1-git-send-email-victor.hiairrassary.ml@gmail.com>
References: <1355298611-1770-1-git-send-email-victor.hiairrassary.ml@gmail.com>
Message-ID: <1355298611-1770-2-git-send-email-victor.hiairrassary.ml@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Victor Hiairrassary <victor.hiairrassary.ml@gmail.com>
---
 package/boost/Config.in | 4 ++++
 package/boost/boost.mk  | 4 ++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 8798367..58e62a0 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -1,9 +1,13 @@
 comment "boost requires a toolchain with C++ support enabled"
 	depends on !BR2_INSTALL_LIBSTDCPP
 
+comment "boost requires a toolchain with large file support enabled"
+	depends on !BR2_LARGEFILE
+
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
-- 
1.8.0.1
