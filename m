From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 12 Sep 2012 19:54:19 -0300
Subject: [Buildroot] [PATCH] package: add new filesystem utilities category
Message-ID: <1347490459-4049-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the new filesystem utilities category and move a bunch of packages
into it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in |   33 ++++++++++++++++++---------------
 1 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 345ed82..85a4a8c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -167,10 +167,27 @@ source "package/xterm/Config.in"
 source "package/xvkbd/Config.in"
 endmenu
 
+menu "Filesystem utilities"
+source "package/cifs-utils/Config.in"
+source "package/cramfs/Config.in"
+source "package/dosfstools/Config.in"
+source "package/e2fsprogs/Config.in"
+source "package/genext2fs/Config.in"
+source "package/genromfs/Config.in"
+source "package/makedevs/Config.in"
+source "package/mtd/Config.in"
+source "package/nfs-utils/Config.in"
+source "package/ntfs-3g/Config.in"
+source "package/squashfs/Config.in"
+source "package/squashfs3/Config.in"
+source "package/sshfs/Config.in"
+source "package/unionfs/Config.in"
+source "package/xfsprogs/Config.in"
+endmenu
+
 menu "Hardware handling"
 source "package/acpid/Config.in"
 source "package/cdrkit/Config.in"
-source "package/cramfs/Config.in"
 source "package/dbus/Config.in"
 source "package/dbus-glib/Config.in"
 source "package/dbus-python/Config.in"
@@ -179,8 +196,6 @@ source "package/devmem2/Config.in"
 endif
 source "package/dmidecode/Config.in"
 source "package/dmraid/Config.in"
-source "package/dosfstools/Config.in"
-source "package/e2fsprogs/Config.in"
 source "package/eeprog/Config.in"
 source "package/flashrom/Config.in"
 source "package/fconfig/Config.in"
@@ -188,8 +203,6 @@ source "package/fis/Config.in"
 source "package/fmtools/Config.in"
 source "package/gadgetfs-test/Config.in"
 source "package/gdisk/Config.in"
-source "package/genext2fs/Config.in"
-source "package/genromfs/Config.in"
 source "package/gpsd/Config.in"
 source "package/gvfs/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
@@ -208,13 +221,10 @@ source "package/lm-sensors/Config.in"
 source "package/lshw/Config.in"
 source "package/lsuio/Config.in"
 source "package/lvm2/Config.in"
-source "package/makedevs/Config.in"
 source "package/mdadm/Config.in"
 source "package/memtester/Config.in"
 source "package/minicom/Config.in"
-source "package/mtd/Config.in"
 source "package/nanocom/Config.in"
-source "package/ntfs-3g/Config.in"
 source "package/ofono/Config.in"
 source "package/open2300/Config.in"
 source "package/openocd/Config.in"
@@ -228,22 +238,17 @@ source "package/sane-backends/Config.in"
 source "package/sdparm/Config.in"
 source "package/setserial/Config.in"
 source "package/smartmontools/Config.in"
-source "package/squashfs/Config.in"
-source "package/squashfs3/Config.in"
 source "package/sredird/Config.in"
-source "package/sshfs/Config.in"
 source "package/statserial/Config.in"
 source "package/sysstat/Config.in"
 source "package/ti-utils/Config.in"
 source "package/uboot-tools/Config.in"
 source "package/udev/Config.in"
-source "package/unionfs/Config.in"
 source "package/usb_modeswitch/Config.in"
 source "package/usb_modeswitch_data/Config.in"
 source "package/usbmount/Config.in"
 source "package/usbutils/Config.in"
 source "package/wipe/Config.in"
-source "package/xfsprogs/Config.in"
 endmenu
 
 menu "Interpreter languages and scripting"
@@ -531,7 +536,6 @@ source "package/bridge-utils/Config.in"
 source "package/can-utils/Config.in"
 source "package/connman/Config.in"
 source "package/ctorrent/Config.in"
-source "package/cifs-utils/Config.in"
 source "package/conntrack-tools/Config.in"
 source "package/cups/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
@@ -583,7 +587,6 @@ source "package/netsnmp/Config.in"
 source "package/netstat-nat/Config.in"
 source "package/network-manager/Config.in"
 source "package/noip/Config.in"
-source "package/nfs-utils/Config.in"
 source "package/ngircd/Config.in"
 source "package/ngrep/Config.in"
 source "package/ntp/Config.in"
-- 
1.7.8.6
