From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jul 2010 23:01:29 +0200
Subject: [Buildroot] [git commit master 1/1] webkit: the X11 variant needs
	libXt
Message-ID: <20100727210247.A2826835A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6e231c18f8678466ef39e1332f15f1c9fc01265e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes bug #829.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/webkit/Config.in |    1 +
 package/webkit/webkit.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index c1ade50..812e6f2 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_WEBKIT
 	select BR2_PACKAGE_LIBSOUP
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_LIBGAIL
+	select BR2_PACKAGE_XLIB_LIBXT if BR2_PACKAGE_XORG7
 	help
 	  WebKit is an open source, standards compliant web browser engine.
 
diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index 648ba31..247ce77 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -17,7 +17,7 @@ WEBKIT_CONF_ENV = ac_cv_path_icu_config=$(STAGING_DIR)/usr/bin/icu-config
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
 	WEBKIT_CONF_OPT += --with-target=x11
-	WEBKIT_DEPENDENCIES += xserver_xorg-server
+	WEBKIT_DEPENDENCIES += xserver_xorg-server xlib_libXt
 endif
 
 ifeq ($(BR2_PACKAGE_DIRECTFB),y)
-- 
1.7.1
