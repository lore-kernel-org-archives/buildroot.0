From: Romain Naour <romain.naour@smile.fr>
Date: Sun, 17 Nov 2019 21:19:05 +0100
Subject: [Buildroot] [PATCH v3 for-next 07/11] board/qemu/csky: move csky860
 stuff to board/qemu/csky860-virt
In-Reply-To: <20191117201909.12900-1-romain.naour@smile.fr>
References: <20191117201909.12900-1-romain.naour@smile.fr>
Message-ID: <20191117201909.12900-8-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to indroduce automated gitlab testing for all qemu defconfig,
split all csky boards to a separate directory.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../linux.config.fragment}                                      | 0
 board/qemu/{csky => csky860-virt}/readme.txt                    | 1 -
 configs/qemu_csky860_virt_defconfig                             | 2 +-
 3 files changed, 1 insertion(+), 2 deletions(-)
 rename board/qemu/{csky/linux-ck860.config.fragment => csky860-virt/linux.config.fragment} (100%)
 rename board/qemu/{csky => csky860-virt}/readme.txt (92%)

diff --git a/board/qemu/csky/linux-ck860.config.fragment b/board/qemu/csky860-virt/linux.config.fragment
similarity index 100%
rename from board/qemu/csky/linux-ck860.config.fragment
rename to board/qemu/csky860-virt/linux.config.fragment
diff --git a/board/qemu/csky/readme.txt b/board/qemu/csky860-virt/readme.txt
similarity index 92%
rename from board/qemu/csky/readme.txt
rename to board/qemu/csky860-virt/readme.txt
index f7cd01b021..bc6a55cdb7 100644
--- a/board/qemu/csky/readme.txt
+++ b/board/qemu/csky860-virt/readme.txt
@@ -1,6 +1,5 @@
 Run with qemu:
 
-For ck860 smp:
  qemu-system-cskyv2 -M virt -cpu ck860 -smp 2 -nographic -kernel vmlinux
 
 The login prompt will appear in the terminal that started Qemu. Username is root and no password.
diff --git a/configs/qemu_csky860_virt_defconfig b/configs/qemu_csky860_virt_defconfig
index 9ec8f633af..896b9a8f2e 100644
--- a/configs/qemu_csky860_virt_defconfig
+++ b/configs/qemu_csky860_virt_defconfig
@@ -13,4 +13,4 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck860.config.fragment"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky860-virt/linux.config.fragment"
-- 
2.21.0
