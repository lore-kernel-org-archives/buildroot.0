From: Romain Naour <romain.naour@smile.fr>
Date: Sun, 17 Nov 2019 21:18:59 +0100
Subject: [Buildroot] [PATCH v3 for-next 01/11] configs/qemu_m68k_q800:
 remove host-qemu
In-Reply-To: <20191117201909.12900-1-romain.naour@smile.fr>
References: <20191117201909.12900-1-romain.naour@smile.fr>
Message-ID: <20191117201909.12900-2-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building upstream host-qemu for m68k_q800 is useless
since it doesn't support the q800 machine:

qemu-system-m68k: -M q800: unsupported machine type

This defconfig mush be used with the QEMU fork from [1]
using q800-v2.11.0 branch.

[1] https://github.com/vivier/qemu-m68k

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 configs/qemu_m68k_q800_defconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/configs/qemu_m68k_q800_defconfig b/configs/qemu_m68k_q800_defconfig
index ce264430fd..0dd90a97b3 100644
--- a/configs/qemu_m68k_q800_defconfig
+++ b/configs/qemu_m68k_q800_defconfig
@@ -23,7 +23,3 @@ BR2_LINUX_KERNEL_VMLINUX=y
 # Serial port config
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-
-# host-qemu for gitlab testing
-BR2_PACKAGE_HOST_QEMU=y
-BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
-- 
2.21.0
