From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:25:08 +0200
Subject: [Buildroot] [PATCH 57/83 v2] package/mtd: use 'menuconfig'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <ffa0cbc752a2bea6202b1a21f16c795d9ba64093.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mtd has more than 5 options, so use a 'menuconfig' to group the
options in a sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mtd/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 6e4346f..5add9c1 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_MTD
+menuconfig BR2_PACKAGE_MTD
 	bool "mtd, jffs2 and ubi/ubifs tools"
 	help
 	  Build mtd, jffs2 and ubi/ubifs tools
@@ -6,7 +6,6 @@ config BR2_PACKAGE_MTD
 	  http://www.linux-mtd.infradead.org/
 
 if BR2_PACKAGE_MTD
-comment "MTD tools selection"
 
 config BR2_PACKAGE_MTD_DOCFDISK
 	bool "docfdisk"
-- 
2.7.4
