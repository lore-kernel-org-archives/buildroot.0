From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 10 May 2021 23:13:54 +0200
Subject: [Buildroot] [git commit] configs/acmesystems_acqua_a5_{256,
 512}mb: add openssl host dependency
Message-ID: <20210510204755.D87CB86D86@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=99cc089b94d8b5953eaf18cc9238d25d8a627414
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Linux build needs openssl:

https://gitlab.com/buildroot.org/buildroot/-/jobs/1240157423
https://gitlab.com/buildroot.org/buildroot/-/jobs/1240157424

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/acmesystems_acqua_a5_256mb_defconfig | 1 +
 configs/acmesystems_acqua_a5_512mb_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
index 37c7dcd83f..810c3c9782 100644
--- a/configs/acmesystems_acqua_a5_256mb_defconfig
+++ b/configs/acmesystems_acqua_a5_256mb_defconfig
@@ -12,6 +12,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.107"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
index 1809575727..11a7e795e0 100644
--- a/configs/acmesystems_acqua_a5_512mb_defconfig
+++ b/configs/acmesystems_acqua_a5_512mb_defconfig
@@ -12,6 +12,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.107"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
