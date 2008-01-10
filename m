From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 10 Jan 2008 01:31:56 -0800 (PST)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/at91sam9261ek
Message-ID: <20080110093156.8F36212C5AC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-01-10 01:31:56 -0800 (Thu, 10 Jan 2008)
New Revision: 20841

Log:
Update at91sam9261ek default config

Modified:
   trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig


Changeset:
Modified: trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig	2008-01-10 09:31:15 UTC (rev 20840)
+++ trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig	2008-01-10 09:31:56 UTC (rev 20841)
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Fri Nov  2 13:39:03 2007
+# Thu Jan 10 08:15:40 2008
 #
 BR2_HAVE_DOT_CONFIG=y
 BR2_VERSION="0.10.0-svn"
@@ -146,6 +146,9 @@
 # Mirrors and Download locations
 #
 BR2_SOURCEFORGE_MIRROR="easynews"
+BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
+BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
+BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 
 #
 # Atmel Mirrors
@@ -296,11 +299,11 @@
 BR2_PACKAGE_BUSYBOX=y
 # BR2_BUSYBOX_VERSION_1_2_2_1 is not set
 # BR2_BUSYBOX_VERSION_1_6_1 is not set
-# BR2_BUSYBOX_VERSION_1_7_0 is not set
-# BR2_BUSYBOX_VERSION_1_7_1 is not set
-BR2_BUSYBOX_VERSION_1_7_2=y
+# BR2_BUSYBOX_VERSION_1_7_X is not set
+# BR2_BUSYBOX_VERSION_1_8_X is not set
+BR2_BUSYBOX_VERSION_1_9_X=y
 # BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
-BR2_BUSYBOX_VERSION="1.7.2"
+BR2_BUSYBOX_VERSION="1.9.0"
 BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS=y
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.6.0.config"
 BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
@@ -358,6 +361,10 @@
 # BR2_PACKAGE_LIBLOCKFILE is not set
 # BR2_PACKAGE_LIBSYSFS is not set
 # BR2_PACKAGE_LIBXML2 is not set
+
+#
+# libxslt	- disabled (requires pkgconfig)
+#
 # BR2_PACKAGE_LOCKFILE_PROGS is not set
 # BR2_PACKAGE_LSOF is not set
 # BR2_PACKAGE_LTP-TESTSUITE is not set
@@ -372,7 +379,10 @@
 #
 # Networking applications
 #
-# BR2_PACKAGE_ARGUS is not set
+
+#
+# argus		- disabled (requires libpcap)
+#
 # BR2_PACKAGE_AVAHI is not set
 # BR2_PACKAGE_BOA is not set
 # BR2_PACKAGE_BIND is not set
@@ -386,12 +396,17 @@
 # BR2_PACKAGE_IRDA_UTILS is not set
 # BR2_PACKAGE_IPERF is not set
 # BR2_PACKAGE_IPROUTE2 is not set
-# BR2_PACKAGE_IPSEC_TOOLS is not set
+
+#
+# ipsec-tools	- disabled (requires openssl, flex and the flex library (libfl.a) )
+#
 # BR2_PACKAGE_IPTABLES is not set
 # BR2_PACKAGE_KISMET is not set
 # BR2_PACKAGE_L2TP is not set
 # BR2_PACKAGE_LIBCGI is not set
 # BR2_PACKAGE_LIBCGICC is not set
+# BR2_PACKAGE_LIBEXOSIP2 is not set
+# BR2_PACKAGE_LIBOSIP2 is not set
 # BR2_PACKAGE_LIBPCAP is not set
 # BR2_PACKAGE_LINKS is not set
 # BR2_PACKAGE_LRZSZ is not set
@@ -440,14 +455,21 @@
 # BR2_PACKAGE_TFTPD is not set
 # BR2_PACKAGE_TN5250 is not set
 # BR2_PACKAGE_TTCP is not set
-# BR2_PACKAGE_VPNC is not set
+
+#
+# vpnc		- disabled (requires libgcrypt and libgpg_error)
+#
 # BR2_PACKAGE_VTUN is not set
 # BR2_PACKAGE_WIRELESS_TOOLS is not set
 BR2_BLOCKDEV_SUPPORT=y
-# BR2_PACKAGE_DBUS is not set
+
+#
+# dbus not available (need expat or libxml2)
+#
 # BR2_PACKAGE_DM is not set
 # BR2_PACKAGE_DMRAID is not set
 # BR2_PACKAGE_E2FSPROGS is not set
+# BR2_PACKAGE_LIBFUSE is not set
 # BR2_PACKAGE_GADGETFS_TEST is not set
 # BR2_PACKAGE_HAL is not set
 # BR2_PACKAGE_HWDATA is not set
@@ -461,6 +483,7 @@
 # BR2_PACKAGE_MEMTESTER is not set
 # BR2_PACKAGE_MKDOSFS is not set
 # BR2_PACKAGE_MTD is not set
+# BR2_PACKAGE_NTFS-3G is not set
 # BR2_PACKAGE_PCIUTILS is not set
 # BR2_PACKAGE_PCMCIA is not set
 # BR2_PACKAGE_RAIDTOOLS is not set
@@ -472,7 +495,10 @@
 # BR2_PACKAGE_XFSPROGS is not set
 BR2_AUDIO_SUPPORT=y
 # BR2_PACKAGE_ALSA_LIB is not set
-# BR2_PACKAGE_ASTERISK is not set
+
+#
+# asterisk	- disabled (required openssl and mpg123)
+#
 # BR2_PACKAGE_AUMIX is not set
 # BR2_PACKAGE_LIBMAD is not set
 # BR2_PACKAGE_LIBOGG is not set
@@ -483,6 +509,7 @@
 #
 # BR2_PACKAGE_MADPLAY is not set
 # BR2_PACKAGE_MPG123 is not set
+# BR2_PACKAGE_SPEEX is not set
 BR2_GRAPHIC_SUPPORT=y
 
 #
@@ -506,6 +533,7 @@
 # BR2_PACKAGE_LIBPNG is not set
 # BR2_PACKAGE_LIBUNGIF is not set
 # BR2_PACKAGE_SDL is not set
+# BR2_PACKAGE_SDL_TTF is not set
 # BR2_PACKAGE_TIFF is not set
 
 #
@@ -532,7 +560,10 @@
 #
 # X libraries and helper libraries
 #
-# BR2_PACKAGE_ATK is not set
+
+#
+# atk		- disabled (requires libglib2)
+#
 # BR2_PACKAGE_PANGO is not set
 # BR2_PACKAGE_LIBDRM is not set
 # BR2_PACKAGE_LIBGLIB12 is not set
@@ -551,6 +582,10 @@
 #
 
 #
+# dillo		- disabled (requires jpeg,libglib12,libgtk12,zlib,libpng and Xorg(7))
+#
+
+#
 # Video libraries/codecs and applications
 #
 # BR2_PACKAGE_MPLAYER is not set
@@ -560,11 +595,17 @@
 # BR2_PACKAGE_LZMA_HOST is not set
 # BR2_PACKAGE_ZLIB is not set
 BR2_SCRIPTING_SUPPORT=y
+
+#
+# lua		- disabled (requires readline and ncurses)
+#
 # BR2_PACKAGE_MICROPERL is not set
 # BR2_PACKAGE_PYTHON is not set
 # BR2_PACKAGE_RUBY is not set
 # BR2_PACKAGE_TCL is not set
 # BR2_PACKAGE_PHP is not set
+BR2_GAMES=y
+# BR2_PACKAGE_DOOM is not set
 
 #
 # Target filesystem options
