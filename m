From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 28 Jan 2010 22:55:42 +0100
Subject: [Buildroot] [git commit master] dbus: fix target installation with
	BR2_HAVE_DEVFILES
Message-ID: <20100128220035.8686C77751@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3470b376f2dad8325a96b5b85a8802cec716e26f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES              |    2 +-
 package/dbus/dbus.mk |    2 ++
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 2fc503e..2076950 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,7 +5,7 @@
 	New packages: libcdaudio, libdvdnav, libdvdread, hostapd, tcpreplay
 
 	Updated/fixed packages: at, autoconf, bash, bind, binutils, bootutils,
-	busybox, directfb, dnsmasq, e2fsprogs, gstreamer, gperf,
+	busybox, dbus, directfb, dnsmasq, e2fsprogs, gstreamer, gperf,
 	gst-plugins-bad, gvfs, flex, hal, iptables, iw, jpeg, kismet, libfuse,
 	libglib2, libpcap, libungif, libxml2, libxslt, lighttpd, mesa, mpg123,
 	mtd-utils, neon, netstat-nat, openvpn, pcre, qt, readline, rpm,
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 276009c..a97fc02 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -81,7 +81,9 @@ $(DBUS_HOOK_POST_BUILD): $(DBUS_TARGET_BUILD)
 	touch $@
 
 $(DBUS_HOOK_POST_INSTALL): $(DBUS_TARGET_INSTALL_TARGET)
+ifneq ($(BR2_HAVE_DEVFILES),y)
 	rm -rf $(TARGET_DIR)/usr/lib/dbus-1.0
+endif
 	rm -rf $(TARGET_DIR)/var/lib/dbus
 	ln -sf /tmp/dbus $(TARGET_DIR)/var/lib/dbus
 	$(INSTALL) -m 0755 package/dbus/S30dbus $(TARGET_DIR)/etc/init.d
-- 
1.6.3.3
