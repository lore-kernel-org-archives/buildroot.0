From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  7 Feb 2016 20:39:08 -0300
Subject: [Buildroot] [PATCH 3/3] configs/qemu: convert versatile to dt
In-Reply-To: <1454888348-8149-1-git-send-email-gustavo@zacarias.com.ar>
References: <1454888348-8149-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1454888348-8149-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As a followup to http://patchwork.ozlabs.org/patch/548550/ fully convert
the versatile defconfig to create the dtb and update the instructions.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/qemu/arm-versatile/linux-4.4.config | 1 +
 board/qemu/arm-versatile/readme.txt       | 2 +-
 configs/qemu_arm_versatile_defconfig      | 2 ++
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/board/qemu/arm-versatile/linux-4.4.config b/board/qemu/arm-versatile/linux-4.4.config
index 9a1ae58..99df3a6 100644
--- a/board/qemu/arm-versatile/linux-4.4.config
+++ b/board/qemu/arm-versatile/linux-4.4.config
@@ -3,6 +3,7 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_ARCH_VERSATILE=y
 CONFIG_MACH_VERSATILE_AB=y
+CONFIG_MACH_VERSATILE_DT=y
 CONFIG_PCI=y
 CONFIG_AEABI=y
 CONFIG_USE_OF=y
diff --git a/board/qemu/arm-versatile/readme.txt b/board/qemu/arm-versatile/readme.txt
index 4af2f46..44d70d8 100644
--- a/board/qemu/arm-versatile/readme.txt
+++ b/board/qemu/arm-versatile/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-arm -M versatilepb -kernel output/images/zImage -drive file=output/images/rootfs.ext2,if=scsi,format=raw -append "root=/dev/sda console=ttyAMA0,115200" -serial stdio -net nic,model=rtl8139 -net user
+  qemu-system-arm -M versatilepb -kernel output/images/zImage -dtb output/images/versatile-pb.dtb -drive file=output/images/rootfs.ext2,if=scsi,format=raw -append "root=/dev/sda console=ttyAMA0,115200" -serial stdio -net nic,model=rtl8139 -net user
 
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index bb64cfe..d95c803 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -20,3 +20,5 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.4.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="versatile-pb"
-- 
2.4.10
