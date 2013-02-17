From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 17 Feb 2013 22:55:59 +0100
Subject: [Buildroot] [git commit] gesftpserver: needs mmu
Message-ID: <20130217221226.082269AB44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a32a55d87e4a2476fcc0dc3edc27e0a7f2dc4350
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/23298ba81896e473e903c17e12ad547049b8d348

Also fix the sort order.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in              |    2 +-
 package/gesftpserver/Config.in |    1 +
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 2fad94d..faee5c3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -633,6 +633,7 @@ source "package/dnsmasq/Config.in"
 source "package/dropbear/Config.in"
 source "package/ebtables/Config.in"
 source "package/ethtool/Config.in"
+source "package/gesftpserver/Config.in"
 source "package/heirloom-mailx/Config.in"
 source "package/hiawatha/Config.in"
 source "package/hostapd/Config.in"
@@ -649,7 +650,6 @@ source "package/ipsec-tools/Config.in"
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
 
