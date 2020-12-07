From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  7 Dec 2020 21:48:20 +0100
Subject: [Buildroot] [PATCH 4/5] support/{config-fragments,
 testing}: select INET_RPC option for custom glibc external
 toolchains
In-Reply-To: <20201207204821.3588178-1-romain.naour@gmail.com>
References: <20201207204821.3588178-1-romain.naour@gmail.com>
Message-ID: <20201207204821.3588178-4-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The sun rpc support has been removed from glibc 2.32 [1], so BR2_TOOLCHAIN_EXTERNAL_INET_RPC
will no longer be enabled by default for custom external toolchains.

Add this option in config fragments used by autobuild and testing scripts.

[1] https://sourceware.org/pipermail/libc-announce/2020/000029.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/config-fragments/autobuild/bootlin-x86-64-glibc.config  | 1 +
 support/config-fragments/autobuild/br-aarch64-glibc.config      | 1 +
 .../config-fragments/autobuild/br-arm-cortex-a9-glibc.config    | 1 +
 .../config-fragments/autobuild/br-mips32r6-el-hf-glibc.config   | 1 +
 .../config-fragments/autobuild/br-mips64r6-el-hf-glibc.config   | 1 +
 support/config-fragments/autobuild/br-nios2-glibc.config        | 1 +
 .../config-fragments/autobuild/br-powerpc64-power7-glibc.config | 1 +
 .../autobuild/br-powerpc64le-power8-glibc.config                | 1 +
 support/config-fragments/autobuild/br-riscv32.config            | 1 +
 support/config-fragments/autobuild/br-riscv64.config            | 1 +
 support/config-fragments/autobuild/br-sparc64-glibc.config      | 1 +
 support/testing/tests/boot/test_syslinux.py                     | 2 ++
 support/testing/tests/core/test_hardening.py                    | 1 +
 support/testing/tests/package/test_glxinfo.py                   | 1 +
 14 files changed, 15 insertions(+)

diff --git a/support/config-fragments/autobuild/bootlin-x86-64-glibc.config b/support/config-fragments/autobuild/bootlin-x86-64-glibc.config
index 6a372803b2..d9a4111fd8 100644
--- a/support/config-fragments/autobuild/bootlin-x86-64-glibc.config
+++ b/support/config-fragments/autobuild/bootlin-x86-64-glibc.config
@@ -13,3 +13,4 @@ BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG=y
 BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS=y
 BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
diff --git a/support/config-fragments/autobuild/br-aarch64-glibc.config b/support/config-fragments/autobuild/br-aarch64-glibc.config
index f1b0f2a91e..525af58ee4 100644
--- a/support/config-fragments/autobuild/br-aarch64-glibc.config
+++ b/support/config-fragments/autobuild/br-aarch64-glibc.config
@@ -6,4 +6,5 @@ BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/b
 BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config b/support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config
index a3b51138d7..4a06d360c8 100644
--- a/support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config
+++ b/support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config
@@ -8,4 +8,5 @@ BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/b
 BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_4=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-mips32r6-el-hf-glibc.config b/support/config-fragments/autobuild/br-mips32r6-el-hf-glibc.config
index ce61100a37..a9993a7dda 100644
--- a/support/config-fragments/autobuild/br-mips32r6-el-hf-glibc.config
+++ b/support/config-fragments/autobuild/br-mips32r6-el-hf-glibc.config
@@ -8,4 +8,5 @@ BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/b
 BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_4=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config b/support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config
index 48ed24dacf..d748250f61 100644
--- a/support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config
+++ b/support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config
@@ -9,4 +9,5 @@ BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/b
 BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_4=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-nios2-glibc.config b/support/config-fragments/autobuild/br-nios2-glibc.config
index c5ac68dc50..9260f72a7f 100644
--- a/support/config-fragments/autobuild/br-nios2-glibc.config
+++ b/support/config-fragments/autobuild/br-nios2-glibc.config
@@ -6,4 +6,5 @@ BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/b
 BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_4=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-powerpc64-power7-glibc.config b/support/config-fragments/autobuild/br-powerpc64-power7-glibc.config
index 5d7171a067..1206f34cb2 100644
--- a/support/config-fragments/autobuild/br-powerpc64-power7-glibc.config
+++ b/support/config-fragments/autobuild/br-powerpc64-power7-glibc.config
@@ -6,4 +6,5 @@ BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/b
 BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_4=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config b/support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config
index b743bbc4a0..5c7a75726c 100644
--- a/support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config
+++ b/support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config
@@ -6,4 +6,5 @@ BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/b
 BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_4=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-riscv32.config b/support/config-fragments/autobuild/br-riscv32.config
index d9110a6a86..2fe9397b3a 100644
--- a/support/config-fragments/autobuild/br-riscv32.config
+++ b/support/config-fragments/autobuild/br-riscv32.config
@@ -6,4 +6,5 @@ BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/b
 BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-riscv64.config b/support/config-fragments/autobuild/br-riscv64.config
index c5df86392c..2b1d4ce603 100644
--- a/support/config-fragments/autobuild/br-riscv64.config
+++ b/support/config-fragments/autobuild/br-riscv64.config
@@ -5,4 +5,5 @@ BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/b
 BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_4=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-sparc64-glibc.config b/support/config-fragments/autobuild/br-sparc64-glibc.config
index 0b77bb45fa..ca50240729 100644
--- a/support/config-fragments/autobuild/br-sparc64-glibc.config
+++ b/support/config-fragments/autobuild/br-sparc64-glibc.config
@@ -5,4 +5,5 @@ BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/b
 BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/testing/tests/boot/test_syslinux.py b/support/testing/tests/boot/test_syslinux.py
index 467d564e18..5a9946dc4d 100644
--- a/support/testing/tests/boot/test_syslinux.py
+++ b/support/testing/tests/boot/test_syslinux.py
@@ -12,6 +12,7 @@ class TestSysLinuxBase(infra.basetest.BRTest):
         BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
         BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
         BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+        BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
         BR2_TOOLCHAIN_EXTERNAL_CXX=y
         """
 
@@ -28,6 +29,7 @@ class TestSysLinuxBase(infra.basetest.BRTest):
         BR2_TOOLCHAIN_EXTERNAL_CXX=y
         BR2_TOOLCHAIN_EXTERNAL_HAS_SSP=y
         BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+        BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
         """
 
     syslinux_legacy_config = \
diff --git a/support/testing/tests/core/test_hardening.py b/support/testing/tests/core/test_hardening.py
index 60e14303a3..b9ed8329c8 100644
--- a/support/testing/tests/core/test_hardening.py
+++ b/support/testing/tests/core/test_hardening.py
@@ -16,6 +16,7 @@ class TestHardeningBase(infra.basetest.BRTest):
         BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
         BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
         BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+        BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
         BR2_TOOLCHAIN_EXTERNAL_CXX=y
         BR2_PACKAGE_LIGHTTPD=y
         BR2_PACKAGE_HOST_CHECKSEC=y
diff --git a/support/testing/tests/package/test_glxinfo.py b/support/testing/tests/package/test_glxinfo.py
index f37236d161..9edd6926b6 100644
--- a/support/testing/tests/package/test_glxinfo.py
+++ b/support/testing/tests/package/test_glxinfo.py
@@ -18,6 +18,7 @@ class TestGlxinfo(infra.basetest.BRTest):
         BR2_TOOLCHAIN_EXTERNAL_CXX=y
         BR2_TOOLCHAIN_EXTERNAL_HAS_SSP=y
         BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+        BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
-- 
2.25.4
