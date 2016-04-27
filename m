From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 27 Apr 2016 22:46:52 +0200
Subject: [Buildroot] [PATCH 2/4] package/efl: bump to 1.17.0
In-Reply-To: <1461790014-17051-1-git-send-email-romain.naour@gmail.com>
References: <1461790014-17051-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1461790014-17051-2-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Autoreconf has been fixed upstream.
Update the untested configuration warning option.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/efl/efl.hash |  4 ++--
 package/efl/efl.mk   | 11 +++--------
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/package/efl/efl.hash b/package/efl/efl.hash
index 6673bb5..4afee33 100644
--- a/package/efl/efl.hash
+++ b/package/efl/efl.hash
@@ -1,2 +1,2 @@
-# From https://download.enlightenment.org/rel/libs/efl/efl-1.15.3.tar.xz.sha256
-sha256	3bac40e6294288034bd7f8902088bf1169cf376f6fd25b7a49854ab561630642	efl-1.15.3.tar.xz
+# From https://download.enlightenment.org/rel/libs/efl/efl-1.17.0.tar.xz.sha256
+sha256	c13540bad764d014fea2c079fad8fcca62e5c229994d43aa4eb692d2c9b73afe	efl-1.17.0.tar.xz
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 916999d..b1f1d90 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFL_VERSION = 1.15.3
+EFL_VERSION = 1.17.0
 EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
 EFL_SITE = http://download.enlightenment.org/rel/libs/efl
 EFL_LICENSE = BSD-2c, LGPLv2.1+, GPLv2+
@@ -22,11 +22,6 @@ EFL_INSTALL_STAGING = YES
 EFL_DEPENDENCIES = host-pkgconf host-efl host-luajit dbus freetype \
 	jpeg luajit udev util-linux zlib
 
-# Regenerate the autotools:
-#  - to fix an issue in eldbus-codegen: https://phab.enlightenment.org/T2718
-EFL_AUTORECONF = YES
-EFL_GETTEXTIZE = YES
-
 # Configure options:
 # --disable-cxx-bindings: disable C++11 bindings.
 # --disable-lua-old: build elua for the target.
@@ -47,7 +42,7 @@ EFL_CONF_OPTS = \
 
 # Disable untested configuration warning.
 ifeq ($(BR2_PACKAGE_EFL_HAS_RECOMMENDED_CONFIG),)
-EFL_CONF_OPTS += --enable-i-really-know-what-i-am-doing-and-that-this-will-probably-break-things-and-i-will-fix-them-myself-and-send-patches-aba
+EFL_CONF_OPTS += --enable-i-really-know-what-i-am-doing-and-that-this-will-probably-break-things-and-i-will-fix-them-myself-and-send-patches-abb
 endif
 
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),y)
@@ -273,6 +268,6 @@ HOST_EFL_CONF_OPTS += \
 	--with-glib=yes \
 	--with-opengl=none \
 	--with-x11=none \
-	--enable-i-really-know-what-i-am-doing-and-that-this-will-probably-break-things-and-i-will-fix-them-myself-and-send-patches-aba
+	--enable-i-really-know-what-i-am-doing-and-that-this-will-probably-break-things-and-i-will-fix-them-myself-and-send-patches-abb
 
 $(eval $(host-autotools-package))
-- 
2.5.5
