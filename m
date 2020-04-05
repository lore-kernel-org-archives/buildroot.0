From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  6 Apr 2020 01:04:08 +0200
Subject: [Buildroot] [PATCH 1/7] support/testing: test_syslinux: fix flake8
 errors
Message-ID: <20200405230414.416403-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reported by gitlab:
https://gitlab.com/kubu93/buildroot/-/jobs/499374911

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/boot/test_syslinux.py | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/support/testing/tests/boot/test_syslinux.py b/support/testing/tests/boot/test_syslinux.py
index 6b1a8bc7d7..4105e5edac 100644
--- a/support/testing/tests/boot/test_syslinux.py
+++ b/support/testing/tests/boot/test_syslinux.py
@@ -1,13 +1,14 @@
 import infra.basetest
 
+
 class TestSysLinuxBase(infra.basetest.BRTest):
     x86_toolchain_config = \
         """
-	BR2_x86_i686=y
-	BR2_TOOLCHAIN_EXTERNAL=y
-	BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-	BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--glibc--bleeding-edge-2018.11-1.tar.bz2"
-	BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
+        BR2_x86_i686=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+        BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--glibc--bleeding-edge-2018.11-1.tar.bz2"
+        BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
         BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
         BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
         BR2_TOOLCHAIN_EXTERNAL_CXX=y
@@ -46,6 +47,7 @@ class TestSysLinuxBase(infra.basetest.BRTest):
         BR2_TARGET_SYSLINUX_EFI=y
         """
 
+
 class TestSysLinuxX86LegacyBios(TestSysLinuxBase):
     config = \
         TestSysLinuxBase.x86_toolchain_config + \
@@ -55,6 +57,7 @@ class TestSysLinuxX86LegacyBios(TestSysLinuxBase):
     def test_run(self):
         pass
 
+
 class TestSysLinuxX86EFI(TestSysLinuxBase):
     config = \
         TestSysLinuxBase.x86_toolchain_config + \
@@ -64,6 +67,7 @@ class TestSysLinuxX86EFI(TestSysLinuxBase):
     def test_run(self):
         pass
 
+
 class TestSysLinuxX86_64LegacyBios(TestSysLinuxBase):
     config = \
         TestSysLinuxBase.x86_64_toolchain_config + \
@@ -73,6 +77,7 @@ class TestSysLinuxX86_64LegacyBios(TestSysLinuxBase):
     def test_run(self):
         pass
 
+
 class TestSysLinuxX86_64EFI(TestSysLinuxBase):
     config = \
         TestSysLinuxBase.x86_64_toolchain_config + \
-- 
2.25.1
