From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 18 Jul 2013 13:09:57 +0200
Subject: [Buildroot] [git commit] ti-gfx: use BR2_ARM_EABIHF
Message-ID: <20130718111043.48E529A178@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c34cd9e2dab7c37bb0bdea6f43e57addf2b710e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ti-gfx/Config.in |    5 -----
 package/ti-gfx/ti-gfx.mk |    2 +-
 2 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/package/ti-gfx/Config.in b/package/ti-gfx/Config.in
index a37705c..f336c52 100644
--- a/package/ti-gfx/Config.in
+++ b/package/ti-gfx/Config.in
@@ -28,11 +28,6 @@ config BR2_PACKAGE_TI_GFX_EGLIMAGE
 	help
 	  Installs OpenGL libaries which support the eglimage api.
 
-config BR2_PACKAGE_TI_GFX_HARD_FLOAT
-	bool "use hard float binaries"
-	help
-	  Install hard float binaries (required if using a hard float toolchain)
-
 choice
 	prompt "Target"
 	default BR2_PACKAGE_TI_GFX_ES3
diff --git a/package/ti-gfx/ti-gfx.mk b/package/ti-gfx/ti-gfx.mk
index 0838bde..7713990 100644
--- a/package/ti-gfx/ti-gfx.mk
+++ b/package/ti-gfx/ti-gfx.mk
@@ -7,7 +7,7 @@
 TI_GFX_VERSION = 4_09_00_01
 TI_GFX_SO_VERSION = 1.9.2188537
 
-ifeq ($(BR2_PACKAGE_TI_GFX_HARD_FLOAT),y)
+ifeq ($(BR2_ARM_EABIHF),y)
 TI_GFX_SOURCE = Graphics_SDK_setuplinux_$(TI_GFX_VERSION)_hardfp_minimal_demos.bin
 else
 TI_GFX_SOURCE = Graphics_SDK_setuplinux_$(TI_GFX_VERSION)_minimal_demos.bin
