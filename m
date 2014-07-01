From: Alexander Potashev <a.potashev@geoscan.aero>
Date: Tue,  1 Jul 2014 13:15:29 +0400
Subject: [Buildroot] [PATCH] wget: Depends on libuuid
Message-ID: <1404206129-27696-1-git-send-email-a.potashev@geoscan.aero>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexander Potashev <a.potashev@geoscan.aero>
---
 package/wget/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/wget/Config.in b/package/wget/Config.in
index 26a2019..fc7ee26 100644
--- a/package/wget/Config.in
+++ b/package/wget/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_WGET
 	# fork()
 	depends on BR2_USE_MMU
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  Network utility to retrieve files from http, https and ftp.
 
-- 
1.9.3
