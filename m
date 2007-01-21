From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 21 Jan 2007 08:08:28 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070121160828.5678148581@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-21 08:08:27 -0800 (Sun, 21 Jan 2007)
New Revision: 17435

Log:
- add some more categories and move respective packages to them.
  I hope that this makes navigation and finding packages easier..


Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-01-21 14:36:25 UTC (rev 17434)
+++ trunk/buildroot/package/Config.in	2007-01-21 16:08:27 UTC (rev 17435)
@@ -21,8 +21,6 @@
 source "package/gawk/Config.in"
 endif
 source "toolchain/gcc/Config.in.2"
-source "toolchain/uClibc/Config.in.2"
-source "toolchain/ccache/Config.in.2"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/grep/Config.in"
 endif
@@ -33,44 +31,33 @@
 source "package/tar/Config.in"
 endif
 
-comment "Other stuff"
-source "package/acpid/Config.in"
-source "package/asterisk/Config.in"
-source "package/at/Config.in"
-source "package/atk/Config.in"
+comment "Other development stuff"
+source "toolchain/uClibc/Config.in.2"
 source "package/autoconf/Config.in"
 source "package/automake/Config.in"
-source "package/avahi/Config.in"
-source "package/berkeleydb/Config.in"
 source "package/bison/Config.in"
-source "package/boa/Config.in"
-source "package/bsdiff/Config.in"
-source "package/customize/Config.in"
-source "package/dash/Config.in"
-source "package/dbus/Config.in"
-source "package/dbus-glib/Config.in"
-source "package/dialog/Config.in"
-source "package/directfb/Config.in"
+source "toolchain/ccache/Config.in.2"
 source "package/distcc/Config.in"
-source "package/dm/Config.in"
 source "package/dmalloc/Config.in"
-source "package/dmraid/Config.in"
 source "package/expat/Config.in"
-source "package/e2fsprogs/Config.in"
 source "package/fakeroot/Config.in"
-source "package/file/Config.in"
 source "package/gettext/Config.in"
 source "package/gmp/Config.in"
 source "package/mpfr/Config.in"
-source "package/gzip/Config.in"
-source "package/hal/Config.in"
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
-source "package/hdparm/Config.in"
-source "package/hotplug/Config.in"
-endif
-source "package/hwdata/Config.in"
-source "package/iostat/Config.in"
-source "package/jpeg/Config.in"
+source "package/libtool/Config.in"
+source "package/m4/Config.in"
+source "package/mpatrol/Config.in"
+source "package/pkgconfig/Config.in"
+source "package/readline/Config.in"
+source "package/valgrind/Config.in"
+
+comment "Other stuff"
+source "package/at/Config.in"
+source "package/berkeleydb/Config.in"
+source "package/bsdiff/Config.in"
+source "package/customize/Config.in"
+source "package/dash/Config.in"
+source "package/file/Config.in"
 source "package/kexec/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/less/Config.in"
@@ -78,41 +65,20 @@
 source "package/libelf/Config.in"
 source "package/libevent/Config.in"
 source "package/libfloat/Config.in"
-source "package/libmad/Config.in"
-source "package/libpng/Config.in"
-source "package/libraw1394/Config.in"
 source "package/libsysfs/Config.in"
-source "package/libtool/Config.in"
-source "package/libusb/Config.in"
 source "package/lsof/Config.in"
 source "package/ltp-testsuite/Config.in"
 source "package/ltrace/Config.in"
 source "package/ltt/Config.in"
-source "package/lvm2/Config.in"
-source "package/lzo/Config.in"
-source "package/lzma/Config.in"
-source "package/m4/Config.in"
-source "package/mdadm/Config.in"
-source "package/memtester/Config.in"
 source "package/microcom/Config.in"
-source "package/microperl/Config.in"
-source "package/mkdosfs/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/module-init-tools/Config.in"
 source "package/modutils/Config.in"
 endif
-source "package/mpatrol/Config.in"
-source "package/mpg123/Config.in"
-source "package/mtd/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 # busybox has an editor..
 source "package/nano/Config.in"
 endif
-source "package/ncurses/Config.in"
-source "package/newt/Config.in"
-source "package/pciutils/Config.in"
-source "package/pcmcia/Config.in"
-source "package/pkgconfig/Config.in"
 source "package/portage/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/procps/Config.in"
@@ -120,19 +86,6 @@
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/psmisc/Config.in"
 endif
-source "package/python/Config.in"
-source "package/qte/Config.in"
-source "package/qtopia4/Config.in"
-source "package/raidtools/Config.in"
-source "package/readline/Config.in"
-source "package/ruby/Config.in"
-source "package/sdl/Config.in"
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
-# busybox has fdisk
-source "package/sfdisk/Config.in"
-endif
-source "package/slang/Config.in"
-source "package/smartmontools/Config.in"
 source "package/sqlite/Config.in"
 source "package/strace/Config.in"
 source "package/sudo/Config.in"
@@ -141,38 +94,30 @@
 # busybox has init and the runit stuff
 source "package/sysvinit/Config.in"
 endif
-source "package/tcl/Config.in"
-source "package/tiff/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/tinylogin/Config.in"
 endif
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
-# mdev
-source "package/udev/Config.in"
 # busybox has an editor..
 source "package/uemacs/Config.in"
 endif
-source "package/usbmount/Config.in"
-source "package/usbutils/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/util-linux/Config.in"
 endif
-source "package/valgrind/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/which/Config.in"
 endif
-source "package/wipe/Config.in"
-source "package/xfsprogs/Config.in"
-source "package/zlib/Config.in"
 
 menuconfig BR2_NETWORK_SUPPORT
 	bool "Networking"
-	default n
+	default y
 	help
 	  Support for networking and related packages
 
 if BR2_NETWORK_SUPPORT
 source "package/argus/Config.in"
+source "package/avahi/Config.in"
+source "package/boa/Config.in"
 source "package/bind/Config.in"
 source "package/bridge/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
@@ -186,7 +131,7 @@
 source "package/iproute2/Config.in"
 source "package/ipsec-tools/Config.in"
 source "package/iptables/Config.in"
-#source "package/l2tp/Config.in"
+source "package/l2tp/Config.in"
 source "package/libcgi/Config.in"
 source "package/libcgicc/Config.in"
 source "package/libpcap/Config.in"
@@ -231,19 +176,98 @@
 
 endif
 
+menuconfig BR2_BLOCKDEV_SUPPORT
+	bool "Hardware handling / blockdevices and filesystem maintenance"
+	default y
+	help
+	  Support for hardware handling and maintenance, block devices,
+	  filesystem creation and maintenance.
 
-menuconfig BR2_X_WINDOW_SYSTEM
-	bool "X Window System"
-	default n
+if BR2_BLOCKDEV_SUPPORT
+source "package/acpid/Config.in"
+source "package/dbus/Config.in"
+source "package/dbus-glib/Config.in"
+source "package/dm/Config.in"
+source "package/dmraid/Config.in"
+source "package/e2fsprogs/Config.in"
+source "package/hal/Config.in"
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+source "package/hdparm/Config.in"
+source "package/hotplug/Config.in"
+endif
+source "package/hwdata/Config.in"
+source "package/iostat/Config.in"
+source "package/libraw1394/Config.in"
+source "package/libusb/Config.in"
+source "package/lvm2/Config.in"
+source "package/mdadm/Config.in"
+source "package/memtester/Config.in"
+source "package/mkdosfs/Config.in"
+source "package/mtd/Config.in"
+source "package/pciutils/Config.in"
+source "package/pcmcia/Config.in"
+source "package/raidtools/Config.in"
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+# busybox has fdisk
+source "package/sfdisk/Config.in"
+endif
+source "package/smartmontools/Config.in"
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+# mdev
+source "package/udev/Config.in"
+endif
+source "package/usbmount/Config.in"
+source "package/usbutils/Config.in"
+source "package/wipe/Config.in"
+source "package/xfsprogs/Config.in"
+endif
+
+menuconfig BR2_AUDIO_SUPPORT
+	bool "Audio libraries and applications"
+	default y
 	help
-	  Support for X and related packages
+	  Support for audio libraries and applications
 
-if BR2_X_WINDOW_SYSTEM
+if BR2_AUDIO_SUPPORT
+source "package/asterisk/Config.in"
+source "package/libmad/Config.in"
+source "package/mpg123/Config.in"
+endif
+
+menuconfig BR2_GRAPHIC_SUPPORT
+	bool "Graphic libraries and applications (graphic/text)"
+	default y
+	help
+	  Support for graphic libraries, X Window system and related
+	  packages, graphical toolkits, etc.
+
+if BR2_GRAPHIC_SUPPORT
+comment "text rendering libraries"
+source "package/ncurses/Config.in"
+source "package/newt/Config.in"
+source "package/slang/Config.in"
+
+comment "text rendering applications"
+source "package/dialog/Config.in"
+
+comment "graphic libraries"
+source "package/directfb/Config.in"
+source "package/jpeg/Config.in"
+source "package/libpng/Config.in"
+source "package/sdl/Config.in"
+source "package/tiff/Config.in"
+
+comment "other GUIs"
+source "package/qte/Config.in"
+source "package/qtopia4/Config.in"
+
 #source "package/microwin/Config.in"
-comment "X server"
+
+comment "X Window System server"
 source "package/xorg/Config.in"
 source "package/tinyx/Config.in"
 comment "X libraries and helper libraries"
+source "package/atk/Config.in"
 source "package/cairo/Config.in"
 source "package/pango/Config.in"
 source "package/libglib12/Config.in"
@@ -252,7 +276,7 @@
 source "package/libgtk2/Config.in"
 source "package/fontconfig/Config.in"
 source "package/freetype/Config.in"
-comment "Window managers"
+comment "X Window managers"
 source "package/metacity/Config.in"
 comment "X applications"
 source "package/dillo/Config.in"
@@ -261,4 +285,30 @@
 
 endif
 
+menuconfig BR2_COMPRESSOR_SUPPORT
+	bool "Compressors / decompressors"
+	default y
+	help
+	  Support for compressors and decompressors like lzo, lzma, bzip2
+
+if BR2_COMPRESSOR_SUPPORT_SUPPORT
+source "package/gzip/Config.in"
+source "package/lzo/Config.in"
+source "package/lzma/Config.in"
+source "package/zlib/Config.in"
+endif
+
+menuconfig BR2_SCRIPTING_SUPPORT
+	bool "Interpreter languages / Scripting"
+	default y
+	help
+	  Support for scripting languages, interpreter languages.
+
+if BR2_SCRIPTING_SUPPORT
+source "package/microperl/Config.in"
+source "package/python/Config.in"
+source "package/ruby/Config.in"
+source "package/tcl/Config.in"
+endif
+
 endmenu
