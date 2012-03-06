From: rolandu at gmail.com <rolandu@gmail.com>
Date: Tue,  6 Mar 2012 19:18:48 +0200
Subject: [Buildroot] [PATCH] Make libmicrohttpd version configurable
Message-ID: <1331054328-6564-1-git-send-email-rolandu@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Roland Uuesoo <roland@martem.eu>

Signed-off-by: Roland Uuesoo <roland@martem.eu>
---
 package/libmicrohttpd/Config.in        |    7 +++++++
 package/libmicrohttpd/libmicrohttpd.mk |    2 +-
 2 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/package/libmicrohttpd/Config.in b/package/libmicrohttpd/Config.in
index cfedc8f..96cd408 100644
--- a/package/libmicrohttpd/Config.in
+++ b/package/libmicrohttpd/Config.in
@@ -6,6 +6,13 @@ config BR2_PACKAGE_LIBMICROHTTPD
 
 	  http://www.gnu.org/software/libmicrohttpd/
 
+config BR2_PACKAGE_LIBMICROHTTPD_VERSION
+	string "libmicrohttpd version"
+	depends on BR2_PACKAGE_LIBMICROHTTPD
+	default 0.4.6
+	help
+	  Specify libmicrohttpd version
+
 config BR2_PACKAGE_LIBMICROHTTPD_SSL
        bool "https support"
        depends on BR2_PACKAGE_LIBMICROHTTPD
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index ff2b55d..739d779 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -3,7 +3,7 @@
 # libmicrohttpd
 #
 #############################################################
-LIBMICROHTTPD_VERSION = 0.4.6
+LIBMICROHTTPD_VERSION = $(BR2_PACKAGE_LIBMICROHTTPD_VERSION)
 LIBMICROHTTPD_SOURCE = libmicrohttpd-$(LIBMICROHTTPD_VERSION).tar.gz
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_INSTALL_STAGING = YES
-- 
1.7.5.4
