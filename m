From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 14 Aug 2017 19:02:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/mtd: needs threads
Message-ID: <20170814170231.17724-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/879/879c79e505f65387a46c4be263dc8783c8ca61bf/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mtd/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index a1df4cfc0..8c9ba1428 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -1,10 +1,14 @@
 config BR2_PACKAGE_MTD
 	bool "mtd, jffs2 and ubi/ubifs tools"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Build mtd, jffs2 and ubi/ubifs tools
 
 	  http://www.linux-mtd.infradead.org/
 
+comment "mtd needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 if BR2_PACKAGE_MTD
 
 # The three hidden options below match mtd configure script options
-- 
2.11.0
