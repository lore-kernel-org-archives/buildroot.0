From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 16 Nov 2018 08:40:43 +0200
Subject: [Buildroot] [PATCH v4] libnftnl: drop useless
 BR2_PACKAGE_LIBNFTNL_XML
Message-ID: <316a06e0166e9f1294cefb7c6a07af79bb1d60bf.1542350443.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit fa0d1ebff99 (libnftnl: bump to version 1.0.9) removed the mxml
dependency. Remove the redundant BR2_PACKAGE_LIBNFTNL_XML config symbol
as well.

Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v4: Add missing 'bool' type to the legacy entry

v3: Remove the dependency comment as well

v2: Add Config.in.legacy entry (Thomas, Arnout)

Note: the legacy entry is under 2018.11. If this patch is backported to
stable branch it should probably move to an appropriate place per
branch.
---
 Config.in.legacy           |  6 ++++++
 package/libnftnl/Config.in | 10 ----------
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index c3df37ddd9cb..a5e0c9fe4fe0 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -232,6 +232,12 @@ config BR2_KERNEL_HEADERS_4_17
 	  Version 4.17.x of the Linux kernel headers are no longer
 	  maintained upstream and are now removed.
 
+config BR2_PACKAGE_LIBNFTNL_XML
+	bool "libnftl no longer supports XML output"
+	select BR2_LEGACY
+	help
+	  libnftnl removed integration with libmxml.
+
 ###############################################################################
 comment "Legacy options removed in 2018.08"
 
diff --git a/package/libnftnl/Config.in b/package/libnftnl/Config.in
index d4c9a1bb54e3..347223ce22a0 100644
--- a/package/libnftnl/Config.in
+++ b/package/libnftnl/Config.in
@@ -22,14 +22,4 @@ config BR2_PACKAGE_LIBNFTNL_JSON
 	help
 	  Enable JSON parsing support
 
-config BR2_PACKAGE_LIBNFTNL_XML
-	bool "enable XML support"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_MXML
-	help
-	  Enable XML parsing support
-
-comment "libnftnl XML parsing support needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
-
 endif
-- 
2.19.1
