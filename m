From: Gerome Burlats <gerome.burlats@smile.fr>
Date: Thu, 24 Jan 2019 17:53:09 +0100
Subject: [Buildroot] [PATCH] qemu: Change CPU in qemu command for aarch64
Message-ID: <20190124165309.2001-1-gerome.burlats@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit changes to "cortex-a53" the CPU model in the qemu command for aarch64 (since it is the default one for this architecture).

Signed-off-by: Gerome Burlats <gerome.burlats@smile.fr>
Cc: Romain Naour <romain.naour@smile.fr>
---

cortex-a53 is the default cpu for aarch64, but some defconfigs, for example raspberrypi3_64_defconfig, still have "BR2_cortex_a53=y" (maybe at one point, this cpu was not the default).
Should this line stay in the defconfig for info, even if it is not used ?
If we generate the defconfig with "make savedefconfig", BR2_cortex_a53=y is indeed not added in the file.
---
 board/qemu/aarch64-virt/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/qemu/aarch64-virt/readme.txt b/board/qemu/aarch64-virt/readme.txt
index 76fc2d6f32..1ff2fba47d 100644
--- a/board/qemu/aarch64-virt/readme.txt
+++ b/board/qemu/aarch64-virt/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-aarch64 -M virt -cpu cortex-a57 -nographic -smp 1 -kernel output/images/Image -append "root=/dev/vda console=ttyAMA0" -netdev user,id=eth0 -device virtio-net-device,netdev=eth0 -drive file=output/images/rootfs.ext4,if=none,format=raw,id=hd0 -device virtio-blk-device,drive=hd0
+  qemu-system-aarch64 -M virt -cpu cortex-a53 -nographic -smp 1 -kernel output/images/Image -append "root=/dev/vda console=ttyAMA0" -netdev user,id=eth0 -device virtio-net-device,netdev=eth0 -drive file=output/images/rootfs.ext4,if=none,format=raw,id=hd0 -device virtio-blk-device,drive=hd0
 
 The login prompt will appear in the terminal that started Qemu.
 
-- 
2.20.1
