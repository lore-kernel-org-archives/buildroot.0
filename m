From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  6 Apr 2020 01:04:10 +0200
Subject: [Buildroot] [PATCH 3/7] support/testing: test_glxinfo: remove
 BR2_TOOLCHAIN_EXTERNAL_LOCALE
In-Reply-To: <20200405230414.416403-1-romain.naour@gmail.com>
References: <20200405230414.416403-1-romain.naour@gmail.com>
Message-ID: <20200405230414.416403-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The BR2_TOOLCHAIN_EXTERNAL_LOCALE is only defined for uClibc based
custom external toolchains.

The test_glxinfo is using a glibc toolchain, so the
"# BR2_TOOLCHAIN_EXTERNAL_LOCALE is not set" line disapear from
the generated dot config (.config) leading to an error due to
a new check in the testsuite infra.

There is the same problem with:
BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG=y
BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS=y
BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL=y

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/testing/tests/package/test_glxinfo.py | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/support/testing/tests/package/test_glxinfo.py b/support/testing/tests/package/test_glxinfo.py
index a9df6ddf6f..f37236d161 100644
--- a/support/testing/tests/package/test_glxinfo.py
+++ b/support/testing/tests/package/test_glxinfo.py
@@ -15,12 +15,8 @@ class TestGlxinfo(infra.basetest.BRTest):
         BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--glibc--bleeding-edge-2018.11-1.tar.bz2"
         BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
         BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
-        # BR2_TOOLCHAIN_EXTERNAL_LOCALE is not set
         BR2_TOOLCHAIN_EXTERNAL_CXX=y
         BR2_TOOLCHAIN_EXTERNAL_HAS_SSP=y
-        BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG=y
-        BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS=y
-        BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL=y
         BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-- 
2.25.1
