From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 17 Jan 2007 03:48:12 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  busybox
Message-ID: <20070117114812.5A5AF4858D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-17 03:48:11 -0800 (Wed, 17 Jan 2007)
New Revision: 17336

Log:
- add central knob (BR2_PACKAGE_BUSYBOX_HIDE_OTHERS) to hide packages that
  are potentially provided by busybox.


Modified:
   trunk/buildroot/package/Config.in
   trunk/buildroot/package/busybox/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-01-17 11:34:20 UTC (rev 17335)
+++ trunk/buildroot/package/Config.in	2007-01-17 11:48:11 UTC (rev 17336)
@@ -8,21 +8,30 @@
 comment "The minimum needed to build a uClibc development system"
 source "package/bash/Config.in"
 source "package/bzip2/Config.in"
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/coreutils/Config.in"
+endif
 source "package/diffutils/Config.in"
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/ed/Config.in"
 source "package/findutils/Config.in"
+endif
 source "package/flex/Config.in"
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/gawk/Config.in"
+endif
 source "toolchain/gcc/Config.in.2"
 source "toolchain/ccache/Config.in.2"
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/grep/Config.in"
+endif
 source "package/make/Config.in"
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/patch/Config.in"
 source "package/sed/Config.in"
 source "package/tar/Config.in"
+endif
 
-
 comment "Other stuff"
 source "package/acpid/Config.in"
 source "package/argus/Config.in"
@@ -42,7 +51,9 @@
 source "package/dash/Config.in"
 source "package/dbus/Config.in"
 source "package/dbus-glib/Config.in"
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/dhcp/Config.in"
+endif
 source "package/dialog/Config.in"
 source "package/directfb/Config.in"
 source "package/distcc/Config.in"
@@ -62,9 +73,13 @@
 source "package/gzip/Config.in"
 source "package/hal/Config.in"
 source "package/haserl/Config.in"
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/hdparm/Config.in"
+endif
 source "package/hostap/Config.in"
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/hotplug/Config.in"
+endif
 source "package/hwdata/Config.in"
 source "package/iostat/Config.in"
 source "package/iproute2/Config.in"
@@ -72,7 +87,9 @@
 source "package/iptables/Config.in"
 source "package/jpeg/Config.in"
 source "package/kexec/Config.in"
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/less/Config.in"
+endif
 source "package/libcgi/Config.in"
 source "package/libcgicc/Config.in"
 source "package/libelf/Config.in"
@@ -101,13 +118,18 @@
 source "package/microcom/Config.in"
 source "package/microperl/Config.in"
 source "package/mkdosfs/Config.in"
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/module-init-tools/Config.in"
 source "package/modutils/Config.in"
+endif
 source "package/mpatrol/Config.in"
 source "package/mpg123/Config.in"
 source "package/mrouted/Config.in"
 source "package/mtd/Config.in"
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+# busybox has an editor..
 source "package/nano/Config.in"
+endif
 source "package/nbd/Config.in"
 source "package/ncurses/Config.in"
 source "package/netkitbase/Config.in"
@@ -128,9 +150,13 @@
 source "package/portage/Config.in"
 source "package/portmap/Config.in"
 source "package/pppd/Config.in"
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/procps/Config.in"
+endif
 source "package/proftpd/Config.in"
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/psmisc/Config.in"
+endif
 source "package/python/Config.in"
 source "package/qte/Config.in"
 source "package/qtopia4/Config.in"
@@ -140,7 +166,10 @@
 source "package/ruby/Config.in"
 source "package/samba/Config.in"
 source "package/sdl/Config.in"
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+# busybox has fdisk
 source "package/sfdisk/Config.in"
+endif
 source "package/slang/Config.in"
 source "package/smartmontools/Config.in"
 source "package/socat/Config.in"
@@ -149,25 +178,40 @@
 source "package/stunnel/Config.in"
 source "package/sudo/Config.in"
 source "package/sysklogd/Config.in"
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+# busybox has init and the runit stuff
 source "package/sysvinit/Config.in"
+endif
 source "package/tcl/Config.in"
 source "package/tcpdump/Config.in"
 source "package/tftpd/Config.in"
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/thttpd/Config.in"
+endif
 source "package/tiff/Config.in"
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/tinylogin/Config.in"
+endif
 source "package/tn5250/Config.in"
 source "package/ttcp/Config.in"
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+# mdev
 source "package/udev/Config.in"
 source "package/udhcp/Config.in"
+# busybox has an editor..
 source "package/uemacs/Config.in"
+endif
 source "package/usbmount/Config.in"
 source "package/usbutils/Config.in"
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/util-linux/Config.in"
+endif
 source "package/valgrind/Config.in"
 source "package/vtun/Config.in"
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/wget/Config.in"
 source "package/which/Config.in"
+endif
 source "package/wipe/Config.in"
 source "package/wireless-tools/Config.in"
 source "package/xfsprogs/Config.in"

Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2007-01-17 11:34:20 UTC (rev 17335)
+++ trunk/buildroot/package/busybox/Config.in	2007-01-17 11:48:11 UTC (rev 17336)
@@ -56,3 +56,12 @@
 	  file, and will specify their config file location with this option.
 
 	  Most people will just use the default BusyBox configuration file.
+
+config BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+	bool "Hide applications that are provided by busybox"
+	depends on BR2_PACKAGE_BUSYBOX
+	default y if BR2_PACKAGE_BUSYBOX_SNAPSHOT
+	help
+	  Do not show packages in menuconfig that are potentially provided
+	  by busybox.
+
