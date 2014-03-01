From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  1 Mar 2014 15:41:49 -0300
Subject: [Buildroot] [PATCH] libmicrohttpd: disable curl testcases
Message-ID: <1393699309-25956-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

They require a toolchain with IPv6. Fixes:
http://autobuild.buildroot.net/results/edb/edb1b5ee1ffaa6a495b4d7c2976f618c8331b5d2/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libmicrohttpd/libmicrohttpd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 95d066d..2312a4d 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -8,7 +8,7 @@ LIBMICROHTTPD_VERSION = 0.9.34
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_INSTALL_STAGING = YES
-LIBMICROHTTPD_CONF_OPT = --disable-spdy
+LIBMICROHTTPD_CONF_OPT = --disable-curl --disable-spdy
 
 ifeq ($(BR2_PACKAGE_LIBMICROHTTPD_SSL),y)
 LIBMICROHTTPD_LICENSE = LGPLv2.1+
-- 
1.8.3.2
