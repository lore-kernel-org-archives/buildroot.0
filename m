From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 Aug 2019 14:54:32 +0200
Subject: [Buildroot] [git commit] configs/bananapro: needs host-openssl
Message-ID: <20190810131651.14D448B474@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=74530f85f99e325926966ee3ef62b9960a3ca2e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The kernel configuration used by the bananapro_defconfig needs
host-openssl, otherwise it fails to build with:

  scripts/extract-cert.c:21:25: fatal error: openssl/bio.h: No such file or directory

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/269139124

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/bananapro_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/bananapro_defconfig b/configs/bananapro_defconfig
index 56166c9428..4ec41795bc 100644
--- a/configs/bananapro_defconfig
+++ b/configs/bananapro_defconfig
@@ -30,6 +30,7 @@ BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/lemaker/bananapro/linux-wifi.fragm
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-bananapro"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
