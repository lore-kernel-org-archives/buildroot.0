From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 23:02:29 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] qemu/aarch64-virt:
 Emulate cortex-a53 in qemu to match Buildroot config
Message-ID: <20190129220142.655C881344@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6d9be6a47ecfc6d4afa82c77d306935c393c98d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

qemu_aarch64_virt_defconfig (implicitly) specifies cortex-a53, so adjust the
QEMU command line to also emulate a a53 instead of a57.

Also adjust the defconfig to explicitly specify a53 for consistency/clarity.

Signed-off-by: Gerome Burlats <gerome.burlats@smile.fr>
Cc: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0203df36ac5ab7d2e7a7fad94edaa51594360f34)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/qemu/aarch64-virt/readme.txt  | 2 +-
 configs/qemu_aarch64_virt_defconfig | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/board/qemu/aarch64-virt/readme.txt b/board/qemu/aarch64-virt/readme.txt
index 76fc2d6f32..1ff2fba47d 100644
--- a/board/qemu/aarch64-virt/readme.txt
+++ b/board/qemu/aarch64-virt/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-aarch64 -M virt -cpu cortex-a57 -nographic -smp 1 -kernel output/images/Image -append "root=/dev/vda console=ttyAMA0" -netdev user,id=eth0 -device virtio-net-device,netdev=eth0 -drive file=output/images/rootfs.ext4,if=none,format=raw,id=hd0 -device virtio-blk-device,drive=hd0
+  qemu-system-aarch64 -M virt -cpu cortex-a53 -nographic -smp 1 -kernel output/images/Image -append "root=/dev/vda console=ttyAMA0" -netdev user,id=eth0 -device virtio-net-device,netdev=eth0 -drive file=output/images/rootfs.ext4,if=none,format=raw,id=hd0 -device virtio-blk-device,drive=hd0
 
 The login prompt will appear in the terminal that started Qemu.
 
diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index 2706544e52..a7b097ef40 100644
--- a/configs/qemu_aarch64_virt_defconfig
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -1,5 +1,6 @@
 # Architecture
 BR2_aarch64=y
+BR2_cortex_a53=y
 
 # System
 BR2_SYSTEM_DHCP="eth0"
