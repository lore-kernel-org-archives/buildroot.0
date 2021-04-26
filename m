From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 26 Apr 2021 21:54:21 +0200
Subject: [Buildroot] [git commit] package/libcamera: disable package
 affected by binutils bug 27597
Message-ID: <20210426192739.8A79A7FE79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=479b09366cca3d4d697d221c5e347e5ab470ebcd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package is affected by binutils bug 27597 and no work around has
been found, so let's disable it if
BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597=y.

Fixes:
http://autobuild.buildroot.net/results/8ac/8ac599392f773eecff4773393ef0d0232a22f372/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libcamera/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
index b9c243084e..92c17df849 100644
--- a/package/libcamera/Config.in
+++ b/package/libcamera/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
 	default y
 	# Invalid packing size of ControlValue struct on m68k
 	depends on !BR2_m68k
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
 
 menuconfig BR2_PACKAGE_LIBCAMERA
 	bool "libcamera"
