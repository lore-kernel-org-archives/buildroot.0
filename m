From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  4 Dec 2015 11:02:44 -0300
Subject: [Buildroot] [PATCH] libmicrohttpd: bump to version 0.9.47
Message-ID: <1449237764-6951-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Experimental SPDY support was dropped so drop the configure option.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libmicrohttpd/libmicrohttpd.hash | 2 +-
 package/libmicrohttpd/libmicrohttpd.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index 5594cba..d4a68cd 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	06dbd2654f390fa1e8196fe063fc1449a6c2ed65a38199a49bf29ad8a93b8979	libmicrohttpd-0.9.46.tar.gz
+sha256	96bdab4352a09fd3952a346bc01898536992f50127d0adea1c3096a8ec9f658c	libmicrohttpd-0.9.47.tar.gz
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 3e8bbb1..302720d 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 0.9.46
+LIBMICROHTTPD_VERSION = 0.9.47
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_INSTALL_STAGING = YES
-LIBMICROHTTPD_CONF_OPTS = --disable-curl --disable-spdy --disable-examples
+LIBMICROHTTPD_CONF_OPTS = --disable-curl --disable-examples
 
 ifeq ($(BR2_PACKAGE_LIBMICROHTTPD_SSL),y)
 LIBMICROHTTPD_LICENSE = LGPLv2.1+
-- 
2.4.10
