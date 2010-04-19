From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 19 Apr 2010 23:24:57 +0200
Subject: [Buildroot] [git commit master] mtd: Add missing 'mtdinfo'
Message-ID: <20100419212539.555FB23B37@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d496bc1f281180c57c32a485385236620ac63a6e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 9277cb760a4cc6e62d0cd23fa938dd953e875a13 added support
for mtdinfo to mtd.mk but missed corresponding Config.in stuff.

Signed-off-by: Michael Roth <mroth@nessie.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.6.3.3
