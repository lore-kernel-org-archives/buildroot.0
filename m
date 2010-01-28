From: Francisco Gonzalez <gzmorell@gmail.com>
Date: Thu, 28 Jan 2010 16:30:37 +0100
Subject: [Buildroot] [git commit master] New package ser2net request
Message-ID: <20100128153324.28FDA776A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=35a478e8f53613cda0f1ddbdc09db8e0a02c4a3c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: whitespace fixes / cleanups]
Signed-off-by: Francisco Gonzalez <gzmorell@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    6 +++---
 package/Config.in          |    1 +
 package/ser2net/Config.in  |    8 ++++++++
 package/ser2net/ser2net.mk |   11 +++++++++++
 4 files changed, 23 insertions(+), 3 deletions(-)
 create mode 100644 package/ser2net/Config.in
 create mode 100644 package/ser2net/ser2net.mk

diff --git a/CHANGES b/CHANGES
index b1bc046..2534fc4 100644
--- a/CHANGES
+++ b/CHANGES
@@ -8,9 +8,9 @@
 	busybox, directfb, dnsmasq, e2fsprogs, gstreamer, gperf,
 	gst-plugins-bad, flex, hal, iptables, iw, jpeg, kismet, libfuse,
 	libpcap, libungif, lighttpd, mesa, mpg123, mtd-utils, neon,
-	netstat-nat, openvpn, pcre, qt, rpm, sdl, sdl_ttf, sqlite, sshfs,
-	tremor, u-boot, usb_modeswitch, usbutils, webkit, wpa_supplicant,
-	xfsprogs
+	netstat-nat, openvpn, pcre, qt, rpm, sdl, sdl_ttf, ser2net, sqlite,
+	sshfs, tremor, u-boot, usb_modeswitch, usbutils, webkit,
+	wpa_supplicant, xfsprogs
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/Config.in b/package/Config.in
index 6adf913..e673631 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -197,6 +197,7 @@ source "package/proftpd/Config.in"
 source "package/quagga/Config.in"
 source "package/rsync/Config.in"
 source "package/samba/Config.in"
+source "package/ser2net/Config.in"
 source "package/socat/Config.in"
 source "package/spawn-fcgi/Config.in"
 source "package/stunnel/Config.in"
diff --git a/package/ser2net/Config.in b/package/ser2net/Config.in
new file mode 100644
index 0000000..7eb3a6a
--- /dev/null
+++ b/package/ser2net/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_SER2NET
+	bool "ser2net"
+	help
+	  Ser2net provides a way for a user to connect from a network
+	  connection to a serial port..
+
+	  http://ser2net.sourceforge.net
+
diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
new file mode 100644
index 0000000..3bfe8e3
--- /dev/null
+++ b/package/ser2net/ser2net.mk
@@ -0,0 +1,11 @@
+#############################################################
+#
+# ser2net
+#
+#############################################################
+
+SER2NET_VERSION = 2.6
+SER2NET_SOURCE = ser2net-$(SER2NET_VERSION).tar.gz
+SER2NET_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/ser2net
+
+$(eval $(call AUTOTARGETS,package,ser2net))
-- 
1.6.3.3
