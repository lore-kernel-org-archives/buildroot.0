From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  4 Jul 2016 15:46:56 +0200
Subject: [Buildroot] [PATCH 2/2] package: move busybox show others
	dependency to per-package
In-Reply-To: <1467640016-19732-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1467640016-19732-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1467640016-19732-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Having the BR2_PACKAGE_BUSYBOX_SHOW_OTHERS dependencies in
package/Config.in is not very practical: it makes this file not very
readable, and puts the dependency away from the package itself, which
can sometimes be confusing. Therefore, this commit moves the dependency
in each package Config.in file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                   | 64 -------------------------------------
 package/bash/Config.in              |  1 +
 package/bootutils/Config.in         |  1 +
 package/coreutils/Config.in         |  2 ++
 package/dash/Config.in              |  1 +
 package/dcron/Config.in             |  1 +
 package/debianutils/Config.in       |  1 +
 package/devmem2/Config.in           |  1 +
 package/dhcp/Config.in              |  1 +
 package/diffutils/Config.in         |  2 ++
 package/dos2unix/Config.in          |  1 +
 package/fbset/Config.in             |  1 +
 package/findutils/Config.in         |  2 ++
 package/gawk/Config.in              |  2 ++
 package/grep/Config.in              |  2 ++
 package/gzip/Config.in              |  2 ++
 package/hdparm/Config.in            |  1 +
 package/ifplugd/Config.in           |  1 +
 package/ifupdown/Config.in          |  2 ++
 package/less/Config.in              |  1 +
 package/lsof/Config.in              |  1 +
 package/net-tools/Config.in         |  1 +
 package/netcat-openbsd/Config.in    |  2 ++
 package/netcat/Config.in            |  1 +
 package/patch/Config.in             |  2 ++
 package/procps-ng/Config.in         |  1 +
 package/psmisc/Config.in            |  1 +
 package/rpm/Config.in               |  2 ++
 package/rsyslog/Config.in           |  2 ++
 package/sed/Config.in               |  2 ++
 package/start-stop-daemon/Config.in |  1 +
 package/sysklogd/Config.in          |  1 +
 package/syslog-ng/Config.in         |  2 ++
 package/sysvinit/Config.in          |  1 +
 package/tar/Config.in               |  2 ++
 package/tftpd/Config.in             |  1 +
 package/time/Config.in              |  1 +
 package/unzip/Config.in             |  1 +
 package/vim/Config.in               |  2 ++
 package/wget/Config.in              |  2 ++
 package/which/Config.in             |  1 +
 package/whois/Config.in             |  2 ++
 package/zsh/Config.in               |  1 +
 43 files changed, 59 insertions(+), 64 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 67810b0..2c4c196 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -54,17 +54,13 @@ endmenu
 
 menu "Compressors and decompressors"
 	source "package/bzip2/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/gzip/Config.in"
-endif
 	source "package/lz4/Config.in"
 	source "package/lzip/Config.in"
 	source "package/lzop/Config.in"
 	source "package/p7zip/Config.in"
 	source "package/unrar/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/unzip/Config.in"
-endif
 	source "package/xz/Config.in"
 	source "package/zip/Config.in"
 endmenu
@@ -89,9 +85,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/kyua/Config.in"
 	source "package/latencytop/Config.in"
 	source "package/lmbench/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/lsof/Config.in"
-endif
 	source "package/ltp-testsuite/Config.in"
 	source "package/ltrace/Config.in"
 	source "package/lttng-babeltrace/Config.in"
@@ -130,32 +124,22 @@ menu "Development tools"
 	source "package/cppunit/Config.in"
 	source "package/cvs/Config.in"
 	source "package/cxxtest/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/diffutils/Config.in"
 	source "package/dos2unix/Config.in"
 	source "package/findutils/Config.in"
-endif
 	source "package/flex/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/gawk/Config.in"
-endif
 	source "package/gettext/Config.in"
 	source "package/git/Config.in"
 	source "package/gperf/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/grep/Config.in"
-endif
 	source "package/intltool/Config.in"
 	source "package/jq/Config.in"
 	source "package/libtool/Config.in"
 	source "package/make/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/patch/Config.in"
-endif
 	source "package/pkgconf/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/sed/Config.in"
-endif
 	source "package/sstrip/Config.in"
 	source "package/subversion/Config.in"
 	source "package/tree/Config.in"
@@ -259,9 +243,7 @@ comment "Graphic libraries"
 	source "package/elementary/Config.in"
 	source "package/fbdump/Config.in"
 	source "package/fbgrab/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/fbset/Config.in"
-endif
 	source "package/fb-test-app/Config.in"
 	source "package/fbterm/Config.in"
 	source "package/fbv/Config.in"
@@ -369,9 +351,7 @@ endmenu
 	source "package/dbus-glib/Config.in"
 	source "package/dbus-python/Config.in"
 	source "package/dbus-triggerd/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/devmem2/Config.in"
-endif
 	source "package/dmidecode/Config.in"
 	source "package/dmraid/Config.in"
 	source "package/dtv-scan-tables/Config.in"
@@ -395,9 +375,7 @@ endif
 	source "package/gpsd/Config.in"
 	source "package/gptfdisk/Config.in"
 	source "package/gvfs/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/hdparm/Config.in"
-endif
 	source "package/hwdata/Config.in"
 	source "package/hwloc/Config.in"
 	source "package/i2c-tools/Config.in"
@@ -1425,9 +1403,7 @@ menu "Networking applications"
 	source "package/crda/Config.in"
 	source "package/ctorrent/Config.in"
 	source "package/cups/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/dhcp/Config.in"
-endif
 	source "package/dhcpcd/Config.in"
 	source "package/dhcpdump/Config.in"
 	source "package/dnsmasq/Config.in"
@@ -1452,13 +1428,9 @@ endif
 	source "package/httping/Config.in"
 	source "package/ibrdtn-tools/Config.in"
 	source "package/ibrdtnd/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/ifplugd/Config.in"
-endif
 	source "package/iftop/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/ifupdown/Config.in"
-endif
 	source "package/igh-ethercat/Config.in"
 	source "package/igmpproxy/Config.in"
 	source "package/inadyn/Config.in"
@@ -1502,16 +1474,12 @@ endif
 	source "package/ncftp/Config.in"
 	source "package/ndisc6/Config.in"
 	source "package/netatalk/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/netcat/Config.in"
 	source "package/netcat-openbsd/Config.in"
-endif
 	source "package/netplug/Config.in"
 	source "package/netsnmp/Config.in"
 	source "package/netstat-nat/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/net-tools/Config.in"
-endif
 	source "package/network-manager/Config.in"
 	source "package/nfacct/Config.in"
 	source "package/nftables/Config.in"
@@ -1571,9 +1539,7 @@ endif
 	source "package/tcpdump/Config.in"
 	source "package/tcping/Config.in"
 	source "package/tcpreplay/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/tftpd/Config.in"
-endif
 	source "package/thttpd/Config.in"
 	source "package/tinc/Config.in"
 	source "package/tinyhttpd/Config.in"
@@ -1590,10 +1556,8 @@ endif
 	source "package/vpnc/Config.in"
 	source "package/vsftpd/Config.in"
 	source "package/vtun/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/wget/Config.in"
 	source "package/whois/Config.in"
-endif
 	source "package/wireless-regdb/Config.in"
 	source "package/wireless_tools/Config.in"
 	source "package/wireshark/Config.in"
@@ -1621,9 +1585,7 @@ comment "http://buildroot.org/manual.html#faq-no-binary-packages"
 comment "-------------------------------------------------------"
 	source "package/ipkg/Config.in"
 	source "package/opkg/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/rpm/Config.in"
-endif
 endmenu
 
 menu "Real-Time"
@@ -1637,11 +1599,9 @@ endmenu
 
 menu "Shell and utilities"
 comment "Shells"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/bash/Config.in"
 	source "package/dash/Config.in"
 	source "package/zsh/Config.in"
-endif
 comment "Utilities"
 	source "package/at/Config.in"
 	source "package/ccrypt/Config.in"
@@ -1659,13 +1619,9 @@ comment "Utilities"
 	source "package/ranger/Config.in"
 	source "package/screen/Config.in"
 	source "package/sudo/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/time/Config.in"
-endif
 	source "package/tmux/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/which/Config.in"
-endif
 	source "package/xmlstarlet/Config.in"
 	source "package/xxhash/Config.in"
 endmenu
@@ -1675,15 +1631,11 @@ menu "System tools"
 	source "package/android-tools/Config.in"
 	source "package/attr/Config.in"
 	source "package/audit/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/bootutils/Config.in"
 	source "package/coreutils/Config.in"
-endif
 	source "package/cpuload/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/dcron/Config.in"
 	source "package/debianutils/Config.in"
-endif
 	source "package/cgroupfs-mount/Config.in"
 	source "package/dsp-tools/Config.in"
 	source "package/efibootmgr/Config.in"
@@ -1707,36 +1659,24 @@ endif
 	source "package/openvmtools/Config.in"
 	source "package/polkit/Config.in"
 	source "package/powerpc-utils/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/procps-ng/Config.in"
-endif
 	source "package/procrank_linux/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/psmisc/Config.in"
-endif
 	source "package/pwgen/Config.in"
 	source "package/quota/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/rsyslog/Config.in"
-endif
 	source "package/scrub/Config.in"
 	source "package/scrypt/Config.in"
 	source "package/smack/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/start-stop-daemon/Config.in"
-endif
 	source "package/supervisor/Config.in"
 	source "package/swupdate/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/sysklogd/Config.in"
 	source "package/syslog-ng/Config.in"
-endif
 	source "package/systemd/Config.in"
 	source "package/systemd-bootchart/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/sysvinit/Config.in"
 	source "package/tar/Config.in"
-endif
 	source "package/tpm-tools/Config.in"
 	source "package/unscd/Config.in"
 	source "package/util-linux/Config.in"
@@ -1746,15 +1686,11 @@ endmenu
 menu "Text editors and viewers"
 	source "package/ed/Config.in"
 	source "package/joe/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/less/Config.in"
-endif
 	source "package/mc/Config.in"
 	source "package/nano/Config.in"
 	source "package/uemacs/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/vim/Config.in"
-endif
 endmenu
 
 endmenu
diff --git a/package/bash/Config.in b/package/bash/Config.in
index 2f823dc..783e4b3 100644
--- a/package/bash/Config.in
+++ b/package/bash/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_BASH
 	select BR2_PACKAGE_READLINE
 	# uses fork()
 	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  The standard GNU Bourne again shell.
 
diff --git a/package/bootutils/Config.in b/package/bootutils/Config.in
index 370da0d..af4a170 100644
--- a/package/bootutils/Config.in
+++ b/package/bootutils/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_BOOTUTILS
 	bool "bootutils"
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  BootUtils is a collection of utilities to facilitate booting of
 	  Linux 2.6-based systems. The process of finding the root volume
diff --git a/package/coreutils/Config.in b/package/coreutils/Config.in
index d9f614a..11a6019 100644
--- a/package/coreutils/Config.in
+++ b/package/coreutils/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_COREUTILS
 	bool "coreutils"
 	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  All of the basic file/text/shell utilities. These are the
 	  core utilities which are expected to exist on every system.
@@ -17,3 +18,4 @@ config BR2_PACKAGE_COREUTILS
 comment "coreutils needs a toolchain w/ wchar"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/dash/Config.in b/package/dash/Config.in
index e06087e..af8fba4 100644
--- a/package/dash/Config.in
+++ b/package/dash/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_DASH
 	bool "dash"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  The Debian/Linux port of the NetBSD version of
 	  ash (the Almquist SHell).
diff --git a/package/dcron/Config.in b/package/dcron/Config.in
index 0f4ffc9..d7f66bd 100644
--- a/package/dcron/Config.in
+++ b/package/dcron/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_DCRON
 	bool "dcron"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  dcron is a time-based job scheduler with anacron-like
 	  features. It works as a background daemon that parses
diff --git a/package/debianutils/Config.in b/package/debianutils/Config.in
index c4f2fcf..c43f330 100644
--- a/package/debianutils/Config.in
+++ b/package/debianutils/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_DEBIANUTILS
 	bool "debianutils"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  Miscellaneous utilities specific to Debian.
 
diff --git a/package/devmem2/Config.in b/package/devmem2/Config.in
index cb00a51..64d6400 100644
--- a/package/devmem2/Config.in
+++ b/package/devmem2/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DEVMEM2
 	bool "devmem2"
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  Simple program to read/write from/to any location in memory.
 
diff --git a/package/dhcp/Config.in b/package/dhcp/Config.in
index 99b4eec..4a30495 100644
--- a/package/dhcp/Config.in
+++ b/package/dhcp/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_DHCP
 	bool "dhcp (ISC)"
 	# fork()
 	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  DHCP relay agent from the ISC DHCP distribution.
 
diff --git a/package/diffutils/Config.in b/package/diffutils/Config.in
index f483c75..97cb38b 100644
--- a/package/diffutils/Config.in
+++ b/package/diffutils/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_DIFFUTILS
 	bool "diffutils"
 	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  GNU diff. Compare files per line.
@@ -9,3 +10,4 @@ config BR2_PACKAGE_DIFFUTILS
 
 comment "diffutils needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/dos2unix/Config.in b/package/dos2unix/Config.in
index ead1a8f..0a4f5e2 100644
--- a/package/dos2unix/Config.in
+++ b/package/dos2unix/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_DOS2UNIX
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	bool "dos2unix"
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  dos2unix converts text file line endings between CRLF and LF
 
diff --git a/package/fbset/Config.in b/package/fbset/Config.in
index 96d090e..c3f8d0b 100644
--- a/package/fbset/Config.in
+++ b/package/fbset/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_FBSET
 	bool "fbset"
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  Fbset is a system utility to show or change the settings of the frame
 	  buffer device. The frame buffer device provides a simple and unique
diff --git a/package/findutils/Config.in b/package/findutils/Config.in
index c93d9d8..b0eee5a 100644
--- a/package/findutils/Config.in
+++ b/package/findutils/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_FINDUTILS
 	bool "findutils"
 	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  Basic directory searching utilities. Provides the
 	  common 'find', 'xargs', 'locate', and 'updatedb' binaries.
@@ -11,3 +12,4 @@ config BR2_PACKAGE_FINDUTILS
 comment "findutils needs a toolchain w/ wchar"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/gawk/Config.in b/package/gawk/Config.in
index 949f509..36e70eb 100644
--- a/package/gawk/Config.in
+++ b/package/gawk/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_GAWK
 	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  A special-purpose programming language which is data driven
 	  rather than procedural. Allows for simple data-reformatting jobs
@@ -13,3 +14,4 @@ config BR2_PACKAGE_GAWK
 comment "gawk needs a toolchain w/ wchar, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/grep/Config.in b/package/grep/Config.in
index 2cd3406..6427650 100644
--- a/package/grep/Config.in
+++ b/package/grep/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GREP
 	bool "grep"
 	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  The GNU regular expression matcher.
@@ -9,3 +10,4 @@ config BR2_PACKAGE_GREP
 
 comment "grep needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/gzip/Config.in b/package/gzip/Config.in
index a251425..f2eac03 100644
--- a/package/gzip/Config.in
+++ b/package/gzip/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GZIP
 	bool "gzip"
 	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  Standard GNU compressor. Provides things like gzip,
 	  gunzip, gzcat, etc...
@@ -9,3 +10,4 @@ config BR2_PACKAGE_GZIP
 
 comment "gzip needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/hdparm/Config.in b/package/hdparm/Config.in
index 1b57439..52385b1 100644
--- a/package/hdparm/Config.in
+++ b/package/hdparm/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HDPARM
 	bool "hdparm"
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  hdparm - get/set hard disk parameters for Linux IDE drives.
 
diff --git a/package/ifplugd/Config.in b/package/ifplugd/Config.in
index cbb5128..c4b5b5b 100644
--- a/package/ifplugd/Config.in
+++ b/package/ifplugd/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_IFPLUGD
 	bool "ifplugd"
 	# libdaemon uses fork()
 	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_LIBDAEMON
 	help
 	  Ifplugd is a daemon which will automatically configure your
diff --git a/package/ifupdown/Config.in b/package/ifupdown/Config.in
index ab47606..e683201 100644
--- a/package/ifupdown/Config.in
+++ b/package/ifupdown/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_IFUPDOWN
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # iproute2
 	# Default/our uclibc lacks wordexp()
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	# runtime for ip binary
 	select BR2_PACKAGE_IPROUTE2 if !BR2_PACKAGE_BUSYBOX
 	# runtime for run-parts
@@ -17,3 +18,4 @@ comment "ifupdown needs a glibc or musl toolchain w/ headers >= 3.0"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/less/Config.in b/package/less/Config.in
index b7aa152..caf688a 100644
--- a/package/less/Config.in
+++ b/package/less/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LESS
 	bool "less"
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_NCURSES
 	help
 	  Excellent text file viewer.
diff --git a/package/lsof/Config.in b/package/lsof/Config.in
index 7b7e47d..c27cc81 100644
--- a/package/lsof/Config.in
+++ b/package/lsof/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LSOF
 	bool "lsof"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  lsof (LiSt Open Files)
 	  The lsof tool lists information about files opened by
diff --git a/package/net-tools/Config.in b/package/net-tools/Config.in
index f98dca0..3980b7e 100644
--- a/package/net-tools/Config.in
+++ b/package/net-tools/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NET_TOOLS
 	bool "net-tools"
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  A collection of programs that form the base set of the NET-3
diff --git a/package/netcat-openbsd/Config.in b/package/netcat-openbsd/Config.in
index 9681801..0df997c 100644
--- a/package/netcat-openbsd/Config.in
+++ b/package/netcat-openbsd/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_NETCAT_OPENBSD
 	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  A simple Unix utility which reads and writes data across network
 	  connections using TCP or UDP protocol. It is designed to be a
@@ -21,3 +22,4 @@ config BR2_PACKAGE_NETCAT_OPENBSD
 comment "netcat-openbsd needs a glibc toolchain w/ threads"
 	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/netcat/Config.in b/package/netcat/Config.in
index 88273ff..924069e 100644
--- a/package/netcat/Config.in
+++ b/package/netcat/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NETCAT
 	bool "netcat"
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  Netcat is a featured networking utility which reads and writes data
 	  across network connections, using the TCP/IP protocol.
diff --git a/package/patch/Config.in b/package/patch/Config.in
index 887c84d..c5b93e9 100644
--- a/package/patch/Config.in
+++ b/package/patch/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PATCH
 	bool "patch"
 	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  Take patch files (containing difference listings) and apply them
 	  to original files, producing patched versions.
@@ -9,3 +10,4 @@ config BR2_PACKAGE_PATCH
 
 comment "patch needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/procps-ng/Config.in b/package/procps-ng/Config.in
index 43e8758..553bea1 100644
--- a/package/procps-ng/Config.in
+++ b/package/procps-ng/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PROCPS_NG
 	bool "procps-ng"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
diff --git a/package/psmisc/Config.in b/package/psmisc/Config.in
index cc8420b..734542c 100644
--- a/package/psmisc/Config.in
+++ b/package/psmisc/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PSMISC
 	bool "psmisc"
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index ad8279e..2be646a 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -1,6 +1,7 @@
 comment "rpm needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 
 comment "rpm needs a toolchain w/ gcc >= 5"
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5 && BR2_sh
@@ -11,6 +12,7 @@ config BR2_PACKAGE_RPM
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 || !BR2_sh
 	depends on BR2_TOOLCHAIN_HAS_THREADS # beecrypt
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_BEECRYPT
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_NEON
diff --git a/package/rsyslog/Config.in b/package/rsyslog/Config.in
index 241ee2e..65291de 100644
--- a/package/rsyslog/Config.in
+++ b/package/rsyslog/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_RSYSLOG
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # modules
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libfastjson
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  Rsyslog is a powerful and flexible syslog implementation
 
@@ -17,3 +18,4 @@ comment "rsyslog needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
\ No newline at end of file
diff --git a/package/sed/Config.in b/package/sed/Config.in
index c6c91df..6adebf2 100644
--- a/package/sed/Config.in
+++ b/package/sed/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SED
 	bool "sed"
 	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  Super-useful stream editor.
 
@@ -8,3 +9,4 @@ config BR2_PACKAGE_SED
 
 comment "sed needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/start-stop-daemon/Config.in b/package/start-stop-daemon/Config.in
index 7d8eb34..8cf44f7 100644
--- a/package/start-stop-daemon/Config.in
+++ b/package/start-stop-daemon/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_START_STOP_DAEMON
 	bool "start-stop-daemon"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  start-stop-daemon is used to control the creation and termination
 	  of system-level processes.
diff --git a/package/sysklogd/Config.in b/package/sysklogd/Config.in
index 64464c4..4188fb8 100644
--- a/package/sysklogd/Config.in
+++ b/package/sysklogd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SYSKLOGD
 	bool "syslogd & klogd"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  System log daemons syslogd and klogd.
 
diff --git a/package/syslog-ng/Config.in b/package/syslog-ng/Config.in
index fdc8d9f..7f47d86 100644
--- a/package/syslog-ng/Config.in
+++ b/package/syslog-ng/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_SYSLOG_NG
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  syslog-ng is an enhanced log daemon, supporting a wide range
 	  of input and output methods: syslog, unstructured text,
@@ -17,3 +18,4 @@ config BR2_PACKAGE_SYSLOG_NG
 comment "syslog-ng needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/sysvinit/Config.in b/package/sysvinit/Config.in
index 2dc3bb0..ab67ed6 100644
--- a/package/sysvinit/Config.in
+++ b/package/sysvinit/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SYSVINIT
 	bool "sysvinit"
 	depends on BR2_INIT_SYSV
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  /sbin/init - parent of all processes
 
diff --git a/package/tar/Config.in b/package/tar/Config.in
index 74b0219..0eea1b8 100644
--- a/package/tar/Config.in
+++ b/package/tar/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_TAR
 	bool "tar"
 	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  A program that saves many files together into a single tape or disk
 	  archive, and can restore individual files from the archive.
@@ -10,3 +11,4 @@ config BR2_PACKAGE_TAR
 
 comment "tar needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/tftpd/Config.in b/package/tftpd/Config.in
index 609b5d1..6517bd5 100644
--- a/package/tftpd/Config.in
+++ b/package/tftpd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_TFTPD
 	bool "tftpd"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  HPA's Trivial File Transfer Protocol (tftp) server.
diff --git a/package/time/Config.in b/package/time/Config.in
index f4694a2..40275cf 100644
--- a/package/time/Config.in
+++ b/package/time/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_TIME
 	depends on BR2_USE_MMU # fork()
 	# See https://savannah.gnu.org/bugs/index.php?48000
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  The GNU time utility.
 
diff --git a/package/unzip/Config.in b/package/unzip/Config.in
index 0d98d28..da6902e 100644
--- a/package/unzip/Config.in
+++ b/package/unzip/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_UNZIP
 	bool "unzip"
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  UnZip is an extraction utility for archives compressed in
 	  .zip format (also called "zipfiles"). Although highly
diff --git a/package/vim/Config.in b/package/vim/Config.in
index 8a5c214..b851627 100644
--- a/package/vim/Config.in
+++ b/package/vim/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_VIM
 	bool "vim"
 	depends on BR2_USE_MMU # uses fork()
 	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
@@ -23,3 +24,4 @@ endif
 comment "vim needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
 	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/wget/Config.in b/package/wget/Config.in
index 26a2019..acb20f8 100644
--- a/package/wget/Config.in
+++ b/package/wget/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_WGET
 	# fork()
 	depends on BR2_USE_MMU
 	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  Network utility to retrieve files from http, https and ftp.
 
@@ -11,3 +12,4 @@ config BR2_PACKAGE_WGET
 comment "wget needs a toolchain w/ wchar"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/which/Config.in b/package/which/Config.in
index 5811083..db090ea 100644
--- a/package/which/Config.in
+++ b/package/which/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_WHICH
 	bool "which"
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  The standard 'which' utility.
 
diff --git a/package/whois/Config.in b/package/whois/Config.in
index 95e3dc6..0fbaf90 100644
--- a/package/whois/Config.in
+++ b/package/whois/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_WHOIS
 	bool "whois"
 	depends on BR2_USE_WCHAR # gettext
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	help
 	  Improved whois client.
@@ -9,3 +10,4 @@ config BR2_PACKAGE_WHOIS
 
 comment "whois needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/zsh/Config.in b/package/zsh/Config.in
index 261df42..ed8cf67 100644
--- a/package/zsh/Config.in
+++ b/package/zsh/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_ZSH
 	bool "zsh"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_NCURSES
 	help
 	  zsh is a shell designed for interactive use, although it is also
-- 
2.7.4
