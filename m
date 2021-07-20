From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 20 Jul 2021 22:47:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: use official tarball
Message-ID: <20210720204721.80821-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/linux-firmware/linux-firmware.hash | 6 ++++--
 package/linux-firmware/linux-firmware.mk   | 4 ++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 22d6ddf88f..41a17b021e 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,5 +1,7 @@
-# Locally calculated
-sha256  4341b33c64afd8e471de06f1459f63a76445b1ea83055fe3d4103dfb2e1b25ec  linux-firmware-20210511-br1.tar.gz
+# From https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
+sha256  2aa6ae8b9808408f9811ac38f00c188e53e984a2b3990254f6c9c02c1ab13417  linux-firmware-20210511.tar.xz
+
+# Hash for license files
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
 sha256  8d5847d2971241d4d6a51c16e206379de53a6d4e203fa6f8e1c1e9279c7c4ad0  LICENSE.amdgpu
 sha256  2d6062d63b91eb750bf741498691604f75184b9fee97608ec537cd09bd6a42b4  LICENCE.Marvell
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 69b1226cca..f29d9cf65d 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 LINUX_FIRMWARE_VERSION = 20210511
-LINUX_FIRMWARE_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
-LINUX_FIRMWARE_SITE_METHOD = git
+LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
+LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
 LINUX_FIRMWARE_INSTALL_IMAGES = YES
 
 LINUX_FIRMWARE_CPE_ID_VENDOR = kernel
-- 
2.30.2
