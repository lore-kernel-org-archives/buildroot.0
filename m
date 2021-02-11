From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 11 Feb 2021 23:13:14 +0100
Subject: [Buildroot] [git commit] configs/avenger96_defconfig: linux build
 needs host-openssl
Message-ID: <20210211215503.B90D17FD62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1fabbd387d2e623cfa6bba81b39bfc96933573d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the gitlab build:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1019385566/

  HOSTCC  scripts/extract-cert
scripts/extract-cert.c:21:25: fatal error: openssl/bio.h: No such file or directory

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/avenger96_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/avenger96_defconfig b/configs/avenger96_defconfig
index 6fea029bf8..d2c1b9013e 100644
--- a/configs/avenger96_defconfig
+++ b/configs/avenger96_defconfig
@@ -10,6 +10,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32mp157a-dhcor-avenger96"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
