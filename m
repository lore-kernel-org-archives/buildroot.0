From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  3 Mar 2013 08:28:47 -0300
Subject: [Buildroot] [PATCH] f2fs-tools: explicitly select libuuid
Message-ID: <1362310127-27764-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Explicitly select BR2_PACKAGE_UTIL_LINUX_LIBUUID. Fixes:
http://autobuild.buildroot.net/results/da5c52b658d9efc25d2c2ad3980add3a36b99ee2/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/f2fs-tools/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/f2fs-tools/Config.in b/package/f2fs-tools/Config.in
index 20db928..99ee91c 100644
--- a/package/f2fs-tools/Config.in
+++ b/package/f2fs-tools/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_F2FS_TOOLS
 	bool "f2fs-tools"
 	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # util-linux
 	help
-- 
1.7.12.4
