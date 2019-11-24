From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Nov 2019 09:47:24 +0100
Subject: [Buildroot] [git commit branch/next] board/beelink_gs1: enable mdev
 and dhcp on eth0
Message-ID: <20191124083939.98A018B89C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e26f5ad712a8264d97969910cba1d2ecfa57e2b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Cl??ment P??ron <peron.clem@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/beelink_gs1_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/beelink_gs1_defconfig b/configs/beelink_gs1_defconfig
index c34bd4e860..80b111aee7 100644
--- a/configs/beelink_gs1_defconfig
+++ b/configs/beelink_gs1_defconfig
@@ -2,6 +2,9 @@
 BR2_aarch64=y
 BR2_ARM_FPU_VFPV4=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Beelink GS1"
+# MDEV is required to autoload the ethernet driver module
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/beelink/gs1/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beelink/gs1/genimage.cfg"
