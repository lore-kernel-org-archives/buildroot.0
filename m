From: Anton Kolesov <anton.kolesov@synopsys.com>
Date: Thu, 13 Feb 2014 16:41:45 +0400
Subject: [Buildroot] [PATCH 2/2] Revert "dmraid: disable on ARC arch"
In-Reply-To: <1392295308-12937-1-git-send-email-anton.kolesov@synopsys.com>
References: <1392295308-12937-1-git-send-email-anton.kolesov@synopsys.com>
Message-ID: <1392295308-12937-2-git-send-email-anton.kolesov@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 262a4c0bf7fb64d632ae6d40c22a62380c0af65f.

Compiler error has been fixed, and building this package doesn't cause an
ICE anymore.

Signed-off-by: Anton Kolesov <anton.kolesov@synopsys.com>
---
 package/dmraid/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/dmraid/Config.in b/package/dmraid/Config.in
index bfdd89b..028b46c 100644
--- a/package/dmraid/Config.in
+++ b/package/dmraid/Config.in
@@ -2,8 +2,6 @@ config BR2_PACKAGE_DMRAID
 	bool "dmraid"
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_MMU # lvm2
-	# triggers gcc ice
-	depends on !BR2_arc
 	select BR2_PACKAGE_LVM2
 	help
 	  dmraid discovers, activates, deactivates and displays properties
@@ -15,4 +13,3 @@ config BR2_PACKAGE_DMRAID
 comment "dmraid needs a toolchain w/ largefile"
 	depends on BR2_USE_MMU
 	depends on !BR2_LARGEFILE
-	depends on !BR2_arc
-- 
1.8.4.1
