From: Romain Naour <romain.naour@smile.fr>
Date: Sun, 17 Nov 2019 21:19:03 +0100
Subject: [Buildroot] [PATCH v3 for-next 05/11] board/qemu/csky: move csky807
 stuff to board/qemu/csky807-virt
In-Reply-To: <20191117201909.12900-1-romain.naour@smile.fr>
References: <20191117201909.12900-1-romain.naour@smile.fr>
Message-ID: <20191117201909.12900-6-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to indroduce automated gitlab testing for all qemu defconfig,
split all csky boards to a separate directory.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 board/qemu/csky/readme.txt                                   | 2 +-
 .../linux.config.fragment}                                   | 0
 board/qemu/csky807-virt/readme.txt                           | 5 +++++
 configs/qemu_csky807_virt_defconfig                          | 2 +-
 4 files changed, 7 insertions(+), 2 deletions(-)
 rename board/qemu/{csky/linux-ck807.config.fragment => csky807-virt/linux.config.fragment} (100%)
 create mode 100644 board/qemu/csky807-virt/readme.txt

diff --git a/board/qemu/csky/readme.txt b/board/qemu/csky/readme.txt
index 897b1ee7a0..433339c4b6 100644
--- a/board/qemu/csky/readme.txt
+++ b/board/qemu/csky/readme.txt
@@ -3,7 +3,7 @@ Run with qemu:
 For ck860 smp:
  qemu-system-cskyv2 -M virt -cpu ck860 -smp 2 -nographic -kernel vmlinux
 
-For ck810/ck807:
+For ck810:
  qemu-system-cskyv2 -M virt -nographic -kernel vmlinux
 
 The login prompt will appear in the terminal that started Qemu. Username is root and no password.
diff --git a/board/qemu/csky/linux-ck807.config.fragment b/board/qemu/csky807-virt/linux.config.fragment
similarity index 100%
rename from board/qemu/csky/linux-ck807.config.fragment
rename to board/qemu/csky807-virt/linux.config.fragment
diff --git a/board/qemu/csky807-virt/readme.txt b/board/qemu/csky807-virt/readme.txt
new file mode 100644
index 0000000000..20b7fa312b
--- /dev/null
+++ b/board/qemu/csky807-virt/readme.txt
@@ -0,0 +1,5 @@
+Run with qemu:
+
+qemu-system-cskyv2 -M virt -nographic -kernel vmlinux
+
+The login prompt will appear in the terminal that started Qemu. Username is root and no password.
diff --git a/configs/qemu_csky807_virt_defconfig b/configs/qemu_csky807_virt_defconfig
index c4a10b8ade..09e0e3dd01 100644
--- a/configs/qemu_csky807_virt_defconfig
+++ b/configs/qemu_csky807_virt_defconfig
@@ -13,4 +13,4 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck807.config.fragment"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky807-virt/linux.config.fragment"
-- 
2.21.0
