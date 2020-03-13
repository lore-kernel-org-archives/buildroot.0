From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Mar 2020 16:42:26 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] support/testing/glxinfo:
 explicitely enable GLX
Message-ID: <20200313152957.65A1A90AE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc9994e277f10a34d33318da12a3357941e47eba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Since [1], the GLX support is enabled by BR2_PACKAGE_MESA3D_OPENGL_GLX
symbol.

Since [2], only one swrast provider can be built.
Keep BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/400391349

[1] 5cb821d5635626b7327d5d704555c412e5ed5a1f
[2] 09a0a285076f544de335efc74c8904e464576575

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit faec5c583ec59e968fdb547aea93ab6ed001eb45)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
