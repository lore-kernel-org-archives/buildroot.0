From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Jul 2017 16:58:30 +0200
Subject: [Buildroot] [git commit] configs/qemu-xtensa: use overlay from the
	github repository
Message-ID: <20170709151526.A71E181D36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e69eabe4390dc96405dbde5295da9a1da94c3e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rather than bundle the overlay with us, directly fetch it from its
upstream location.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/qemu/xtensa-lx60/xtensa_dc233c.tar | Bin 808960 -> 0 bytes
 configs/qemu_xtensa_lx60_defconfig       |   2 +-
 configs/qemu_xtensa_lx60_nommu_defconfig |   2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/qemu/xtensa-lx60/xtensa_dc233c.tar b/board/qemu/xtensa-lx60/xtensa_dc233c.tar
deleted file mode 100644
index 1a97d7a..0000000
Binary files a/board/qemu/xtensa-lx60/xtensa_dc233c.tar and /dev/null differ
diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index 778c31a..d8614ef 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -1,7 +1,7 @@
 # Architecture
 BR2_xtensa=y
 BR2_XTENSA_CUSTOM=y
-BR2_XTENSA_OVERLAY_FILE="board/qemu/xtensa-lx60/xtensa_dc233c.tar"
+BR2_XTENSA_OVERLAY_FILE="https://github.com/jcmvbkbc/xtensa-toolchain-build/raw/95291b7c39e6f790d0b2f062c945a630290f2c81/overlays/xtensa_dc233c.tar.gz"
 
 # System
 BR2_SYSTEM_DHCP="eth0"
diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
index 63e0194..174ebd3 100644
--- a/configs/qemu_xtensa_lx60_nommu_defconfig
+++ b/configs/qemu_xtensa_lx60_nommu_defconfig
@@ -1,7 +1,7 @@
 # Architecture
 BR2_xtensa=y
 BR2_XTENSA_CUSTOM=y
-BR2_XTENSA_OVERLAY_FILE="board/qemu/xtensa-lx60/xtensa_dc233c.tar"
+BR2_XTENSA_OVERLAY_FILE="https://github.com/jcmvbkbc/xtensa-toolchain-build/raw/95291b7c39e6f790d0b2f062c945a630290f2c81/overlays/xtensa_dc233c.tar.gz"
 
 # Toolchain
 BR2_PACKAGE_HOST_ELF2FLT=y
