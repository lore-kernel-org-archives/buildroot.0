From: Romain Naour <romain.naour@smile.fr>
Date: Sun, 17 Nov 2019 21:19:04 +0100
Subject: [Buildroot] [PATCH v3 for-next 06/11] board/qemu/csky: move csky810
 stuff to board/qemu/csky810-virt
In-Reply-To: <20191117201909.12900-1-romain.naour@smile.fr>
References: <20191117201909.12900-1-romain.naour@smile.fr>
Message-ID: <20191117201909.12900-7-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to indroduce automated gitlab testing for all qemu defconfig,
split all csky boards to a separate directory.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 board/qemu/csky/readme.txt                                    | 3 ---
 .../linux.config.fragment}                                    | 0
 board/qemu/{csky => csky810-virt}/readme.txt                  | 4 ----
 configs/qemu_csky810_virt_defconfig                           | 2 +-
 4 files changed, 1 insertion(+), 8 deletions(-)
 rename board/qemu/{csky/linux-ck810.config.fragment => csky810-virt/linux.config.fragment} (100%)
 copy board/qemu/{csky => csky810-virt}/readme.txt (62%)

diff --git a/board/qemu/csky/readme.txt b/board/qemu/csky/readme.txt
index 433339c4b6..f7cd01b021 100644
--- a/board/qemu/csky/readme.txt
+++ b/board/qemu/csky/readme.txt
@@ -3,7 +3,4 @@ Run with qemu:
 For ck860 smp:
  qemu-system-cskyv2 -M virt -cpu ck860 -smp 2 -nographic -kernel vmlinux
 
-For ck810:
- qemu-system-cskyv2 -M virt -nographic -kernel vmlinux
-
 The login prompt will appear in the terminal that started Qemu. Username is root and no password.
diff --git a/board/qemu/csky/linux-ck810.config.fragment b/board/qemu/csky810-virt/linux.config.fragment
similarity index 100%
rename from board/qemu/csky/linux-ck810.config.fragment
rename to board/qemu/csky810-virt/linux.config.fragment
diff --git a/board/qemu/csky/readme.txt b/board/qemu/csky810-virt/readme.txt
similarity index 62%
copy from board/qemu/csky/readme.txt
copy to board/qemu/csky810-virt/readme.txt
index 433339c4b6..758e436467 100644
--- a/board/qemu/csky/readme.txt
+++ b/board/qemu/csky810-virt/readme.txt
@@ -1,9 +1,5 @@
 Run with qemu:
 
-For ck860 smp:
- qemu-system-cskyv2 -M virt -cpu ck860 -smp 2 -nographic -kernel vmlinux
-
-For ck810:
  qemu-system-cskyv2 -M virt -nographic -kernel vmlinux
 
 The login prompt will appear in the terminal that started Qemu. Username is root and no password.
diff --git a/configs/qemu_csky810_virt_defconfig b/configs/qemu_csky810_virt_defconfig
index 56efe8a6ae..f6d3b82206 100644
--- a/configs/qemu_csky810_virt_defconfig
+++ b/configs/qemu_csky810_virt_defconfig
@@ -13,4 +13,4 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck810.config.fragment"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky810-virt/linux.config.fragment"
-- 
2.21.0
