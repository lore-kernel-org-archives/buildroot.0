From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Mon, 3 May 2010 12:01:19 +0200
Subject: [Buildroot] [git commit master] directfb: added directfb tests
	installation option
Message-ID: <20100503100233.169088F456@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=58633266d53994737b469fe3205c7e138203a850
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/directfb/Config.in   |    3 +++
 package/directfb/directfb.mk |    9 ++++++++-
 2 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 7c41cdf..5e81b7e 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -98,4 +98,7 @@ config BR2_PACKAGE_DIRECTB_DITHER_RGB16
 	  Enable dithering when loading images to RGB16 surfaces.
 	  This increases the data section by 64 KBytes.
 
+config BR2_PACKAGE_DIRECTB_TESTS
+	bool "build directfb tests"
+
 endif # BR2_PACKAGE_DIRECTFB
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index c5d9c2b..ccb0c5a 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -121,6 +121,12 @@ else
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
@@ -146,7 +152,8 @@ DIRECTFB_CONF_OPT = \
 	--disable-sdl \
 	--disable-vnc \
 	--disable-video4linux \
-	--disable-video4linux2
+	--disable-video4linux2 \
+	$(DIRECTFB_TESTS)
 
 DIRECTFB_DEPENDENCIES = $(DIRECTFB_DEP) freetype $(DIRECTFB_FUSION)
 
-- 
1.6.3.3
