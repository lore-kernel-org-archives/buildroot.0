From: Romain Naour <romain.naour@smile.fr>
Date: Thu, 13 Feb 2020 22:40:45 +0100
Subject: [Buildroot] [PATCH] support/testing/glxinfo: explicitely enable GLX
Message-ID: <20200213214045.535684-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since [1], the GLX support is enabled by BR2_PACKAGE_MESA3D_OPENGL_GLX
symbol.

Since [2], only one swrast provider can be built.
Keep BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/400391349

[1] 5cb821d5635626b7327d5d704555c412e5ed5a1f
[2] 09a0a285076f544de335efc74c8904e464576575

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
To be backported to 2019.11.x
---
 support/testing/tests/package/test_glxinfo.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_glxinfo.py b/support/testing/tests/package/test_glxinfo.py
index 5a28411f49..a9df6ddf6f 100644
--- a/support/testing/tests/package/test_glxinfo.py
+++ b/support/testing/tests/package/test_glxinfo.py
@@ -29,8 +29,8 @@ class TestGlxinfo(infra.basetest.BRTest):
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux.config"
         BR2_PACKAGE_MESA3D_DEMOS=y
         BR2_PACKAGE_MESA3D=y
-        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
         BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
+        BR2_PACKAGE_MESA3D_OPENGL_GLX=y
         BR2_PACKAGE_XORG7=y
         BR2_PACKAGE_XSERVER_XORG_SERVER=y
         BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-- 
2.24.1
