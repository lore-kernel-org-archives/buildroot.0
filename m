From: Michael Roth <mroth@nessie.de>
Date: Mon, 19 Apr 2010 22:36:13 +0200
Subject: [Buildroot] [PATCH 1/1] mtd: Add missing 'mtdinfo'
Message-ID: <1271709373-11620-1-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 9277cb760a4cc6e62d0cd23fa938dd953e875a13 added support
for mtdinfo to mtd.mk but missed corresponding Config.in stuff.

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 package/mtd/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 8e846a3..0ba71d3 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -93,6 +93,10 @@ config BR2_PACKAGE_MTD_SERVE_IMAGE
 config BR2_PACKAGE_MTD_SUMTOOL
 	bool "sumtool"
 
+config BR2_PACKAGE_MTD_MTDINFO
+	bool "mtdinfo"
+	default y
+
 config BR2_PACKAGE_MTD_UBIATTACH
 	bool "ubiattach"
 	default y
-- 
1.6.4.4
