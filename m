From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 30 Mar 2015 18:07:30 -0300
Subject: [Buildroot] [PATCH v3 11/15] packages: remove (non-)lfs
	dependencies and tweaks
In-Reply-To: <1427749654-30153-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427749654-30153-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1427749654-30153-12-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that largefile is mandatory removes package dependencies and
conditionals.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/acl/Config.in                          |  4 ----
 package/aircrack-ng/Config.in                  |  5 ++---
 package/alsa-utils/Config.in                   |  5 ++---
 package/apr/apr.mk                             |  2 --
 package/armadillo/Config.in                    |  5 ++---
 package/attr/Config.in                         |  4 ----
 package/avrdude/Config.in                      |  5 ++---
 package/bcache-tools/Config.in                 |  5 ++---
 package/bind/Config.in                         |  5 ++---
 package/bluez_utils/Config.in                  |  4 ----
 package/boost/Config.in                        |  5 ++---
 package/bootutils/Config.in                    |  4 ----
 package/btrfs-progs/Config.in                  |  6 ++----
 package/cdrkit/Config.in                       |  5 ++---
 package/civetweb/Config.in                     |  4 ----
 package/civetweb/civetweb.mk                   |  4 ----
 package/clapack/Config.in                      |  7 -------
 package/cmake/cmake.mk                         |  2 +-
 package/collectd/Config.in                     |  4 ----
 package/conntrack-tools/Config.in              |  4 +---
 package/cppzmq/Config.in                       |  7 +++----
 package/cryptsetup/Config.in                   |  6 ++----
 package/curlftpfs/Config.in                    |  5 ++---
 package/czmq/Config.in                         |  7 +++----
 package/dmraid/Config.in                       |  6 ++----
 package/dnsmasq/Config.in                      |  4 ----
 package/dnsmasq/dnsmasq.mk                     |  4 ----
 package/dosfstools/Config.in                   |  5 ++---
 package/dvb-apps/Config.in                     |  5 ++---
 package/dvbsnoop/Config.in                     |  4 ----
 package/dvdauthor/Config.in                    |  5 ++---
 package/dvdrw-tools/Config.in                  |  5 ++---
 package/e2fsprogs/Config.in                    |  5 ++---
 package/e2tools/Config.in                      |  6 ++----
 package/ecryptfs-utils/Config.in               |  5 ++---
 package/elfutils/Config.in                     |  5 ++---
 package/elfutils/elfutils.mk                   |  2 --
 package/espeak/Config.in                       |  5 -----
 package/eudev/Config.in                        |  5 ++---
 package/exfat-utils/Config.in                  |  5 ++---
 package/exfat/Config.in                        |  5 ++---
 package/exiv2/Config.in                        |  5 ++---
 package/f2fs-tools/Config.in                   |  5 ++---
 package/ffmpeg/Config.in                       |  5 ++---
 package/filemq/Config.in                       |  7 +++----
 package/fio/Config.in                          |  9 ++++-----
 package/flashbench/Config.in                   |  4 ----
 package/ftop/Config.in                         |  4 ----
 package/gamin/gamin.mk                         |  4 ----
 package/genext2fs/Config.in                    |  4 ----
 package/git/Config.in                          |  5 -----
 package/glmark2/Config.in                      |  6 ++----
 package/gnuradio/Config.in                     |  6 ++----
 package/gptfdisk/Config.in                     |  5 ++---
 package/gstreamer/gst-ffmpeg/Config.in         |  5 ++---
 package/gstreamer/gst-plugins-bad/Config.in    |  4 ----
 package/gstreamer/gst-plugins-good/Config.in   |  5 ++---
 package/gstreamer1/gst1-plugins-bad/Config.in  |  4 ----
 package/gstreamer1/gst1-plugins-good/Config.in |  5 ++---
 package/gstreamer1/gst1-plugins-ugly/Config.in |  5 ++---
 package/gvfs/Config.in                         |  5 ++---
 package/hdparm/Config.in                       |  4 ----
 package/imagemagick/imagemagick.mk             |  4 ----
 package/inotify-tools/Config.in                |  5 -----
 package/ipset/Config.in                        |  4 ----
 package/jack2/Config.in                        |  6 ++----
 package/kexec-lite/Config.in                   |  5 ++---
 package/kmod/Config.in                         |  5 ++---
 package/kodi/Config.in                         |  5 ++---
 package/libdri2/Config.in                      |  5 ++---
 package/libdrm/Config.in                       |  5 ++---
 package/libdvdnav/Config.in                    |  5 ++---
 package/libdvdread/Config.in                   |  5 ++---
 package/libftdi1/Config.in                     |  5 ++---
 package/libfuse/Config.in                      |  5 ++---
 package/libmnl/Config.in                       |  4 ----
 package/libnetfilter_acct/Config.in            |  4 ----
 package/libnetfilter_conntrack/Config.in       |  4 ----
 package/libnetfilter_cthelper/Config.in        |  4 ----
 package/libnetfilter_cttimeout/Config.in       |  4 ----
 package/libnetfilter_queue/Config.in           |  5 ++---
 package/libnfs/Config.in                       |  5 ++---
 package/libnftnl/Config.in                     |  5 ++---
 package/libnspr/Config.in                      |  5 ++---
 package/libnss/Config.in                       |  6 ++----
 package/libpciaccess/Config.in                 |  4 ----
 package/libplayer/Config.in                    |  7 ++-----
 package/libselinux/Config.in                   |  5 ++---
 package/libsemanage/Config.in                  |  5 ++---
 package/libsndfile/Config.in                   |  7 -------
 package/libupnp/Config.in                      |  5 ++---
 package/libupnpp/Config.in                     |  6 ++----
 package/libv4l/Config.in                       |  5 ++---
 package/libva-intel-driver/Config.in           |  6 ++----
 package/libva/Config.in                        |  6 ++----
 package/libxml2/libxml2.mk                     |  4 ----
 package/lighttpd/lighttpd.mk                   |  3 +--
 package/lshw/Config.in                         |  5 ++---
 package/lsof/lsof.mk                           |  3 ---
 package/ltp-testsuite/Config.in                |  5 ++---
 package/ltrace/Config.in                       |  5 ++---
 package/lttng-babeltrace/Config.in             |  5 ++---
 package/lttng-libust/Config.in                 |  8 +++-----
 package/lttng-tools/Config.in                  |  6 ++----
 package/lua/lua.mk                             |  4 ----
 package/luafilesystem/luafilesystem.mk         |  3 ---
 package/luajit/luajit.mk                       |  5 -----
 package/lvm2/Config.in                         |  6 ++----
 package/lxc/Config.in                          |  5 ++---
 package/lz4/Config.in                          |  4 ----
 package/lzip/Config.in                         |  5 ++---
 package/memtester/Config.in                    |  4 ----
 package/mesa3d/Config.in                       |  5 ++---
 package/minidlna/Config.in                     |  5 ++---
 package/mmc-utils/Config.in                    |  5 ++---
 package/modem-manager/Config.in                |  5 ++---
 package/mongoose/Config.in                     |  5 ++---
 package/mongrel2/Config.in                     |  5 ++---
 package/monit/monit.mk                         |  9 ++-------
 package/mp4v2/mp4v2.mk                         |  8 +-------
 package/mpd/Config.in                          | 26 +++-----------------------
 package/mplayer/Config.in                      |  7 -------
 package/mtd/Config.in                          |  5 ++---
 package/nbd/nbd.mk                             |  2 +-
 package/network-manager/Config.in              |  5 ++---
 package/nfacct/Config.in                       |  4 ----
 package/nfs-utils/Config.in                    |  8 ++------
 package/nftables/Config.in                     |  5 ++---
 package/nginx/Config.in                        |  5 -----
 package/nginx/nginx.mk                         |  2 +-
 package/nodejs/Config.in                       |  5 ++---
 package/ntfs-3g/Config.in                      |  5 ++---
 package/numactl/Config.in                      |  6 ------
 package/ola/Config.in                          |  5 ++---
 package/opencv/Config.in                       |  5 ++---
 package/openvmtools/Config.in                  |  5 ++---
 package/opusfile/Config.in                     |  4 ----
 package/parted/Config.in                       |  5 ++---
 package/pax-utils/Config.in                    |  4 ----
 package/perf/Config.in                         |  5 ++---
 package/perl/perl.mk                           |  4 ----
 package/php-zmq/Config.in                      |  5 ++---
 package/php/php.mk                             |  3 ---
 package/pifmrds/Config.in                      |  5 -----
 package/proftpd/proftpd.mk                     |  2 --
 package/pulseaudio/Config.in                   |  5 ++---
 package/python-libconfig/Config.in             |  5 ++---
 package/python-pyzmq/Config.in                 |  7 +++----
 package/qt/qt.mk                               | 14 --------------
 package/qt5/qt5base/qt5base.mk                 |  4 ----
 package/quota/Config.in                        |  6 ++----
 package/redis/Config.in                        |  6 ++----
 package/rpi-userland/Config.in                 |  5 ++---
 package/sg3_utils/Config.in                    |  5 ++---
 package/softether/Config.in                    |  5 ++---
 package/sqlcipher/sqlcipher.mk                 |  7 -------
 package/sqlite/sqlite.mk                       |  7 -------
 package/squashfs/Config.in                     |  5 ++---
 package/sshfs/Config.in                        |  5 ++---
 package/strace/Config.in                       |  4 ----
 package/sysklogd/Config.in                     |  5 -----
 package/systemd/Config.in                      |  1 -
 package/thrift/Config.in                       |  5 ++---
 package/trace-cmd/Config.in                    |  6 ++----
 package/tstools/Config.in                      |  5 -----
 package/tvheadend/Config.in                    |  6 +++---
 package/twolame/Config.in                      |  4 ----
 package/udpcast/Config.in                      |  5 ++---
 package/ulogd/Config.in                        |  5 ++---
 package/unionfs/Config.in                      |  5 ++---
 package/upmpdcli/Config.in                     |  6 ++----
 package/ushare/Config.in                       |  6 ++----
 package/ustr/Config.in                         |  4 ----
 package/util-linux/Config.in                   |  5 ++---
 package/vlc/Config.in                          |  5 ++---
 package/wvdial/Config.in                       |  5 ++---
 package/wvstreams/Config.in                    |  5 ++---
 package/x11r7/xserver_xorg-server/Config.in    |  6 +++---
 package/x264/Config.in                         |  4 ----
 package/xfsprogs/Config.in                     |  5 ++---
 package/xorriso/Config.in                      |  5 ++---
 package/xtables-addons/Config.in               |  6 ++----
 package/yaml-cpp/Config.in                     |  5 ++---
 package/ympd/Config.in                         |  5 ++---
 package/zeromq/Config.in                       |  7 +++----
 package/zlog/Config.in                         |  5 ++---
 package/zmqpp/Config.in                        |  7 +++----
 package/zyre/Config.in                         |  7 +++----
 188 files changed, 263 insertions(+), 703 deletions(-)

diff --git a/package/acl/Config.in b/package/acl/Config.in
index 73ceb72..92f2251 100644
--- a/package/acl/Config.in
+++ b/package/acl/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_ACL
 	bool "acl"
 	select BR2_PACKAGE_ATTR
-	depends on BR2_LARGEFILE
 	help
 	  POSIX Access Control Lists, which are used to define more
 	  fine-grained discretionary access rights for files and
@@ -9,6 +8,3 @@ config BR2_PACKAGE_ACL
 	  This package also provides libacl.
 
 	  http://savannah.nongnu.org/projects/acl
-
-comment "acl needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
diff --git a/package/aircrack-ng/Config.in b/package/aircrack-ng/Config.in
index 80b3a2b..bb100b8 100644
--- a/package/aircrack-ng/Config.in
+++ b/package/aircrack-ng/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_AIRCRACK_NG
 	bool "aircrack-ng"
-	depends on BR2_LARGEFILE
 	depends on BR2_USE_MMU # uses fork()
 	# libnl has issues when linking statically
 	# they need fixing in libnl itself
@@ -13,6 +12,6 @@ config BR2_PACKAGE_AIRCRACK_NG
 
 	  http://www.aircrack-ng.org/
 
-comment "aircrack-ng needs a toolchain w/ largefile, threads"
+comment "aircrack-ng needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
index cc66711..c7c0e68 100644
--- a/package/alsa-utils/Config.in
+++ b/package/alsa-utils/Config.in
@@ -1,11 +1,10 @@
-comment "alsa-utils needs a toolchain w/ largefile, threads"
+comment "alsa-utils needs a toolchain w/ threads"
 	depends on BR2_USE_MMU # fork
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_ALSA_UTILS
 	bool "alsa-utils"
 	depends on BR2_USE_MMU # fork
-	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index cbae0ff..69524a6 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -32,9 +32,7 @@ APR_CONF_ENV += apr_cv_pthreads_lib="-lpthread"
 endif
 
 # Fix lfs detection when cross compiling
-ifeq ($(BR2_LARGEFILE),y)
 APR_CONF_ENV += apr_cv_use_lfs64=yes
-endif
 
 define APR_CLEANUP_UNNEEDED_FILES
 	$(RM) -rf $(TARGET_DIR)/usr/build-1/
diff --git a/package/armadillo/Config.in b/package/armadillo/Config.in
index c7a680a..e49997d 100644
--- a/package/armadillo/Config.in
+++ b/package/armadillo/Config.in
@@ -1,5 +1,5 @@
-comment "armadillo needs a toolchain w/ C++, largefile"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE
+comment "armadillo needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
 	depends on !(BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) # clapack
 	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC) # clapack
 	depends on !BR2_bfin # clapack
@@ -7,7 +7,6 @@ comment "armadillo needs a toolchain w/ C++, largefile"
 config BR2_PACKAGE_ARMADILLO
 	bool "armadillo"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_LARGEFILE # clapack
 	depends on !(BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) # clapack
 	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC) # clapack
 	depends on !BR2_bfin # clapack
diff --git a/package/attr/Config.in b/package/attr/Config.in
index db229de..554772b 100644
--- a/package/attr/Config.in
+++ b/package/attr/Config.in
@@ -1,11 +1,7 @@
 config BR2_PACKAGE_ATTR
 	bool "attr"
-	depends on BR2_LARGEFILE
 	help
 	  Commands for Manipulating Filesystem Extended Attributes.
 	  This package also provides libattr.
 
 	  http://savannah.nongnu.org/projects/attr
-
-comment "attr needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
diff --git a/package/avrdude/Config.in b/package/avrdude/Config.in
index 1433d2b..dc84237 100644
--- a/package/avrdude/Config.in
+++ b/package/avrdude/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_AVRDUDE
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	select BR2_PACKAGE_NCURSES
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_LARGEFILE # elfutils
 	depends on BR2_USE_WCHAR # elfutils
 	depends on !BR2_STATIC_LIBS # elfutils
 	depends on !BR2_bfin # elfutils
@@ -15,6 +14,6 @@ config BR2_PACKAGE_AVRDUDE
 
 	  https://github.com/kcuzner/avrdude
 
-comment "avrdude needs a toolchain w/ threads, largefile, wchar, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_STATIC_LIBS
+comment "avrdude needs a toolchain w/ threads, wchar, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || BR2_STATIC_LIBS
 	depends on !BR2_bfin
diff --git a/package/bcache-tools/Config.in b/package/bcache-tools/Config.in
index a3f7897..ee5f1f2 100644
--- a/package/bcache-tools/Config.in
+++ b/package/bcache-tools/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_BCACHE_TOOLS
 	bool "bcache tools"
 	depends on BR2_PACKAGE_HAS_UDEV
-	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_USE_MMU # util-linux (libblkid)
 	select BR2_PACKAGE_UTIL_LINUX
@@ -17,6 +16,6 @@ config BR2_PACKAGE_BCACHE_TOOLS
 	  This is the user space bcache tools, required to setup the linux
 	  bcache feature of the Linux kernel.
 
-comment "bcache-tools needs udev /dev management and a toolchain w/ largefile, wchar"
+comment "bcache-tools needs udev /dev management and a toolchain w/ wchar"
 	depends on BR2_USE_MMU
-	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_LARGEFILE || !BR2_USE_WCHAR
+	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_USE_WCHAR
diff --git a/package/bind/Config.in b/package/bind/Config.in
index ba71270..95bbab1 100644
--- a/package/bind/Config.in
+++ b/package/bind/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_BIND
 	bool "bind"
 	depends on BR2_INET_IPV6
-	depends on BR2_LARGEFILE
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
 	help
@@ -39,6 +38,6 @@ config BR2_PACKAGE_BIND_TOOLS
 
 endif
 
-comment "bind needs a toolchain w/ largefile, IPv6, dynamic library"
+comment "bind needs a toolchain w/ IPv6, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || !BR2_INET_IPV6 || BR2_STATIC_LIBS
+	depends on !BR2_INET_IPV6 || BR2_STATIC_LIBS
diff --git a/package/bluez_utils/Config.in b/package/bluez_utils/Config.in
index 34defd3..3848162 100644
--- a/package/bluez_utils/Config.in
+++ b/package/bluez_utils/Config.in
@@ -22,13 +22,9 @@ config BR2_PACKAGE_BLUEZ_UTILS_AUDIO
 	bool "audio support"
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_LIBSNDFILE
-	depends on BR2_LARGEFILE
 	help
 	  Audio support
 
-comment "bluez-utils audio needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
-
 config BR2_PACKAGE_BLUEZ_UTILS_USB
 	bool "USB support"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
diff --git a/package/boost/Config.in b/package/boost/Config.in
index 7085c05..a004fd8 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -1,10 +1,9 @@
-comment "boost needs a toolchain w/ C++, largefile, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+comment "boost needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_BOOST
 	bool "boost"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_LARGEFILE
 	# Boost could theorically be built with threading=single, but
 	# that unfortunately doesn't work. Until someone fixes that,
 	# let's depend on threads.
diff --git a/package/bootutils/Config.in b/package/bootutils/Config.in
index 192089e..308db24 100644
--- a/package/bootutils/Config.in
+++ b/package/bootutils/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_BOOTUTILS
 	bool "bootutils"
-	depends on BR2_LARGEFILE
 	help
 	  BootUtils is a collection of utilities to facilitate booting of
 	  Linux 2.6-based systems. The process of finding the root volume
@@ -8,6 +7,3 @@ config BR2_PACKAGE_BOOTUTILS
 	  mounting it, and 'switchroot'ing is automated.
 
 	  http://bootutils.pr.linuxrulz.org/
-
-comment "bootutils needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
diff --git a/package/btrfs-progs/Config.in b/package/btrfs-progs/Config.in
index dcd2ec5..9a2bd6c 100644
--- a/package/btrfs-progs/Config.in
+++ b/package/btrfs-progs/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_BTRFS_PROGS
 	bool "btrfs-progs"
-	depends on BR2_LARGEFILE # acl, attr
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_USE_MMU # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -17,7 +16,6 @@ config BR2_PACKAGE_BTRFS_PROGS
 
 	  https://btrfs.wiki.kernel.org/index.php/Main_Page
 
-comment "btrfs-progs needs a toolchain w/ largefile, wchar, threads"
+comment "btrfs-progs needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/cdrkit/Config.in b/package/cdrkit/Config.in
index 81c5c01..3b0b7f1 100644
--- a/package/cdrkit/Config.in
+++ b/package/cdrkit/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_CDRKIT
 	# Needed for libbz
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_LIBCAP
-	depends on BR2_LARGEFILE
 	depends on BR2_USE_MMU # fork
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # libcap
 	bool "cdrkit"
@@ -13,6 +12,6 @@ config BR2_PACKAGE_CDRKIT
 
 	  http://www.cdrkit.org/
 
-comment "cdrkit needs a toolchain w/ largefile, headers >= 3.0"
+comment "cdrkit needs a toolchain w/ headers >= 3.0"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
diff --git a/package/civetweb/Config.in b/package/civetweb/Config.in
index 33f4ef1..f964ac1 100644
--- a/package/civetweb/Config.in
+++ b/package/civetweb/Config.in
@@ -12,15 +12,11 @@ if BR2_PACKAGE_CIVETWEB
 config BR2_CIVETWEB_WITH_LUA
 	bool "enable Lua support"
 	# required by the bundled Sqlite3 and Lua code
-	depends on BR2_LARGEFILE
 	help
 	  Enable Lua support in Civetweb. Note that this will use a
 	  version of Lua and Sqlite bundled within the Civetweb
 	  sources, and not the packages from Buildroot.
 
-comment "Lua support needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
-
 endif
 
 comment "civetweb needs a toolchain w/ threads"
diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index 2940a7a..145721e 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -15,10 +15,6 @@ CIVETWEB_LIBS = -lpthread -lm -ldl
 CIVETWEB_SYSCONFDIR = /etc
 CIVETWEB_HTMLDIR = /var/www
 
-ifneq ($(BR2_LARGEFILE),y)
-	CIVETWEB_COPT += -DSQLITE_DISABLE_LFS
-endif
-
 ifeq ($(BR2_INET_IPV6),y)
 	CIVETWEB_CONF_OPTS += WITH_IPV6=1
 endif
diff --git a/package/clapack/Config.in b/package/clapack/Config.in
index 5e930a6..f37752a 100644
--- a/package/clapack/Config.in
+++ b/package/clapack/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_CLAPACK
 	bool "cblas/clapack"
-	depends on BR2_LARGEFILE
 	depends on !(BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el)
 	# _fpu_control is used on PowerPC, but not available with
 	# uClibc
@@ -25,9 +24,3 @@ config BR2_PACKAGE_CLAPACK_ARITH_H
 
 	  In any case an 'arithchk' program is built (but not installed), to be run
 	  on the target to generate this arith.h header.
-
-comment "cblas/clapack needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
-	depends on !BR2_bfin
-	depends on !(BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el)
-	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC)
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 9a939bf..6b9e563 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -14,7 +14,7 @@ HOST_CMAKE_DEPENDENCIES = host-pkgconf
 CMAKE_DEPENDENCIES = zlib libcurl libarchive expat bzip2 xz
 
 CMAKE_CONF_OPTS = \
-	-DKWSYS_LFS_WORKS=$(if $(BR2_LARGEFILE),TRUE,FALSE) \
+	-DKWSYS_LFS_WORKS=TRUE \
 	-DKWSYS_CHAR_IS_SIGNED=TRUE \
 	-DCMAKE_USE_SYSTEM_LIBRARIES=1 \
 	-DCTEST_USE_XMLRPC=OFF \
diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index c65fc65..98eb51e 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -270,12 +270,8 @@ config BR2_PACKAGE_COLLECTD_MYSQL
 	help
 	  Connects to a MySQL database and issues a "show status" command.
 
-comment "netlink support needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
-
 config BR2_PACKAGE_COLLECTD_NETLINK
 	bool "netlink"
-	depends on BR2_LARGEFILE
 	select BR2_PACKAGE_LIBMNL
 	help
 	  Get statistics for interfaces, qdiscs, classes, and filters.
diff --git a/package/conntrack-tools/Config.in b/package/conntrack-tools/Config.in
index ec19d8e..a928352 100644
--- a/package/conntrack-tools/Config.in
+++ b/package/conntrack-tools/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_CONNTRACK_TOOLS
 	bool "conntrack-tools"
 	depends on BR2_INET_IPV6
-	depends on BR2_LARGEFILE
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc
 	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
@@ -17,8 +16,7 @@ config BR2_PACKAGE_CONNTRACK_TOOLS
 
 	  http://www.netfilter.org/projects/conntrack-tools/
 
-comment "conntrack-tools needs a toolchain w/ IPv6, largefile, threads"
+comment "conntrack-tools needs a toolchain w/ IPv6, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_INET_IPV6 || \
-		!BR2_LARGEFILE || \
 		!(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
diff --git a/package/cppzmq/Config.in b/package/cppzmq/Config.in
index e17963e..d064901 100644
--- a/package/cppzmq/Config.in
+++ b/package/cppzmq/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_CPPZMQ
 	bool "cppzmq"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_INET_IPV6 # zeromq
-	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 	select BR2_PACKAGE_ZEROMQ
@@ -11,6 +10,6 @@ config BR2_PACKAGE_CPPZMQ
 
 	  http://github.com/zeromq/cppzmq
 
-comment "cppzmq needs a toolchain w/ C++, IPv6, largefile, wchar, threads"
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE \
-		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
+comment "cppzmq needs a toolchain w/ C++, IPv6, wchar, threads"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && \
+		BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
index 7f672f9..89cc4b5 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_CRYPTSETUP
 	select BR2_PACKAGE_LVM2
 	select BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-	depends on BR2_LARGEFILE # lvm2, util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
 	depends on BR2_USE_MMU # lvm2, e2fsprogs
 	depends on !BR2_STATIC_LIBS # lvm2
@@ -15,7 +14,6 @@ config BR2_PACKAGE_CRYPTSETUP
 
 	  https://code.google.com/p/cryptsetup/
 
-comment "cryptsetup needs a toolchain w/ largefile, wchar, threads, dynamic library"
+comment "cryptsetup needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || \
-		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/curlftpfs/Config.in b/package/curlftpfs/Config.in
index 8903432..ad3ac24 100644
--- a/package/curlftpfs/Config.in
+++ b/package/curlftpfs/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_CURLFTPFS
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBCURL
-	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse, glib2
 	depends on BR2_USE_MMU # libfuse, glib2
@@ -17,6 +16,6 @@ config BR2_PACKAGE_CURLFTPFS
 
 	  http://curlftpfs.sourceforge.net/
 
-comment "curlftpfs needs a toolchain w/ largefile, wchar, threads, dynamic library"
+comment "curlftpfs needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/czmq/Config.in b/package/czmq/Config.in
index fbdedd1..66c0437 100644
--- a/package/czmq/Config.in
+++ b/package/czmq/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_CZMQ
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
 	depends on BR2_INET_IPV6 # zeromq
-	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 	help
@@ -12,7 +11,7 @@ config BR2_PACKAGE_CZMQ
 
 	  http://czmq.zeromq.org/
 
-comment "czmq needs a toolchain w/ C++, IPv6, largefile, wchar, threads"
+comment "czmq needs a toolchain w/ C++, IPv6, wchar, threads"
 	depends on BR2_USE_MMU
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE \
-		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && \
+		BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/dmraid/Config.in b/package/dmraid/Config.in
index 0e33a0d..4a8cf61 100644
--- a/package/dmraid/Config.in
+++ b/package/dmraid/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_DMRAID
 	bool "dmraid"
-	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
 	depends on BR2_USE_MMU # lvm2
 	depends on !BR2_STATIC_LIBS # lvm2
@@ -12,7 +11,6 @@ config BR2_PACKAGE_DMRAID
 	  dmraid uses the Linux device-mapper to create devices with
 	  respective mappings for the ATARAID sets discovered.
 
-comment "dmraid needs a toolchain w/ largefile, threads, dynamic library"
+comment "dmraid needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/dnsmasq/Config.in b/package/dnsmasq/Config.in
index 40376ad..4926c95 100644
--- a/package/dnsmasq/Config.in
+++ b/package/dnsmasq/Config.in
@@ -45,11 +45,7 @@ config BR2_PACKAGE_DNSMASQ_LUA
 config BR2_PACKAGE_DNSMASQ_CONNTRACK
 	bool "conntrack marking support"
 	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
-	depends on BR2_LARGEFILE
 	help
 	  Enable DNS query connection marking in netfilter.
 
-comment "conntrack marking support needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
-
 endif
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index f848a94..f98d5b5 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -68,10 +68,6 @@ define DNSMASQ_ENABLE_LUA
 endef
 endif
 
-ifneq ($(BR2_LARGEFILE),y)
-	DNSMASQ_COPTS += -DNO_LARGEFILE
-endif
-
 ifeq ($(BR2_PACKAGE_DBUS),y)
 	DNSMASQ_DEPENDENCIES += dbus
 endif
diff --git a/package/dosfstools/Config.in b/package/dosfstools/Config.in
index 43051ec..7f3481c 100644
--- a/package/dosfstools/Config.in
+++ b/package/dosfstools/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_DOSFSTOOLS
 	bool "dosfstools"
-	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
@@ -27,5 +26,5 @@ config BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT
 
 endif
 
-comment "dosfstools needs a toolchain w/ largefile, wchar"
-	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR
+comment "dosfstools needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/dvb-apps/Config.in b/package/dvb-apps/Config.in
index 3f8fdb6..75cc14e 100644
--- a/package/dvb-apps/Config.in
+++ b/package/dvb-apps/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_DVB_APPS
 	bool "dvb-apps"
-	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
@@ -11,5 +10,5 @@ config BR2_PACKAGE_DVB_APPS
 	  http://linuxtv.org/projects.php
 	  http://linuxtv.org/hg/dvb-apps
 
-comment "dvb-apps utils needs a toolchain w/ largefile, threads, headers >= 3.3"
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
+comment "dvb-apps utils needs a toolchain w/ threads, headers >= 3.3"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
diff --git a/package/dvbsnoop/Config.in b/package/dvbsnoop/Config.in
index 09a3c4d..fc34c34 100644
--- a/package/dvbsnoop/Config.in
+++ b/package/dvbsnoop/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_DVBSNOOP
 	bool "dvbsnoop"
-	depends on BR2_LARGEFILE
 	help
 	  Dvbsnoop is just a simple tool to analyze, view or debug a transport
 	  stream (TS), program elementary stream (PES) or even a program stream
@@ -20,6 +19,3 @@ config BR2_PACKAGE_DVBSNOOP
 
 	  http://dvbsnoop.sourceforge.net
 	  http://en.wikipedia.org/wiki/DBox2
-
-comment "dvbsnoop needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
diff --git a/package/dvdauthor/Config.in b/package/dvdauthor/Config.in
index d241af0..6f8e2e4 100644
--- a/package/dvdauthor/Config.in
+++ b/package/dvdauthor/Config.in
@@ -17,14 +17,13 @@ if BR2_PACKAGE_DVDAUTHOR
 config BR2_PACKAGE_DVDAUTHOR_DVDUNAUTHOR
 	bool "dvdunauthor"
 	select BR2_PACKAGE_LIBDVDREAD
-	depends on BR2_LARGEFILE # libdvdread
 	depends on !BR2_STATIC_LIBS # libdvdread
 	help
 	  This option enables the dvdunauthor program, which requires
 	  libdvdread.
 
-comment "dvdunauthor needs a toolchain w/ dynamic library, largefile"
-	depends on !BR2_LARGEFILE || BR2_STATIC_LIBS
+comment "dvdunauthor needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
 
 endif
 
diff --git a/package/dvdrw-tools/Config.in b/package/dvdrw-tools/Config.in
index 47835d8..c9dd3dd 100644
--- a/package/dvdrw-tools/Config.in
+++ b/package/dvdrw-tools/Config.in
@@ -1,7 +1,7 @@
-comment "dvdrw-tools needs a toolchain w/ threads, C++, wchar, largefile"
+comment "dvdrw-tools needs a toolchain w/ threads, C++, wchar"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_USE_WCHAR || !BR2_LARGEFILE
+		!BR2_USE_WCHAR
 
 config BR2_PACKAGE_DVDRW_TOOLS
 	bool "dvdrw-tools"
@@ -9,7 +9,6 @@ config BR2_PACKAGE_DVDRW_TOOLS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
-	depends on BR2_LARGEFILE
 	help
 	  The dvd+rw-tools are used to master Blu-ray Disc
 	  and DVD Disc media, both +RW/+R and -RW/-R. Note:
diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index d9c03a8..f5011d1 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -1,7 +1,6 @@
 
 config BR2_PACKAGE_E2FSPROGS
 	bool "e2fsprogs"
-	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_USE_MMU # util-linux/libblkid
 	select BR2_PACKAGE_UTIL_LINUX
@@ -99,5 +98,5 @@ config BR2_PACKAGE_E2FSPROGS_UUIDGEN
 
 endif
 
-comment "e2fsprogs needs a toolchain w/ largefile, wchar"
-	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
+comment "e2fsprogs needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/e2tools/Config.in b/package/e2tools/Config.in
index 2baf580..8d80479 100644
--- a/package/e2tools/Config.in
+++ b/package/e2tools/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_E2TOOLS
 	bool "e2tools"
 	select BR2_PACKAGE_E2FSPROGS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_LARGEFILE # e2fsprogs
 	depends on BR2_USE_WCHAR # e2fsprogs
 	depends on BR2_USE_MMU # e2fsprogs
 	help
@@ -13,7 +12,6 @@ config BR2_PACKAGE_E2TOOLS
 
 	  https://github.com/ndim/e2tools
 
-comment "e2tools needs a toolchain w/ threads, largefile and wchar"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || \
-		!BR2_USE_WCHAR
+comment "e2tools needs a toolchain w/ threads, wchar"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 	depends on BR2_USE_MMU
diff --git a/package/ecryptfs-utils/Config.in b/package/ecryptfs-utils/Config.in
index bd7b586..d243da6 100644
--- a/package/ecryptfs-utils/Config.in
+++ b/package/ecryptfs-utils/Config.in
@@ -10,7 +10,6 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
 	depends on BR2_USE_WCHAR # gettext
 	depends on BR2_USE_MMU # keyutils
 	depends on !BR2_microblaze # keyutils
-	depends on BR2_LARGEFILE # libnss
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnss -> libnspr
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnss -> libnspr
 	depends on !BR2_MIPS_NABI32 # libnss
@@ -30,9 +29,9 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
 
 	  http://ecryptfs.org
 
-comment "ecryptfs-utils needs a toolchain w/ largefile, threads, wchar, dynamic library"
+comment "ecryptfs-utils needs a toolchain w/ threads, wchar, dynamic library"
 	depends on !BR2_microblaze
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
 		BR2_STATIC_LIBS
diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
index cb9a658..6c6856e 100644
--- a/package/elfutils/Config.in
+++ b/package/elfutils/Config.in
@@ -1,12 +1,11 @@
-comment "elfutils needs a toolchain w/ largefile, wchar, dynamic library"
+comment "elfutils needs a toolchain w/ wchar, dynamic library"
 	depends on !BR2_bfin
-	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_STATIC_LIBS
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_ELFUTILS
 	bool "elfutils"
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
-	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS
 	# build issue caused by the _ prefix used on blackfin for
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 9901bcb..227dea9 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -16,12 +16,10 @@ ELFUTILS_PATCH = elfutils-portability-0.161.patch
 ELFUTILS_AUTORECONF = YES
 ELFUTILS_CONF_OPTS += --disable-werror
 
-ifeq ($(BR2_LARGEFILE),y)
 # elfutils gets confused when lfs mode is forced, so don't
 ELFUTILS_CONF_ENV += \
 	CFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))" \
 	CPPFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))"
-endif
 
 ELFUTILS_LDFLAGS = $(TARGET_LDFLAGS)
 
diff --git a/package/espeak/Config.in b/package/espeak/Config.in
index 607d5b0..4bb8d4a 100644
--- a/package/espeak/Config.in
+++ b/package/espeak/Config.in
@@ -30,14 +30,9 @@ config BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_ALSA
 
 config BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_PULSEAUDIO
 	bool "pulseaudio"
-	depends on BR2_LARGEFILE # pulseaudio
 	depends on BR2_ARCH_HAS_ATOMICS # pulseaudio
 	select BR2_PACKAGE_PULSEAUDIO
 
-comment "pulseaudio backend needs a toolchain with largefile"
-	depends on !BR2_LARGEFILE
-	depends on BR2_ARCH_HAS_ATOMICS
-
 endchoice
 
 endif # BR2_PACKAGE_ESPEAK
diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index 7934cd7..6d4139f 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_EUDEV
 	bool "eudev"
 	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 	depends on BR2_USE_MMU # uses fork()
-	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
 	depends on !BR2_STATIC_LIBS # kmod
 	select BR2_PACKAGE_HAS_UDEV
@@ -34,6 +33,6 @@ comment "eudev needs eudev /dev management"
 	depends on BR2_USE_MMU
 	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 
-comment "eudev needs a toolchain w/ largefile, wchar, dynamic library"
+comment "eudev needs a toolchain w/ wchar, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_STATIC_LIBS
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
diff --git a/package/exfat-utils/Config.in b/package/exfat-utils/Config.in
index e5c0338..aedff5f 100644
--- a/package/exfat-utils/Config.in
+++ b/package/exfat-utils/Config.in
@@ -1,11 +1,10 @@
 config BR2_PACKAGE_EXFAT_UTILS
 	bool "exfat-utils"
-	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
 	help
 	  exFAT filesystem utilities.
 
 	  http://code.google.com/p/exfat/
 
-comment "exfat-utils needs a toolchain w/ largefile, wchar"
-	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR
+comment "exfat-utils needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/exfat/Config.in b/package/exfat/Config.in
index e5e17e9..575f389 100644
--- a/package/exfat/Config.in
+++ b/package/exfat/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_EXFAT
 	bool "exFAT (FUSE)"
-	depends on BR2_LARGEFILE # libfuse
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
 	depends on BR2_USE_MMU # libfuse
 	depends on BR2_USE_WCHAR
@@ -12,6 +11,6 @@ config BR2_PACKAGE_EXFAT
 
 	  http://code.google.com/p/exfat/
 
-comment "exfat needs a toolchain w/ largefile, wchar, threads, dynamic library"
+comment "exfat needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || BR2_STATIC_LIBS
diff --git a/package/exiv2/Config.in b/package/exiv2/Config.in
index 3837dd7..9a7cf44 100644
--- a/package/exiv2/Config.in
+++ b/package/exiv2/Config.in
@@ -39,12 +39,11 @@ config BR2_PACKAGE_EXIV2_XMP
 	bool "XMP support"
 	select BR2_PACKAGE_EXPAT
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_LARGEFILE
 	help
 	  Build with XMP support
 
-comment "xmp support needs a toolchain w/ threads, and largefile"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE
+comment "xmp support needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_EXIV2_LENSDATA
 	bool "Nikon lens name database"
diff --git a/package/f2fs-tools/Config.in b/package/f2fs-tools/Config.in
index 98f66a2..6a98e79 100644
--- a/package/f2fs-tools/Config.in
+++ b/package/f2fs-tools/Config.in
@@ -2,12 +2,11 @@ config BR2_PACKAGE_F2FS_TOOLS
 	bool "f2fs-tools"
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
-	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # util-linux
 	help
 	  Tools for Flash-Friendly File System (F2FS)
 
 	  http://sourceforge.net/projects/f2fs-tools/
 
-comment "f2fs-tools needs a toolchain w/ largefile, wchar"
-	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
+comment "f2fs-tools needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index 7ce0f3a..bfdc624 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -1,11 +1,10 @@
-comment "ffmpeg needs a toolchain w/ largefile, IPv6"
-	depends on !(BR2_LARGEFILE && BR2_INET_IPV6)
+comment "ffmpeg needs a toolchain w/ IPv6"
+	depends on !BR2_INET_IPV6
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
 
 menuconfig BR2_PACKAGE_FFMPEG
 	bool "ffmpeg"
-	depends on BR2_LARGEFILE
 	depends on BR2_INET_IPV6
 	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
diff --git a/package/filemq/Config.in b/package/filemq/Config.in
index 1604846..4015b92 100644
--- a/package/filemq/Config.in
+++ b/package/filemq/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_FILEMQ
 	select BR2_PACKAGE_ZEROMQ
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
 	depends on BR2_INET_IPV6 # zeromq
-	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 	depends on BR2_USE_MMU # czmq
@@ -14,7 +13,7 @@ config BR2_PACKAGE_FILEMQ
 
 	  http://github.com/zeromq/filemq
 
-comment "filemq needs a toolchain w/ C++, IPv6, largefile, wchar, threads"
+comment "filemq needs a toolchain w/ C++, IPv6, wchar, threads"
 	depends on BR2_USE_MMU
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE \
-		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && \
+		BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/fio/Config.in b/package/fio/Config.in
index 219b9d9..75af6a7 100644
--- a/package/fio/Config.in
+++ b/package/fio/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_FIO
 	bool "fio"
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# fio uses posix_madvise(), which is not part of any official
 	# release of uClibc, but is part of uClibc Git, and backported
@@ -9,8 +8,8 @@ config BR2_PACKAGE_FIO
 	# disable the build of fio for external uClibc toolchains
 	# (which use an unknown uClibc version)
 	depends on !BR2_TOOLCHAIN_EXTERNAL_UCLIBC
-	# fio uses fallocate() which becomes fallocate64() while compiling
-	# with BR2_LARGEFILE but fallocate64() is not available on nios2
+	# fio uses fallocate() which becomes fallocate64() while compiling with
+	# largefile support, but fallocate64() is not available on nios2
 	depends on !BR2_nios2
 	help
 	  fio is an I/O tool meant to be used both for benchmark
@@ -18,7 +17,7 @@ config BR2_PACKAGE_FIO
 
 	  http://git.kernel.dk/?p=fio.git;a=summary
 
-comment "fio needs a toolchain w/ largefile, threads"
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+comment "fio needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_nios2
 	depends on BR2_USE_MMU
diff --git a/package/flashbench/Config.in b/package/flashbench/Config.in
index aa98200..7be1ea9 100644
--- a/package/flashbench/Config.in
+++ b/package/flashbench/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_FLASHBENCH
 	bool "flashbench"
-	depends on BR2_LARGEFILE
 	help
 	  Flashbench - Identify characteristics of flash media.
 
@@ -9,6 +8,3 @@ config BR2_PACKAGE_FLASHBENCH
 	  survey.
 
 	  https://wiki.linaro.org/WorkingGroups/KernelConsolidation/Projects/FlashCardSurvey
-
-comment "flashbench needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
diff --git a/package/ftop/Config.in b/package/ftop/Config.in
index d8f57b0..1f5ebbb 100644
--- a/package/ftop/Config.in
+++ b/package/ftop/Config.in
@@ -1,12 +1,8 @@
 config BR2_PACKAGE_FTOP
 	bool "ftop"
-	depends on BR2_LARGEFILE
 	select BR2_PACKAGE_NCURSES
 	help
 	  Ftop is to files what top is to processes.
 	  The progress of all open files and file systems can be monitored.
 
 	  https://code.google.com/p/ftop/
-
-comment "ftop needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
diff --git a/package/gamin/gamin.mk b/package/gamin/gamin.mk
index 443dd48..d908b90 100644
--- a/package/gamin/gamin.mk
+++ b/package/gamin/gamin.mk
@@ -16,10 +16,6 @@ GAMIN_CONF_OPTS += --without-python
 
 GAMIN_CONF_ENV = have_abstract_sockets=no
 
-ifneq ($(BR2_LARGEFILE),y)
-GAMIN_CONF_ENV += CC="$(TARGET_CC) $(TARGET_CFLAGS) -DNO_LARGEFILE_SOURCE"
-endif
-
 GAMIN_DEPENDENCIES = libglib2
 
 $(eval $(autotools-package))
diff --git a/package/genext2fs/Config.in b/package/genext2fs/Config.in
index c8b5635..d119160 100644
--- a/package/genext2fs/Config.in
+++ b/package/genext2fs/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_GENEXT2FS
 	bool "genext2fs"
-	depends on BR2_LARGEFILE
 	help
 	  genext2fs generates an ext2 filesystem as a normal (non-root)
 	  user.  It does not require you to mount the image file to
@@ -8,6 +7,3 @@ config BR2_PACKAGE_GENEXT2FS
 	  superuser to make device nodes.
 
 	  http://genext2fs.sourceforge.net/
-
-comment "genext2fs needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
diff --git a/package/git/Config.in b/package/git/Config.in
index 66c66c7..9babbec 100644
--- a/package/git/Config.in
+++ b/package/git/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_GIT
 	bool "git"
-	depends on BR2_LARGEFILE
 	depends on BR2_USE_MMU # uses fork()
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
@@ -9,7 +8,3 @@ config BR2_PACKAGE_GIT
 	  designed to handle everything from small to very large projects.
 
 	  http://git-scm.com
-
-comment "git needs a toolchain w/ largefile"
-	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE
diff --git a/package/glmark2/Config.in b/package/glmark2/Config.in
index 65e077b..052e820 100644
--- a/package/glmark2/Config.in
+++ b/package/glmark2/Config.in
@@ -10,12 +10,10 @@ config BR2_PACKAGE_GLMARK2_GL
 	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER
 
 comment "glmark2 needs an OpenGL or an openGL ES and EGL backend provided by mesa3d"
-	depends on BR2_LARGEFILE
 	depends on !BR2_PACKAGE_GLMARK2_GL && !BR2_PACKAGE_GLMARK2_EGL_GLES
 
 config BR2_PACKAGE_GLMARK2
 	bool "glmark2"
-	depends on BR2_LARGEFILE
 	depends on BR2_PACKAGE_GLMARK2_GL || BR2_PACKAGE_GLMARK2_EGL_GLES
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBPNG
@@ -24,6 +22,6 @@ config BR2_PACKAGE_GLMARK2
 
 	  https://github.com/glmark2/glmark2
 
-comment "glmark2 needs udev /dev management and a toolchain w/ C++, largefile, NPTL"
-	depends on !BR2_LARGEFILE || !BR2_INSTALL_LIBSTDCPP || \
+comment "glmark2 needs udev /dev management and a toolchain w/ C++, NPTL"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_PACKAGE_HAS_UDEV
diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 274afaa..856bf8d 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -1,14 +1,12 @@
-comment "gnuradio needs a toolchain w/ C++, IPV6, NPTL, largefile, wchar"
+comment "gnuradio needs a toolchain w/ C++, IPV6, NPTL, wchar"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_LARGEFILE || \
-		!BR2_INET_IPV6
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_INET_IPV6
 
 config BR2_PACKAGE_GNURADIO
 	bool "gnuradio"
 	depends on BR2_INET_IPV6 # boost
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_LARGEFILE # boost
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU # use fork()
 	depends on BR2_USE_WCHAR # boost
diff --git a/package/gptfdisk/Config.in b/package/gptfdisk/Config.in
index 75cdf8c..61692f6 100644
--- a/package/gptfdisk/Config.in
+++ b/package/gptfdisk/Config.in
@@ -1,9 +1,8 @@
-comment "gptfdisk needs a toolchain w/ largefile, wchar, C++"
-	depends on !(BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)
+comment "gptfdisk needs a toolchain w/ wchar, C++"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)
 
 config BR2_PACKAGE_GPTFDISK
 	bool "gptfdisk"
-	depends on BR2_LARGEFILE
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # util-linux
 	select BR2_PACKAGE_UTIL_LINUX
diff --git a/package/gstreamer/gst-ffmpeg/Config.in b/package/gstreamer/gst-ffmpeg/Config.in
index ab80ef8..fc2906f 100644
--- a/package/gstreamer/gst-ffmpeg/Config.in
+++ b/package/gstreamer/gst-ffmpeg/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_GST_FFMPEG
 	bool "gst-ffmpeg"
 	select BR2_PACKAGE_GST_PLUGINS_BASE
-	depends on BR2_LARGEFILE
 	depends on BR2_INET_IPV6
 	help
 	  GStreamer plugin containing one plugin with a set of elements using
@@ -23,5 +22,5 @@ config BR2_PACKAGE_GST_FFMPEG_GPL
 
 endif
 
-comment "gst-ffmpeg needs a toolchain w/ largefile, IPv6"
-	depends on !(BR2_LARGEFILE && BR2_INET_IPV6)
+comment "gst-ffmpeg needs a toolchain w/ IPv6"
+	depends on !BR2_INET_IPV6
diff --git a/package/gstreamer/gst-plugins-bad/Config.in b/package/gstreamer/gst-plugins-bad/Config.in
index 1e8b5ae..1a3bdb2 100644
--- a/package/gstreamer/gst-plugins-bad/Config.in
+++ b/package/gstreamer/gst-plugins-bad/Config.in
@@ -312,10 +312,6 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDL
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SNDFILE
 	bool "sndfile"
 	select BR2_PACKAGE_LIBSNDFILE
-	depends on BR2_LARGEFILE
-
-comment "gst-plugins-bad-plugin-sndfile needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VCD
 	bool "vcd"
diff --git a/package/gstreamer/gst-plugins-good/Config.in b/package/gstreamer/gst-plugins-good/Config.in
index 35bb692..6fb1a84 100644
--- a/package/gstreamer/gst-plugins-good/Config.in
+++ b/package/gstreamer/gst-plugins-good/Config.in
@@ -207,16 +207,15 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_OSS4
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PULSE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
-	depends on BR2_LARGEFILE # pulseaudio -> libsndfile
 	depends on BR2_USE_MMU # pulseaudio
 	depends on BR2_ARCH_HAS_ATOMICS # pulseaudio
 	select BR2_PACKAGE_PULSEAUDIO
 	bool "pulseaudio"
 
-comment "pulseaudio support needs a toolchain w/ largefile, threads"
+comment "pulseaudio support needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
 	depends on BR2_ARCH_HAS_ATOMICS
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SOUPHTTPSRC
 	bool "souphttpsrc (http client)"
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 5cadc42..44fcdfb 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -476,10 +476,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDL
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SNDFILE
 	bool "sndfile"
 	select BR2_PACKAGE_LIBSNDFILE
-	depends on BR2_LARGEFILE
-
-comment "sndfile plugin needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVB
 	bool "dvb"
diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index 9d15cbf..b3929b4 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -310,7 +310,6 @@ comment "gdkpixbuf needs a toolchain w/ wchar, threads"
 
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_PULSE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
-	depends on BR2_LARGEFILE # pulseaudio -> libsndfile
 	depends on BR2_USE_MMU # pulseaudio
 	depends on BR2_ARCH_HAS_ATOMICS # pulseaudio
 	select BR2_PACKAGE_PULSEAUDIO
@@ -318,10 +317,10 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_PULSE
 	help
 	  PulseAudio plugin library
 
-comment "pulseaudio support needs a toolchain w/ largefile, threads"
+comment "pulseaudio support needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
 	depends on BR2_ARCH_HAS_ATOMICS
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SOUPHTTPSRC
 	bool "souphttpsrc (http client)"
diff --git a/package/gstreamer1/gst1-plugins-ugly/Config.in b/package/gstreamer1/gst1-plugins-ugly/Config.in
index 341ec8c..f33e258 100644
--- a/package/gstreamer1/gst1-plugins-ugly/Config.in
+++ b/package/gstreamer1/gst1-plugins-ugly/Config.in
@@ -40,14 +40,13 @@ comment "plugins with external dependencies (there may be more available)"
 
 config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_DVDREAD
 	bool "dvdread"
-	depends on BR2_LARGEFILE # libdvdread
 	depends on !BR2_STATIC_LIBS # libdvdread
 	select BR2_PACKAGE_LIBDVDREAD
 	help
 	  Access a DVD with dvdread
 
-comment "dvdread needs a toolchain w/ dynamic library, largefile"
-	depends on !BR2_LARGEFILE || BR2_STATIC_LIBS
+comment "dvdread needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
 
 config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_LAME
 	bool "lame (*.mp3 audio encoder)"
diff --git a/package/gvfs/Config.in b/package/gvfs/Config.in
index f3a04f5..5e01918 100644
--- a/package/gvfs/Config.in
+++ b/package/gvfs/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_GVFS
 	bool "gvfs"
-	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_USE_MMU # dbus, glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, glib2
@@ -16,6 +15,6 @@ config BR2_PACKAGE_GVFS
 
 	  http://en.wikipedia.org/wiki/GVFS
 
-comment "gvfs needs a toolchain w/ largefile, wchar, threads"
+comment "gvfs needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/hdparm/Config.in b/package/hdparm/Config.in
index 3254830..1b57439 100644
--- a/package/hdparm/Config.in
+++ b/package/hdparm/Config.in
@@ -1,10 +1,6 @@
 config BR2_PACKAGE_HDPARM
 	bool "hdparm"
-	depends on BR2_LARGEFILE
 	help
 	  hdparm - get/set hard disk parameters for Linux IDE drives.
 
 	  http://www.ibiblio.org/pub/Linux/system/hardware/
-
-comment "hdparm needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index f11ebf5..fe788ac 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -18,11 +18,7 @@ ifeq ($(BR2_INSTALL_LIBSTDCPP)$(BR2_USE_WCHAR),yy)
 IMAGEMAGICK_CONFIG_SCRIPTS += Magick++-config
 endif
 
-ifeq ($(BR2_LARGEFILE),y)
 IMAGEMAGICK_CONF_ENV = ac_cv_sys_file_offset_bits=64
-else
-IMAGEMAGICK_CONF_ENV = ac_cv_sys_file_offset_bits=32
-endif
 
 IMAGEMAGICK_CONF_OPTS = \
 	--program-transform-name='s,,,' \
diff --git a/package/inotify-tools/Config.in b/package/inotify-tools/Config.in
index 4d64b73..df440d5 100644
--- a/package/inotify-tools/Config.in
+++ b/package/inotify-tools/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_INOTIFY_TOOLS
 	bool "inotify-tools"
-	depends on BR2_LARGEFILE
 	depends on BR2_USE_MMU # fork()
 	help
 	  inotify-tools is a C library and a set of command-line
@@ -10,7 +9,3 @@ config BR2_PACKAGE_INOTIFY_TOOLS
 	  binaries.
 
 	  https://github.com/rvoicilas/inotify-tools
-
-comment "inotify-tools needs a toolchain w/ largefile"
-	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE
diff --git a/package/ipset/Config.in b/package/ipset/Config.in
index 94832d3..6951413 100644
--- a/package/ipset/Config.in
+++ b/package/ipset/Config.in
@@ -1,12 +1,8 @@
 config BR2_PACKAGE_IPSET
 	bool "ipset"
-	depends on BR2_LARGEFILE
 	select BR2_PACKAGE_LIBMNL
 	help
 	  Utility to manage IP sets in the linux kernel.
 	  Requires a patched kernel or version >=2.6.39.
 
 	  http://ipset.netfilter.org/
-
-comment "ipset needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
diff --git a/package/jack2/Config.in b/package/jack2/Config.in
index afc723c..04249a1 100644
--- a/package/jack2/Config.in
+++ b/package/jack2/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_JACK2
 	bool "jack2"
-	depends on BR2_LARGEFILE # libsndfile
 	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -21,8 +20,7 @@ config BR2_PACKAGE_JACK2
 
 	  http://jackaudio.org/
 
-comment "jack2 needs a toolchain w/ largefile, threads, C++"
+comment "jack2 needs a toolchain w/ threads, C++"
 	depends on BR2_USE_MMU
 	depends on BR2_ARCH_HAS_ATOMICS
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/kexec-lite/Config.in b/package/kexec-lite/Config.in
index 7d3beff..8417dac 100644
--- a/package/kexec-lite/Config.in
+++ b/package/kexec-lite/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_KEXEC_LITE
 	bool "kexec-lite"
 	depends on BR2_powerpc || BR2_powerpc64
 	depends on !BR2_STATIC_LIBS # dtc, elfutils
-	depends on BR2_LARGEFILE # elfutils
 	depends on BR2_USE_WCHAR # elfutils
 	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_DTC
@@ -14,6 +13,6 @@ config BR2_PACKAGE_KEXEC_LITE
 	  This package is a tiny implementation of the kexec userspace
 	  components, for devicetree-based platforms.
 
-comment "kexec-lite needs a toolchain w/ largefile, wchar, dynamic library"
+comment "kexec-lite needs a toolchain w/ wchar, dynamic library"
 	depends on BR2_powerpc || BR2_powerpc64
-	depends on BR2_STATIC_LIBS || !BR2_LARGEFILE || !BR2_USE_WCHAR
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
diff --git a/package/kmod/Config.in b/package/kmod/Config.in
index 8d8a993..e59b281 100644
--- a/package/kmod/Config.in
+++ b/package/kmod/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_KMOD
 	bool "kmod"
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_LARGEFILE
 	help
 	  handle kernel modules
 
@@ -18,5 +17,5 @@ config BR2_PACKAGE_KMOD_TOOLS
 
 endif
 
-comment "kmod needs a toolchain w/ largefile, dynamic library"
-	depends on !BR2_LARGEFILE || BR2_STATIC_LIBS
+comment "kmod needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 48e624f..a0cbb18 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -2,9 +2,9 @@ config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	bool
 	default y if BR2_arm || BR2_i386 || BR2_x86_64
 
-comment "kodi needs a toolchain w/ C++, IPv6, largefile, threads, wchar"
+comment "kodi needs a toolchain w/ C++, IPv6, threads, wchar"
 	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
-	depends on !BR2_INET_IPV6 || !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+	depends on !BR2_INET_IPV6 || !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 	depends on BR2_USE_MMU
 
 config BR2_PACKAGE_KODI_EGL_GLES
@@ -93,7 +93,6 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_ZLIB
 	depends on BR2_INET_IPV6
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_KODI_EGL_GLES || BR2_PACKAGE_KODI_GL
 	depends on BR2_USE_MMU # python
diff --git a/package/libdri2/Config.in b/package/libdri2/Config.in
index badd52e..fff979e 100644
--- a/package/libdri2/Config.in
+++ b/package/libdri2/Config.in
@@ -5,12 +5,11 @@ config BR2_PACKAGE_LIBDRI2
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XPROTO_DRI2PROTO
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
-	depends on BR2_LARGEFILE # libdrm
 	depends on BR2_PACKAGE_XORG7
 	help
 	  Library for the DRI2 extension to the X Window System.
 
 	  https://github.com/robclark/libdri2
 
-comment "libdri2 needs a toolchain w/ largefile, threads"
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+comment "libdri2 needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index 8f70db5..dda3aee 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_LIBDRM
 	bool "libdrm"
 	select BR2_PACKAGE_LIBPTHREAD_STUBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libpthread-stubs
-	depends on BR2_LARGEFILE
 	help
 	  Direct Rendering Manager
 
@@ -64,5 +63,5 @@ endmenu
 
 endif
 
-comment "libdrm needs a toolchain w/ largefile, threads"
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+comment "libdrm needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libdvdnav/Config.in b/package/libdvdnav/Config.in
index 54a25de..fb13bc0 100644
--- a/package/libdvdnav/Config.in
+++ b/package/libdvdnav/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBDVDNAV
 	bool "libdvdnav"
-	depends on BR2_LARGEFILE # libdvdread
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS # libdvdread
 	select BR2_PACKAGE_LIBDVDREAD
@@ -11,5 +10,5 @@ config BR2_PACKAGE_LIBDVDNAV
 
 	  http://www.mplayerhq.hu
 
-comment "libdvdnav needs a toolchain w/ dynamic library, largefile, threads"
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+comment "libdvdnav needs a toolchain w/ dynamic library, threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libdvdread/Config.in b/package/libdvdread/Config.in
index 05a97c0..1326709 100644
--- a/package/libdvdread/Config.in
+++ b/package/libdvdread/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBDVDREAD
 	bool "libdvdread"
-	depends on BR2_LARGEFILE
 	depends on !BR2_STATIC_LIBS
 	help
 	  libdvdread provides a simple foundation for reading
@@ -8,5 +7,5 @@ config BR2_PACKAGE_LIBDVDREAD
 
 	  http://www.mplayerhq.hu/MPlayer/releases/dvdnav/
 
-comment "libdvdread needs a toolchain w/ dynamic library, largefile"
-	depends on !BR2_LARGEFILE || BR2_STATIC_LIBS
+comment "libdvdread needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/libftdi1/Config.in b/package/libftdi1/Config.in
index 957ad9a..9fb80ae 100644
--- a/package/libftdi1/Config.in
+++ b/package/libftdi1/Config.in
@@ -13,13 +13,12 @@ config BR2_PACKAGE_LIBTFDI1_LIBFTDIPP1
 	bool "libfdtipp1"
 	select BR2_PACKAGE_BOOST
 	depends on BR2_INSTALL_LIBSTDCPP # boost
-	depends on BR2_LARGEFILE # boost
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
 	help
 	  C++ bindings for libftdi
 
-comment "libfdtipp1 needs a toolchain w/ C++, largefile"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE
+comment "libfdtipp1 needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_LIBTFDI1_PYTHON_BINDINGS
 	bool "python bindings"
diff --git a/package/libfuse/Config.in b/package/libfuse/Config.in
index 0e9e969..deedb5a 100644
--- a/package/libfuse/Config.in
+++ b/package/libfuse/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_LIBFUSE
 	bool "libfuse"
 	# Really doesn't like static, see fuse/lib/fuse.c
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	help
@@ -10,6 +9,6 @@ config BR2_PACKAGE_LIBFUSE
 
 	  http://fuse.sourceforge.net/
 
-comment "libfuse needs a toolchain w/ largefile, threads, dynamic library"
+comment "libfuse needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libmnl/Config.in b/package/libmnl/Config.in
index 4ffe537..5acfb24 100644
--- a/package/libmnl/Config.in
+++ b/package/libmnl/Config.in
@@ -1,11 +1,7 @@
 config BR2_PACKAGE_LIBMNL
 	bool "libmnl"
-	depends on BR2_LARGEFILE
 	help
 	  libmnl is a minimalistic user-space library oriented
 	  to Netlink developers.
 
 	  http://netfilter.org/projects/libmnl/
-
-comment "libmnl needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
diff --git a/package/libnetfilter_acct/Config.in b/package/libnetfilter_acct/Config.in
index a918dac..ecfef6d 100644
--- a/package/libnetfilter_acct/Config.in
+++ b/package/libnetfilter_acct/Config.in
@@ -1,12 +1,8 @@
 config BR2_PACKAGE_LIBNETFILTER_ACCT
 	bool "libnetfilter_acct"
-	depends on BR2_LARGEFILE
 	select BR2_PACKAGE_LIBMNL
 	help
 	  libnetfilter_acct is the userspace library providing interface
 	  to extended accounting infrastructure.
 
 	  http://www.netfilter.org/projects/libnetfilter_acct/
-
-comment "libnetfilter_acct needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
diff --git a/package/libnetfilter_conntrack/Config.in b/package/libnetfilter_conntrack/Config.in
index c4a76a2..f9a407f 100644
--- a/package/libnetfilter_conntrack/Config.in
+++ b/package/libnetfilter_conntrack/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBNETFILTER_CONNTRACK
 	bool "libnetfilter_conntrack"
-	depends on BR2_LARGEFILE
 	select BR2_PACKAGE_LIBMNL
 	select BR2_PACKAGE_LIBNFNETLINK
 	help
@@ -9,6 +8,3 @@ config BR2_PACKAGE_LIBNETFILTER_CONNTRACK
 	  connection tracking state table.
 
 	  http://www.netfilter.org/projects/libnetfilter_conntrack/
-
-comment "libnetfilter_conntrack needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
diff --git a/package/libnetfilter_cthelper/Config.in b/package/libnetfilter_cthelper/Config.in
index 0b808cc..571883d 100644
--- a/package/libnetfilter_cthelper/Config.in
+++ b/package/libnetfilter_cthelper/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBNETFILTER_CTHELPER
 	bool "libnetfilter_cthelper"
-	depends on BR2_LARGEFILE
 	select BR2_PACKAGE_LIBMNL
 	help
 	  libnetfilter_cthelper is the userspace library that provides
@@ -8,6 +7,3 @@ config BR2_PACKAGE_LIBNETFILTER_CTHELPER
 	  available since Linux kernel 3.6.
 
 	  http://www.netfilter.org/projects/libnetfilter_cthelper/
-
-comment "libnetfilter_cthelper needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
diff --git a/package/libnetfilter_cttimeout/Config.in b/package/libnetfilter_cttimeout/Config.in
index 18e85d3..333919b 100644
--- a/package/libnetfilter_cttimeout/Config.in
+++ b/package/libnetfilter_cttimeout/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBNETFILTER_CTTIMEOUT
 	bool "libnetfilter_cttimeout"
-	depends on BR2_LARGEFILE
 	select BR2_PACKAGE_LIBMNL
 	help
 	  libnetfilter_cttimeout is the userspace library that provides
@@ -8,6 +7,3 @@ config BR2_PACKAGE_LIBNETFILTER_CTTIMEOUT
 	  connection tracking timeout infrastructure.
 
 	  http://www.netfilter.org/projects/libnetfilter_cttimeout/
-
-comment "libnetfilter_cttimout needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
diff --git a/package/libnetfilter_queue/Config.in b/package/libnetfilter_queue/Config.in
index de8c5d3..767f44a 100644
--- a/package/libnetfilter_queue/Config.in
+++ b/package/libnetfilter_queue/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBNETFILTER_QUEUE
 	bool "libnetfilter_queue"
-	depends on BR2_LARGEFILE
 	depends on BR2_INET_IPV6
 	select BR2_PACKAGE_LIBNFNETLINK
 	select BR2_PACKAGE_LIBMNL
@@ -11,5 +10,5 @@ config BR2_PACKAGE_LIBNETFILTER_QUEUE
 
 	  http://www.netfilter.org/projects/libnetfilter_queue/
 
-comment "libnetfilter_queue needs a toolchain w/ largefile, IPv6"
-	depends on !BR2_LARGEFILE && !BR2_INET_IPV6
+comment "libnetfilter_queue needs a toolchain w/ IPv6"
+	depends on !BR2_INET_IPV6
diff --git a/package/libnfs/Config.in b/package/libnfs/Config.in
index 657bdda..6642fe4 100644
--- a/package/libnfs/Config.in
+++ b/package/libnfs/Config.in
@@ -1,11 +1,10 @@
 config BR2_PACKAGE_LIBNFS
 	bool "libnfs"
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	depends on BR2_LARGEFILE
 	help
 	  nfs userspace implementation.
 
 	  http://github.com/sahlberg/libnfs
 
-comment "libnfs needs a toolchain w/ RPC and LARGEFILE"
-	depends on !(BR2_TOOLCHAIN_HAS_NATIVE_RPC && BR2_LARGEFILE)
+comment "libnfs needs a toolchain w/ RPC"
+	depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/package/libnftnl/Config.in b/package/libnftnl/Config.in
index af0bb4a..0d3db5b 100644
--- a/package/libnftnl/Config.in
+++ b/package/libnftnl/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LIBNFTNL
 	bool "libnftnl"
 	depends on BR2_INET_IPV6
-	depends on BR2_LARGEFILE
 	# bad headers, no sa_family_t in linux/socket.h
 	depends on !(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 || BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009)
 	select BR2_PACKAGE_LIBMNL
@@ -34,5 +33,5 @@ comment "libnftnl XML parsing support needs a toolchain w/ threads"
 
 endif
 
-comment "libnftnl needs a toolchain w/ IPv6, largefile"
-	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE
+comment "libnftnl needs a toolchain w/ IPv6"
+	depends on !BR2_INET_IPV6
diff --git a/package/libnspr/Config.in b/package/libnspr/Config.in
index 416f1c9..6a5310c 100644
--- a/package/libnspr/Config.in
+++ b/package/libnspr/Config.in
@@ -6,7 +6,6 @@ if BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
 
 config BR2_PACKAGE_LIBNSPR
 	bool "libnspr"
-	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  NSPR is the Netscape Portable Runtime library which provides
@@ -16,7 +15,7 @@ config BR2_PACKAGE_LIBNSPR
 
 	  http://www.mozilla.org/projects/nspr/
 
-comment "libnspr needs a toolchain w/ largefile, threads"
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+comment "libnspr needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 endif
diff --git a/package/libnss/Config.in b/package/libnss/Config.in
index fde6710..f07bb04 100644
--- a/package/libnss/Config.in
+++ b/package/libnss/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_LIBNSS
 	select BR2_PACKAGE_LIBNSPR
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_ZLIB
-	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnspr
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnspr
 	depends on !BR2_STATIC_LIBS
@@ -16,7 +15,6 @@ config BR2_PACKAGE_LIBNSS
 
 	  http://www.mozilla.org/projects/security/pki/nss/
 
-comment "libnss needs a toolchain w/ largefile, threads, dynamic library"
+comment "libnss needs a toolchain w/ threads, dynamic library"
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libpciaccess/Config.in b/package/libpciaccess/Config.in
index 8b05ebf..6cc983f 100644
--- a/package/libpciaccess/Config.in
+++ b/package/libpciaccess/Config.in
@@ -1,8 +1,4 @@
 config BR2_PACKAGE_LIBPCIACCESS
 	bool "libpciaccess"
-	depends on BR2_LARGEFILE
 	help
 	  X.Org libpciaccess
-
-comment "libpciaccess needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
diff --git a/package/libplayer/Config.in b/package/libplayer/Config.in
index fd3e325..aa599ae 100644
--- a/package/libplayer/Config.in
+++ b/package/libplayer/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_LIBPLAYER
-	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	bool "libplayer"
 	help
@@ -16,8 +15,6 @@ config BR2_PACKAGE_LIBPLAYER_MPLAYER
 	depends on !(BR2_bfin || BR2_sh2a || BR2_sh4a || BR2_sh4aeb || \
 		BR2_microblaze || BR2_aarch64 || BR2_nios2)
 	# mplayer
-	depends on BR2_LARGEFILE
-	# mplayer
 	# Broken support for <ARMv5
 	depends on !BR2_ARM_CPU_ARMV4
 	select BR2_PACKAGE_MPLAYER
@@ -39,5 +36,5 @@ config BR2_PACKAGE_LIBPLAYER_PYTHON
 	bool "Libplayer python bindings"
 endif
 
-comment "libplayer needs a toolchain w/ largefile, threads"
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+comment "libplayer needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libselinux/Config.in b/package/libselinux/Config.in
index e4d1309..eb892e4 100644
--- a/package/libselinux/Config.in
+++ b/package/libselinux/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_LIBSELINUX
 	select BR2_PACKAGE_LIBSEPOL
 	select BR2_PACKAGE_PCRE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_LARGEFILE
 	depends on !BR2_STATIC_LIBS
 	help
 	  libselinux is the runtime SELinux library that provides
@@ -16,5 +15,5 @@ config BR2_PACKAGE_LIBSELINUX
 
 	  http://selinuxproject.org/page/Main_Page
 
-comment "libselinux needs a toolchain w/ largefile, threads, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || BR2_STATIC_LIBS
+comment "libselinux needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libsemanage/Config.in b/package/libsemanage/Config.in
index bef5c78..130fd82 100644
--- a/package/libsemanage/Config.in
+++ b/package/libsemanage/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_LIBSEMANAGE
 	select BR2_PACKAGE_USTR
 	select BR2_PACKAGE_BZIP2
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_LARGEFILE
 	depends on !BR2_STATIC_LIBS
 	help
 	  libsemanage is the policy management library. It uses
@@ -27,5 +26,5 @@ config BR2_PACKAGE_LIBSEMANAGE_PYTHON_BINDINGS
 
 endif
 
-comment "libsemanage needs a toolchain w/ largefile, threads, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || BR2_STATIC_LIBS
+comment "libsemanage needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libsndfile/Config.in b/package/libsndfile/Config.in
index 28e366a..9afe496 100644
--- a/package/libsndfile/Config.in
+++ b/package/libsndfile/Config.in
@@ -1,15 +1,8 @@
 config BR2_PACKAGE_LIBSNDFILE
 	bool "libsndfile"
-	# The absence of largefile doesn't prevent libsndfile to
-	# build, but@runtime the code assumes that off_t is 64
-	# bits, and asserts if not.
-	depends on BR2_LARGEFILE
 	help
 	  Libsndfile is a C library for reading and writing files containing
 	  sampled sound (such as MS Windows WAV and the Apple/SGI AIFF format)
 	  through one standard library interface.
 
 	  http://www.mega-nerd.com/libsndfile/
-
-comment "libsndfile needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
diff --git a/package/libupnp/Config.in b/package/libupnp/Config.in
index 5c94879..6a07b42 100644
--- a/package/libupnp/Config.in
+++ b/package/libupnp/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBUPNP
 	bool "libupnp"
-	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  The portable SDK for UPnP(tm) Devices (libupnp) provides developers
@@ -10,5 +9,5 @@ config BR2_PACKAGE_LIBUPNP
 
 	  http://pupnp.sourceforge.net/
 
-comment "libupnp needs a toolchain w/ largefile, threads"
-	depends on !(BR2_LARGEFILE && BR2_TOOLCHAIN_HAS_THREADS)
+comment "libupnp needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libupnpp/Config.in b/package/libupnpp/Config.in
index 90b6067..a0565fe 100644
--- a/package/libupnpp/Config.in
+++ b/package/libupnpp/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_LIBUPNPP
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBUPNP
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_LARGEFILE # libupnp
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnp
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 # Too old gcc
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 # Ditto
@@ -18,11 +17,10 @@ config BR2_PACKAGE_LIBUPNPP
 
 	  http://www.lesbonscomptes.com/upmpdcli/
 
-comment "libupnpp needs a toolchain w/ C++, largefile, threads"
+comment "libupnpp needs a toolchain w/ C++, threads"
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 # Too old gcc
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 # Ditto
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 # Ditto
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
index aca514a..a5455cb 100644
--- a/package/libv4l/Config.in
+++ b/package/libv4l/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBV4L
 	bool "libv4l"
-	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -29,7 +28,7 @@ config BR2_PACKAGE_LIBV4L_UTILS
 
 endif
 
-comment "libv4l needs a toolchain w/ largefile, threads and C++, headers >= 3.0"
+comment "libv4l needs a toolchain w/ threads and C++, headers >= 3.0"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS \
+	depends on !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
diff --git a/package/libva-intel-driver/Config.in b/package/libva-intel-driver/Config.in
index 2e4ba52..0f5b656 100644
--- a/package/libva-intel-driver/Config.in
+++ b/package/libva-intel-driver/Config.in
@@ -8,14 +8,12 @@ config BR2_PACKAGE_LIBVA_INTEL_DRIVER
 	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_XORG7
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm/libpthread-stubs
-	depends on BR2_LARGEFILE # libdrm
 	depends on !BR2_STATIC_LIBS # libva
 	help
 	  VA-API back-end driver for Intel graphics chips
 
 	  https://01.org/linuxgraphics/community/vaapi
 
-comment "libva intel driver needs a toolchain w/ largefile, threads, dynamic library"
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
+comment "libva intel driver needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 	depends on BR2_i386 || BR2_x86_64
diff --git a/package/libva/Config.in b/package/libva/Config.in
index d3308f8..467b9d2 100644
--- a/package/libva/Config.in
+++ b/package/libva/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_LIBVA
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_XORG7
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm/libpthread-stubs
-	depends on BR2_LARGEFILE # libdrm
 	depends on !BR2_STATIC_LIBS
 	help
 	  The main motivation for VA-API (Video Acceleration API) is to enable
@@ -15,6 +14,5 @@ config BR2_PACKAGE_LIBVA
 
 	  http://www.freedesktop.org/wiki/Software/vaapi/
 
-comment "libva needs a toolchain w/ largefile, threads, dynamic library"
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
+comment "libva needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 264e437..e5832b2 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -12,10 +12,6 @@ LIBXML2_LICENSE = MIT
 LIBXML2_LICENSE_FILES = COPYING
 LIBXML2_CONFIG_SCRIPTS = xml2-config
 
-ifneq ($(BR2_LARGEFILE),y)
-LIBXML2_CONF_ENV = CC="$(TARGET_CC) $(TARGET_CFLAGS) -DNO_LARGEFILE_SOURCE"
-endif
-
 LIBXML2_CONF_OPTS = --with-gnu-ld --without-python --without-debug
 
 HOST_LIBXML2_DEPENDENCIES = host-pkgconf
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index cdbf91d..626cd69 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -13,8 +13,7 @@ LIGHTTPD_LICENSE_FILES = COPYING
 LIGHTTPD_DEPENDENCIES = host-pkgconf
 LIGHTTPD_CONF_OPTS = \
 	--libdir=/usr/lib/lighttpd \
-	--libexecdir=/usr/lib \
-	$(if $(BR2_LARGEFILE),,--disable-lfs)
+	--libexecdir=/usr/lib
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_OPENSSL),y)
 LIGHTTPD_DEPENDENCIES += openssl
diff --git a/package/lshw/Config.in b/package/lshw/Config.in
index bd4a1ba..8cc935a 100644
--- a/package/lshw/Config.in
+++ b/package/lshw/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LSHW
 	bool "lshw"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
@@ -10,5 +9,5 @@ config BR2_PACKAGE_LSHW
 
 	  http://ezix.org/project/wiki/HardwareLiSter
 
-comment "lshw needs a toolchain w/ C++, largefile, wchar"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_USE_WCHAR
+comment "lshw needs a toolchain w/ C++, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index 0a1667a..5d1f564 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -17,9 +17,6 @@ LSOF_LICENSE_FILES = dialects/linux/dproto.h
 LSOF_DEPENDENCIES += $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 
 BR2_LSOF_CFLAGS =
-ifeq ($(BR2_LARGEFILE),)
-BR2_LSOF_CFLAGS += -U_FILE_OFFSET_BITS
-endif
 ifeq ($(BR2_INET_IPV6),)
 BR2_LSOF_CFLAGS += -UHASIPv6
 endif
diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index 2cb49a6..4929bbc 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -7,7 +7,6 @@ config BR2_PACKAGE_LTP_TESTSUITE
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INET_IPV6
-	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	# does not build, cachectl.h issue
 	depends on !BR2_nios2
@@ -23,8 +22,8 @@ config BR2_PACKAGE_LTP_TESTSUITE
 
 	  http://ltp.sourceforge.net/
 
-comment "ltp-testsuite needs a toolchain w/ IPv6, RPC, largefile, threads"
+comment "ltp-testsuite needs a toolchain w/ IPv6, RPC, threads"
 	depends on !BR2_nios2
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6 || \
-		!BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+		!BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/package/ltrace/Config.in b/package/ltrace/Config.in
index e7237da..af932df 100644
--- a/package/ltrace/Config.in
+++ b/package/ltrace/Config.in
@@ -7,7 +7,6 @@ config BR2_PACKAGE_LTRACE
 	depends on (BR2_i386 || BR2_arm \
 		|| BR2_powerpc || BR2_sparc || BR2_x86_64 || BR2_xtensa)
 	select BR2_PACKAGE_ELFUTILS
-	depends on BR2_LARGEFILE # elfutils
 	depends on BR2_USE_WCHAR # elfutils
 	depends on !BR2_STATIC_LIBS # elfutils
 	help
@@ -18,5 +17,5 @@ config BR2_PACKAGE_LTRACE
 
 	  http://ltrace.org
 
-comment "ltrace needs toolchain w/ largefile, wchar, dynamic library"
-	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_STATIC_LIBS
+comment "ltrace needs toolchain w/ wchar, dynamic library"
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
diff --git a/package/lttng-babeltrace/Config.in b/package/lttng-babeltrace/Config.in
index 1040e26..0eaaa20 100644
--- a/package/lttng-babeltrace/Config.in
+++ b/package/lttng-babeltrace/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_LTTNG_BABELTRACE
 	depends on BR2_USE_WCHAR # libglib2, util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
-	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_USES_GLIBC # posix_fallocate
 	help
 	  The Babeltrace project provides trace read and write
@@ -28,7 +27,7 @@ config BR2_PACKAGE_LTTNG_BABELTRACE
 
 	  http://www.efficios.com/babeltrace
 
-comment "lttng-babeltrace needs a uclibc snapshot or (e)glib toolchain w/ wchar, threads, largefile"
+comment "lttng-babeltrace needs a uclibc snapshot or (e)glib toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS \
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !(BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_USES_GLIBC)
diff --git a/package/lttng-libust/Config.in b/package/lttng-libust/Config.in
index 0a6abb6..7c30d78 100644
--- a/package/lttng-libust/Config.in
+++ b/package/lttng-libust/Config.in
@@ -3,9 +3,7 @@ config BR2_PACKAGE_LTTNG_LIBUST
 	select BR2_PACKAGE_LIBURCU
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
-	# util-linux needs wchar and largefile
-	depends on BR2_USE_WCHAR
-	depends on BR2_LARGEFILE
+	depends on BR2_USE_WCHAR # util-linux
 	# liburcu only works on some architectures and requires threads support"
 	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
@@ -18,9 +16,9 @@ config BR2_PACKAGE_LTTNG_LIBUST
 
 	  http://lttng.org
 
-comment "lttng-libust needs a toolchain w/ wchar, largefile, threads"
+comment "lttng-libust needs a toolchain w/ wchar, threads"
 	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
-	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
 
 comment "lttng-libust needs a toolchain not affected by GCC bug 58854"
diff --git a/package/lttng-tools/Config.in b/package/lttng-tools/Config.in
index a960b21..4d4b923 100644
--- a/package/lttng-tools/Config.in
+++ b/package/lttng-tools/Config.in
@@ -9,7 +9,6 @@ config BR2_PACKAGE_LTTNG_TOOLS
 	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58595 # lttng-tools/gcc-4.{7,8}.x bug
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
-	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
@@ -30,10 +29,9 @@ config BR2_PACKAGE_LTTNG_TOOLS
 
 	  http://lttng.org
 
-comment "lttng-tools needs a toolchain w/ largefile, threads, wchar"
+comment "lttng-tools needs a toolchain w/ threads, wchar"
 	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58595 # lttng-tools/gcc-4.{7,8}.x bug
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
 
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index bb5741d..ae783c6 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -54,10 +54,6 @@ ifeq ($(BR2_PACKAGE_LUA_LINENOISE),y)
 endif
 endif
 
-ifneq ($(BR2_LARGEFILE),y)
-	LUA_CFLAGS += -D_FILE_OFFSET_BITS=32
-endif
-
 ifeq ($(BR2_PACKAGE_LUA_32BITS),y)
 define LUA_32BITS_LUACONF
 	$(SED) 's/\/\* #define LUA_32BITS \*\//#define LUA_32BITS/' $(@D)/src/luaconf.h
diff --git a/package/luafilesystem/luafilesystem.mk b/package/luafilesystem/luafilesystem.mk
index ea80753..5826e1e 100644
--- a/package/luafilesystem/luafilesystem.mk
+++ b/package/luafilesystem/luafilesystem.mk
@@ -7,8 +7,5 @@
 LUAFILESYSTEM_VERSION = 1.6.3-1
 LUAFILESYSTEM_LICENSE = MIT
 LUAFILESYSTEM_SUBDIR = luafilesystem
-ifneq ($(BR2_LARGEFILE),y)
-LUAFILESYSTEM_BUILD_OPTS += CFLAGS="$(LUAROCKS_CFLAGS) -DLFS_DO_NOT_USE_LARGE_FILE"
-endif
 
 $(eval $(luarocks-package))
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index b8d8392..89f6a1d 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -14,10 +14,6 @@ LUAJIT_INSTALL_STAGING = YES
 
 LUAJIT_PROVIDES = luainterpreter
 
-ifneq ($(BR2_LARGEFILE),y)
-LUAJIT_NO_LARGEFILE = TARGET_LFSFLAGS=
-endif
-
 ifeq ($(BR2_STATIC_LIBS),y)
 LUAJIT_BUILDMODE = static
 else
@@ -51,7 +47,6 @@ define LUAJIT_BUILD_CMDS
 		HOST_CC="$(LUAJIT_HOST_CC)" \
 		HOST_CFLAGS="$(HOST_CFLAGS)" \
 		HOST_LDFLAGS="$(HOST_LDFLAGS)" \
-		$(LUAJIT_NO_LARGEFILE) \
 		BUILDMODE=$(LUAJIT_BUILDMODE) \
 		-C $(@D) amalg
 endef
diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index 4f9ad1d..b3a6593 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LVM2
 	bool "lvm2 & device mapper"
-	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # needs fork()
 	depends on !BR2_STATIC_LIBS # It fails to build statically
@@ -35,7 +34,6 @@ config BR2_PACKAGE_LVM2_APP_LIBRARY
 
 endif
 
-comment "lvm2 needs a toolchain w/ largefile, threads, dynamic library"
+comment "lvm2 needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lxc/Config.in b/package/lxc/Config.in
index 7bae87d..dc287c1 100644
--- a/package/lxc/Config.in
+++ b/package/lxc/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_LXC
 	select BR2_PACKAGE_LIBCAP
 	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_LARGEFILE
 	depends on BR2_USE_MMU # fork()
 	# the toolchain doesn't support setns syscall
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
@@ -16,9 +15,9 @@ config BR2_PACKAGE_LXC
 
 	  https://linuxcontainers.org/
 
-comment "lxc needs a toolchain w/ IPv6, threads, largefile, headers >= 3.0"
+comment "lxc needs a toolchain w/ IPv6, threads, headers >= 3.0"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
 	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_LARGEFILE || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
diff --git a/package/lz4/Config.in b/package/lz4/Config.in
index a855e31..677658c 100644
--- a/package/lz4/Config.in
+++ b/package/lz4/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LZ4
 	bool "lz4"
-	depends on BR2_LARGEFILE
 	help
 	  LZ4 is a very fast lossless compression algorithm, providing
 	  compression speed at 400 MB/s per core, scalable with multi-cores
@@ -9,6 +8,3 @@ config BR2_PACKAGE_LZ4
 	  on multi-core systems.
 
 	  https://code.google.com/p/lz4/
-
-comment "lz4 needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
diff --git a/package/lzip/Config.in b/package/lzip/Config.in
index b72ac78..f20d0e5 100644
--- a/package/lzip/Config.in
+++ b/package/lzip/Config.in
@@ -1,10 +1,9 @@
-comment "lzip needs a toolchain w/ C++, largefile"
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_LARGEFILE)
+comment "lzip needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_LZIP
 	bool "lzip"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_LARGEFILE
 	help
 	  Lzip is a lossless data compressor with a user interface similar
 	  to the one of gzip or bzip2.
diff --git a/package/memtester/Config.in b/package/memtester/Config.in
index b04dcd1..7a504dc 100644
--- a/package/memtester/Config.in
+++ b/package/memtester/Config.in
@@ -1,10 +1,6 @@
 config BR2_PACKAGE_MEMTESTER
 	bool "memtester"
-	depends on BR2_LARGEFILE
 	help
 	  A userspace utility for testing the memory subsystem for faults.
 
 	  http://pyropus.ca/software/memtester/
-
-comment "memtester needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index c407ece..ff3b24e 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -11,7 +11,6 @@ menuconfig BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XORG7
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	help
 	  Mesa 3D, an open-source implementation of the OpenGL specification.
@@ -147,6 +146,6 @@ config BR2_PACKAGE_PROVIDES_LIBGLES
 
 endif # BR2_PACKAGE_MESA3D
 
-comment "mesa3d needs udev /dev management and a toolchain w/ C++, largefile, NPTL"
-	depends on !BR2_LARGEFILE || !BR2_INSTALL_LIBSTDCPP || \
+comment "mesa3d needs udev /dev management and a toolchain w/ C++, NPTL"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_PACKAGE_HAS_UDEV
diff --git a/package/minidlna/Config.in b/package/minidlna/Config.in
index f6faeee..c78f1b6 100644
--- a/package/minidlna/Config.in
+++ b/package/minidlna/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_MINIDLNA
 	bool "minidlna"
-	depends on BR2_LARGEFILE # ffmpeg
 	depends on BR2_INET_IPV6 # ffmpeg
 	depends on BR2_USE_WCHAR # flac
 	depends on BR2_USE_MMU # fork
@@ -23,6 +22,6 @@ config BR2_PACKAGE_MINIDLNA
 
 	  http://minidlna.sourceforge.net/
 
-comment "minidlna needs a toolchain w/ largefile, IPv6, threads, wchar"
+comment "minidlna needs a toolchain w/ IPv6, threads, wchar"
 	depends on BR2_USE_MMU
-	depends on !(BR2_LARGEFILE && BR2_INET_IPV6 && BR2_TOOLCHAIN_HAS_THREADS && BR2_USE_WCHAR)
+	depends on !(BR2_INET_IPV6 && BR2_TOOLCHAIN_HAS_THREADS && BR2_USE_WCHAR)
diff --git a/package/mmc-utils/Config.in b/package/mmc-utils/Config.in
index d321800..850aeac 100644
--- a/package/mmc-utils/Config.in
+++ b/package/mmc-utils/Config.in
@@ -1,11 +1,10 @@
 config BR2_PACKAGE_MMC_UTILS
 	bool "mmc-utils"
-	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 	help
 	  MMC utils
 
 	  https://git.kernel.org/cgit/linux/kernel/git/cjb/mmc-utils.git
 
-comment "mmc-utils needs a toolchain w/ largefile, headers >= 3.0"
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+comment "mmc-utils needs a toolchain w/ headers >= 3.0"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
index 7768f1f..1c565ee 100644
--- a/package/modem-manager/Config.in
+++ b/package/modem-manager/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_MODEM_MANAGER
 	depends on BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_DBUS
 	depends on BR2_INET_IPV6
-	depends on BR2_LARGEFILE # acl
 	depends on BR2_USE_WCHAR # libglib2 and gnutls
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus
@@ -29,7 +28,7 @@ config BR2_PACKAGE_MODEM_MANAGER_LIBQMI
 	  This option enables support for QMI protocol
 endif
 
-comment "modemmanager needs udev /dev management and a toolchain w/ largefile, wchar, threads, IPv6"
-	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || !BR2_USE_WCHAR || \
+comment "modemmanager needs udev /dev management and a toolchain w/ wchar, threads, IPv6"
+	depends on !BR2_INET_IPV6 || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_HAS_UDEV
 	depends on BR2_USE_MMU
diff --git a/package/mongoose/Config.in b/package/mongoose/Config.in
index 8060942..df706b9 100644
--- a/package/mongoose/Config.in
+++ b/package/mongoose/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_MONGOOSE
 	bool "mongoose"
-	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	help
@@ -8,6 +7,6 @@ config BR2_PACKAGE_MONGOOSE
 
 	  https://github.com/cesanta/mongoose
 
-comment "mongoose needs a toolchain w/ threads, largefile"
+comment "mongoose needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/mongrel2/Config.in b/package/mongrel2/Config.in
index 680e0ce..77ca921 100644
--- a/package/mongrel2/Config.in
+++ b/package/mongrel2/Config.in
@@ -1,9 +1,9 @@
-comment "mongrel2 needs a toolchain w/ C++, IPv6, threads, largefile, wchar"
+comment "mongrel2 needs a toolchain w/ C++, IPv6, threads, wchar"
 	depends on BR2_UCLIBC_VERSION_SNAPSHOT || \
 		BR2_TOOLCHAIN_USES_GLIBC || \
 		BR2_arm
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_INET_IPV6 || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || !BR2_USE_WCHAR
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 
 config BR2_PACKAGE_MONGREL2
 	bool "mongrel2"
@@ -12,7 +12,6 @@ config BR2_PACKAGE_MONGREL2
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
 	depends on BR2_INET_IPV6 # zeromq
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
-	depends on BR2_LARGEFILE # zeromq -> util-linux
 	depends on BR2_USE_WCHAR # zeromq -> util-linux
 	# {get,make,swap}context functions present in
 	# {e,}glibc and in uClibc's master branch. Source has arm workaround
diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index 732b111..1a81349 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -23,7 +23,8 @@ MONIT_CONF_ENV = \
 	libmonit_cv_vsnprintf_c99_conformant=yes
 
 MONIT_CONF_OPTS += \
-	--without-pam
+	--without-pam \
+	--with-largefiles
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MONIT_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr
@@ -32,10 +33,4 @@ else
 MONIT_CONF_OPTS += --without-ssl
 endif
 
-ifeq ($(BR2_LARGEFILE),y)
-MONIT_CONF_OPTS += --with-largefiles
-else
-MONIT_CONF_OPTS += --without-largefiles
-endif
-
 $(eval $(autotools-package))
diff --git a/package/mp4v2/mp4v2.mk b/package/mp4v2/mp4v2.mk
index 5d38116..d34de02 100644
--- a/package/mp4v2/mp4v2.mk
+++ b/package/mp4v2/mp4v2.mk
@@ -20,13 +20,7 @@ MP4V2_CONF_ENV = ac_cv_prog_FOUND_HELP2MAN=no
 # mpv42 the only thing this option does is that it tries to strip any
 # -g* options from CFLAGS/CXXFLAGS. The logic to do so is
 # unfortunately buggy, so just pass --enable-debug to disable this
-MP4V2_CONF_OPTS = --enable-debug
-
-ifeq ($(BR2_LARGEFILE),y)
-MP4V2_CONF_OPTS += --enable-largefile
-else
-MP4V2_CONF_OPTS += --disable-largefile
-endif
+MP4V2_CONF_OPTS = --enable-debug --enable-largefile
 
 ifeq ($(BR2_PACKAGE_MP4V2_UTIL),y)
 MP4V2_CONF_OPTS += --enable-util
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index d077792..8ed1149 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -1,7 +1,6 @@
 menuconfig BR2_PACKAGE_MPD
 	bool "mpd"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_LARGEFILE # boost
 	depends on BR2_USE_WCHAR # libglib2, flac
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
@@ -79,15 +78,14 @@ config BR2_PACKAGE_MPD_FAAD2
 config BR2_PACKAGE_MPD_FFMPEG
 	bool "ffmpeg"
 	select BR2_PACKAGE_FFMPEG
-	depends on BR2_LARGEFILE
 	depends on BR2_INET_IPV6
 	help
 	  Enable ffmpeg input support.
 	  Select this if you want to play back files supported by
 	  ffmpeg.
 
-comment "ffmpeg support needs a toolchain w/ largefile, IPv6"
-	depends on !(BR2_LARGEFILE && BR2_INET_IPV6)
+comment "ffmpeg support needs a toolchain w/ IPv6"
+	depends on !BR2_INET_IPV6
 
 config BR2_PACKAGE_MPD_FLAC
 	bool "flac"
@@ -99,14 +97,10 @@ config BR2_PACKAGE_MPD_FLAC
 config BR2_PACKAGE_MPD_LIBSNDFILE
 	bool "libsndfile"
 	select BR2_PACKAGE_LIBSNDFILE
-	depends on BR2_LARGEFILE
 	help
 	  Enable libsndfile input/streaming support.
 	  Select this if you want to play back WAV files.
 
-comment "libsndfile support needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
-
 config BR2_PACKAGE_MPD_MAD
 	bool "mad"
 	default y
@@ -176,14 +170,10 @@ config BR2_PACKAGE_MPD_LAME
 
 config BR2_PACKAGE_MPD_TWOLAME
 	bool "twolame"
-	depends on BR2_LARGEFILE # twolame -> libsndfile
 	select BR2_PACKAGE_TWOLAME
 	help
 	  Enable TwoLAME mp2 encoding.
 
-comment "twolame support needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
-
 comment "Input plugins"
 
 config BR2_PACKAGE_MPD_CURL
@@ -238,16 +228,11 @@ config BR2_PACKAGE_MPD_AO
 
 config BR2_PACKAGE_MPD_JACK2
 	bool "jack2"
-	depends on BR2_LARGEFILE # jack2 -> libsndfile
 	depends on BR2_ARCH_HAS_ATOMICS
 	select BR2_PACKAGE_JACK2
 	help
 	  Enable jack output support.
 
-comment "jack support needs a toolchain w/ largefile"
-	depends on BR2_ARCH_HAS_ATOMICS
-	depends on !BR2_LARGEFILE
-
 config BR2_PACKAGE_MPD_OSS
 	bool "oss"
 	help
@@ -255,16 +240,11 @@ config BR2_PACKAGE_MPD_OSS
 
 config BR2_PACKAGE_MPD_PULSEAUDIO
 	bool "pulseaudio"
-	depends on BR2_LARGEFILE # pulseaudio -> libsndfile
 	depends on BR2_ARCH_HAS_ATOMICS # pulseaudio
 	select BR2_PACKAGE_PULSEAUDIO
 	help
 	  Enable pulseaudio output support.
 
-comment "pulseaudio support needs a toolchain w/ largefile"
-	depends on BR2_ARCH_HAS_ATOMICS
-	depends on !BR2_LARGEFILE
-
 comment "Miscellaneous plugins"
 
 config BR2_PACKAGE_MPD_AVAHI_SUPPORT
@@ -316,4 +296,4 @@ comment "mpd needs a toolchain w/ C++, threads, wchar"
 	depends on BR2_USE_MMU
 	depends on !BR2_sparc
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/mplayer/Config.in b/package/mplayer/Config.in
index 779f1bd..5140b9b 100644
--- a/package/mplayer/Config.in
+++ b/package/mplayer/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_MPLAYER
 		|| BR2_microblaze || BR2_aarch64 || BR2_nios2)
 	# Broken support for <ARMv5
 	depends on !BR2_ARM_CPU_ARMV4
-	depends on BR2_LARGEFILE
 	help
 	  MPlayer is a movie player which runs on many systems and supports
 	  many different file formats.
@@ -26,9 +25,3 @@ config BR2_PACKAGE_MPLAYER_MENCODER
 	  This will install the video encoder.
 
 endif
-
-comment "mplayer needs a toolchain w/ largefile"
-	depends on !(BR2_bfin || BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
-		|| BR2_microblaze || BR2_aarch64 || BR2_nios2)
-	depends on !BR2_ARM_CPU_ARMV4
-	depends on !BR2_LARGEFILE
diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index dd090a0..bef5178 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -62,11 +62,10 @@ config BR2_PACKAGE_MTD_MKFSUBIFS
 	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
-	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
 
-comment "mkfs.ubifs needs a toolchain w/ largefile, wchar"
-	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR
+comment "mkfs.ubifs needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
 
 config BR2_PACKAGE_MTD_MTD_DEBUG
 	bool "mtd_debug"
diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index f561363..2e9ba05 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -7,7 +7,7 @@
 NBD_VERSION = 3.8
 NBD_SOURCE = nbd-$(NBD_VERSION).tar.xz
 NBD_SITE = http://downloads.sourceforge.net/project/nbd/nbd/$(NBD_VERSION)
-NBD_CONF_OPTS = $(if $(BR2_LARGEFILE),--enable-lfs,--disable-lfs)
+NBD_CONF_OPTS = --enable-lfs
 NBD_DEPENDENCIES = libglib2
 NBD_LICENSE = GPLv2
 NBD_LICENSE_FILES = COPYING
diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 8b3ad71..e68a4dd 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_NETWORK_MANAGER
 	bool "networkmanager"
 	depends on BR2_INET_IPV6
-	depends on BR2_LARGEFILE # acl
 	depends on BR2_USE_WCHAR # libglib2 and gnutls
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus
@@ -52,8 +51,8 @@ config BR2_PACKAGE_NETWORK_MANAGER_PPPD
 	  This option enables support for PPPD daemon
 endif
 
-comment "NetworkManager needs udev /dev management and a toolchain w/ IPv6, largefile, wchar, threads, headers >= 3.7"
+comment "NetworkManager needs udev /dev management and a toolchain w/ IPv6, wchar, threads, headers >= 3.7"
 	depends on BR2_USE_MMU
-	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || !BR2_USE_WCHAR || \
+	depends on !BR2_INET_IPV6 || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
diff --git a/package/nfacct/Config.in b/package/nfacct/Config.in
index 4230783..e30d2d9 100644
--- a/package/nfacct/Config.in
+++ b/package/nfacct/Config.in
@@ -1,12 +1,8 @@
 config BR2_PACKAGE_NFACCT
 	bool "nfacct"
-	depends on BR2_LARGEFILE
 	select BR2_PACKAGE_LIBNETFILTER_ACCT
 	help
 	  nfacct is the command line tool to create/retrieve/delete
 	  netfilter accounting objects.
 
 	  http://www.netfilter.org/projects/nfacct/
-
-comment "nfacct needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index dff5150..66f9c21 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -1,18 +1,14 @@
-comment "nfs-utils needs a toolchain w/ largefile, threads"
+comment "nfs-utils needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || \
-		!(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
+	depends on !(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
 
 config BR2_PACKAGE_NFS_UTILS
 	bool "nfs-utils"
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	depends on BR2_LARGEFILE
 	depends on BR2_USE_MMU # fork()
 	help
 	  The NFS Linux kernel server.
-	  Warning: We do not force largefile support on here on purpose.
-	  Enable it yourself if you want to access big exports!
 
 	  http://sourceforge.net/projects/nfs
 
diff --git a/package/nftables/Config.in b/package/nftables/Config.in
index b7af244..9779ae9 100644
--- a/package/nftables/Config.in
+++ b/package/nftables/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_NFTABLES
 	bool "nftables"
 	depends on BR2_INET_IPV6
-	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
 	select BR2_PACKAGE_GMP
@@ -17,6 +16,6 @@ config BR2_PACKAGE_NFTABLES
 
 	  http://www.netfilter.org/projects/nftables/index.html
 
-comment "nftables needs a toolchain w/ IPv6, largefile, wchar, headers >= 3.4"
-	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || \
+comment "nftables needs a toolchain w/ IPv6, wchar, headers >= 3.4"
+	depends on !BR2_INET_IPV6 || \
 		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index e5d20af..cfbba73 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -1,10 +1,5 @@
-comment "nginx needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
-	depends on BR2_USE_MMU # fork()
-
 menuconfig BR2_PACKAGE_NGINX
 	bool "nginx"
-	depends on BR2_LARGEFILE
 	depends on BR2_USE_MMU # fork()
 	help
 	  nginx is an HTTP and reverse proxy server, as well as a mail proxy
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 06f1312..dee16af 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -37,7 +37,7 @@ NGINX_CONF_ENV += \
 	ngx_force_have_libatomic=no \
 	ngx_force_have_epoll=yes \
 	ngx_force_have_sendfile=yes \
-	ngx_force_have_sendfile64=$(if $(BR2_LARGEFILE),yes,no) \
+	ngx_force_have_sendfile64=yes \
 	ngx_force_have_pr_set_dumpable=yes \
 	ngx_force_have_timer_event=yes \
 	ngx_force_have_map_anon=yes \
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 47e80ec..5f1346c 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_NODEJS
 	bool "nodejs"
 	depends on BR2_INET_IPV6
-	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
@@ -16,11 +15,11 @@ config BR2_PACKAGE_NODEJS
 
 	  http://nodejs.org/
 
-comment "nodejs needs a toolchain w/ C++, IPv6, largefile, threads"
+comment "nodejs needs a toolchain w/ C++, IPv6, threads"
 	depends on BR2_USE_MMU
 	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
 	depends on !BR2_ARM_CPU_ARMV4
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || \
+	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6
 
 if BR2_PACKAGE_NODEJS
diff --git a/package/ntfs-3g/Config.in b/package/ntfs-3g/Config.in
index 0510c12..36e8ab8 100644
--- a/package/ntfs-3g/Config.in
+++ b/package/ntfs-3g/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_NTFS_3G
 	bool "ntfs-3g"
-	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
@@ -30,6 +29,6 @@ config BR2_PACKAGE_NTFS_3G_NTFSPROGS
 
 endif
 
-comment "ntfs-3g needs a toolchain w/ largefile, wchar, threads"
+comment "ntfs-3g needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
-	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
+	depends on !(BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/numactl/Config.in b/package/numactl/Config.in
index b383f69..f18e28d 100644
--- a/package/numactl/Config.in
+++ b/package/numactl/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_NUMACTL
 	bool "numactl"
 	# numactl uses some system calls that are not available on all
 	# architectures.
-	depends on BR2_LARGEFILE
 	depends on BR2_i386 || BR2_mips || BR2_mipsel || \
 		BR2_mips64 || BR2_mips64el || BR2_powerpc || BR2_x86_64
 	help
@@ -11,8 +10,3 @@ config BR2_PACKAGE_NUMACTL
 	  policy to the operating system before running your program.
 
 	  http://oss.sgi.com/projects/libnuma/
-
-comment "numactl needs a toolchain w/ largefile"
-	depends on BR2_i386 || BR2_mips || BR2_mipsel || \
-		BR2_mips64 || BR2_mips64el || BR2_powerpc || BR2_x86_64
-	depends on !BR2_LARGEFILE
diff --git a/package/ola/Config.in b/package/ola/Config.in
index 713102c..1c4b8d8 100644
--- a/package/ola/Config.in
+++ b/package/ola/Config.in
@@ -1,5 +1,5 @@
-comment "ola needs a toolchain w/ C++, threads, largefile, wchar"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+comment "ola needs a toolchain w/ C++, threads, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64
 
 config BR2_PACKAGE_OLA
@@ -8,7 +8,6 @@ config BR2_PACKAGE_OLA
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_UTIL_LINUX
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf
-	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64 # protobuf
diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 6a8ac6a..b1cab9c 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -129,7 +129,6 @@ comment "3rd party support"
 
 config BR2_PACKAGE_OPENCV_WITH_FFMPEG
 	bool "ffmpeg support"
-	depends on BR2_LARGEFILE
 	depends on BR2_INET_IPV6
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_FFMPEG
@@ -137,8 +136,8 @@ config BR2_PACKAGE_OPENCV_WITH_FFMPEG
 	help
 	  Use ffmpeg from the target system.
 
-comment "ffmpeg support needs a toolchain w/ largefile, IPv6"
-	depends on !(BR2_LARGEFILE && BR2_INET_IPV6)
+comment "ffmpeg support needs a toolchain w/ IPv6"
+	depends on !BR2_INET_IPV6
 
 config BR2_PACKAGE_OPENCV_WITH_GSTREAMER
 	bool "gstreamer support"
diff --git a/package/openvmtools/Config.in b/package/openvmtools/Config.in
index 5fc6977..285e3c6 100644
--- a/package/openvmtools/Config.in
+++ b/package/openvmtools/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_OPENVMTOOLS
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	depends on BR2_LARGEFILE
 	depends on BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBGLIB2
 	help
@@ -54,8 +53,8 @@ comment "PAM support needs a toolchain w/ dynamic library"
 
 endif
 
-comment "openvmtools needs a toolchain w/ wchar, threads, RPC, largefile, locale"
+comment "openvmtools needs a toolchain w/ wchar, threads, RPC, locale"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR ||!BR2_TOOLCHAIN_HAS_THREADS || \
-	!BR2_TOOLCHAIN_HAS_NATIVE_RPC || !BR2_LARGEFILE || !BR2_ENABLE_LOCALE
+	!BR2_TOOLCHAIN_HAS_NATIVE_RPC || !BR2_ENABLE_LOCALE
diff --git a/package/opusfile/Config.in b/package/opusfile/Config.in
index f9271c4..fe8a1b9 100644
--- a/package/opusfile/Config.in
+++ b/package/opusfile/Config.in
@@ -1,9 +1,5 @@
-comment "opusfile needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
-
 config BR2_PACKAGE_OPUSFILE
 	bool "opusfile"
-	depends on BR2_LARGEFILE
 	select BR2_PACKAGE_LIBOGG
 	select BR2_PACKAGE_OPUS
 	help
diff --git a/package/parted/Config.in b/package/parted/Config.in
index 45170aa..9d78f0f 100644
--- a/package/parted/Config.in
+++ b/package/parted/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PARTED
 	bool "parted"
-	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
@@ -9,5 +8,5 @@ config BR2_PACKAGE_PARTED
 
 	  http://www.gnu.org/software/parted/
 
-comment "parted needs a toolchain w/ largefile, wchar"
-	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
+comment "parted needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/pax-utils/Config.in b/package/pax-utils/Config.in
index 2591e2f..58100e4 100644
--- a/package/pax-utils/Config.in
+++ b/package/pax-utils/Config.in
@@ -1,11 +1,7 @@
 config BR2_PACKAGE_PAX_UTILS
 	bool "pax-utils"
-	depends on BR2_LARGEFILE
 	help
 	  ELF related utils for ELF 32/64 binaries that can check files
 	  for security relevant properties.
 
 	  http://www.gentoo.org/proj/en/hardened/pax-utils.xml
-
-comment "pax-utils needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
diff --git a/package/perf/Config.in b/package/perf/Config.in
index 083086b..05c9870 100644
--- a/package/perf/Config.in
+++ b/package/perf/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PERF
 	bool "perf"
 	depends on BR2_LINUX_KERNEL
-	depends on BR2_LARGEFILE
 	help
 	  perf (sometimes "Perf Events" or perf tools, originally
 	  "Performance Counters for Linux") - is a performance
@@ -18,5 +17,5 @@ config BR2_PACKAGE_PERF
 
 	  https://perf.wiki.kernel.org/
 
-comment "perf needs a toolchain w/ largefile and a Linux kernel to be built"
-	depends on !BR2_LINUX_KERNEL || !BR2_LARGEFILE
+comment "perf needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 133e8aa..cace1dc 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -73,10 +73,6 @@ ifeq ($(BR2_STATIC_LIBS),y)
 PERL_CONF_OPTS += --all-static --no-dynaloader
 endif
 
-ifneq ($(BR2_LARGEFILE),y)
-PERL_CONF_OPTS += -Uuselargefiles
-endif
-
 PERL_MODULES = $(call qstrip,$(BR2_PACKAGE_PERL_MODULES))
 ifneq ($(PERL_MODULES),)
 PERL_CONF_OPTS += --only-mod=$(subst $(space),$(comma),$(PERL_MODULES))
diff --git a/package/php-zmq/Config.in b/package/php-zmq/Config.in
index f32b5a3..37322a2 100644
--- a/package/php-zmq/Config.in
+++ b/package/php-zmq/Config.in
@@ -1,5 +1,5 @@
-comment "php-zmq needs a toolchain w/ C++, IPv6, largefile, wchar, threads"
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE \
+comment "php-zmq needs a toolchain w/ C++, IPv6, wchar, threads"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 \
 		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
 
 config BR2_PACKAGE_PHP_ZMQ
@@ -7,7 +7,6 @@ config BR2_PACKAGE_PHP_ZMQ
 	depends on BR2_PACKAGE_PHP
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_INET_IPV6
-	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_ZEROMQ
diff --git a/package/php/php.mk b/package/php/php.mk
index 2e21508..1c81acc 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -166,9 +166,6 @@ ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_SQLITE),y)
 	PHP_CONF_OPTS += --with-pdo-sqlite=$(STAGING_DIR)/usr
 	PHP_DEPENDENCIES += sqlite
 	PHP_CFLAGS += -DSQLITE_OMIT_LOAD_EXTENSION
-ifneq ($(BR2_LARGEFILE),y)
-	PHP_CFLAGS += -DSQLITE_DISABLE_LFS
-endif
 endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_MYSQL),y)
 	PHP_CONF_OPTS += --with-pdo-mysql=$(STAGING_DIR)/usr
diff --git a/package/pifmrds/Config.in b/package/pifmrds/Config.in
index 938b36d..6d49268 100644
--- a/package/pifmrds/Config.in
+++ b/package/pifmrds/Config.in
@@ -1,13 +1,8 @@
 config BR2_PACKAGE_PIFMRDS
 	bool "pifmrds"
 	depends on BR2_arm
-	depends on BR2_LARGEFILE # libsndfile
 	select BR2_PACKAGE_LIBSNDFILE
 	help
 	  pifmrds, FM-RDS transmitter using the Raspberry Pi's PWM
 
 	  https://github.com/ChristopheJacquet/PiFmRds
-
-comment "pifmrds needs a toolchain w/ largefile"
-	depends on BR2_arm
-	depends on !BR2_LARGEFILE
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 59ce844..575c381 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -28,7 +28,6 @@ ifeq ($(BR2_PACKAGE_PROFTPD_MOD_REWRITE),y)
 PROFTPD_CONF_OPTS += --with-modules=mod_rewrite
 endif
 
-ifeq ($(BR2_LARGEFILE),y)
 # configure script doesn't handle detection of %llu format string
 # support for printing the file size when cross compiling, breaking
 # access for large files.
@@ -38,7 +37,6 @@ define PROFTPD_USE_LLU
 	$(SED) 's/HAVE_LU/HAVE_LLU/' $(@D)/configure
 endef
 PROFTPD_PRE_CONFIGURE_HOOKS += PROFTPD_USE_LLU
-endif
 
 define PROFTPD_MAKENAMES
 	$(MAKE1) CC="$(HOSTCC)" CFLAGS="" LDFLAGS="" -C $(@D)/lib/libcap _makenames
diff --git a/package/pulseaudio/Config.in b/package/pulseaudio/Config.in
index 4bf64c2..b2be9ab 100644
--- a/package/pulseaudio/Config.in
+++ b/package/pulseaudio/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_PULSEAUDIO
 	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_LIBSNDFILE
 	select BR2_PACKAGE_SPEEX
-	depends on BR2_LARGEFILE
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_ARCH_HAS_ATOMICS
 	help
@@ -31,7 +30,7 @@ config BR2_PACKAGE_PULSEAUDIO_DAEMON
 
 endif
 
-comment "pulseaudio needs a toolchain w/ wchar, largefile, threads"
+comment "pulseaudio needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on BR2_ARCH_HAS_ATOMICS
-	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/python-libconfig/Config.in b/package/python-libconfig/Config.in
index 7a49d91..7cc5f8a 100644
--- a/package/python-libconfig/Config.in
+++ b/package/python-libconfig/Config.in
@@ -1,5 +1,5 @@
-comment "python-libconfig needs a toolchain w/ C++, largefile, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+comment "python-libconfig needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_PYTHON_LIBCONFIG
 	bool "python-libconfig"
@@ -7,7 +7,6 @@ config BR2_PACKAGE_PYTHON_LIBCONFIG
 	select BR2_PACKAGE_BOOST_PYTHON
 	select BR2_PACKAGE_LIBCONFIG
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Python bindings to the C++ library libconfig
diff --git a/package/python-pyzmq/Config.in b/package/python-pyzmq/Config.in
index 0f868d0..c521706 100644
--- a/package/python-pyzmq/Config.in
+++ b/package/python-pyzmq/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_PYZMQ
 	bool "python-pyzmq"
-	depends on BR2_LARGEFILE # zeromq
 	depends on BR2_INET_IPV6 # zeromq
 	depends on BR2_USE_WCHAR # zeromq
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
@@ -11,7 +10,7 @@ config BR2_PACKAGE_PYTHON_PYZMQ
 
 	  http://zeromq.org/bindings:python
 
-comment "python-pyzmq needs a toolchain w/ C++, IPv6, largefile, wchar, threads"
+comment "python-pyzmq needs a toolchain w/ C++, IPv6, wchar, threads"
 	depends on BR2_PACKAGE_PYTHON
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE \
-		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && \
+		BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 53c487d..8b5aa17 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -38,20 +38,6 @@ QT_CFLAGS = $(TARGET_CFLAGS)
 QT_CXXFLAGS = $(TARGET_CXXFLAGS)
 QT_LDFLAGS = $(TARGET_LDFLAGS)
 
-ifeq ($(BR2_LARGEFILE),y)
-QT_CONFIGURE_OPTS += -largefile
-else
-QT_CONFIGURE_OPTS += -no-largefile
-
-# embedded sqlite module forces FILE_OFFSET_BITS=64 unless this is defined
-# webkit internally uses this module as well
-ifneq ($(BR2_PACKAGE_QT_SQLITE_QT)$(BR2_PACKAGE_QT_WEBKIT),)
-QT_CFLAGS += -DSQLITE_DISABLE_LFS
-QT_CXXFLAGS += -DSQLITE_DISABLE_LFS
-endif
-
-endif
-
 # Qt has some assembly function that are not present in thumb1 mode:
 # Error: selected processor does not support Thumb mode `swp r3,r7,[r4]'
 # so, we desactivate thumb mode
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 4d344fe..032ebed 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -42,11 +42,7 @@ else
 QT5BASE_CONFIGURE_OPTS += -shared
 endif
 
-ifeq ($(BR2_LARGEFILE),y)
 QT5BASE_CONFIGURE_OPTS += -largefile
-else
-QT5BASE_CONFIGURE_OPTS += -no-largefile
-endif
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 QT5BASE_CONFIGURE_OPTS += -opensource -confirm-license
diff --git a/package/quota/Config.in b/package/quota/Config.in
index 46a6c05..c8ab0d7 100644
--- a/package/quota/Config.in
+++ b/package/quota/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_QUOTA
 	bool "quota"
-	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc
@@ -11,8 +10,7 @@ config BR2_PACKAGE_QUOTA
 
 	  http://sourceforge.net/projects/linuxquota/
 
-comment "quota needs a toolchain w/ largefile, wchar, threads"
+comment "quota needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || \
-		!BR2_USE_WCHAR || \
+	depends on !BR2_USE_WCHAR || \
 		!(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
diff --git a/package/redis/Config.in b/package/redis/Config.in
index d2a7556..695bd91 100644
--- a/package/redis/Config.in
+++ b/package/redis/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_REDIS
 	bool "redis"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_LARGEFILE
 	depends on BR2_INET_IPV6
 	help
 	  Redis is an open source, advanced key-value store. It is
@@ -11,7 +10,6 @@ config BR2_PACKAGE_REDIS
 
 	  http://www.redis.io
 
-comment "redis needs a toolchain w/ IPv6, largefile, threads"
+comment "redis needs a toolchain w/ IPv6, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_INET_IPV6
+	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/rpi-userland/Config.in b/package/rpi-userland/Config.in
index e629bb6..6adb9e3 100644
--- a/package/rpi-userland/Config.in
+++ b/package/rpi-userland/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_RPI_USERLAND
 	bool "rpi-userland"
 	depends on BR2_arm
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
@@ -40,6 +39,6 @@ config BR2_PACKAGE_RPI_USERLAND_START_VCFILED
 
 endif
 
-comment "rpi-userland needs a toolchain w/ C++, largefile, threads"
+comment "rpi-userland needs a toolchain w/ C++, threads"
 	depends on BR2_arm
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/sg3_utils/Config.in b/package/sg3_utils/Config.in
index a8099f5..f4db4b9 100644
--- a/package/sg3_utils/Config.in
+++ b/package/sg3_utils/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_SG3_UTILS
 	bool "sg3-utils"
-	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Low level utilities for devices that use a SCSI command set.
@@ -15,5 +14,5 @@ config BR2_PACKAGE_SG3_UTILS_PROGS
 
 endif
 
-comment "sg3-utils needs a toolchain w/ largefile, threads"
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+comment "sg3-utils needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/softether/Config.in b/package/softether/Config.in
index 15d5834..60f1357 100644
--- a/package/softether/Config.in
+++ b/package/softether/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_SOFTETHER
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_READLINE
-	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR
@@ -23,6 +22,6 @@ config BR2_PACKAGE_SOFTETHER
 
 	  http://www.softether.org
 
-comment "softether needs a toolchain w/ largefile, wchar, threads"
+comment "softether needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
-	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
+	depends on !(BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index 9b4446c..9693eb9 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -19,13 +19,6 @@ SQLCIPHER_CONF_OPTS = \
 SQLCIPHER_CFLAGS += -DSQLITE_HAS_CODEC # Required according to the README
 SQLCIPHER_CONF_ENV += LIBS="-lcrypto -lz"
 
-ifneq ($(BR2_LARGEFILE),y)
-# the sqlite configure script fails to define SQLITE_DISABLE_LFS when
-# --disable-largefile is passed, breaking the build. Work around it by
-# simply adding it to CFLAGS for configure instead
-SQLCIPHER_CFLAGS += -DSQLITE_DISABLE_LFS
-endif
-
 ifeq ($(BR2_PACKAGE_SQLCIPHER_STAT3),y)
 SQLCIPHER_CFLAGS += -DSQLITE_ENABLE_STAT3
 endif
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 23dfd75..badd378 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -10,13 +10,6 @@ SQLITE_SITE = http://www.sqlite.org/2015
 SQLITE_LICENSE = Public domain
 SQLITE_INSTALL_STAGING = YES
 
-ifneq ($(BR2_LARGEFILE),y)
-# the sqlite configure script fails to define SQLITE_DISABLE_LFS when
-# --disable-largefile is passed, breaking the build. Work around it by
-# simply adding it to CFLAGS for configure instead
-SQLITE_CFLAGS += -DSQLITE_DISABLE_LFS
-endif
-
 ifeq ($(BR2_PACKAGE_SQLITE_STAT3),y)
 SQLITE_CFLAGS += -DSQLITE_ENABLE_STAT3
 endif
diff --git a/package/squashfs/Config.in b/package/squashfs/Config.in
index 6dd65e3..70c0fc9 100644
--- a/package/squashfs/Config.in
+++ b/package/squashfs/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_SQUASHFS
 	bool "squashfs"
-	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_SQUASHFS_GZIP if !(BR2_PACKAGE_SQUASHFS_LZMA || BR2_PACKAGE_SQUASHFS_LZO)
@@ -44,6 +43,6 @@ config BR2_PACKAGE_SQUASHFS_XZ
 
 endif
 
-comment "squashfs needs a toolchain w/ largefile, threads"
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+comment "squashfs needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
diff --git a/package/sshfs/Config.in b/package/sshfs/Config.in
index 43701a7..7c821a5 100644
--- a/package/sshfs/Config.in
+++ b/package/sshfs/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_SSHFS
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_OPENSSH
-	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse, glib2
 	depends on BR2_USE_MMU # libfuse, glib2
@@ -15,6 +14,6 @@ config BR2_PACKAGE_SSHFS
 
 	  http://fuse.sourceforge.net/sshfs.html
 
-comment "sshfs needs a toolchain w/ largefile, wchar, threads, dynamic library"
+comment "sshfs needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/strace/Config.in b/package/strace/Config.in
index ad8d308..bdd7638 100644
--- a/package/strace/Config.in
+++ b/package/strace/Config.in
@@ -1,13 +1,9 @@
 config BR2_PACKAGE_STRACE
 	bool "strace"
 	depends on !BR2_nios2
-	depends on BR2_LARGEFILE
 	help
 	  A useful diagnostic, instructional, and debugging tool.
 	  Allows you to track what system calls a program makes
 	  while it is running.
 
 	  http://sourceforge.net/projects/strace/
-
-comment "strace needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
diff --git a/package/sysklogd/Config.in b/package/sysklogd/Config.in
index 4a0ac13..64464c4 100644
--- a/package/sysklogd/Config.in
+++ b/package/sysklogd/Config.in
@@ -1,12 +1,7 @@
 config BR2_PACKAGE_SYSKLOGD
 	bool "syslogd & klogd"
-	depends on BR2_LARGEFILE
 	depends on BR2_USE_MMU # fork()
 	help
 	  System log daemons syslogd and klogd.
 
 	  http://www.infodrom.org/projects/sysklogd/
-
-comment "syslogd needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
-	depends on BR2_USE_MMU
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index ed59c8d..d00ac9d 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -10,7 +10,6 @@ config BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 config BR2_PACKAGE_SYSTEMD
 	bool "systemd"
 	depends on BR2_INIT_SYSTEMD
-	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_INET_IPV6
 	depends on !BR2_STATIC_LIBS # kmod
diff --git a/package/thrift/Config.in b/package/thrift/Config.in
index 7c7272a..c5c7c16 100644
--- a/package/thrift/Config.in
+++ b/package/thrift/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_THRIFT
 	bool "thrift"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
-	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_ARCH_HAS_ATOMICS
 	select BR2_PACKAGE_BOOST
@@ -19,7 +18,7 @@ config BR2_PACKAGE_THRIFT
 
 	  http://thrift.apache.org/
 
-comment "thrift needs a toolchain w/ C++, largefile, wchar, threads"
+comment "thrift needs a toolchain w/ C++, wchar, threads"
 	depends on BR2_ARCH_HAS_ATOMICS
-	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || \
+	depends on !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/trace-cmd/Config.in b/package/trace-cmd/Config.in
index f64d28d..fcec102 100644
--- a/package/trace-cmd/Config.in
+++ b/package/trace-cmd/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_TRACE_CMD
 	bool "trace-cmd"
-	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # dlopen()
@@ -14,7 +13,6 @@ config BR2_PACKAGE_TRACE_CMD
 
 	  http://git.kernel.org/cgit/linux/kernel/git/rostedt/trace-cmd.git
 
-comment "trace-cmd needs a toolchain w/ largefile, threads, dynamic library"
+comment "trace-cmd needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/tstools/Config.in b/package/tstools/Config.in
index c6c2696..706cb54 100644
--- a/package/tstools/Config.in
+++ b/package/tstools/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_TSTOOLS
 	bool "tstools"
-	depends on BR2_LARGEFILE
 	depends on BR2_USE_MMU # fork()
 	help
 	  This is a set of cross-platform command line tools for
@@ -16,7 +15,3 @@ config BR2_PACKAGE_TSTOOLS
 	  used to store data on DVDs.
 
 	  https://code.google.com/p/tstools/
-
-comment "tstools needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
-	depends on BR2_USE_MMU
diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index 33dd484..27138ec 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -1,9 +1,9 @@
-comment "tvheadend needs a toolchain w/ largefile, IPv6, NPTL, headers >= 3.2"
-	depends on !BR2_LARGEFILE || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+comment "tvheadend needs a toolchain w/ IPv6, NPTL, headers >= 3.2"
+	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 
 config BR2_PACKAGE_TVHEADEND
 	bool "tvheadend"
-	depends on BR2_LARGEFILE && BR2_INET_IPV6
+	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 	select BR2_PACKAGE_DTV_SCAN_TABLES
diff --git a/package/twolame/Config.in b/package/twolame/Config.in
index 93cfe0b..3d8f23d 100644
--- a/package/twolame/Config.in
+++ b/package/twolame/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_TWOLAME
 	bool "twolame"
-	depends on BR2_LARGEFILE # libsndfile
 	select BR2_PACKAGE_LIBSNDFILE
 	help
 	  TwoLAME is an optimised MPEG Audio Layer 2 (MP2) encoder based on
@@ -8,6 +7,3 @@ config BR2_PACKAGE_TWOLAME
 	  code and portions of LAME.
 
 	  http://www.twolame.org/
-
-comment "twolame needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
diff --git a/package/udpcast/Config.in b/package/udpcast/Config.in
index e9425da..2f98610 100644
--- a/package/udpcast/Config.in
+++ b/package/udpcast/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_UDPCAST
 	bool "udpcast"
-	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	help
@@ -9,9 +8,9 @@ config BR2_PACKAGE_UDPCAST
 
 	  http://www.udpcast.linux.lu/
 
-comment "udpcast needs a toolchain w/ largefile, threads"
+comment "udpcast needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 if BR2_PACKAGE_UDPCAST
 
diff --git a/package/ulogd/Config.in b/package/ulogd/Config.in
index 826a382..7092409 100644
--- a/package/ulogd/Config.in
+++ b/package/ulogd/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_ULOGD
 	bool "ulogd"
 	depends on BR2_INET_IPV6
-	depends on BR2_LARGEFILE
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
 	# ulog support removed for kernels >= 3.17
@@ -16,7 +15,7 @@ config BR2_PACKAGE_ULOGD
 
 	  http://www.netfilter.org/projects/ulogd/
 
-comment "ulogd needs a toolchain w/ IPv6, largefile, dynamic library"
-	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || BR2_STATIC_LIBS
+comment "ulogd needs a toolchain w/ IPv6, dynamic library"
+	depends on !BR2_INET_IPV6 || BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
diff --git a/package/unionfs/Config.in b/package/unionfs/Config.in
index ff871d3..b623960 100644
--- a/package/unionfs/Config.in
+++ b/package/unionfs/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_UNIONFS
 	bool "unionfs (FUSE)"
 	select BR2_PACKAGE_LIBFUSE
-	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
 	depends on BR2_USE_MMU # libfuse
 	depends on !BR2_STATIC_LIBS # libfuse
@@ -10,6 +9,6 @@ config BR2_PACKAGE_UNIONFS
 
 	  http://podgorny.cz/moin/UnionFsFuse
 
-comment "unionfs needs a toolchain w/ largefile, threads, dynamic library"
+comment "unionfs needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/upmpdcli/Config.in b/package/upmpdcli/Config.in
index 8ccf861..6464d06 100644
--- a/package/upmpdcli/Config.in
+++ b/package/upmpdcli/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_UPMPDCLI
 	select BR2_PACKAGE_LIBMPDCLIENT
 	select BR2_PACKAGE_LIBUPNPP
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_LARGEFILE # libupnpp -> libupnp
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnpp -> libupnp
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 # Too old gcc
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 # Ditto
@@ -18,11 +17,10 @@ config BR2_PACKAGE_UPMPDCLI
 
 	  http://www.lesbonscomptes.com/upmpdcli/
 
-comment "upmpdcli needs a toolchain w/ C++, largefile, threads"
+comment "upmpdcli needs a toolchain w/ C++, threads"
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 # Too old gcc
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 # Ditto
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 # Ditto
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/ushare/Config.in b/package/ushare/Config.in
index 81140ce..eba7acf 100644
--- a/package/ushare/Config.in
+++ b/package/ushare/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_USHARE
 	bool "ushare"
-	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnp
 	select BR2_PACKAGE_LIBUPNP
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
@@ -15,6 +14,5 @@ config BR2_PACKAGE_USHARE
 
 	  http://ushare.geexbox.org/
 
-comment "ushare needs a toolchain w/ largefile, threads, dynamic library"
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
+comment "ushare needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/ustr/Config.in b/package/ustr/Config.in
index abaefce..a86b26d 100644
--- a/package/ustr/Config.in
+++ b/package/ustr/Config.in
@@ -1,10 +1,6 @@
 config BR2_PACKAGE_USTR
 	bool "ustr"
-	depends on BR2_LARGEFILE
 	help
 	  A small, safe string library.
 
 	  http://www.and.org/ustr/
-
-comment "ustr requires a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 0c818b9..8ed56b0 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_UTIL_LINUX
 	bool "util-linux"
-	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
@@ -280,5 +279,5 @@ endif
 
 endif
 
-comment "util-linux needs a toolchain w/ largefile, wchar"
-	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
+comment "util-linux needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/vlc/Config.in b/package/vlc/Config.in
index cdb0d16..323582b 100644
--- a/package/vlc/Config.in
+++ b/package/vlc/Config.in
@@ -7,7 +7,6 @@ config BR2_PACKAGE_VLC
 	bool "vlc"
 	depends on (BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_USES_GLIBC) # spawn.h
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBVORBIS if BR2_PACKAGE_OPUS
@@ -18,5 +17,5 @@ config BR2_PACKAGE_VLC
 
 	  http://www.videolan.org/vlc/
 
-comment "vlc needs a uclibc snapshot or (e)glibc toolchain w/ C++, largefile, wchar, threads"
-	depends on !(BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_USES_GLIBC) || !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+comment "vlc needs a uclibc snapshot or (e)glibc toolchain w/ C++, wchar, threads"
+	depends on !(BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_USES_GLIBC) || !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/wvdial/Config.in b/package/wvdial/Config.in
index ef4cd75..e57f975 100644
--- a/package/wvdial/Config.in
+++ b/package/wvdial/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_WVDIAL
 	bool "wvdial"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_LARGEFILE
 	depends on BR2_USE_MMU # wvstreams
 	select BR2_PACKAGE_WVSTREAMS
 	help
@@ -9,6 +8,6 @@ config BR2_PACKAGE_WVDIAL
 
 	  http://wvdial.googlecode.com/
 
-comment "wvdial needs a toolchain w/ C++, largefile"
+comment "wvdial needs a toolchain w/ C++"
 	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/wvstreams/Config.in b/package/wvstreams/Config.in
index c29937e..3080dc7 100644
--- a/package/wvstreams/Config.in
+++ b/package/wvstreams/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_WVSTREAMS
 	bool "wvstreams"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_LARGEFILE
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
@@ -10,6 +9,6 @@ config BR2_PACKAGE_WVSTREAMS
 
 	  http://wvstreams.googlecode.com/
 
-comment "wvstreams needs a toolchain w/ C++, largefile"
+comment "wvstreams needs a toolchain w/ C++"
 	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index db8a54d..1123f3b 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -64,15 +64,15 @@ choice
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
 	bool "Modular X.org"
-	depends on BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  This variant of the X.org server is the full-blown variant,
 	  as used by desktop GNU/Linux distributions. The drivers (for
 	  input and graphics) are built separately from the X.org
 	  server (see the xdriver* packages).
 
-comment "Modular X.org needs a toolchain w/ largefile, C++"
-	depends on !(BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP)
+comment "Modular X.org needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE
 	bool "KDrive / TinyX"
diff --git a/package/x264/Config.in b/package/x264/Config.in
index 5e614b5..be3ab3f 100644
--- a/package/x264/Config.in
+++ b/package/x264/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_X264
 	bool "x264"
-	depends on BR2_LARGEFILE
 	help
 	  x264 is a free software library and application for
 	  encoding video streams into the H.264/MPEG-4 AVC
@@ -18,6 +17,3 @@ config BR2_PACKAGE_X264_CLI
 	  H.264/MPEG-4 AVC compression format.
 
 endif
-
-comment "x264 needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
diff --git a/package/xfsprogs/Config.in b/package/xfsprogs/Config.in
index 6f02c97..0998637 100644
--- a/package/xfsprogs/Config.in
+++ b/package/xfsprogs/Config.in
@@ -2,14 +2,13 @@
 comment "Note that xfsprogs needs a toolchain with UCLIBC_SV4_DEPRECATED and UCLIBC_HAS_OBSOLETE_BSD_SIGNAL enabled"
 	depends on BR2_PACKAGE_XFSPROGS
 
-comment "xfsprogs needs a toolchain w/ largefile, wchar"
+comment "xfsprogs needs a toolchain w/ wchar"
 	depends on BR2_USE_MMU
-	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
+	depends on !BR2_USE_WCHAR
 
 config BR2_PACKAGE_XFSPROGS
 	bool "xfsprogs"
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # util-linux
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
diff --git a/package/xorriso/Config.in b/package/xorriso/Config.in
index 14d81fa..2ac2d83 100644
--- a/package/xorriso/Config.in
+++ b/package/xorriso/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_XORRISO
 	bool "xorriso"
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	depends on BR2_USE_WCHAR
-	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	help
@@ -19,6 +18,6 @@ config BR2_PACKAGE_XORRISO
 	  http://libburnia-project.org/
 	  http://www.gnu.org/software/xorriso
 
-comment "xorriso needs a toolchain w/ wchar, largefile, threads"
+comment "xorriso needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/xtables-addons/Config.in b/package/xtables-addons/Config.in
index 36dbd48..a687618 100644
--- a/package/xtables-addons/Config.in
+++ b/package/xtables-addons/Config.in
@@ -1,14 +1,12 @@
 comment "xtables-addons needs a Linux kernel to be built"
 	depends on !BR2_LINUX_KERNEL
 
-comment "xtables-addons needs a toolchain w/ dynamic library, largefile, threads"
-	depends on BR2_STATIC_LIBS || !BR2_LARGEFILE || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+comment "xtables-addons needs a toolchain w/ dynamic library, threads"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_XTABLES_ADDONS
 	bool "xtables-addons"
 	depends on BR2_LINUX_KERNEL
-	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS # extensions are .so
 	select BR2_PACKAGE_IPTABLES
diff --git a/package/yaml-cpp/Config.in b/package/yaml-cpp/Config.in
index d6afdac..954a944 100644
--- a/package/yaml-cpp/Config.in
+++ b/package/yaml-cpp/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_YAML_CPP
 	bool "yaml-cpp"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_LARGEFILE # boost
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
 	select BR2_PACKAGE_BOOST
 	help
@@ -10,5 +9,5 @@ config BR2_PACKAGE_YAML_CPP
 
 	  https://code.google.com/p/yaml-cpp/
 
-comment "yaml-cpp needs a toolchain w/ C++, largefile, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+comment "yaml-cpp needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/ympd/Config.in b/package/ympd/Config.in
index 38a0cf9..ba0e5e8 100644
--- a/package/ympd/Config.in
+++ b/package/ympd/Config.in
@@ -3,10 +3,9 @@ config BR2_PACKAGE_YMPD
 	select BR2_PACKAGE_LIBMPDCLIENT
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_LARGEFILE
 	help
 	  ympd, a standalone MPD Web GUI written in C, utilizing
 	  Websockets and Bootstrap/JS
 
-comment "ympd needs a toolchain w/ threads, largefile"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE
+comment "ympd needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
index 1a69f7d..d44af60 100644
--- a/package/zeromq/Config.in
+++ b/package/zeromq/Config.in
@@ -1,12 +1,11 @@
-comment "zeromq needs a toolchain w/ C++, IPv6, largefile, wchar, threads"
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE \
-		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
+comment "zeromq needs a toolchain w/ C++, IPv6, wchar, threads"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && \
+		BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
 
 config BR2_PACKAGE_ZEROMQ
 	bool "zeromq"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_INET_IPV6
-	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_UTIL_LINUX
diff --git a/package/zlog/Config.in b/package/zlog/Config.in
index f9c7839..cf86a26 100644
--- a/package/zlog/Config.in
+++ b/package/zlog/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_ZLOG
 	bool "zlog"
-	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	help
@@ -9,5 +8,5 @@ config BR2_PACKAGE_ZLOG
 
 	  https://github.com/HardySimpson/zlog
 
-comment "zlog needs a toolchain w/ threads, largefile, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || BR2_STATIC_LIBS
+comment "zlog needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/zmqpp/Config.in b/package/zmqpp/Config.in
index 881877a..d92a37a 100644
--- a/package/zmqpp/Config.in
+++ b/package/zmqpp/Config.in
@@ -7,7 +7,6 @@ config BR2_PACKAGE_ZMQPP
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009 # c++0x support
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_INET_IPV6 # zeromq
-	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 	select BR2_PACKAGE_ZEROMQ
@@ -19,9 +18,9 @@ config BR2_PACKAGE_ZMQPP
 
 	  http://github.com/benjamg/zmqpp
 
-comment "zmqpp needs a toolchain w/ C++, IPv6, largefile, wchar, threads"
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE \
-		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
+comment "zmqpp needs a toolchain w/ C++, IPv6, wchar, threads"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && \
+		BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
 
 if BR2_PACKAGE_ZMQPP
 
diff --git a/package/zyre/Config.in b/package/zyre/Config.in
index 86fff35..14075f0 100644
--- a/package/zyre/Config.in
+++ b/package/zyre/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_ZYRE
 	bool "zyre"
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
 	depends on BR2_INET_IPV6 # zeromq
-	depends on BR2_LARGEFILE # zeromq
 	depends on BR2_USE_WCHAR # zeromq
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 	depends on BR2_USE_MMU # czmq
@@ -17,8 +16,8 @@ config BR2_PACKAGE_ZYRE
 
 	  http://zyre.org
 
-comment "zyre needs a toolchain w/ C++, IPv6, largefile, wchar, threads"
+comment "zyre needs a toolchain w/ C++, IPv6, wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE \
-		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && \
+		BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
-- 
2.0.5
