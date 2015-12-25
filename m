From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:24:40 +0100
Subject: [Buildroot] [PATCH 11/84 RFC] package/collectd: use 'menuconfig'
	instead of 'config'+'menu'
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <98e2bd868911c43a5e8fd5ab45ca150521677d1b.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since there were multiple sub-menus, keep their prompts as a comment, to
properly separate all famillies of plugins.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/collectd/Config.in | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 5cdb24e..8e65c20 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_COLLECTD
+menuconfig BR2_PACKAGE_COLLECTD
 	bool "collectd"
 	# Uses fork()
 	depends on BR2_USE_MMU
@@ -13,7 +13,7 @@ config BR2_PACKAGE_COLLECTD
 
 if BR2_PACKAGE_COLLECTD
 
-menu "match plugins"
+comment "match plugins"
 
 config BR2_PACKAGE_COLLECTD_EMPTY_COUNTER
 	bool "empty counter"
@@ -39,9 +39,8 @@ config BR2_PACKAGE_COLLECTD_VALUE
 	bool "value"
 	help
 	  Select values by their data sources' values.
-endmenu
 
-menu "misc plugins"
+comment "misc plugins"
 
 config BR2_PACKAGE_COLLECTD_AGGREGATION
 	bool "aggregation"
@@ -86,9 +85,7 @@ config BR2_PACKAGE_COLLECTD_THRESHOLD
 	  Checks values against configured thresholds and creates notifications
 	  if values are out of bounds.
 
-endmenu
-
-menu "read plugins"
+comment "read plugins"
 
 comment "Select at least one for collectd to be useful"
 
@@ -455,9 +452,7 @@ config BR2_PACKAGE_COLLECTD_ZOOKEEPER
 	help
 	  Read data from Zookeeper's MNTR command.
 
-endmenu
-
-menu "target plugins"
+comment "target plugins"
 
 config BR2_PACKAGE_COLLECTD_NOTIFICATION
 	bool "notification"
@@ -479,9 +474,7 @@ config BR2_PACKAGE_COLLECTD_SET
 	help
 	  Set (overwrite) entire parts of an identifier.
 
-endmenu
-
-menu "write plugins"
+comment "write plugins"
 
 comment "Select at least one for collectd to be useful"
 
@@ -550,8 +543,6 @@ config BR2_PACKAGE_COLLECTD_WRITETSDB
 	  Sends data OpenTSDB, a scalable no master, no shared state time
 	  series database.
 
-endmenu
-
 endif
 
 comment "collectd needs a toolchain w/ threads, dynamic library"
-- 
1.9.1
