From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Fri, 27 Jan 2017 00:02:37 +0100
Subject: [Buildroot] [PATCH] wine: Bump to version 2.0
Message-ID: <1485471757-29305-1-git-send-email-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/wine/wine.hash |  2 +-
 package/wine/wine.mk   | 15 +++++++++++----
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/package/wine/wine.hash b/package/wine/wine.hash
index a5297f0..b4b67cd 100644
--- a/package/wine/wine.hash
+++ b/package/wine/wine.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 b1797896eb3b63aab8a4753cc756d6211a0e85460146a1b52063ec79c13906d3 wine-1.8.6.tar.bz2
+sha256 9756f5a2129b6a83ba701e546173cbff86caa671b0af73eb8f72c03b20c066c6 wine-2.0.tar.bz2
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 1947daa..f9b2e1a 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-WINE_VERSION = 1.8.6
+WINE_VERSION = 2.0
 WINE_SOURCE = wine-$(WINE_VERSION).tar.bz2
-WINE_SITE = https://dl.winehq.org/wine/source/1.8
+WINE_SITE = https://dl.winehq.org/wine/source/2.0
 WINE_LICENSE = LGPLv2.1+
 WINE_LICENSE_FILES = COPYING.LIB LICENSE
 WINE_DEPENDENCIES = host-bison host-flex host-wine
@@ -85,9 +85,9 @@ else
 WINE_CONF_OPTS += --without-gnutls
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE),y)
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
 WINE_CONF_OPTS += --with-gstreamer
-WINE_DEPENDENCIES += gst-plugins-base
+WINE_DEPENDENCIES += gst1-plugins-base
 else
 WINE_CONF_OPTS += --without-gstreamer
 endif
@@ -221,6 +221,13 @@ else
 WINE_CONF_OPTS += --without-tiff
 endif
 
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+WINE_CONF_OPTS += --with-udev
+WINE_DEPENDENCIES += udev
+else
+WINE_CONF_OPTS += --without-udev
+endif
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
 WINE_CONF_OPTS += --with-x
 WINE_DEPENDENCIES += xlib_libX11
-- 
2.7.4
