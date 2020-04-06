From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Apr 2020 22:16:36 +0200
Subject: [Buildroot] [git commit] support/testing: test_syslinux: remove
 BR2_TOOLCHAIN_EXTERNAL_LOCALE
Message-ID: <20200406200249.3AC988D1F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9cc3b0c7de19c826fe91e5d340c16528fbafc974
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BR2_TOOLCHAIN_EXTERNAL_LOCALE is only defined for uClibc based
custom external toolchains.

The test_syslinux is using a glibc toolchain, so the
"# BR2_TOOLCHAIN_EXTERNAL_LOCALE is not set" line disapear from
the generated dot config (.config) leading to an error due to
a new check in the testsuite infra.

There is the same problem with:
BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG=y
BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS=y
BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL=y

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/boot/test_syslinux.py | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/support/testing/tests/boot/test_syslinux.py b/support/testing/tests/boot/test_syslinux.py
index 4105e5edac..f25cddfb6c 100644
--- a/support/testing/tests/boot/test_syslinux.py
+++ b/support/testing/tests/boot/test_syslinux.py
@@ -24,12 +24,8 @@ class TestSysLinuxBase(infra.basetest.BRTest):
         BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--stable-2018.11-1.tar.bz2"
         BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
         BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
-        # BR2_TOOLCHAIN_EXTERNAL_LOCALE is not set
         BR2_TOOLCHAIN_EXTERNAL_CXX=y
         BR2_TOOLCHAIN_EXTERNAL_HAS_SSP=y
-        BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG=y
-        BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS=y
-        BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL=y
         BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
         """
 
