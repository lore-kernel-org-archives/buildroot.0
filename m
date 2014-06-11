From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Jun 2014 12:55:41 +0200
Subject: [Buildroot] [git commit] ti-gfx: bump to version 5_01_01_01 if
	EABIhf is used
Message-ID: <20140611111743.38B959B9C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e4b4c33cf891c153a9dbc662bef594e1c5d1f3a5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SDK 5_01_01_01 only support EABIhf so 5_01_00_01 is still used if
EABIhf is not available.

Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ti-gfx/ti-gfx.mk |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/ti-gfx/ti-gfx.mk b/package/ti-gfx/ti-gfx.mk
index 324e19c..4e83f1e 100644
--- a/package/ti-gfx/ti-gfx.mk
+++ b/package/ti-gfx/ti-gfx.mk
@@ -4,15 +4,17 @@
 #
 ################################################################################
 
-TI_GFX_VERSION = 5_01_00_01
-TI_GFX_SO_VERSION = 1.10.2359475
-
+# SDK 5_01_01_01 only support EABIhf so we downgrade to 5_01_00_01 if EABIhf is
+# not available.
 ifeq ($(BR2_ARM_EABIHF),y)
+TI_GFX_VERSION = 5_01_01_01
 TI_GFX_SOURCE = Graphics_SDK_setuplinux_hardfp_$(TI_GFX_VERSION).bin
 else
+TI_GFX_VERSION = 5_01_00_01
 TI_GFX_SOURCE = Graphics_SDK_setuplinux_softfp_$(TI_GFX_VERSION).bin
 endif
 
+TI_GFX_SO_VERSION = 1.10.2359475
 TI_GFX_SITE = http://downloads.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/$(TI_GFX_VERSION)/exports/
 TI_GFX_LICENSE = Technology / Software Publicly Available
 TI_GFX_LICENSE_FILES = TSPA.txt
