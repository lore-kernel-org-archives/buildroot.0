From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Fri, 30 Apr 2010 02:58:47 +0200
Subject: [Buildroot] [PATCH 4/6] directfb: added directfb tests installation
	option
In-Reply-To: <1272589129-21443-1-git-send-email-llandwerlin@gmail.com>
References: <1272589129-21443-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1272589129-21443-5-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/directfb/Config.in   |    3 +++
 package/directfb/directfb.mk |    9 ++++++++-
 2 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 8e00f14..c4e920d 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -102,4 +102,7 @@ config BR2_PACKAGE_DIRECTB_DITHER_RGB16
 	  Enable dithering when loading images to RGB16 surfaces.
 	  This increases the data section by 64 KBytes.
 
+config BR2_PACKAGE_DIRECTB_TESTS
+	bool "build directfb tests"
+
 endif # BR2_PACKAGE_DIRECTFB
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index a065a22..9b1cecf 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -126,6 +126,12 @@ else
 DIRECTFB_DITHER_RGB16:=--with-dither-rgb16=none
 endif
 
+ifeq ($(BR2_PACKAGE_DIRECTB_TESTS),y)
+DIRECTFB_TESTS:=--with-tests
+else
+DIRECTFB_TESTS:=
+endif
+
 DIRECTFB_CONF_OPT = \
 	--localstatedir=/var \
 	--with-gfxdrivers=$(DIRECTFB_GFX) \
@@ -151,7 +157,8 @@ DIRECTFB_CONF_OPT = \
 	--disable-sdl \
 	--disable-vnc \
 	--disable-video4linux \
-	--disable-video4linux2
+	--disable-video4linux2 \
+	$(DIRECTFB_TESTS)
 
 DIRECTFB_DEPENDENCIES = $(DIRECTFB_DEP) freetype $(DIRECTFB_FUSION)
 
-- 
1.7.0.4
