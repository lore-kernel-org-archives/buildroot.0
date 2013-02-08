From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  8 Feb 2013 08:36:02 -0300
Subject: [Buildroot] [PATCH 2/5] configs/mini2440_defconfig: lock down
	kernel headers version
In-Reply-To: <1360323365-5936-1-git-send-email-gustavo@zacarias.com.ar>
References: <1360323365-5936-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1360323365-5936-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 configs/mini2440_defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/configs/mini2440_defconfig b/configs/mini2440_defconfig
index a7db855..6adcea0 100644
--- a/configs/mini2440_defconfig
+++ b/configs/mini2440_defconfig
@@ -15,6 +15,11 @@ BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER=y
 BR2_TARGET_ROOTFS_JFFS2_LE=y
 BR2_TARGET_ROOTFS_TAR=y
 
+
+# Lock down headers to avoid breaking with new defaults
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.0.4"
+
 # Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mini2440"
-- 
1.7.12.4
