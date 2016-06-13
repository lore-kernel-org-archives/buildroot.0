From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 13 Jun 2016 20:37:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/libmicrohttpd: Fix build with c99
	compilers
Message-ID: <1465843047-30583-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/734/734652bbdd7b6b18a8d67a30fe03bed62cd644e7/
http://autobuild.buildroot.net/results/d03/d03d36bfd4a97ff8091a815a45b4670bff992233/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libmicrohttpd/libmicrohttpd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 84bb6b1..c53676f 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -9,6 +9,7 @@ LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_INSTALL_STAGING = YES
 LIBMICROHTTPD_CONF_OPTS = --disable-curl --disable-examples
+LIBMICROHTTPD_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
 
 ifeq ($(BR2_PACKAGE_LIBMICROHTTPD_SSL),y)
 LIBMICROHTTPD_LICENSE = LGPLv2.1+
-- 
2.8.1
