From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 8 Feb 2013 22:24:38 +0100
Subject: [Buildroot] [git commit] configs/mini2440_defconfig: lock down
	kernel headers version
Message-ID: <20130208212607.897BC9AA21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6f6803089dc6c4a2a2f9dfa1e26d7e580e7e7e1a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/mini2440_defconfig |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

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
