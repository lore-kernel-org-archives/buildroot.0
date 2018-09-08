From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 22:38:41 +0200
Subject: [Buildroot] [git commit] synergy: change upstream location to fix
 download
Message-ID: <20180908203915.2FDC783703@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b20ac5f7261a63dc78be3d59d1af9059fe758792
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Github repository at https://github.com/symless/synergy no longer
exists, it has apparently been moved to
https://github.com/symless/synergy-core.

Fixes:

  http://autobuild.buildroot.net/results/77f43b5937f102822a5b4644551222fda62fa129/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/synergy/Config.in  | 2 +-
 package/synergy/synergy.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/synergy/Config.in b/package/synergy/Config.in
index 6005363dcb..e0ac246155 100644
--- a/package/synergy/Config.in
+++ b/package/synergy/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_SYNERGY
 	  operating systems, each with its own display,
 	  without special hardware.
 
-	  https://github.com/symless/synergy/
+	  https://github.com/symless/synergy-core/
 
 comment "synergy needs a toolchain w/ C++, wchar"
 	depends on BR2_PACKAGE_XORG7
diff --git a/package/synergy/synergy.mk b/package/synergy/synergy.mk
index d357415689..7f1dc79874 100644
--- a/package/synergy/synergy.mk
+++ b/package/synergy/synergy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SYNERGY_VERSION = v2.0.12-beta
-SYNERGY_SITE = $(call github,symless,synergy,$(SYNERGY_VERSION))
+SYNERGY_SITE = $(call github,symless,synergy-core,$(SYNERGY_VERSION))
 SYNERGY_LICENSE = GPL-2.0
 SYNERGY_LICENSE_FILES = LICENSE
 SYNERGY_DEPENDENCIES = xlib_libX11 xlib_libXtst
