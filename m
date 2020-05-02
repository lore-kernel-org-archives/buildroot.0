From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  2 May 2020 23:28:10 +0200
Subject: [Buildroot] [PATCH 4/6] configs/beelink_gs1: use Python 3.x
In-Reply-To: <20200502212812.51219-1-thomas.petazzoni@bootlin.com>
References: <20200502212812.51219-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200502212812.51219-5-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the bump to U-Boot 2020.01 in commit
e210080d2ab4d77862c42d2b318e21fab461f127, it needs Python 3.x on the
host.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/535054357

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/beelink_gs1_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/beelink_gs1_defconfig b/configs/beelink_gs1_defconfig
index 04c8b544ea..2fe89bf747 100644
--- a/configs/beelink_gs1_defconfig
+++ b/configs/beelink_gs1_defconfig
@@ -34,6 +34,8 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="beelink_gs1"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_SPL=y
-- 
2.26.2
