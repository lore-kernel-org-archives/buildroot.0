From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Nov 2020 09:06:03 +0100
Subject: [Buildroot] [git commit branch/next] support/testing/test_syslinux:
 add missing Kconfig symbol
Message-ID: <20201117203827.900847FB95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ddf40cffeab1552d350a07c26129c9e83239399c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y is needed to use the
custom external toolchain x86-i686--glibc--bleeding-edge-2018.11-1.tar.bz2

Otherwise the symbol BR2_TOOLCHAIN_EXTERNAL_URL is lost.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/830981734
https://gitlab.com/buildroot.org/buildroot/-/jobs/830981733

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/boot/test_syslinux.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/tests/boot/test_syslinux.py b/support/testing/tests/boot/test_syslinux.py
index f25cddfb6c..467d564e18 100644
--- a/support/testing/tests/boot/test_syslinux.py
+++ b/support/testing/tests/boot/test_syslinux.py
@@ -6,6 +6,7 @@ class TestSysLinuxBase(infra.basetest.BRTest):
         """
         BR2_x86_i686=y
         BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
         BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
         BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--glibc--bleeding-edge-2018.11-1.tar.bz2"
         BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
