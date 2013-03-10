From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Sun, 10 Mar 2013 19:32:45 +0100
Subject: [Buildroot] [PATCH 04/10] directfb: fixing typo in variables
In-Reply-To: <1362940371-25899-1-git-send-email-c.schoenert@gmail.com>
References: <1362940371-25899-1-git-send-email-c.schoenert@gmail.com>
Message-ID: <1362940371-25899-5-git-send-email-c.schoenert@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carsten Schoenert <c.schoenert@gmail.com>

Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
---
 package/directfb/Config.in   |    4 ++--
 package/directfb/directfb.mk |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 796be37..23f4947 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -109,13 +109,13 @@ config BR2_PACKAGE_DIRECTFB_PNG
 	default y
 	select BR2_PACKAGE_LIBPNG
 
-config BR2_PACKAGE_DIRECTB_DITHER_RGB16
+config BR2_PACKAGE_DIRECTFB_DITHER_RGB16
 	bool "enable advanced dithering of RGB16 surfaces"
 	help
 	  Enable dithering when loading images to RGB16 surfaces.
 	  This increases the data section by 64 KBytes.
 
-config BR2_PACKAGE_DIRECTB_TESTS
+config BR2_PACKAGE_DIRECTFB_TESTS
 	bool "build directfb tests"
 
 endif # BR2_PACKAGE_DIRECTFB
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 8c701db..5ead084 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -108,13 +108,13 @@ else
 DIRECTFB_CONF_OPT += --disable-jpeg
 endif
 
-ifeq ($(BR2_PACKAGE_DIRECTB_DITHER_RGB16),y)
+ifeq ($(BR2_PACKAGE_DIRECTFB_DITHER_RGB16),y)
 DIRECTFB_CONF_OPT += --with-dither-rgb16=advanced
 else
 DIRECTFB_CONF_OPT += --with-dither-rgb16=none
 endif
 
-ifeq ($(BR2_PACKAGE_DIRECTB_TESTS),y)
+ifeq ($(BR2_PACKAGE_DIRECTFB_TESTS),y)
 DIRECTFB_CONF_OPT += --with-tests
 endif
 
-- 
1.7.10.4
