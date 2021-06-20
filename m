From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 20 Jun 2021 20:25:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: requires DES support in
 openssl
Message-ID: <20210620182531.1291580-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable DES in openssl to fix build failure raised since commit
a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
http://autobuild.buildroot.net/results/b22/b22469d96ce64b277e942046845284e6729b42af/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index da6dce50f3..c033b29819 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -12,6 +12,7 @@ menuconfig BR2_PACKAGE_TVHEADEND
 	select BR2_PACKAGE_DTV_SCAN_TABLES
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	help
 
 	  Tvheadend is a TV streaming server for Linux supporting
-- 
2.30.2
