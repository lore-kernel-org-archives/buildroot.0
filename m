From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 May 2021 16:14:25 +0200
Subject: [Buildroot] [git commit branch/2021.02.x]
 testing/tests/package/test_openjdk.py: bump kernel version to 5.10.34
Message-ID: <20210508140507.219F386BE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a523755bfb6665c92965bf792875d43a5c85cd11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Kernel 4.16.7 is old enough to produce the "multiple definition of `yylloc'"
error which is fixed in newer versions.

Bump the test kernel version from 4.16.7 to 5.10.34 to prevent this error wwhen
building the test image.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ab2d472cde20c75cde9e48a0158c66afa102d190)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_openjdk.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_openjdk.py b/support/testing/tests/package/test_openjdk.py
index 3a1d1a9b09..26b7f9ee92 100644
--- a/support/testing/tests/package/test_openjdk.py
+++ b/support/testing/tests/package/test_openjdk.py
@@ -12,7 +12,7 @@ class TestOpenJdk(infra.basetest.BRTest):
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.34"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
         BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
