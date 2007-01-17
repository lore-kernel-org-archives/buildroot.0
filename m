From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 17 Jan 2007 04:27:28 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070117122728.BA7C848599@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-17 04:27:27 -0800 (Wed, 17 Jan 2007)
New Revision: 17338

Log:
- add a BR2_NETWORK_SUPPORT and move related packages to it


Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-01-17 12:03:59 UTC (rev 17337)
+++ trunk/buildroot/package/Config.in	2007-01-17 12:27:27 UTC (rev 17338)
@@ -34,7 +34,6 @@
 
 comment "Other stuff"
 source "package/acpid/Config.in"
-source "package/argus/Config.in"
 source "package/asterisk/Config.in"
 source "package/at/Config.in"
 source "package/atk/Config.in"
@@ -42,27 +41,19 @@
 source "package/automake/Config.in"
 source "package/avahi/Config.in"
 source "package/berkeleydb/Config.in"
-source "package/bind/Config.in"
 source "package/bison/Config.in"
 source "package/boa/Config.in"
-source "package/bridge/Config.in"
 source "package/bsdiff/Config.in"
 source "package/customize/Config.in"
 source "package/dash/Config.in"
 source "package/dbus/Config.in"
 source "package/dbus-glib/Config.in"
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
-source "package/dhcp/Config.in"
-endif
 source "package/dialog/Config.in"
 source "package/directfb/Config.in"
 source "package/distcc/Config.in"
 source "package/dm/Config.in"
 source "package/dmalloc/Config.in"
 source "package/dmraid/Config.in"
-source "package/dnsmasq/Config.in"
-source "package/dropbear/Config.in"
-source "package/ethtool/Config.in"
 source "package/expat/Config.in"
 source "package/e2fsprogs/Config.in"
 source "package/fakeroot/Config.in"
@@ -75,36 +66,24 @@
 source "package/haserl/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/hdparm/Config.in"
-endif
-source "package/hostap/Config.in"
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/hotplug/Config.in"
 endif
 source "package/hwdata/Config.in"
 source "package/iostat/Config.in"
-source "package/iproute2/Config.in"
-source "package/ipsec-tools/Config.in"
-source "package/iptables/Config.in"
 source "package/jpeg/Config.in"
 source "package/kexec/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/less/Config.in"
 endif
-source "package/libcgi/Config.in"
-source "package/libcgicc/Config.in"
 source "package/libelf/Config.in"
 source "package/libevent/Config.in"
 source "package/libfloat/Config.in"
 source "package/libmad/Config.in"
-source "package/libpcap/Config.in"
 source "package/libpng/Config.in"
 source "package/libraw1394/Config.in"
 source "package/libsysfs/Config.in"
 source "package/libtool/Config.in"
 source "package/libusb/Config.in"
-source "package/lighttpd/Config.in"
-source "package/links/Config.in"
-source "package/lrzsz/Config.in"
 source "package/lsof/Config.in"
 source "package/ltp-testsuite/Config.in"
 source "package/ltrace/Config.in"
@@ -124,36 +103,20 @@
 endif
 source "package/mpatrol/Config.in"
 source "package/mpg123/Config.in"
-source "package/mrouted/Config.in"
 source "package/mtd/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 # busybox has an editor..
 source "package/nano/Config.in"
 endif
-source "package/nbd/Config.in"
 source "package/ncurses/Config.in"
-source "package/netkitbase/Config.in"
-source "package/netkittelnet/Config.in"
-source "package/netplug/Config.in"
-source "package/netsnmp/Config.in"
 source "package/newt/Config.in"
-source "package/nfs-utils/Config.in"
-source "package/ntp/Config.in"
-source "package/openntpd/Config.in"
-source "package/openssh/Config.in"
-source "package/openssl/Config.in"
-source "package/openvpn/Config.in"
-source "package/openswan/Config.in"
 source "package/pciutils/Config.in"
 source "package/pcmcia/Config.in"
 source "package/pkgconfig/Config.in"
 source "package/portage/Config.in"
-source "package/portmap/Config.in"
-source "package/pppd/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/procps/Config.in"
 endif
-source "package/proftpd/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/psmisc/Config.in"
 endif
@@ -162,9 +125,7 @@
 source "package/qtopia4/Config.in"
 source "package/raidtools/Config.in"
 source "package/readline/Config.in"
-source "package/rsync/Config.in"
 source "package/ruby/Config.in"
-source "package/samba/Config.in"
 source "package/sdl/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 # busybox has fdisk
@@ -172,10 +133,8 @@
 endif
 source "package/slang/Config.in"
 source "package/smartmontools/Config.in"
-source "package/socat/Config.in"
 source "package/sqlite/Config.in"
 source "package/strace/Config.in"
-source "package/stunnel/Config.in"
 source "package/sudo/Config.in"
 source "package/sysklogd/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
@@ -183,21 +142,13 @@
 source "package/sysvinit/Config.in"
 endif
 source "package/tcl/Config.in"
-source "package/tcpdump/Config.in"
-source "package/tftpd/Config.in"
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
-source "package/thttpd/Config.in"
-endif
 source "package/tiff/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/tinylogin/Config.in"
 endif
-source "package/tn5250/Config.in"
-source "package/ttcp/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 # mdev
 source "package/udev/Config.in"
-source "package/udhcp/Config.in"
 # busybox has an editor..
 source "package/uemacs/Config.in"
 endif
@@ -207,16 +158,78 @@
 source "package/util-linux/Config.in"
 endif
 source "package/valgrind/Config.in"
-source "package/vtun/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
-source "package/wget/Config.in"
 source "package/which/Config.in"
 endif
 source "package/wipe/Config.in"
-source "package/wireless-tools/Config.in"
 source "package/xfsprogs/Config.in"
 source "package/zlib/Config.in"
 
+menuconfig BR2_NETWORK_SUPPORT
+	bool "Networking"
+	default n
+	help
+	  Support for networking and related packages
+
+if BR2_NETWORK_SUPPORT
+source "package/argus/Config.in"
+source "package/bind/Config.in"
+source "package/bridge/Config.in"
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+source "package/dhcp/Config.in"
+endif
+source "package/dnsmasq/Config.in"
+source "package/dropbear/Config.in"
+source "package/ethtool/Config.in"
+source "package/hostap/Config.in"
+source "package/iproute2/Config.in"
+source "package/ipsec-tools/Config.in"
+source "package/iptables/Config.in"
+source "package/libcgi/Config.in"
+source "package/libcgicc/Config.in"
+source "package/libpcap/Config.in"
+source "package/lighttpd/Config.in"
+source "package/links/Config.in"
+source "package/lrzsz/Config.in"
+source "package/mrouted/Config.in"
+source "package/nbd/Config.in"
+source "package/netkitbase/Config.in"
+source "package/netkittelnet/Config.in"
+source "package/netplug/Config.in"
+source "package/netsnmp/Config.in"
+source "package/nfs-utils/Config.in"
+source "package/ntp/Config.in"
+source "package/openntpd/Config.in"
+source "package/openssh/Config.in"
+source "package/openssl/Config.in"
+source "package/openvpn/Config.in"
+source "package/openswan/Config.in"
+source "package/portmap/Config.in"
+source "package/pppd/Config.in"
+source "package/proftpd/Config.in"
+source "package/rsync/Config.in"
+source "package/samba/Config.in"
+source "package/socat/Config.in"
+source "package/stunnel/Config.in"
+source "package/tcpdump/Config.in"
+source "package/tftpd/Config.in"
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+source "package/thttpd/Config.in"
+endif
+source "package/tn5250/Config.in"
+source "package/ttcp/Config.in"
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+source "package/udhcp/Config.in"
+endif
+source "package/vtun/Config.in"
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+source "package/wget/Config.in"
+endif
+source "package/wireless-tools/Config.in"
+
+endif
+
+
 menuconfig BR2_X_WINDOW_SYSTEM
 	bool "X Window System"
 	default n
