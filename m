From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Jan 2013 22:29:40 +0100
Subject: [Buildroot] [PATCH 28/28] webkit: remove X.org server dependency
In-Reply-To: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <eeaa9cf0f64ff3eeee4360332b54c188d6c4d50f.1357507764.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/webkit/webkit.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index a9701e4..d37601f 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -19,7 +19,7 @@ WEBKIT_CONF_ENV = ac_cv_path_icu_config=$(STAGING_DIR)/usr/bin/icu-config \
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
 	WEBKIT_CONF_OPT += --with-target=x11
-	WEBKIT_DEPENDENCIES += xserver_xorg-server xlib_libXt
+	WEBKIT_DEPENDENCIES += xlib_libXt
 else
 	WEBKIT_CONF_OPT += --with-target=directfb
 	WEBKIT_DEPENDENCIES += directfb
-- 
1.7.9.5
