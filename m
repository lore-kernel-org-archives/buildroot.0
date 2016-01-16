From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:37:50 +0100
Subject: [Buildroot] [PATCH 58/80 v1] package/mtd: use 'menuconfig'
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <6c11aab220840366de38acf8708c8eb4585c62d2.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mtd has more than 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

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
1.9.1
