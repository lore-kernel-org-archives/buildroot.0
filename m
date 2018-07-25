From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 25 Jul 2018 12:07:02 +0200
Subject: [Buildroot] [PATCH 3/5] sunxi-mali-mainline: add r8p1 blob version.
In-Reply-To: <20180725100704.71349-1-giulio.benetti@micronovasrl.com>
References: <20180725100704.71349-1-giulio.benetti@micronovasrl.com>
Message-ID: <20180725100704.71349-4-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Blobs for r8p1 are available on Bootlin Github.

Add r8p1 version to choice the same way as r6p2.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/sunxi-mali-mainline/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/sunxi-mali-mainline/Config.in b/package/sunxi-mali-mainline/Config.in
index 912f5d22c6..a889864465 100644
--- a/package/sunxi-mali-mainline/Config.in
+++ b/package/sunxi-mali-mainline/Config.in
@@ -25,12 +25,15 @@ choice
 
 config BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2
 	bool "r6p2"
+config BR2_PACKAGE_SUNXI_MALI_MAINLINE_R8P1
+	bool "r8p1"
 
 endchoice
 
 config BR2_PACKAGE_SUNXI_MALI_MAINLINE_REVISION
 	string
 	default "r6p2"	if BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2
+	default "r8p1"	if BR2_PACKAGE_SUNXI_MALI_MAINLINE_R8P1
 
 endif
 
-- 
2.17.1
