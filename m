From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jul 2010 16:46:23 +0200
Subject: [Buildroot] [PATCH 14/16] webkit: the X11 variant needs libXt
In-Reply-To: <cover.1280241791.git.thomas.petazzoni@free-electrons.com>
References: <cover.1280241791.git.thomas.petazzoni@free-electrons.com>
Message-ID: <99749e502ebba1c921e78e5bf163cce8e405e783.1280241791.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes bug #829.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/webkit/Config.in |    1 +
 package/webkit/webkit.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index d0231a6..343b4f9 100644
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
1.7.0.4
