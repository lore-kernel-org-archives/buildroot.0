From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 23 Jun 2019 13:40:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/util-linux: minix needs MMU
Message-ID: <20190623114053.8775-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/87801e1a3c628e00ccb0c57afc2b46cc735c6018

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/util-linux/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index acde9e5474..39eb2c03a0 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -217,6 +217,7 @@ config BR2_PACKAGE_UTIL_LINUX_MESG
 
 config BR2_PACKAGE_UTIL_LINUX_MINIX
 	bool "minix"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Minix filesystem support
 
-- 
2.20.1
