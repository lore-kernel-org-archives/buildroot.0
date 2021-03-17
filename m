From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 17 Mar 2021 18:00:32 +0100
Subject: [Buildroot] [PATCH v2] package/libcamera: disable package affected
 by binutils bug 27597
In-Reply-To: <20210317174530.15bd89ac@windsurf.home>
References: <20210317174530.15bd89ac@windsurf.home>
Message-ID: <20210317170032.1944665-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package is affected by binutils bug 27597 and no work around has
been found, so let's disable it if
BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597=y.

Fixes:
http://autobuild.buildroot.net/results/8ac/8ac599392f773eecff4773393ef0d0232a22f372/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* move BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597 under BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
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
-- 
2.25.1
