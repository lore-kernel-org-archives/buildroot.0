From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Jun 2020 21:29:18 +0200
Subject: [Buildroot] [git commit] boot/opensbi: bump to version 0.8
Message-ID: <20200624192737.027D68448E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a517093ea9ac87b629facfa057131800c0108866
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The OpenSBI platform 'qemu/virt' has been removed in v0.8. Builds for
the QEMU 'virt' machine can use the 'generic' platform instead.

Tested with qemu_riscv32_virt_defconfig and
qemu_riscv64_virt_defconfig using Buildroot host-qemu 5.0.0.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
[yann.morin.1998 at free.fr: two spaces in hash file]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/opensbi/opensbi.hash           | 4 ++--
 boot/opensbi/opensbi.mk             | 2 +-
 configs/qemu_riscv32_virt_defconfig | 2 +-
 configs/qemu_riscv64_virt_defconfig | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/opensbi/opensbi.hash b/boot/opensbi/opensbi.hash
index 6e69d512dd..f7280b890b 100644
--- a/boot/opensbi/opensbi.hash
+++ b/boot/opensbi/opensbi.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256 46a93afd5465eba094ddba40015e754bf09f9e80e0702c00013d6bdb3ecd0a72 opensbi-0.6.tar.gz
-sha256 82d13fb1bf6bb162629deeea9eb9c117e74548d3b707e478967691fe79a68e21 COPYING.BSD
+sha256  17e048ac765e92e15f7436b604452614cf88dc2bcbbaab18cdc024f3fdd4c575  opensbi-0.8.tar.gz
+sha256  82d13fb1bf6bb162629deeea9eb9c117e74548d3b707e478967691fe79a68e21  COPYING.BSD
diff --git a/boot/opensbi/opensbi.mk b/boot/opensbi/opensbi.mk
index 00e3b05dd0..60b87c268d 100644
--- a/boot/opensbi/opensbi.mk
+++ b/boot/opensbi/opensbi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSBI_VERSION = 0.6
+OPENSBI_VERSION = 0.8
 OPENSBI_SITE = $(call github,riscv,opensbi,v$(OPENSBI_VERSION))
 OPENSBI_LICENSE = BSD-2-Clause
 OPENSBI_LICENSE_FILES = COPYING.BSD
diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
index dc1a5b1295..166c41f1f0 100644
--- a/configs/qemu_riscv32_virt_defconfig
+++ b/configs/qemu_riscv32_virt_defconfig
@@ -26,7 +26,7 @@ BR2_LINUX_KERNEL_IMAGE=y
 
 # Bootloader
 BR2_TARGET_OPENSBI=y
-BR2_TARGET_OPENSBI_PLAT="qemu/virt"
+BR2_TARGET_OPENSBI_PLAT="generic"
 
 # host-qemu for gitlab testing
 BR2_PACKAGE_HOST_QEMU=y
diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
index dbe6107b62..2887cf5f22 100644
--- a/configs/qemu_riscv64_virt_defconfig
+++ b/configs/qemu_riscv64_virt_defconfig
@@ -25,7 +25,7 @@ BR2_LINUX_KERNEL_IMAGE=y
 
 # Bootloader
 BR2_TARGET_OPENSBI=y
-BR2_TARGET_OPENSBI_PLAT="qemu/virt"
+BR2_TARGET_OPENSBI_PLAT="generic"
 
 # host-qemu for gitlab testing
 BR2_PACKAGE_HOST_QEMU=y
