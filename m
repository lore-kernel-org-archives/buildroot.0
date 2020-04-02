From: Romain Naour <romain.naour@gmail.com>
Date: Thu,  2 Apr 2020 23:57:18 +0200
Subject: [Buildroot] [PATCH] support/testing: update basic toolchain to
 bootlin bleeding-edge 2018.11-1
Message-ID: <20200402215718.161290-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the toolchain being used by the testsuite infra.

The new toolchain 2018.11-1 is based on gcc 8.2, uClibc-ng 1.0.30,
linux-headers 4.14 and binutils 2.31.1.
Enable BR2_TOOLCHAIN_HAS_THREADS_DEBUG that is now required.

The old toolchain 2017.05 is based on gcc 4.9, uClibc-ng 1.0.25,
linux-headers 3.10 and binutils 2.27.

Tested with gitlab
https://gitlab.com/kubu93/buildroot/pipelines/132376578

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
(note some tests failed but it's not related to the toolchain version bump)
---
 support/testing/infra/basetest.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 5dc6034447..a97a814441 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -11,11 +11,11 @@ BASIC_TOOLCHAIN_CONFIG = \
     BR2_TOOLCHAIN_EXTERNAL=y
     BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
     BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-    BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.05-1078-g95b1dae.tar.bz2"
-    BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
-    BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
+    BR2_TOOLCHAIN_EXTERNAL_URL="https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--uclibc--bleeding-edge-2018.11-1.tar.bz2"
+    BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
+    BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
     BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
-    # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
+    BR2_TOOLCHAIN_HAS_THREADS_DEBUG=y
     BR2_TOOLCHAIN_EXTERNAL_CXX=y
     """
 
-- 
2.25.1
