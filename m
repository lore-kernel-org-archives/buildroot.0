From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 10 Nov 2020 21:56:51 +0100
Subject: [Buildroot] [PATCH] support/testing/test_syslinux: add missing
 Kconfig symbol
Message-ID: <20201110205651.1135087-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y is needed to use the
custom external toolchain x86-i686--glibc--bleeding-edge-2018.11-1.tar.bz2

Otherwise the symbol BR2_TOOLCHAIN_EXTERNAL_URL is lost.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/830981734
https://gitlab.com/buildroot.org/buildroot/-/jobs/830981733

Signed-off-by: Romain Naour <romain.naour@gmail.com>
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
-- 
2.25.4
