From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 19:48:30 +0200
Subject: [Buildroot] [git commit] support/testing: use more recent toolchains
Message-ID: <20171021174133.AAA7980E58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=193dfffa834a4cd76bc7b41089bd93d4c37dfc65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the hard disk crash of autobuild.b.o, we lost old toolchains, so
use the latest toolchains, which have been restored.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/testing/infra/basetest.py                | 5 ++---
 support/testing/tests/fs/test_iso9660.py         | 5 ++---
 support/testing/tests/toolchain/test_external.py | 6 +++---
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 5210f0a..7549226 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -11,12 +11,11 @@ BASIC_TOOLCHAIN_CONFIG = \
     BR2_TOOLCHAIN_EXTERNAL=y
     BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
     BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-    BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2015.05-1190-g4a48479.tar.bz2"
-    BR2_TOOLCHAIN_EXTERNAL_GCC_4_7=y
+    BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.05-1078-g95b1dae.tar.bz2"
+    BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
     BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
     BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
     # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
-    BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
     BR2_TOOLCHAIN_EXTERNAL_CXX=y
     """
 
diff --git a/support/testing/tests/fs/test_iso9660.py b/support/testing/tests/fs/test_iso9660.py
index 41430eb..0cb15ad 100644
--- a/support/testing/tests/fs/test_iso9660.py
+++ b/support/testing/tests/fs/test_iso9660.py
@@ -8,12 +8,11 @@ BASIC_CONFIG = \
     BR2_TOOLCHAIN_EXTERNAL=y
     BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
     BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-    BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-i386-pentium4-full-2015.05-496-g85945aa.tar.bz2"
-    BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
+    BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-i386-pentium4-full-2017.05-1078-g95b1dae.tar.bz2"
+    BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
     BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_2=y
     BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
     # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
-    BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
     BR2_TOOLCHAIN_EXTERNAL_CXX=y
     BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
     BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
diff --git a/support/testing/tests/toolchain/test_external.py b/support/testing/tests/toolchain/test_external.py
index 072cf00..881d2b0 100644
--- a/support/testing/tests/toolchain/test_external.py
+++ b/support/testing/tests/toolchain/test_external.py
@@ -171,9 +171,9 @@ class TestExternalToolchainBuildrootMusl(TestExternalToolchain):
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
         BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-        BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-musl-2017.05-444-g6c704ba.tar.bz2"
+        BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-musl-2017.05-1078-g95b1dae.tar.bz2"
         BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
-        BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_11=y
+        BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_12=y
         BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
         BR2_TOOLCHAIN_EXTERNAL_CXX=y
         """
@@ -222,7 +222,7 @@ class TestExternalToolchainBuildrootuClibc(TestExternalToolchain):
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
         BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-        BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.05-444-g6c704ba.tar.bz2"
+        BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.05-1078-g95b1dae.tar.bz2"
         BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
         BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
         BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
