From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 14 Feb 2013 10:03:00 -0300
Subject: [Buildroot] [PATCH 1/2] gesftpserver: needs mmu
Message-ID: <1360846981-26122-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/23298ba81896e473e903c17e12ad547049b8d348

Also fix the sort order.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in              | 2 +-
 package/gesftpserver/Config.in | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index b6755d7..e65396a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -637,6 +637,7 @@ source "package/dnsmasq/Config.in"
 source "package/dropbear/Config.in"
 source "package/ebtables/Config.in"
 source "package/ethtool/Config.in"
+source "package/gesftpserver/Config.in"
 source "package/heirloom-mailx/Config.in"
 source "package/hiawatha/Config.in"
 source "package/hostapd/Config.in"
@@ -653,7 +654,6 @@ source "package/ipsec-tools/Config.in"
 source "package/ipset/Config.in"
 source "package/iptables/Config.in"
 source "package/iw/Config.in"
-source "package/gesftpserver/Config.in"
 source "package/kismet/Config.in"
 source "package/lighttpd/Config.in"
 source "package/links/Config.in"
diff --git a/package/gesftpserver/Config.in b/package/gesftpserver/Config.in
index bc38c51..57bbf29 100644
--- a/package/gesftpserver/Config.in
+++ b/package/gesftpserver/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_GESFTPSERVER
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 	help
 	  Green End SFTP Server
 
-- 
1.7.12.4
