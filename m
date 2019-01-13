From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 13 Jan 2019 18:43:15 +0100
Subject: [Buildroot] [PATCH v2,
 1/2] cc-tool: drop BR2_PACKAGE_BOOST_SIGNALS select
Message-ID: <20190113174316.26267-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cc-tool depends on signals2 not signals, indeed only signals2 is used in
src/data/progress_watcher.h and BOOST_SIGNALS defined in m4/boost.m4 is
never used in configure.ac

No BR2_PACKAGE_SIGNALS2 is needed as signals2 is a header-only boost
library

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Give more details in commit log

 package/cc-tool/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/cc-tool/Config.in b/package/cc-tool/Config.in
index 32250db3af..67c67a3992 100644
--- a/package/cc-tool/Config.in
+++ b/package/cc-tool/Config.in
@@ -10,7 +10,6 @@ config BR2_PACKAGE_CC_TOOL
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_REGEX
 	select BR2_PACKAGE_BOOST_FILESYSTEM
-	select BR2_PACKAGE_BOOST_SIGNALS
 	help
 	  cc-tool provides support for Texas Instruments CC Debugger
 	  for Linux OS in order to program 8051-based System-On-Chip
-- 
2.14.1
