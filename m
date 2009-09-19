From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 19 Sep 2009 19:28:07 +0200
Subject: [Buildroot] [git commit master] package/: hide more programs with
	busybox alternatives by default
Message-ID: <20090919172939.C97B777767@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=797551c8ce0ebe05a02e42359b909e602bd1abd4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Hide netkitbase / netkittelnet / tftp / devmem2 when
BR2_PACKAGE_BUSYBOX_HIDE_OTHERS is enabled.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in |   10 ++++------
 1 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index fc97222..061838b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -180,9 +180,9 @@ source "package/ncftp/Config.in"
 source "package/neon/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/netcat/Config.in"
-endif
 source "package/netkitbase/Config.in"
 source "package/netkittelnet/Config.in"
+endif
 source "package/netplug/Config.in"
 source "package/netsnmp/Config.in"
 source "package/netstat-nat/Config.in"
@@ -207,17 +207,13 @@ source "package/socat/Config.in"
 source "package/spawn-fcgi/Config.in"
 source "package/stunnel/Config.in"
 source "package/tcpdump/Config.in"
-source "package/tftpd/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+source "package/tftpd/Config.in"
 source "package/thttpd/Config.in"
 source "package/tinyhttpd/Config.in"
 endif
 source "package/tn5250/Config.in"
 source "package/ttcp/Config.in"
-#if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
-# ATTENTION! This was merged into busybox!
-#source "package/udhcp/Config.in"
-#endif
 source "package/udpcast/Config.in"
 source "package/vpnc/Config.in"
 source "package/vsftpd/Config.in"
@@ -236,7 +232,9 @@ source "package/acpid/Config.in"
 source "package/dbus/Config.in"
 source "package/dbus-glib/Config.in"
 source "package/dbus-python/Config.in"
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/devmem2/Config.in"
+endif
 source "package/dmraid/Config.in"
 source "package/dosfstools/Config.in"
 source "package/e2fsprogs/Config.in"
-- 
1.6.3.3
