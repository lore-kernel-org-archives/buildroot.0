From: Romain Naour <romain.naour@smile.fr>
Date: Sun, 17 Nov 2019 21:19:02 +0100
Subject: [Buildroot] [PATCH v3 for-next 04/11] board/qemu/csky: move csky610
 stuff to board/qemu/csky610-virt
In-Reply-To: <20191117201909.12900-1-romain.naour@smile.fr>
References: <20191117201909.12900-1-romain.naour@smile.fr>
Message-ID: <20191117201909.12900-5-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to indroduce automated gitlab testing for all qemu defconfig,
split all csky boards to a separate directory.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 board/qemu/csky/readme.txt                                   | 3 ---
 .../linux.config.fragment}                                   | 0
 board/qemu/csky610-virt/readme.txt                           | 5 +++++
 configs/qemu_csky610_virt_defconfig                          | 2 +-
 4 files changed, 6 insertions(+), 4 deletions(-)
 rename board/qemu/{csky/linux-ck610.config.fragment => csky610-virt/linux.config.fragment} (100%)
 create mode 100644 board/qemu/csky610-virt/readme.txt

diff --git a/board/qemu/csky/readme.txt b/board/qemu/csky/readme.txt
index 89d68aafb8..897b1ee7a0 100644
--- a/board/qemu/csky/readme.txt
+++ b/board/qemu/csky/readme.txt
@@ -6,7 +6,4 @@ For ck860 smp:
 For ck810/ck807:
  qemu-system-cskyv2 -M virt -nographic -kernel vmlinux
 
-For ck610:
- qemu-system-cskyv1 -M virt -nographic -kernel vmlinux
-
 The login prompt will appear in the terminal that started Qemu. Username is root and no password.
diff --git a/board/qemu/csky/linux-ck610.config.fragment b/board/qemu/csky610-virt/linux.config.fragment
similarity index 100%
rename from board/qemu/csky/linux-ck610.config.fragment
rename to board/qemu/csky610-virt/linux.config.fragment
diff --git a/board/qemu/csky610-virt/readme.txt b/board/qemu/csky610-virt/readme.txt
new file mode 100644
index 0000000000..6f9f7c18ce
--- /dev/null
+++ b/board/qemu/csky610-virt/readme.txt
@@ -0,0 +1,5 @@
+Run with qemu:
+
+ qemu-system-cskyv1 -M virt -nographic -kernel vmlinux
+
+The login prompt will appear in the terminal that started Qemu. Username is root and no password.
diff --git a/configs/qemu_csky610_virt_defconfig b/configs/qemu_csky610_virt_defconfig
index f337bd7eb4..be5fee8c6a 100644
--- a/configs/qemu_csky610_virt_defconfig
+++ b/configs/qemu_csky610_virt_defconfig
@@ -13,4 +13,4 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck610.config.fragment"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky610-virt/linux.config.fragment"
-- 
2.21.0
