From: Will Newton <will.newton@gmail.com>
Date: Thu, 2 Feb 2012 11:28:11 +0000
Subject: [Buildroot] [PATCH] liboauth: Add new package
Message-ID: <CAFbHwiRh1gFDp1ktEK612jxreKo83vqM=JzPaAsq0R2WTBBswg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Newton <will.newton@imgtec.com>
---
 package/Config.in            |    1 +
 package/liboauth/Config.in   |   10 ++++++++++
 package/liboauth/liboauth.mk |   19 +++++++++++++++++++
 3 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 package/liboauth/Config.in
 create mode 100644 package/liboauth/liboauth.mk

diff --git a/package/Config.in b/package/Config.in
index c506df8..66ee266 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -350,6 +350,7 @@ source "package/libdnet/Config.in"
 source "package/libesmtp/Config.in"
 source "package/libeXosip2/Config.in"
 source "package/libidn/Config.in"
+source "package/liboauth/Config.in"
 source "package/libmicrohttpd/Config.in"
 source "package/neon/Config.in"
 source "package/libmnl/Config.in"
diff --git a/package/liboauth/Config.in b/package/liboauth/Config.in
new file mode 100644
index 0000000..77a78f1
--- /dev/null
+++ b/package/liboauth/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBOAUTH
+	bool "liboauth"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  liboauth is a collection of c functions implementing the oAuth
+	  Core 1.0 Rev A standard API. liboauth provides basic functions to
+	  escape and encode parameters according to oAuth specs and offers
+	  high-level functions to sign requests or verify signatures.
+
+	  http://liboauth.sourceforge.net/
diff --git a/package/liboauth/liboauth.mk b/package/liboauth/liboauth.mk
new file mode 100644
index 0000000..888470e
--- /dev/null
+++ b/package/liboauth/liboauth.mk
@@ -0,0 +1,19 @@
+#############################################################
+#
+# liboauth
+#
+#############################################################
+LIBOAUTH_VERSION = 0.9.6
+LIBOAUTH_SOURCE = liboauth-$(LIBOAUTH_VERSION).tar.gz
+LIBOAUTH_SITE = http://liboauth.sourceforge.net/pool
+LIBOAUTH_INSTALL_STAGING = YES
+
+LIBOAUTH_DEPENDENCIES += host-pkg-config openssl
+
+ifneq ($(BR2_PACKAGE_LIBCURL),y)
+LIBOAUTH_CONF_OPT += --disable-libcurl
+else
+LIBOAUTH_DEPENDENCIES += libcurl
+endif
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.1
-------------- next part --------------
