From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  3 Dec 2014 22:41:29 +0100
Subject: [Buildroot] [PATCH 2/8] Rename BR2_PREFER_STATIC_LIB to
	BR2_STATIC_LIBS
In-Reply-To: <1417642895-29606-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417642895-29606-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417642895-29606-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since a while, the semantic of BR2_PREFER_STATIC_LIB has been changed
from "prefer static libraries when possible" to "use only static
libraries". The former semantic didn't make much sense, since the user
had absolutely no control/idea of which package would use static
libraries, and which packages would not. Therefore, for quite some
time, we have been starting to enforce that BR2_PREFER_STATIC_LIB
should really build everything with static libraries.

As a consequence, this patch renames BR2_PREFER_STATIC_LIB to
BR2_STATIC_LIBS, and adjust the Config.in option accordingly.

This also helps preparing the addition of other options to select
shared, shared+static or just static.

Note that we have verified that this commit can be reproduced by
simply doing a global rename of BR2_PREFER_STATIC_LIB to
BR2_STATIC_LIBS plus adding BR2_PREFER_STATIC_LIB to Config.in.legacy.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in                                          |  2 +-
 Config.in.legacy                                   | 12 ++++
 arch/Config.in                                     |  2 +-
 docs/manual/adding-packages-cmake.txt              |  2 +-
 docs/manual/adding-packages-directory.txt          |  2 +-
 package/Config.in                                  |  6 +-
 package/Makefile.in                                |  2 +-
 package/agentpp/Config.in                          |  4 +-
 package/aiccu/aiccu.mk                             |  2 +-
 package/aircrack-ng/Config.in                      |  2 +-
 package/aircrack-ng/aircrack-ng.mk                 |  8 +--
 package/alsa-lib/alsa-lib.mk                       |  2 +-
 package/am335x-pru-package/am335x-pru-package.mk   |  6 +-
 package/apr-util/Config.in                         |  4 +-
 package/apr/Config.in                              |  4 +-
 package/avahi/Config.in                            |  2 +-
 package/avrdude/Config.in                          |  4 +-
 package/bash/bash.mk                               |  2 +-
 package/bellagio/Config.in                         |  4 +-
 package/bind/Config.in                             |  4 +-
 package/bluez5_utils/Config.in                     |  4 +-
 package/bluez_utils/Config.in                      |  4 +-
 package/bmon/bmon.mk                               |  2 +-
 package/boost/boost.mk                             |  4 +-
 package/botan/botan.mk                             |  2 +-
 package/btrfs-progs/btrfs-progs.mk                 |  2 +-
 package/bustle/bustle.mk                           |  2 +-
 package/busybox/busybox.mk                         |  2 +-
 package/bzip2/bzip2.mk                             |  6 +-
 package/canfestival/Config.in                      |  4 +-
 package/ccid/Config.in                             |  4 +-
 package/cegui06/Config.in                          |  4 +-
 package/cifs-utils/cifs-utils.mk                   |  2 +-
 package/cjson/Config.in                            |  2 +-
 package/collectd/Config.in                         |  8 +--
 package/connman/Config.in                          |  4 +-
 package/cppcms/Config.in                           |  4 +-
 package/cppdb/Config.in                            |  4 +-
 package/cppunit/Config.in                          |  4 +-
 package/crda/Config.in                             |  4 +-
 package/crda/crda.mk                               |  2 +-
 package/cryptsetup/Config.in                       |  4 +-
 package/curlftpfs/Config.in                        |  4 +-
 package/cwiid/Config.in                            |  2 +-
 package/czmq/czmq.mk                               |  2 +-
 package/dbus/dbus.mk                               |  2 +-
 package/dhcpcd/dhcpcd.mk                           |  2 +-
 package/dhcpdump/dhcpdump.mk                       |  2 +-
 package/directfb/Config.in                         |  8 +--
 package/directfb/directfb.mk                       |  2 +-
 package/dmraid/Config.in                           |  4 +-
 package/dnsmasq/dnsmasq.mk                         |  4 +-
 package/dropbear/dropbear.mk                       |  2 +-
 package/dtc/Config.in                              |  4 +-
 package/dvb-apps/dvb-apps.mk                       |  2 +-
 package/e2fsprogs/e2fsprogs.mk                     |  2 +-
 package/ebtables/ebtables.mk                       |  4 +-
 package/efl/libedbus/Config.in                     |  4 +-
 package/elfutils/Config.in                         |  4 +-
 package/erlang/Config.in                           |  4 +-
 package/eudev/Config.in                            |  4 +-
 package/exfat/Config.in                            |  4 +-
 package/exim/exim.mk                               |  2 +-
 package/exiv2/Config.in                            |  4 +-
 package/faifa/Config.in                            |  4 +-
 package/fbv/fbv.mk                                 |  2 +-
 package/ffmpeg/ffmpeg.mk                           |  2 +-
 package/flann/Config.in                            |  4 +-
 package/fswebcam/Config.in                         |  4 +-
 package/gawk/Config.in                             |  4 +-
 package/gcc/gcc-final/gcc-final.mk                 |  4 +-
 package/giblib/Config.in                           |  4 +-
 package/gpm/Config.in                              |  4 +-
 package/gptfdisk/gptfdisk.mk                       |  2 +-
 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk         |  2 +-
 package/gstreamer1/gst1-plugins-bad/Config.in      |  2 +-
 package/gstreamer1/gst1-plugins-ugly/Config.in     |  4 +-
 package/haserl/haserl.mk                           |  2 +-
 package/heirloom-mailx/Config.in                   |  4 +-
 package/hostapd/Config.in                          |  4 +-
 package/hostapd/hostapd.mk                         |  4 +-
 package/iftop/iftop.mk                             |  2 +-
 package/imlib2/Config.in                           |  4 +-
 package/inadyn/Config.in                           |  4 +-
 package/ipsec-tools/ipsec-tools.mk                 |  2 +-
 package/iptables/iptables.mk                       |  2 +-
 package/iw/iw.mk                                   |  2 +-
 package/jimtcl/jimtcl.mk                           |  2 +-
 package/kexec-lite/Config.in                       |  4 +-
 package/keyutils/keyutils.mk                       |  2 +-
 package/kmod/Config.in                             |  2 +-
 package/knock/knock.mk                             |  2 +-
 package/lftp/lftp.mk                               |  2 +-
 package/libarchive/libarchive.mk                   |  4 +-
 package/libbluray/Config.in                        |  4 +-
 package/libcap/libcap.mk                           |  2 +-
 package/libcec/Config.in                           |  4 +-
 package/libcgi/libcgi.mk                           |  2 +-
 package/libdvdnav/Config.in                        |  4 +-
 package/libdvdread/Config.in                       |  4 +-
 package/libebml/libebml.mk                         |  2 +-
 package/libesmtp/Config.in                         |  4 +-
 package/libfreefare/libfreefare.mk                 |  2 +-
 package/libfuse/Config.in                          |  4 +-
 package/libjson/libjson.mk                         |  4 +-
 package/libmatroska/libmatroska.mk                 |  2 +-
 package/libnl/Config.in                            |  4 +-
 package/libnspr/libnspr.mk                         |  2 +-
 package/libphidget/Config.in                       |  4 +-
 package/libpthread-stubs/libpthread-stubs.mk       |  2 +-
 package/libsepol/libsepol.mk                       |  2 +-
 package/libshairplay/Config.in                     |  4 +-
 package/libubox/Config.in                          |  4 +-
 package/libuci/Config.in                           |  4 +-
 package/libva-intel-driver/Config.in               |  4 +-
 package/libva/Config.in                            |  4 +-
 package/linux-pam/Config.in                        |  4 +-
 package/live555/live555.mk                         |  2 +-
 package/lm-sensors/lm-sensors.mk                   |  2 +-
 package/lockdev/lockdev.mk                         |  6 +-
 package/log4cxx/Config.in                          |  4 +-
 package/ltrace/Config.in                           |  4 +-
 package/lua/lua.mk                                 |  2 +-
 package/luajit/luajit.mk                           |  2 +-
 package/lvm2/Config.in                             |  4 +-
 package/lz4/lz4.mk                                 |  2 +-
 package/mesa3d/Config.in                           |  6 +-
 package/mesa3d/mesa3d.mk                           |  2 +-
 package/minidlna/minidlna.mk                       |  2 +-
 package/mpd/Config.in                              |  4 +-
 package/msmtp/msmtp.mk                             |  2 +-
 package/ncurses/ncurses.mk                         |  6 +-
 package/ne10/ne10.mk                               |  4 +-
 package/netsnmp/netsnmp.mk                         |  2 +-
 package/nftables/nftables.mk                       |  4 +-
 package/ngrep/ngrep.mk                             |  2 +-
 package/omniorb/omniorb.mk                         |  2 +-
 package/openobex/Config.in                         |  4 +-
 package/openssl/openssl.mk                         | 10 ++--
 package/openvmtools/Config.in                      |  4 +-
 package/openvpn/openvpn.mk                         |  2 +-
 package/p11-kit/Config.in                          |  4 +-
 package/parted/parted.mk                           |  2 +-
 package/pciutils/pciutils.mk                       |  2 +-
 package/pcsc-lite/Config.in                        |  4 +-
 package/perl-gd/Config.in                          |  4 +-
 package/perl-gdgraph/Config.in                     |  4 +-
 package/perl-io-socket-ssl/Config.in               |  4 +-
 package/perl-net-ssleay/Config.in                  |  4 +-
 package/perl-xml-libxml/Config.in                  |  4 +-
 package/perl/perl.mk                               |  2 +-
 package/phidgetwebservice/Config.in                |  4 +-
 package/php/php.mk                                 |  2 +-
 package/pkg-cmake.mk                               |  2 +-
 package/pkgconf/pkgconf.mk                         |  2 +-
 package/pppd/Config.in                             |  4 +-
 package/proxychains-ng/Config.in                   |  4 +-
 package/ptpd2/ptpd2.mk                             |  2 +-
 package/pure-ftpd/pure-ftpd.mk                     |  2 +-
 package/qdecoder/Config.in                         |  2 +-
 package/qhull/Config.in                            |  4 +-
 package/qlibc/Config.in                            |  4 +-
 package/qt/Config.in                               |  2 +-
 package/qt5/qt5base/Config.in                      |  4 +-
 package/qt5/qt5base/qt5base.mk                     |  4 +-
 package/qt5/qt5connectivity/Config.in              |  4 +-
 package/qt5/qt5declarative/qt5declarative.mk       |  2 +-
 package/qt5/qt5enginio/qt5enginio.mk               |  2 +-
 package/qt5/qt5imageformats/qt5imageformats.mk     |  2 +-
 package/qt5/qt5multimedia/qt5multimedia.mk         |  2 +-
 package/qt5/qt5quick1/Config.in                    |  4 +-
 package/qt5/qt5script/qt5script.mk                 |  2 +-
 package/qt5/qt5sensors/qt5sensors.mk               |  2 +-
 package/qt5/qt5serialport/qt5serialport.mk         |  2 +-
 package/qt5/qt5svg/qt5svg.mk                       |  2 +-
 package/qt5/qt5webkit/Config.in                    |  2 +-
 package/qt5/qt5websockets/qt5websockets.mk         |  2 +-
 package/qt5/qt5x11extras/qt5x11extras.mk           |  2 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk       |  2 +-
 package/rsh-redone/Config.in                       |  8 +--
 package/rtmpdump/rtmpdump.mk                       |  2 +-
 package/ruby/Config.in                             |  4 +-
 package/sconeserver/Config.in                      |  4 +-
 package/smack/Config.in                            |  4 +-
 package/snmppp/Config.in                           |  4 +-
 package/snowball-hdmiservice/Config.in             |  4 +-
 package/snowball-init/Config.in                    |  4 +-
 package/spice/Config.in                            |  4 +-
 package/sqlite/sqlite.mk                           |  2 +-
 package/sshfs/Config.in                            |  4 +-
 package/stress/stress.mk                           |  4 +-
 package/strongswan/Config.in                       |  2 +-
 package/subversion/Config.in                       |  2 +-
 package/systemd/Config.in                          |  2 +-
 package/tcpdump/tcpdump.mk                         |  2 +-
 package/thrift/thrift.mk                           |  2 +-
 package/tinyalsa/Config.in                         |  4 +-
 package/trace-cmd/Config.in                        |  4 +-
 package/tslib/Config.in                            |  4 +-
 package/uclibc/uclibc.mk                           |  4 +-
 package/udisks/Config.in                           |  4 +-
 package/ulogd/Config.in                            |  4 +-
 package/unionfs/Config.in                          |  4 +-
 package/ushare/Config.in                           |  4 +-
 package/ussp-push/Config.in                        |  4 +-
 package/util-linux/Config.in                       |  8 +--
 package/vde2/Config.in                             |  4 +-
 package/vlc/vlc.mk                                 |  2 +-
 package/wayland/Config.in                          |  4 +-
 package/weston/Config.in                           |  4 +-
 package/wireless_tools/Config.in                   |  2 +-
 package/wpa_supplicant/wpa_supplicant.mk           |  4 +-
 package/wvstreams/wvstreams.mk                     |  2 +-
 package/x11r7/Config.in                            |  4 +-
 package/x11r7/xdriver_xf86-input-tslib/Config.in   |  4 +-
 package/x264/x264.mk                               |  2 +-
 package/xbmc/Config.in                             | 14 ++---
 package/xl2tp/xl2tp.mk                             |  2 +-
 package/xmlstarlet/xmlstarlet.mk                   |  2 +-
 package/zeromq/zeromq.mk                           |  2 +-
 package/zlib/zlib.mk                               |  2 +-
 package/zlog/Config.in                             |  4 +-
 support/scripts/scancpan                           |  4 +-
 system/Config.in                                   |  6 +-
 toolchain/toolchain-buildroot/Config.in            |  6 +-
 toolchain/toolchain-external/Config.in             | 68 +++++++++++-----------
 toolchain/toolchain-external/toolchain-external.mk |  2 +-
 227 files changed, 421 insertions(+), 409 deletions(-)

diff --git a/Config.in b/Config.in
index 1aa1080..fefa54e 100644
--- a/Config.in
+++ b/Config.in
@@ -525,7 +525,7 @@ config BR2_ENABLE_SSP
 comment "enabling Stack Smashing Protection requires support in the toolchain"
 	depends on !BR2_TOOLCHAIN_HAS_SSP
 
-config BR2_PREFER_STATIC_LIB
+config BR2_STATIC_LIBS
 	bool "build statically linked applications, no dynamic libraries"
 	help
 	  Build all applications for the target statically linked.
diff --git a/Config.in.legacy b/Config.in.legacy
index b126556..09c025c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -99,6 +99,18 @@ comment "----------------------------------------------------"
 endif
 
 ###############################################################################
+
+comment "Legacy options removed in 2015.02"
+
+config BR2_PREFER_STATIC_LIB
+	bool "static library option renamed"
+	select BR2_STATIC_LIBS
+	help
+	  The BR2_PREFER_STATIC_LIB was renamed to BR2_STATIC_LIBS. It
+	  highlights the fact that the option no longer "prefers"
+	  static libraries, but "enforces" static libraries (i.e
+	  shared libraries are completely unused).
+
 comment "Legacy options removed in 2014.11"
 
 config BR2_x86_generic
diff --git a/arch/Config.in b/arch/Config.in
index d62d887..2779ab6 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -277,7 +277,7 @@ config BR2_BINFMT_FDPIC
 config BR2_BINFMT_FLAT
 	bool "FLAT"
 	depends on BR2_bfin || BR2_m68k
-	select BR2_PREFER_STATIC_LIB
+	select BR2_STATIC_LIBS
 	help
 	  FLAT binary is a relatively simple and lightweight executable format
 	  based on the original a.out format. It is widely used in environment
diff --git a/docs/manual/adding-packages-cmake.txt b/docs/manual/adding-packages-cmake.txt
index 097cf63..d92b209 100644
--- a/docs/manual/adding-packages-cmake.txt
+++ b/docs/manual/adding-packages-cmake.txt
@@ -102,7 +102,7 @@ typical packages will therefore only use a few of them.
 
 ** +CMAKE_BUILD_TYPE+ is driven by +BR2_ENABLE_DEBUG+;
 ** +CMAKE_INSTALL_PREFIX+;
-** +BUILD_SHARED_LIBS+ is driven by +BR2_PREFER_STATIC_LIB+;
+** +BUILD_SHARED_LIBS+ is driven by +BR2_STATIC_LIBS+;
 ** +BUILD_DOC+, +BUILD_DOCS+ are disabled;
 ** +BUILD_EXAMPLE+, +BUILD_EXAMPLES+ are disabled;
 ** +BUILD_TEST+, +BUILD_TESTS+, +BUILD_TESTING+ are disabled.
diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 0ea03f9..de03271 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -271,7 +271,7 @@ use in the comment.
 ** Comment string: +wchar+
 
 * dynamic library
-** Dependency symbol: +!BR2_PREFER_STATIC_LIB+
+** Dependency symbol: +!BR2_STATIC_LIBS+
 ** Comment string: +dynamic library+
 
 ==== Dependencies on a Linux kernel built by buildroot
diff --git a/package/Config.in b/package/Config.in
index b8fc7d1..2b3bf61 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -399,7 +399,7 @@ menu "Interpreter languages and scripting"
 	source "package/lua/Config.in"
 	source "package/luainterpreter/Config.in"
 	source "package/luajit/Config.in"
-if BR2_PACKAGE_HAS_LUAINTERPRETER && !BR2_PREFER_STATIC_LIB
+if BR2_PACKAGE_HAS_LUAINTERPRETER && !BR2_STATIC_LIBS
 # lua modules are dynamically loaded, so not available on static builds
 menu "Lua libraries/modules"
 	source "package/cgilua/Config.in"
@@ -464,7 +464,7 @@ endmenu
 endif
 	source "package/php/Config.in"
 if BR2_PACKAGE_PHP
-if !BR2_PREFER_STATIC_LIB
+if !BR2_STATIC_LIBS
 menu "External php extensions"
 	source "package/php-geoip/Config.in"
 	source "package/php-gnupg/Config.in"
@@ -475,7 +475,7 @@ menu "External php extensions"
 	source "package/php-zmq/Config.in"
 endmenu
 endif
-if BR2_PREFER_STATIC_LIB
+if BR2_STATIC_LIBS
 comment "External PHP extensions need a toolchain w/ dynamic library"
 endif
 endif
diff --git a/package/Makefile.in b/package/Makefile.in
index 36ecf0b..49a158e 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -389,7 +389,7 @@ else
 ENABLE_DEBUG := --disable-debug
 endif
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 SHARED_STATIC_LIBS_OPTS = --enable-static --disable-shared
 TARGET_CFLAGS += -static
 TARGET_CXXFLAGS += -static
diff --git a/package/agentpp/Config.in b/package/agentpp/Config.in
index 8fd6c0d..4b70a1a 100644
--- a/package/agentpp/Config.in
+++ b/package/agentpp/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_AGENTPP
 	select BR2_PACKAGE_SNMPPP
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # snmp++
-	depends on !BR2_PREFER_STATIC_LIB # snmp++
+	depends on !BR2_STATIC_LIBS # snmp++
 	help
 	  AGENT++ is a set of C++ classes which provides a complete protocol
 	  engine and dispatch table for the development of SNMP agents.
@@ -19,4 +19,4 @@ config BR2_PACKAGE_AGENTPP
 
 comment "agent++ needs a toolchain w/ threads, C++, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_PREFER_STATIC_LIB
+		BR2_STATIC_LIBS
diff --git a/package/aiccu/aiccu.mk b/package/aiccu/aiccu.mk
index 4413f86..6223f07 100644
--- a/package/aiccu/aiccu.mk
+++ b/package/aiccu/aiccu.mk
@@ -15,7 +15,7 @@ AICCU_LFDLAGS = $(TARGET_LDFLAGS)
 
 # aiccu forgets to link with gnutls' dependencies breaking the build when
 # linking statically
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 AICCU_LDFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --static --libs gnutls)
 endif
 
diff --git a/package/aircrack-ng/Config.in b/package/aircrack-ng/Config.in
index d254e21..80b3a2b 100644
--- a/package/aircrack-ng/Config.in
+++ b/package/aircrack-ng/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_AIRCRACK_NG
 	depends on BR2_USE_MMU # uses fork()
 	# libnl has issues when linking statically
 	# they need fixing in libnl itself
-	select BR2_PACKAGE_LIBNL if !BR2_PREFER_STATIC_LIB
+	select BR2_PACKAGE_LIBNL if !BR2_STATIC_LIBS
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	depends on BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
index c7fcb63..fff4137 100644
--- a/package/aircrack-ng/aircrack-ng.mk
+++ b/package/aircrack-ng/aircrack-ng.mk
@@ -14,10 +14,10 @@ AIRCRACK_NG_MAKE_OPTS = unstable=true
 
 # Account for libpthread in static
 AIRCRACK_NG_LDFLAGS = $(TARGET_LDFLAGS) \
-	$(if $(BR2_PREFER_STATIC_LIB),-lpthread -lz)
+	$(if $(BR2_STATIC_LIBS),-lpthread -lz)
 
 # libnl support has issues when building static
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 	AIRCRACK_NG_MAKE_OPTS += libnl=false
 else
 	AIRCRACK_NG_MAKE_OPTS += libnl=true
@@ -27,7 +27,7 @@ endif
 ifeq ($(BR2_PACKAGE_LIBPCAP),y)
 	AIRCRACK_NG_DEPENDENCIES += libpcap
 	AIRCRACK_NG_MAKE_OPTS += HAVE_PCAP=yes \
-		$(if $(BR2_PREFER_STATIC_LIB),LIBPCAP="-lpcap $(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)")
+		$(if $(BR2_STATIC_LIBS),LIBPCAP="-lpcap $(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)")
 else
 	AIRCRACK_NG_MAKE_OPTS += HAVE_PCAP=no
 endif
@@ -42,7 +42,7 @@ endif
 # Duplicate -lpthread, because it is also needed by sqlite
 ifeq ($(BR2_PACKAGE_SQLITE),y)
 	AIRCRACK_NG_DEPENDENCIES += sqlite
-	AIRCRACK_NG_MAKE_OPTS += sqlite=true LIBSQL="-lsqlite3 $(if $(BR2_PREFER_STATIC_LIB),-lpthread)"
+	AIRCRACK_NG_MAKE_OPTS += sqlite=true LIBSQL="-lsqlite3 $(if $(BR2_STATIC_LIBS),-lpthread)"
 else
 	AIRCRACK_NG_MAKE_OPTS += sqlite=false
 endif
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 0b329cd..2890a38 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -18,7 +18,7 @@ ALSA_LIB_CONF_OPTS = --with-alsa-devdir=$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_DEV
 		    --without-versioned
 
 # Can't build with static & shared at the same time (1.0.25+)
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 ALSA_LIB_CONF_OPTS += --enable-shared=no
 else
 ALSA_LIB_CONF_OPTS += --enable-static=no
diff --git a/package/am335x-pru-package/am335x-pru-package.mk b/package/am335x-pru-package/am335x-pru-package.mk
index 1e4fc0d..a4ff201 100644
--- a/package/am335x-pru-package/am335x-pru-package.mk
+++ b/package/am335x-pru-package/am335x-pru-package.mk
@@ -13,9 +13,9 @@ AM335X_PRU_PACKAGE_INSTALL_STAGING = YES
 
 # The default 'all' rule builds everything, when we just need the library
 ifeq ($(BR2_ENABLE_DEBUG),y)
-AM335X_MAKE_TARGET = debug $(if $(BR2_PREFER_STATIC_LIB),,sodebug)
+AM335X_MAKE_TARGET = debug $(if $(BR2_STATIC_LIBS),,sodebug)
 else
-AM335X_MAKE_TARGET = release $(if $(BR2_PREFER_STATIC_LIB),,sorelease)
+AM335X_MAKE_TARGET = release $(if $(BR2_STATIC_LIBS),,sorelease)
 endif
 
 define AM335X_PRU_PACKAGE_BUILD_CMDS
@@ -44,7 +44,7 @@ define AM335X_PRU_PACKAGE_LN_DEBUG_STAGING_STATIC
 endef
 AM335X_PRU_PACKAGE_POST_INSTALL_STAGING_HOOKS += AM335X_PRU_PACKAGE_LN_DEBUG_STAGING_STATIC
 
-ifeq ($(BR2_PREFER_STATIC_LIB),)
+ifeq ($(BR2_STATIC_LIBS),)
 
 define AM335X_PRU_PACKAGE_LN_DEBUG_STAGING_SHARED
 	ln -sf libprussdrvd.so $(STAGING_DIR)/usr/lib/libprussdrv.so
diff --git a/package/apr-util/Config.in b/package/apr-util/Config.in
index 6757e7e..1d7db2b 100644
--- a/package/apr-util/Config.in
+++ b/package/apr-util/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_APR_UTIL
 	select BR2_PACKAGE_APR
 	select BR2_PACKAGE_EXPAT
 	# apr really needs shared library support
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # apr
 	help
 	  The utility library for the apache runtime project
@@ -12,4 +12,4 @@ config BR2_PACKAGE_APR_UTIL
 
 comment "apr-util needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
diff --git a/package/apr/Config.in b/package/apr/Config.in
index fcfffec..5757272 100644
--- a/package/apr/Config.in
+++ b/package/apr/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_APR
 	bool "apr"
 	# apr really needs shared library support
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # fork() in apr_proc_fork()
 	help
 	  The mission of the Apache Portable Runtime (APR) project is to create
@@ -12,4 +12,4 @@ config BR2_PACKAGE_APR
 
 comment "apr needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
diff --git a/package/avahi/Config.in b/package/avahi/Config.in
index b52cc78..a6b4ac8 100644
--- a/package/avahi/Config.in
+++ b/package/avahi/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_AVAHI
 	# libdaemon uses fork()
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Avahi is a system which facilitates service
diff --git a/package/avrdude/Config.in b/package/avrdude/Config.in
index 84bd091..f090ac6 100644
--- a/package/avrdude/Config.in
+++ b/package/avrdude/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_AVRDUDE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_LARGEFILE # elfutils
 	depends on BR2_USE_WCHAR # elfutils
-	depends on !BR2_PREFER_STATIC_LIB # elfutils
+	depends on !BR2_STATIC_LIBS # elfutils
 	depends on !BR2_avr32 # elfutils
 	depends on !BR2_bfin # elfutils
 	help
@@ -17,6 +17,6 @@ config BR2_PACKAGE_AVRDUDE
 	  https://github.com/kcuzner/avrdude
 
 comment "avrdude needs a toolchain w/ threads, largefile, wchar, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_STATIC_LIBS
 	depends on !BR2_avr32
 	depends on !BR2_bfin
diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index c44a986..9865e19 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -26,7 +26,7 @@ BASH_CONF_ENV += \
 BASH_MAKE = $(MAKE1)
 
 # The static build needs some trickery
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 BASH_CONF_OPTS += --enable-static-link --without-bash-malloc
 # bash wants to redefine the getenv() function. To check whether this is
 # possible, AC_TRY_RUN is used which is not possible in
diff --git a/package/bellagio/Config.in b/package/bellagio/Config.in
index ee87e13..8ad1867 100644
--- a/package/bellagio/Config.in
+++ b/package/bellagio/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_BELLAGIO
 	bool "bellagio"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_HAS_LIBOPENMAX
 	help
 	  Bellagio is an opensource implementation of the
@@ -25,4 +25,4 @@ config BR2_PACKAGE_PROVIDES_LIBOPENMAX
 endif
 
 comment "bellagio needs a toolchain w/ C++, threads, dynamic library"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/bind/Config.in b/package/bind/Config.in
index 8e3b824..ba71270 100644
--- a/package/bind/Config.in
+++ b/package/bind/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_BIND
 	depends on BR2_INET_IPV6
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_MMU # fork()
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	help
 	  BIND (Berkeley Internet Name Domain) is an implementation of
 	  the Domain Name System (DNS) protocols and provides an openly
@@ -41,4 +41,4 @@ endif
 
 comment "bind needs a toolchain w/ largefile, IPv6, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || !BR2_INET_IPV6 || BR2_PREFER_STATIC_LIB
+	depends on !BR2_LARGEFILE || !BR2_INET_IPV6 || BR2_STATIC_LIBS
diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index a374f92..a7cd55e 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_BLUEZ5_UTILS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus
 	depends on BR2_INET_IPV6
-	depends on !BR2_PREFER_STATIC_LIB # uses dlfcn
+	depends on !BR2_STATIC_LIBS # uses dlfcn
 	depends on !BR2_PACKAGE_BLUEZ_UTILS # conflicts with 4.x version
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
 	select BR2_PACKAGE_DBUS
@@ -66,7 +66,7 @@ endif
 comment "bluez5-utils needs a toolchain w/ wchar, threads, IPv6, headers >= 3.4, dynamic library"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_INET_IPV6 || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 || \
-		BR2_PREFER_STATIC_LIB
+		BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
 
 comment "bluez5-utils conflicts with older bluez-utils version"
diff --git a/package/bluez_utils/Config.in b/package/bluez_utils/Config.in
index 9efd83d..c4760b2 100644
--- a/package/bluez_utils/Config.in
+++ b/package/bluez_utils/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_BLUEZ_UTILS
 	bool "bluez-utils"
 	depends on !BR2_avr32
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib, libglib2
 	depends on BR2_USE_MMU # dbus, libglib2
@@ -48,4 +48,4 @@ endif
 
 comment "bluez-utils needs a toolchain w/ wchar, threads, dynamic library"
 	depends on !BR2_avr32 && BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/bmon/bmon.mk b/package/bmon/bmon.mk
index 99f074b..c89de17 100644
--- a/package/bmon/bmon.mk
+++ b/package/bmon/bmon.mk
@@ -13,7 +13,7 @@ BMON_LICENSE_FILES = LICENSE
 BMON_AUTORECONF = YES
 
 # link dynamically unless explicitly requested otherwise
-ifeq ($(BR2_PREFER_STATIC_LIB),)
+ifeq ($(BR2_STATIC_LIBS),)
 BMON_CONF_OPTS += --disable-static
 else
 # forgets to explicitly link with pthread for libnl
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 275ee00..725463c 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -92,8 +92,8 @@ BOOST_OPTS += toolset=gcc \
 	     threading=multi \
 	     abi=$(BOOST_ABI) \
 	     variant=$(if $(BR2_ENABLE_DEBUG),debug,release) \
-	     link=$(if $(BR2_PREFER_STATIC_LIB),static,shared) \
-	     runtime-link=$(if $(BR2_PREFER_STATIC_LIB),static,shared)
+	     link=$(if $(BR2_STATIC_LIBS),static,shared) \
+	     runtime-link=$(if $(BR2_STATIC_LIBS),static,shared)
 
 ifeq ($(BR2_PACKAGE_BOOST_LOCALE),y)
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 2e47eb6..9c41c9b 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -19,7 +19,7 @@ BOTAN_CONF_OPTS = \
 	--cc=gcc \
 	--cc-bin="$(TARGET_CXX)"
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 	BOTAN_CONF_OPTS += --disable-shared --no-autoload
 endif
 
diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index b13f227..5f6bd36 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -14,7 +14,7 @@ BTRFS_PROGS_LICENSE = GPLv2
 BTRFS_PROGS_LICENSE_FILES = COPYING
 
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 BTRFS_PROGS_MAKE_TARGET = static
 BTRFS_PROGS_MAKE_INSTALL_TARGET = install-static
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
diff --git a/package/bustle/bustle.mk b/package/bustle/bustle.mk
index 9943db5..1ba36e0 100644
--- a/package/bustle/bustle.mk
+++ b/package/bustle/bustle.mk
@@ -11,7 +11,7 @@ BUSTLE_LICENSE_FILES = LICENSE
 BUSTLE_DEPENDENCIES = libglib2 libpcap host-pkgconf
 
 BUSTLE_PCAP_FLAGS = "-lpcap"
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 BUSTLE_PCAP_FLAGS += $(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)
 endif
 
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index f0fa851..e924702 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -120,7 +120,7 @@ endef
 endif
 
 # If we're using static libs do the same for busybox
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 define BUSYBOX_PREFER_STATIC
 	$(call KCONFIG_ENABLE_OPT,CONFIG_STATIC,$(BUSYBOX_BUILD_CONFIG))
 endef
diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
index 7584694..0597ab9 100644
--- a/package/bzip2/bzip2.mk
+++ b/package/bzip2/bzip2.mk
@@ -10,7 +10,7 @@ BZIP2_INSTALL_STAGING = YES
 BZIP2_LICENSE = bzip2 license
 BZIP2_LICENSE_FILES = LICENSE
 
-ifeq ($(BR2_PREFER_STATIC_LIB),)
+ifeq ($(BR2_STATIC_LIBS),)
 define BZIP2_BUILD_SHARED_CMDS
 	$(TARGET_MAKE_ENV)
 		$(MAKE) -C $(@D) -f Makefile-libbz2_so $(TARGET_CONFIGURE_OPTS)
@@ -23,7 +23,7 @@ define BZIP2_BUILD_CMDS
 	$(BZIP2_BUILD_SHARED_CMDS)
 endef
 
-ifeq ($(BR2_PREFER_STATIC_LIB),)
+ifeq ($(BR2_STATIC_LIBS),)
 define BZIP2_INSTALL_STAGING_SHARED_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) \
 		-f Makefile-libbz2_so PREFIX=$(STAGING_DIR)/usr -C $(@D) install
@@ -36,7 +36,7 @@ define BZIP2_INSTALL_STAGING_CMDS
 	$(BZIP2_INSTALL_STAGING_SHARED_CMDS)
 endef
 
-ifeq ($(BR2_PREFER_STATIC_LIB),)
+ifeq ($(BR2_STATIC_LIBS),)
 define BZIP2_INSTALL_TARGET_SHARED_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) \
 		-f Makefile-libbz2_so PREFIX=$(TARGET_DIR)/usr -C $(@D) install
diff --git a/package/canfestival/Config.in b/package/canfestival/Config.in
index d2bfaca..7c7b370 100644
--- a/package/canfestival/Config.in
+++ b/package/canfestival/Config.in
@@ -4,13 +4,13 @@ config BR2_PACKAGE_CANFESTIVAL_ARCH_SUPPORTS
 
 comment "canfestival needs a toolchain w/ threads and dynamic library"
 	depends on BR2_PACKAGE_CANFESTIVAL_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_CANFESTIVAL
 	bool "canfestival"
 	depends on BR2_PACKAGE_CANFESTIVAL_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	help
 	  CanFestival is an OpenSource CANOpen framework, licensed under
 	  LGPLv2.1 and GPLv2 for some drivers (virtual_kernel, lincan and
diff --git a/package/ccid/Config.in b/package/ccid/Config.in
index e3c71f8..f5bb583 100644
--- a/package/ccid/Config.in
+++ b/package/ccid/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_CCID
 	select BR2_PACKAGE_LIBUSB
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	depends on BR2_USE_MMU # pcsc-lite
-	depends on !BR2_PREFER_STATIC_LIB # pcsc-lite
+	depends on !BR2_STATIC_LIBS # pcsc-lite
 	help
 	  PC/SC driver for USB CCID smart card readers
 
@@ -12,4 +12,4 @@ config BR2_PACKAGE_CCID
 
 comment "ccid needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/cegui06/Config.in b/package/cegui06/Config.in
index f03e488..e6a024a 100644
--- a/package/cegui06/Config.in
+++ b/package/cegui06/Config.in
@@ -1,11 +1,11 @@
 comment "cegui06 needs a toolchain w/ C++, threads, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || BR2_PREFER_STATIC_LIB
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_CEGUI06
 	bool "cegui06"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_PCRE
diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index 0fbde0e..e668b08 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -10,7 +10,7 @@ CIFS_UTILS_SITE = http://ftp.samba.org/pub/linux-cifs/cifs-utils
 CIFS_UTILS_LICENSE = GPLv3+
 CIFS_UTILS_LICENSE_FILES = COPYING
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 CIFS_UTILS_CONF_OPTS += --disable-pie
 endif
 
diff --git a/package/cjson/Config.in b/package/cjson/Config.in
index fed61d7..bbe4c4a 100644
--- a/package/cjson/Config.in
+++ b/package/cjson/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_CJSON
 	bool "cJSON"
 	# For static build with cJSON.c directly see README
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	help
 	  An ultra-lightweight, portable, single-file, simple-as-can-be ANSI-C
 	  compliant JSON parser, under MIT license.
diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 75c90d1..c12dd5b 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_COLLECTD
 	depends on BR2_USE_MMU
 	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	help
 	  collectd is a daemon which collects system performance
 	  statistics periodically and provides mechanisms to store
@@ -59,7 +59,7 @@ config BR2_PACKAGE_COLLECTD_LOGFILE
 
 config BR2_PACKAGE_COLLECTD_NOTIFY_EMAIL
 	bool "notify_email"
-	depends on !BR2_PREFER_STATIC_LIB # libesmtp
+	depends on !BR2_STATIC_LIBS # libesmtp
 	select BR2_PACKAGE_LIBESMTP
 	select BR2_PACKAGE_OPENSSL
 	help
@@ -67,7 +67,7 @@ config BR2_PACKAGE_COLLECTD_NOTIFY_EMAIL
 	  configured recipients.
 
 comment "notify_email needs a toolchain w/ dynamic library"
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
 
 config BR2_PACKAGE_COLLECTD_SYSLOG
 	bool "syslog"
@@ -454,5 +454,5 @@ endmenu
 endif
 
 comment "collectd needs a toolchain w/ IPv6, threads, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6 || BR2_PREFER_STATIC_LIB
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6 || BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
diff --git a/package/connman/Config.in b/package/connman/Config.in
index 63d50b4..861df7d 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_CONNMAN
 	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus, libglib2
-	depends on !BR2_PREFER_STATIC_LIB # needs dlopen()
+	depends on !BR2_STATIC_LIBS # needs dlopen()
 	help
 	  The Connection Manager (ConnMan) project provides a daemon
 	  for managing internet connections within embedded devices
@@ -68,4 +68,4 @@ endif # BR2_PACKAGE_CONNMAN
 
 comment "connman needs a toolchain w/ IPv6, wchar, threads, resolver, dynamic library"
 	depends on BR2_USE_MMU && !BR2_avr32
-	depends on !BR2_USE_WCHAR || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
+	depends on !BR2_USE_WCHAR || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
index f02ff17..85ba118 100644
--- a/package/cppcms/Config.in
+++ b/package/cppcms/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_CPPCMS
 	select BR2_PACKAGE_LIBGCRYPT
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	depends on !BR2_PREFER_STATIC_LIB # dlopen()
+	depends on !BR2_STATIC_LIBS # dlopen()
 	depends on BR2_USE_WCHAR
 	help
 	  CppCMS is a Free High Performance Web Development Framework
@@ -36,4 +36,4 @@ endif
 
 comment "cppcms needs a toolchain w/ C++, NPTL, wchar, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
-		!BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB
+		!BR2_USE_WCHAR || BR2_STATIC_LIBS
diff --git a/package/cppdb/Config.in b/package/cppdb/Config.in
index 19c9419..9037a7a 100644
--- a/package/cppdb/Config.in
+++ b/package/cppdb/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_CPPDB
 	bool "cppdb"
 	# dlfcn.h
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# Can be built without them but it's useless
@@ -16,4 +16,4 @@ config BR2_PACKAGE_CPPDB
 comment "cppdb needs a toolchain w/ C++, threads, dynamic library"
 	depends on BR2_PACKAGE_MYSQL || BR2_PACKAGE_POSTGRESQL || BR2_PACKAGE_SQLITE
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_PREFER_STATIC_LIB
+		BR2_STATIC_LIBS
diff --git a/package/cppunit/Config.in b/package/cppunit/Config.in
index d7582b3..f349fb3 100644
--- a/package/cppunit/Config.in
+++ b/package/cppunit/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_CPPUNIT
 	bool "cppunit"
 	depends on BR2_INSTALL_LIBSTDCPP
 	# currently the static situation is not correctly detected.
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	help
 	  CppUnit is the C++ port of the famous JUnit framework for
 	  unit testing.  Test output is in XML or text format for
@@ -11,4 +11,4 @@ config BR2_PACKAGE_CPPUNIT
 	  http://www.freedesktop.org/wiki/Software/cppunit/
 
 comment "cppunit needs a toolchain w/ C++, dynamic library"
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_PREFER_STATIC_LIB
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
diff --git a/package/crda/Config.in b/package/crda/Config.in
index f67ea77..7ee021a 100644
--- a/package/crda/Config.in
+++ b/package/crda/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_CRDA
 	bool "crda"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBNL
 	# regdb is a runtime dependency
@@ -19,5 +19,5 @@ config BR2_PACKAGE_CRDA
 	  http://linuxwireless.org/en/developers/Regulatory/CRDA
 
 comment "crda needs a toolchain w/ threads, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 	depends on !BR2_nios2
diff --git a/package/crda/crda.mk b/package/crda/crda.mk
index f3d3e80..3c06e07 100644
--- a/package/crda/crda.mk
+++ b/package/crda/crda.mk
@@ -18,7 +18,7 @@ CRDA_LICENSE_FILES = LICENSE
 #
 # libgcrypt needs -lgpg-error if linking statically, which is correctly
 # set by the libgcrypt-config script (and in the right order).
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 CRDA_NLLIBS += -lnl-3 -lm -lpthread
 CRDA_LDLIBS += `$(STAGING_DIR)/usr/bin/libgcrypt-config --libs`
 endif
diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
index 3545794..353420f 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_CRYPTSETUP
 	depends on BR2_LARGEFILE # lvm2, util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
 	depends on BR2_USE_MMU # lvm2, e2fsprogs
-	depends on !BR2_PREFER_STATIC_LIB # lvm2
+	depends on !BR2_STATIC_LIBS # lvm2
 	depends on BR2_USE_WCHAR # util-linux
 	help
 	  This tool helps manipulate dm-crypt and luks partitions for
@@ -19,4 +19,4 @@ config BR2_PACKAGE_CRYPTSETUP
 comment "cryptsetup needs a toolchain w/ largefile, wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || \
-		BR2_PREFER_STATIC_LIB || !BR2_TOOLCHAIN_HAS_THREADS
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/curlftpfs/Config.in b/package/curlftpfs/Config.in
index ec40f3d..8903432 100644
--- a/package/curlftpfs/Config.in
+++ b/package/curlftpfs/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_CURLFTPFS
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse, glib2
 	depends on BR2_USE_MMU # libfuse, glib2
-	depends on !BR2_PREFER_STATIC_LIB # libfuse
+	depends on !BR2_STATIC_LIBS # libfuse
 	help
 	  CurlFtpFS is a filesystem for accessing FTP hosts based on FUSE
 	  and libcurl.
@@ -19,4 +19,4 @@ config BR2_PACKAGE_CURLFTPFS
 
 comment "curlftpfs needs a toolchain w/ largefile, wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
+	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/cwiid/Config.in b/package/cwiid/Config.in
index db53b5a..da49836 100644
--- a/package/cwiid/Config.in
+++ b/package/cwiid/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_CWIID
 	bool "cwiid"
 	depends on !BR2_avr32 # bluez_utils
-	depends on !BR2_PREFER_STATIC_LIB # bluez_utils
+	depends on !BR2_STATIC_LIBS # bluez_utils
 	depends on BR2_USE_WCHAR # bluez_utils -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez_utils -> dbus, alsa-lib, libglib2
 	depends on BR2_USE_MMU # bluez_utils -> dbus, libglib2
diff --git a/package/czmq/czmq.mk b/package/czmq/czmq.mk
index 25f67d5..b585c94 100644
--- a/package/czmq/czmq.mk
+++ b/package/czmq/czmq.mk
@@ -18,7 +18,7 @@ CZMQ_LICENSE_FILES = LICENSE
 # host-python, so disable asciidoc entirely.
 CZMQ_CONF_ENV = ac_cv_prog_czmq_have_asciidoc=no
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 CZMQ_CONF_OPTS += LIBS="-lstdc++ -lm"
 endif
 
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 2d5d2c8..ed400e8 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -34,7 +34,7 @@ DBUS_CONF_OPTS = --with-dbus-user=dbus \
 		--with-system-socket=/var/run/dbus/system_bus_socket \
 		--with-system-pid-file=/var/run/messagebus.pid
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 DBUS_CONF_OPTS += LIBS='-pthread'
 endif
 
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index dc663a8..db2e0b4 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -14,7 +14,7 @@ ifeq ($(BR2_INET_IPV6),)
 	DHCPCD_CONFIG_OPTS += --disable-ipv6
 endif
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 	DHCPCD_CONFIG_OPTS += --enable-static
 endif
 
diff --git a/package/dhcpdump/dhcpdump.mk b/package/dhcpdump/dhcpdump.mk
index ce889f4..0756319 100644
--- a/package/dhcpdump/dhcpdump.mk
+++ b/package/dhcpdump/dhcpdump.mk
@@ -11,7 +11,7 @@ DHCPDUMP_LICENSE = BSD-2c
 DHCPDUMP_LICENSE_FILES = LICENSE
 
 DHCPDUMP_LIBS = -lpcap
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 DHCPDUMP_LIBS += $(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)
 endif
 
diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 3aa51cb..7759f8f 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -97,12 +97,12 @@ config BR2_PACKAGE_DIRECTFB_SERIALMOUSE
 
 config BR2_PACKAGE_DIRECTFB_TSLIB
 	bool "enable touchscreen support"
-	depends on !BR2_PREFER_STATIC_LIB # tslib
+	depends on !BR2_STATIC_LIBS # tslib
 	default y
 	select BR2_PACKAGE_TSLIB
 
 comment "touchscreen support needs a toolchain w/ dynamic library"
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
 
 config BR2_PACKAGE_DIRECTFB_GIF
 	bool "enable GIF support"
@@ -111,10 +111,10 @@ config BR2_PACKAGE_DIRECTFB_GIF
 config BR2_PACKAGE_DIRECTFB_IMLIB2
 	bool "enable IMLIB2 support"
 	select BR2_PACKAGE_IMLIB2
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 
 comment "imlib2 support needs a toolchain w/ dynamic library"
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
 
 config BR2_PACKAGE_DIRECTFB_JPEG
 	bool "enable JPEG support"
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 7f1c8d7..4e4a3c0 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -26,7 +26,7 @@ DIRECTFB_CONF_OPTS = \
 	--disable-video4linux2 \
 	--without-tools
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 DIRECTFB_CONF_OPTS += --disable-dynload
 endif
 
diff --git a/package/dmraid/Config.in b/package/dmraid/Config.in
index 2e3a3fa..0e33a0d 100644
--- a/package/dmraid/Config.in
+++ b/package/dmraid/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_DMRAID
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
 	depends on BR2_USE_MMU # lvm2
-	depends on !BR2_PREFER_STATIC_LIB # lvm2
+	depends on !BR2_STATIC_LIBS # lvm2
 	select BR2_PACKAGE_LVM2
 	help
 	  dmraid discovers, activates, deactivates and displays properties
@@ -14,5 +14,5 @@ config BR2_PACKAGE_DMRAID
 
 comment "dmraid needs a toolchain w/ largefile, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || BR2_PREFER_STATIC_LIB || \
+	depends on !BR2_LARGEFILE || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index e7123f8..9b1092e 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -25,7 +25,7 @@ endif
 ifeq ($(BR2_PACKAGE_DNSMASQ_DNSSEC),y)
 	DNSMASQ_DEPENDENCIES += gmp nettle
 	DNSMASQ_COPTS += -DHAVE_DNSSEC
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 	DNSMASQ_COPTS += -DHAVE_DNSSEC_STATIC
 endif
 endif
@@ -57,7 +57,7 @@ ifeq ($(BR2_PACKAGE_DNSMASQ_LUA),y)
 	DNSMASQ_DEPENDENCIES += lua
 
 # liblua uses dlopen when dynamically linked
-ifneq ($(BR2_PREFER_STATIC_LIB),y)
+ifneq ($(BR2_STATIC_LIBS),y)
 	DNSMASQ_MAKE_OPTS += LIBS+="-ldl"
 endif
 
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index d5a3509..f897d1c 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -14,7 +14,7 @@ DROPBEAR_MAKE =	$(MAKE) MULTI=1 SCPPROGRESS=1 \
 DROPBEAR_LICENSE = MIT, BSD-2c-like, BSD-2c
 DROPBEAR_LICENSE_FILES = LICENSE
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 DROPBEAR_MAKE += STATIC=1
 endif
 
diff --git a/package/dtc/Config.in b/package/dtc/Config.in
index 194b012..7b02dd2 100644
--- a/package/dtc/Config.in
+++ b/package/dtc/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_DTC
 	bool "dtc (libfdt)"
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	help
 	  The Device Tree Compiler, dtc, takes as input a device-tree in
 	  a given format and outputs a device-tree in another format.
@@ -34,4 +34,4 @@ comment "dtdiff will not be installed: it requires bash"
 endif
 
 comment "dtc needs a toolchain w/ dynamic library"
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
diff --git a/package/dvb-apps/dvb-apps.mk b/package/dvb-apps/dvb-apps.mk
index f2ad96c..892af63 100644
--- a/package/dvb-apps/dvb-apps.mk
+++ b/package/dvb-apps/dvb-apps.mk
@@ -15,7 +15,7 @@ DVB_APPS_DEPENDENCIES = libiconv
 DVB_APPS_LDLIBS += -liconv
 endif
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 DVB_APPS_MAKE_OPTS += static=1
 endif
 
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 8ee316a..b4f0950 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -12,7 +12,7 @@ E2FSPROGS_INSTALL_STAGING = YES
 E2FSPROGS_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-libs
 
 E2FSPROGS_CONF_OPTS = \
-	$(if $(BR2_PREFER_STATIC_LIB),,--enable-elf-shlibs) \
+	$(if $(BR2_STATIC_LIBS),,--enable-elf-shlibs) \
 	$(if $(BR2_PACKAGE_E2FSPROGS_DEBUGFS),,--disable-debugfs) \
 	$(if $(BR2_PACKAGE_E2FSPROGS_E2IMAGE),,--disable-imager) \
 	$(if $(BR2_PACKAGE_E2FSPROGS_E4DEFRAG),,--disable-defrag) \
diff --git a/package/ebtables/ebtables.mk b/package/ebtables/ebtables.mk
index 578c3ae..69c2331 100644
--- a/package/ebtables/ebtables.mk
+++ b/package/ebtables/ebtables.mk
@@ -9,7 +9,7 @@ EBTABLES_SOURCE = ebtables-v$(EBTABLES_VERSION).tar.gz
 EBTABLES_SITE = http://downloads.sourceforge.net/project/ebtables/ebtables/ebtables-$(subst .,-,$(EBTABLES_VERSION))
 EBTABLES_LICENSE = GPLv2+
 EBTABLES_LICENSE_FILES = COPYING
-EBTABLES_STATIC = $(if $(BR2_PREFER_STATIC_LIB),static)
+EBTABLES_STATIC = $(if $(BR2_STATIC_LIBS),static)
 EBTABLES_K64U32 = $(if $(BR2_KERNEL_64_USERLAND_32),-DKERNEL_64_USERSPACE_32)
 
 define EBTABLES_BUILD_CMDS
@@ -17,7 +17,7 @@ define EBTABLES_BUILD_CMDS
 		CFLAGS="$(TARGET_CFLAGS) $(EBTABLES_K64U32)" -C $(@D)
 endef
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 define EBTABLES_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/$(EBTABLES_SUBDIR)/static \
 		$(TARGET_DIR)/sbin/ebtables
diff --git a/package/efl/libedbus/Config.in b/package/efl/libedbus/Config.in
index 907c7fe..b35e46a 100644
--- a/package/efl/libedbus/Config.in
+++ b/package/efl/libedbus/Config.in
@@ -17,7 +17,7 @@ if BR2_PACKAGE_LIBEDBUS
 config BR2_PACKAGE_LIBEDBUS_BLUEZ
 	bool "bluez support"
 	depends on !BR2_avr32 # bluez_utils
-	depends on !BR2_PREFER_STATIC_LIB # bluez_utils
+	depends on !BR2_STATIC_LIBS # bluez_utils
 	depends on BR2_USE_WCHAR # bluez_utils -> glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez_utils -> glib2
 	select BR2_PACKAGE_BLUEZ_UTILS
@@ -26,7 +26,7 @@ config BR2_PACKAGE_LIBEDBUS_BLUEZ
 
 comment "bluez support needs a toolchain w/ wchar, threads, dynamic library"
 	depends on !BR2_avr32
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_LIBEDBUS_CONNMAN
 	bool "connman support"
diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
index 5d6e659..9f72098 100644
--- a/package/elfutils/Config.in
+++ b/package/elfutils/Config.in
@@ -1,7 +1,7 @@
 comment "elfutils needs a toolchain w/ largefile, wchar, dynamic library"
 	depends on !BR2_avr32
 	depends on !BR2_bfin
-	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB
+	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_ELFUTILS
 	bool "elfutils"
@@ -9,7 +9,7 @@ config BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	# canonicalize_file_name() not available on uClibc 0.9.31, used
 	# only for AVR32
 	depends on !BR2_avr32
diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index 0566582..56830da 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -1,11 +1,11 @@
 comment "erlang needs a toolchain w/ threads, shared library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS && BR2_PREFER_STATIC_LIB
+	depends on !BR2_TOOLCHAIN_HAS_THREADS && BR2_STATIC_LIBS
 
 config BR2_PACKAGE_ERLANG
 	bool "erlang"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	help
 	  Erlang is a programming language used to build massively scalable
 	  soft real-time systems with requirements on high availability.
diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index 6101d6d..7916fd0 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_EUDEV
 	depends on BR2_USE_MMU # uses fork()
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
-	depends on !BR2_PREFER_STATIC_LIB # kmod
+	depends on !BR2_STATIC_LIBS # kmod
 	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
@@ -39,4 +39,4 @@ comment "eudev needs eudev /dev management"
 comment "eudev needs a toolchain w/ largefile, wchar, dynamic library"
 	depends on !BR2_avr32
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB
+	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_STATIC_LIBS
diff --git a/package/exfat/Config.in b/package/exfat/Config.in
index 92e6c38..e5e17e9 100644
--- a/package/exfat/Config.in
+++ b/package/exfat/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_EXFAT
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
 	depends on BR2_USE_MMU # libfuse
 	depends on BR2_USE_WCHAR
-	depends on !BR2_PREFER_STATIC_LIB # libfuse
+	depends on !BR2_STATIC_LIBS # libfuse
 	select BR2_PACKAGE_LIBFUSE
 	help
 	  A full-featured exFAT file system implementation for GNU/Linux
@@ -14,4 +14,4 @@ config BR2_PACKAGE_EXFAT
 
 comment "exfat needs a toolchain w/ largefile, wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || BR2_STATIC_LIBS
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index ba184f0..c42c7c1 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -86,7 +86,7 @@ endef
 endif # CUSTOM_CONFIG
 
 # exim needs a bit of love to build statically
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 EXIM_STATIC_FLAGS = LFLAGS="-pthread --static"
 endif
 
diff --git a/package/exiv2/Config.in b/package/exiv2/Config.in
index 3dc7445..9a7cf44 100644
--- a/package/exiv2/Config.in
+++ b/package/exiv2/Config.in
@@ -1,9 +1,9 @@
 comment "exiv2 needs a toolchain w/ C++, dynamic library"
-	depends on BR2_PREFER_STATIC_LIB || !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_EXIV2
 	bool "exiv2"
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  Exiv2 is a C++ library and a command line utility to manage
diff --git a/package/faifa/Config.in b/package/faifa/Config.in
index 23133b7..de2cc79 100644
--- a/package/faifa/Config.in
+++ b/package/faifa/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_FAIFA
 	bool "faifa"
 	select BR2_PACKAGE_LIBPCAP
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Faifa can configure any Intellon-based Power Line
@@ -13,4 +13,4 @@ config BR2_PACKAGE_FAIFA
 	  https://dev.open-plc.org
 
 comment "faifa needs a toolchain w/ dynamic library, threads"
-	depends on BR2_PREFER_STATIC_LIB || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/fbv/fbv.mk b/package/fbv/fbv.mk
index 19d5cea..fe24a6f 100644
--- a/package/fbv/fbv.mk
+++ b/package/fbv/fbv.mk
@@ -17,7 +17,7 @@ ifeq ($(BR2_PACKAGE_FBV_PNG),y)
 FBV_DEPENDENCIES += libpng
 
 # libpng in turn depends on other libraries
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 FBV_CONFIGURE_OPTS += "--libs=$(shell $(PKG_CONFIG_HOST_BINARY) --libs libpng --static)"
 endif
 
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 1a68fa0..3a0048e 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -332,7 +332,7 @@ else
 FFMPEG_CONF_OPTS += --disable-altivec
 endif
 
-ifeq ($(BR2_PREFER_STATIC_LIB),)
+ifeq ($(BR2_STATIC_LIBS),)
 FFMPEG_CONF_OPTS += --enable-pic
 else
 FFMPEG_CONF_OPTS += --disable-pic
diff --git a/package/flann/Config.in b/package/flann/Config.in
index a3af7c1..1222310 100644
--- a/package/flann/Config.in
+++ b/package/flann/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_FLANN
 	bool "flann"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	# triggers an assert in the linker of this toolchain
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
 	help
@@ -24,4 +24,4 @@ config BR2_PACKAGE_FLANN_EXAMPLES
 endif
 
 comment "flann needs a toolchain w/ C++, dynamic library"
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_PREFER_STATIC_LIB
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
diff --git a/package/fswebcam/Config.in b/package/fswebcam/Config.in
index 03ab38f..d268454 100644
--- a/package/fswebcam/Config.in
+++ b/package/fswebcam/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_FSWEBCAM
 	bool "fswebcam"
 	depends on BR2_USE_MMU # fork()
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_GD
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_JPEG
@@ -19,4 +19,4 @@ config BR2_PACKAGE_FSWEBCAM
 
 comment "fswebcam needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
diff --git a/package/gawk/Config.in b/package/gawk/Config.in
index d0213a7..5b4d818 100644
--- a/package/gawk/Config.in
+++ b/package/gawk/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_GAWK
 	bool "gawk"
 	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU # fork()
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	help
 	  A special-purpose programming language which is data driven
 	  rather than procedural.  Allows for simple data-reformatting jobs
@@ -12,4 +12,4 @@ config BR2_PACKAGE_GAWK
 
 comment "gawk needs a toolchain w/ wchar, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 46ef5c6..af6b1a7 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -53,7 +53,7 @@ HOST_GCC_FINAL_CONF_OPTS = \
 	--with-build-time-tools=$(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin
 
 # Disable shared libs like libstdc++ if we do static since it confuses linking
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 HOST_GCC_FINAL_CONF_OPTS += --disable-shared
 else
 HOST_GCC_FINAL_CONF_OPTS += --enable-shared
@@ -145,7 +145,7 @@ define HOST_GCC_FINAL_INSTALL_STATIC_LIBS
 	done
 endef
 
-ifeq ($(BR2_PREFER_STATIC_LIB),)
+ifeq ($(BR2_STATIC_LIBS),)
 define HOST_GCC_FINAL_INSTALL_SHARED_LIBS
 	for i in $(HOST_GCC_FINAL_USR_LIBS) ; do \
 		cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/$${i}.so* \
diff --git a/package/giblib/Config.in b/package/giblib/Config.in
index 7b8f038..f50271a 100644
--- a/package/giblib/Config.in
+++ b/package/giblib/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_GIBLIB
 	bool "giblib"
 	depends on BR2_PACKAGE_XORG7
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_IMLIB2
 	select BR2_PACKAGE_IMLIB2_X
 	help
@@ -10,4 +10,4 @@ config BR2_PACKAGE_GIBLIB
 	  http://linuxbrit.co.uk/giblib/
 
 comment "giblib support needs a toolchain w/ dynamic library"
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
diff --git a/package/gpm/Config.in b/package/gpm/Config.in
index 0148c13..2d0d366 100644
--- a/package/gpm/Config.in
+++ b/package/gpm/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_GPM
 	bool "gpm"
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # fork()
 	help
 	  "gpm" means general purpose mouse (server) and provides mouse support
@@ -22,5 +22,5 @@ config BR2_PACKAGE_GPM_INSTALL_TEST_TOOLS
 endif
 
 comment "gpm mouse server needs a toolchain w/ dynamic library"
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
index 897dc77..9e95618 100644
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -26,7 +26,7 @@ GPTFDISK_DEPENDENCIES += icu
 GPTFDISK_MAKE_OPTS += USE_UTF16=y
 endif
 
-ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE)$(BR2_PREFER_STATIC_LIB),yy)
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE)$(BR2_STATIC_LIBS),yy)
 GPTFDISK_MAKE_OPTS += LDLIBS=-lintl
 endif
 
diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
index 984b64c..0fc7877 100644
--- a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
@@ -80,7 +80,7 @@ else
 GST_FFMPEG_CONF_EXTRA_OPTS += --disable-altivec
 endif
 
-ifeq ($(BR2_PREFER_STATIC_LIB),)
+ifeq ($(BR2_STATIC_LIBS),)
 GST_FFMPEG_CONF_EXTRA_OPTS += --enable-pic
 endif
 
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index c455aca..9ccce94 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -372,7 +372,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DIRECTFB
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND
 	bool "wayland"
 	depends on !BR2_avr32 # wayland
-	depends on !BR2_PREFER_STATIC_LIB # wayland
+	depends on !BR2_STATIC_LIBS # wayland
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
 	select BR2_PACKAGE_WAYLAND
 	help
diff --git a/package/gstreamer1/gst1-plugins-ugly/Config.in b/package/gstreamer1/gst1-plugins-ugly/Config.in
index 958b8c3..341ec8c 100644
--- a/package/gstreamer1/gst1-plugins-ugly/Config.in
+++ b/package/gstreamer1/gst1-plugins-ugly/Config.in
@@ -41,13 +41,13 @@ comment "plugins with external dependencies (there may be more available)"
 config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_DVDREAD
 	bool "dvdread"
 	depends on BR2_LARGEFILE # libdvdread
-	depends on !BR2_PREFER_STATIC_LIB # libdvdread
+	depends on !BR2_STATIC_LIBS # libdvdread
 	select BR2_PACKAGE_LIBDVDREAD
 	help
 	  Access a DVD with dvdread
 
 comment "dvdread needs a toolchain w/ dynamic library, largefile"
-	depends on !BR2_LARGEFILE || BR2_PREFER_STATIC_LIB
+	depends on !BR2_LARGEFILE || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_LAME
 	bool "lame (*.mp3 audio encoder)"
diff --git a/package/haserl/haserl.mk b/package/haserl/haserl.mk
index 3db70ef..f0de790 100644
--- a/package/haserl/haserl.mk
+++ b/package/haserl/haserl.mk
@@ -19,7 +19,7 @@ ifeq ($(BR2_PACKAGE_HASERL_WITH_LUA),y)
 	HASERL_DEPENDENCIES += lua
 
 # liblua uses dlopen when dynamically linked
-ifneq ($(BR2_PREFER_STATIC_LIB),y)
+ifneq ($(BR2_STATIC_LIBS),y)
 	HASERL_CONF_ENV += LIBS="-ldl"
 endif
 
diff --git a/package/heirloom-mailx/Config.in b/package/heirloom-mailx/Config.in
index a2521ef..87664b4 100644
--- a/package/heirloom-mailx/Config.in
+++ b/package/heirloom-mailx/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_HEIRLOOM_MAILX
 	bool "heirloom-mailx"
 	# uses fork()
 	depends on BR2_USE_MMU
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	help
 	  Heirloom mailx (previously known as nail) is a mail user
 	  agent for Unix systems.
@@ -16,5 +16,5 @@ config BR2_PACKAGE_HEIRLOOM_MAILX
 	  http://heirloom.sourceforge.net/mailx.html
 
 comment "heirloom-mailx needs a toolchain w/ dynamic library"
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
index 6ca396e..656645b 100644
--- a/package/hostapd/Config.in
+++ b/package/hostapd/Config.in
@@ -16,12 +16,12 @@ if BR2_PACKAGE_HOSTAPD
 
 config BR2_PACKAGE_HOSTAPD_EAP
 	bool "Enable EAP"
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	help
 	  Enable support for EAP and RADIUS.
 
 comment "hostapd EAP needs a toolchain w/ dynamic library"
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
 
 config BR2_PACKAGE_HOSTAPD_WPS
 	bool "Enable WPS"
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index dec9ef8..d4a5304 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -31,7 +31,7 @@ HOSTAPD_CONFIG_DISABLE =
 # libnl-3 needs -lm (for rint) and -lpthread if linking statically
 # And library order matters hence stick -lnl-3 first since it's appended
 # in the hostapd Makefiles as in LIBS+=-lnl-3 ... thus failing
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 HOSTAPD_LIBS += -lnl-3 -lm -lpthread
 endif
 
@@ -42,7 +42,7 @@ endif
 # Try to use openssl if it's already available
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	HOSTAPD_DEPENDENCIES += openssl
-	HOSTAPD_LIBS += $(if $(BR2_PREFER_STATIC_LIB),-lcrypto -lz)
+	HOSTAPD_LIBS += $(if $(BR2_STATIC_LIBS),-lcrypto -lz)
 	HOSTAPD_CONFIG_EDITS += 's/\#\(CONFIG_TLS=openssl\)/\1/'
 else
 	HOSTAPD_CONFIG_DISABLE += CONFIG_EAP_PWD
diff --git a/package/iftop/iftop.mk b/package/iftop/iftop.mk
index ef162a8..bea05ba 100644
--- a/package/iftop/iftop.mk
+++ b/package/iftop/iftop.mk
@@ -11,7 +11,7 @@ IFTOP_LICENSE = GPLv2+
 IFTOP_LICENSE_FILES = COPYING
 
 IFTOP_LIBS = -lpcap
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 IFTOP_LIBS += $(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)
 endif
 IFTOP_CONF_ENV += LIBS+="$(IFTOP_LIBS)"
diff --git a/package/imlib2/Config.in b/package/imlib2/Config.in
index 757f100..a323a8d 100644
--- a/package/imlib2/Config.in
+++ b/package/imlib2/Config.in
@@ -1,10 +1,10 @@
 comment "imlib2 needs a toolchain w/ dynamic library"
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
 
 config BR2_PACKAGE_IMLIB2
 	bool "imlib2"
 	select BR2_PACKAGE_FREETYPE
-	depends on !BR2_PREFER_STATIC_LIB # dlopen()
+	depends on !BR2_STATIC_LIBS # dlopen()
 	help
 	  Imlib 2 is the successor to Imlib. This library provides
 	  routines to load, save and render images in various formats.
diff --git a/package/inadyn/Config.in b/package/inadyn/Config.in
index 2809531..65f6851 100644
--- a/package/inadyn/Config.in
+++ b/package/inadyn/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_INADYN
 	bool "inadyn"
 	depends on BR2_USE_MMU # Uses fork()
-	depends on !BR2_PREFER_STATIC_LIB # dlopen()
+	depends on !BR2_STATIC_LIBS # dlopen()
 	help
 	  INADYN is a free DynDNS client. It gives the possibility
 	  to have your own fixed hostname registered on the internet,
@@ -10,5 +10,5 @@ config BR2_PACKAGE_INADYN
 	  https://github.com/troglobit/inadyn
 
 comment "inadyn needs a toolchain w/ dynamic library"
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
diff --git a/package/ipsec-tools/ipsec-tools.mk b/package/ipsec-tools/ipsec-tools.mk
index 535dc07..d916027 100644
--- a/package/ipsec-tools/ipsec-tools.mk
+++ b/package/ipsec-tools/ipsec-tools.mk
@@ -16,7 +16,7 @@ IPSEC_TOOLS_DEPENDENCIES = openssl flex host-flex
 IPSEC_TOOLS_MAKE_OPTS = CFLAGS='$(TARGET_CFLAGS)'
 
 # openssl uses zlib, so we need to explicitly link with it when static
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 IPSEC_TOOLS_CONF_ENV += LIBS=-lz
 endif
 
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 2ef879d..38faa68 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -14,7 +14,7 @@ IPTABLES_LICENSE = GPLv2
 IPTABLES_LICENSE_FILES = COPYING
 # Building static causes ugly warnings on some plugins
 IPTABLES_CONF_OPTS = --libexecdir=/usr/lib --with-kernel=$(STAGING_DIR)/usr \
-	$(if $(BR2_PREFER_STATIC_LIB),,--disable-static)
+	$(if $(BR2_STATIC_LIBS),,--disable-static)
 # Because of iptables-01-fix-static-link.patch
 IPTABLES_AUTORECONF = YES
 
diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 544ac55..df6e257 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -14,7 +14,7 @@ IW_MAKE_OPTS = CC="$(TARGET_CC)" LD="$(TARGET_LD)" LDFLAGS="$(TARGET_LDFLAGS)"
 IW_MAKE_ENV = PKG_CONFIG="$(HOST_DIR)/usr/bin/pkg-config" \
 	GIT_DIR=$(IW_DIR)
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 # libnl needs pthread/m, so we need to explicitly with them when static
 # these need to added AFTER libnl, so we have to override LIBS completely
 IW_MAKE_OPTS += LIBS='-lnl-genl-3 -lnl-3 -lpthread -lm'
diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
index 27f43f0..9f0fb0c 100644
--- a/package/jimtcl/jimtcl.mk
+++ b/package/jimtcl/jimtcl.mk
@@ -25,7 +25,7 @@ define JIMTCL_LINK_TCLSH
 endef
 endif
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 JIMTCL_SHARED =
 JIMTCL_LIB = a
 JIMTCL_INSTALL_LIB =
diff --git a/package/kexec-lite/Config.in b/package/kexec-lite/Config.in
index 8db6058..7d3beff 100644
--- a/package/kexec-lite/Config.in
+++ b/package/kexec-lite/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_KEXEC_LITE
 	bool "kexec-lite"
 	depends on BR2_powerpc || BR2_powerpc64
-	depends on !BR2_PREFER_STATIC_LIB # dtc, elfutils
+	depends on !BR2_STATIC_LIBS # dtc, elfutils
 	depends on BR2_LARGEFILE # elfutils
 	depends on BR2_USE_WCHAR # elfutils
 	select BR2_PACKAGE_ELFUTILS
@@ -16,4 +16,4 @@ config BR2_PACKAGE_KEXEC_LITE
 
 comment "kexec-lite needs a toolchain w/ largefile, wchar, dynamic library"
 	depends on BR2_powerpc || BR2_powerpc64
-	depends on BR2_PREFER_STATIC_LIB || !BR2_LARGEFILE || !BR2_USE_WCHAR
+	depends on BR2_STATIC_LIBS || !BR2_LARGEFILE || !BR2_USE_WCHAR
diff --git a/package/keyutils/keyutils.mk b/package/keyutils/keyutils.mk
index 27cd4ae..2038c0d 100644
--- a/package/keyutils/keyutils.mk
+++ b/package/keyutils/keyutils.mk
@@ -19,7 +19,7 @@ KEYUTILS_MAKE_PARAMS =                    \
 	CPPFLAGS="$(TARGET_CPPFLAGS) -I." \
 	LNS="$(HOSTLN) -sf"
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 KEYUTILS_MAKE_PARAMS += NO_SOLIB=1
 endif
 
diff --git a/package/kmod/Config.in b/package/kmod/Config.in
index 2e8b955..8703e82 100644
--- a/package/kmod/Config.in
+++ b/package/kmod/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_KMOD
 	bool "kmod"
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	help
 	  handle kernel modules
 
diff --git a/package/knock/knock.mk b/package/knock/knock.mk
index 0143974..2c0adb1 100644
--- a/package/knock/knock.mk
+++ b/package/knock/knock.mk
@@ -10,7 +10,7 @@ KNOCK_LICENSE = GPLv2+
 KNOCK_LICENSE_FILES = COPYING
 KNOCK_DEPENDENCIES = libpcap
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 KNOCK_CONF_OPTS = LIBS="$(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)"
 endif
 
diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index a50b018..1586579 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -11,7 +11,7 @@ LFTP_LICENSE_FILES = COPYING
 LFTP_AUTORECONF = YES
 LFTP_DEPENDENCIES = readline zlib host-pkgconf
 
-ifneq ($(BR2_PREFER_STATIC_LIB),y)
+ifneq ($(BR2_STATIC_LIBS),y)
 LFTP_CONF_OPTS += --with-modules
 endif
 
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 8522128..61528d9 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -12,7 +12,7 @@ LIBARCHIVE_LICENSE_FILES = COPYING
 LIBARCHIVE_CONF_OPTS = --without-lzma
 
 ifeq ($(BR2_PACKAGE_LIBARCHIVE_BSDTAR),y)
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 LIBARCHIVE_CONF_OPTS += --enable-bsdtar=static
 else
 LIBARCHIVE_CONF_OPTS += --enable-bsdtar=shared
@@ -22,7 +22,7 @@ LIBARCHIVE_CONF_OPTS += --disable-bsdtar
 endif
 
 ifeq ($(BR2_PACKAGE_LIBARCHIVE_BSDCPIO),y)
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 LIBARCHIVE_CONF_OPTS += --enable-bsdcpio=static
 else
 LIBARCHIVE_CONF_OPTS += --enable-bsdcpio=shared
diff --git a/package/libbluray/Config.in b/package/libbluray/Config.in
index e174773..357a562 100644
--- a/package/libbluray/Config.in
+++ b/package/libbluray/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBBLURAY
 	bool "libbluray"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	help
 	  libbluray is a client library for accessing bluray disks.
 
@@ -9,4 +9,4 @@ config BR2_PACKAGE_LIBBLURAY
 
 comment "libbluray needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 42bd19a..512dac8 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -23,7 +23,7 @@ endif
 # we don't have host-attr
 HOST_LIBCAP_DEPENDENCIES =
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 LIBCAP_MAKE_TARGET = libcap.a
 LIBCAP_MAKE_INSTALL_TARGET = install-static
 else
diff --git a/package/libcec/Config.in b/package/libcec/Config.in
index 8097472..e5fa9c8 100644
--- a/package/libcec/Config.in
+++ b/package/libcec/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_LIBCEC
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	help
 	  libcec allows you in combination with the right hardware to
 	  control your home theater devices with your TV remote
@@ -13,4 +13,4 @@ config BR2_PACKAGE_LIBCEC
 
 comment "libcec needs a toolchain w/ C++, wchar, threads, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB
+		!BR2_USE_WCHAR || BR2_STATIC_LIBS
diff --git a/package/libcgi/libcgi.mk b/package/libcgi/libcgi.mk
index f46a1fa..7cb3417 100644
--- a/package/libcgi/libcgi.mk
+++ b/package/libcgi/libcgi.mk
@@ -9,7 +9,7 @@ LIBCGI_SITE = http://downloads.sourceforge.net/project/libcgi/libcgi/$(LIBCGI_VE
 LIBCGI_INSTALL_STAGING = YES
 # use cross CC/AR rather than host
 LIBCGI_MAKE_ENV = CC="$(TARGET_CC) $(TARGET_CFLAGS)" AR="$(TARGET_AR)" \
-	$(if $(BR2_PREFER_STATIC_LIB),STATIC=1)
+	$(if $(BR2_STATIC_LIBS),STATIC=1)
 LIBCGI_LICENSE = LGPLv2.1+
 
 $(eval $(autotools-package))
diff --git a/package/libdvdnav/Config.in b/package/libdvdnav/Config.in
index 40a375a..54a25de 100644
--- a/package/libdvdnav/Config.in
+++ b/package/libdvdnav/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBDVDNAV
 	bool "libdvdnav"
 	depends on BR2_LARGEFILE # libdvdread
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_PREFER_STATIC_LIB # libdvdread
+	depends on !BR2_STATIC_LIBS # libdvdread
 	select BR2_PACKAGE_LIBDVDREAD
 	help
 	  libdvdnav is a library that allows easy use of sophisticated
@@ -12,4 +12,4 @@ config BR2_PACKAGE_LIBDVDNAV
 	  http://www.mplayerhq.hu
 
 comment "libdvdnav needs a toolchain w/ dynamic library, largefile, threads"
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libdvdread/Config.in b/package/libdvdread/Config.in
index 65d3d40..05a97c0 100644
--- a/package/libdvdread/Config.in
+++ b/package/libdvdread/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBDVDREAD
 	bool "libdvdread"
 	depends on BR2_LARGEFILE
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	help
 	  libdvdread provides a simple foundation for reading
 	  DVD-Video images.
@@ -9,4 +9,4 @@ config BR2_PACKAGE_LIBDVDREAD
 	  http://www.mplayerhq.hu/MPlayer/releases/dvdnav/
 
 comment "libdvdread needs a toolchain w/ dynamic library, largefile"
-	depends on !BR2_LARGEFILE || BR2_PREFER_STATIC_LIB
+	depends on !BR2_LARGEFILE || BR2_STATIC_LIBS
diff --git a/package/libebml/libebml.mk b/package/libebml/libebml.mk
index 618ef1a..67dcfc6 100644
--- a/package/libebml/libebml.mk
+++ b/package/libebml/libebml.mk
@@ -11,7 +11,7 @@ LIBEBML_INSTALL_STAGING = YES
 LIBEBML_LICENSE = LGPLv2.1+
 LIBEBML_LICENSE_FILES = LICENSE.LGPL
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 LIBEBML_MAKE_TARGETS = staticlib
 LIBEBML_MAKE_INSTALL_TARGETS = install_staticlib install_headers
 else
diff --git a/package/libesmtp/Config.in b/package/libesmtp/Config.in
index 42a1c08..ba9d527 100644
--- a/package/libesmtp/Config.in
+++ b/package/libesmtp/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_LIBESMTP
 	bool "libesmtp"
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	help
 	  Library for sending emails through SMTP.
 
 	  http://www.stafford.uklinux.net/libesmtp
 
 comment "libesmtp needs a toolchain w/ dynamic library"
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
diff --git a/package/libfreefare/libfreefare.mk b/package/libfreefare/libfreefare.mk
index 1b90c3b..5d6d636 100644
--- a/package/libfreefare/libfreefare.mk
+++ b/package/libfreefare/libfreefare.mk
@@ -10,7 +10,7 @@ LIBFREEFARE_DEPENDENCIES = libnfc openssl
 LIBFREEFARE_LICENSE = LGPLv3+ with exception
 LIBFREEFARE_LICENSE_FILES = COPYING
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 # openssl needs zlib even if the libfreefare example itself doesn't
 LIBFREEFARE_CONF_ENV += LIBS='-lz'
 endif
diff --git a/package/libfuse/Config.in b/package/libfuse/Config.in
index 5561d9d..0e9e969 100644
--- a/package/libfuse/Config.in
+++ b/package/libfuse/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBFUSE
 	bool "libfuse"
 	# Really doesn't like static, see fuse/lib/fuse.c
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
@@ -12,4 +12,4 @@ config BR2_PACKAGE_LIBFUSE
 
 comment "libfuse needs a toolchain w/ largefile, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libjson/libjson.mk b/package/libjson/libjson.mk
index 17a1e9a..c73a69f 100644
--- a/package/libjson/libjson.mk
+++ b/package/libjson/libjson.mk
@@ -13,7 +13,7 @@ LIBJSON_LICENSE_FILES = License.txt
 
 LIBJSON_CXXFLAGS = $(TARGET_CFLAGS) -DNDEBUG
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 LIBJSON_MAKE_OPTS += SHARED=0
 else
 LIBJSON_MAKE_OPTS += SHARED=1
@@ -30,7 +30,7 @@ define LIBJSON_EXTRACT_CMDS
 endef
 
 define LIBJSON_BUILD_CMDS
-	mkdir -p $(@D)/Objects_$(if $(BR2_PREFER_STATIC_LIB),static,shared) \
+	mkdir -p $(@D)/Objects_$(if $(BR2_STATIC_LIBS),static,shared) \
 		$(@D)/_internal/Source/Dependencies
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
 		$(LIBJSON_MAKE_OPTS) -C $(@D)
diff --git a/package/libmatroska/libmatroska.mk b/package/libmatroska/libmatroska.mk
index fe49275..778e74c 100644
--- a/package/libmatroska/libmatroska.mk
+++ b/package/libmatroska/libmatroska.mk
@@ -12,7 +12,7 @@ LIBMATROSKA_LICENSE = LGPLv2.1+
 LIBMATROSKA_LICENSE_FILES = LICENSE.LGPL
 LIBMATROSKA_DEPENDENCIES = libebml
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 LIBMATROSKA_MAKE_TARGETS = staticlib
 LIBMATROSKA_MAKE_INSTALL_TARGETS = install_staticlib install_headers
 else
diff --git a/package/libnl/Config.in b/package/libnl/Config.in
index af045e7..46877c3 100644
--- a/package/libnl/Config.in
+++ b/package/libnl/Config.in
@@ -11,12 +11,12 @@ if BR2_PACKAGE_LIBNL
 config BR2_PACKAGE_LIBNL_TOOLS
 	bool "install tools"
 	# uses <dlfcn.h>
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	help
 	  Install binary tools.
 
 comment "libnl tools needs a toolchain w/ dynamic library"
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
 endif
 
 comment "libnl needs a toolchain w/ threads"
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 1930870..4beff68 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -21,7 +21,7 @@ LIBNSPR_CONF_OPTS = --host=$(GNU_HOST_NAME)
 LIBNSPR_CONF_OPTS += --$(if $(BR2_ARCH_IS_64),en,dis)able-64bit
 LIBNSPR_CONF_OPTS += --$(if $(BR2_INET_IPV6),en,dis)able-ipv6
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 LIBNSPR_MAKE_OPTS = SHARED_LIBRARY=
 LIBNSPR_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) SHARED_LIBRARY= install
 LIBNSPR_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) SHARED_LIBRARY= install
diff --git a/package/libphidget/Config.in b/package/libphidget/Config.in
index 18a3207..7466fb5 100644
--- a/package/libphidget/Config.in
+++ b/package/libphidget/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBPHIDGET
 	bool "libphidget"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBUSB
 	help
 	  The libphidget library provides an API for controlling Phidgets
@@ -23,4 +23,4 @@ config BR2_PACKAGE_LIBPHIDGET
 
 comment "libphidget needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
diff --git a/package/libpthread-stubs/libpthread-stubs.mk b/package/libpthread-stubs/libpthread-stubs.mk
index 2ee3f1e..856793c 100644
--- a/package/libpthread-stubs/libpthread-stubs.mk
+++ b/package/libpthread-stubs/libpthread-stubs.mk
@@ -12,7 +12,7 @@ LIBPTHREAD_STUBS_LICENSE_FILES = COPYING
 
 LIBPTHREAD_STUBS_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 LIBPTHREAD_STUBS_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -pthread"
 endif
 
diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index 7999c4a..356f137 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -13,7 +13,7 @@ LIBSEPOL_INSTALL_STAGING = YES
 
 LIBSEPOL_MAKE_FLAGS = $(TARGET_CONFIGURE_OPTS)
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 LIBSEPOL_MAKE_FLAGS += STATIC=1
 endif
 
diff --git a/package/libshairplay/Config.in b/package/libshairplay/Config.in
index 92955ee..0895cd2 100644
--- a/package/libshairplay/Config.in
+++ b/package/libshairplay/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_LIBSHAIRPLAY
 	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # avahi
-	depends on !BR2_PREFER_STATIC_LIB # avahi
+	depends on !BR2_STATIC_LIBS # avahi
 	select BR2_PACKAGE_AVAHI
 	select BR2_PACKAGE_AVAHI_DAEMON
 	select BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY # runtime
@@ -15,4 +15,4 @@ config BR2_PACKAGE_LIBSHAIRPLAY
 
 comment "libshairplay needs a toolchain w/ IPv6, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
+	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libubox/Config.in b/package/libubox/Config.in
index d458067..25ef4bb 100644
--- a/package/libubox/Config.in
+++ b/package/libubox/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBUBOX
 	bool "libubox"
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	help
 	  This library originates from the OpenWrt project to
 	  handle the configuration file infrastructure, but can
@@ -10,4 +10,4 @@ config BR2_PACKAGE_LIBUBOX
 	  http://nbd.name/gitweb.cgi?p=luci2/libubox.git;a=summary
 
 comment "libubox needs a toolchain w/ dynamic library"
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
diff --git a/package/libuci/Config.in b/package/libuci/Config.in
index 761ae6e..2f4ad40 100644
--- a/package/libuci/Config.in
+++ b/package/libuci/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBUCI
 	bool "libuci"
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBUBOX
 	help
 	  This library originates from the OpenWrt project to
@@ -13,4 +13,4 @@ config BR2_PACKAGE_LIBUCI
 	  http://wiki.openwrt.org/doc/techref/uci
 
 comment "libuci needs a toolchain w/ dynamic library"
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
diff --git a/package/libva-intel-driver/Config.in b/package/libva-intel-driver/Config.in
index a0f397b..2e4ba52 100644
--- a/package/libva-intel-driver/Config.in
+++ b/package/libva-intel-driver/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_LIBVA_INTEL_DRIVER
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm/libpthread-stubs
 	depends on BR2_LARGEFILE # libdrm
-	depends on !BR2_PREFER_STATIC_LIB # libva
+	depends on !BR2_STATIC_LIBS # libva
 	help
 	  VA-API back-end driver for Intel graphics chips
 
@@ -17,5 +17,5 @@ config BR2_PACKAGE_LIBVA_INTEL_DRIVER
 
 comment "libva intel driver needs a toolchain w/ largefile, threads, dynamic library"
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_PREFER_STATIC_LIB
+		BR2_STATIC_LIBS
 	depends on BR2_i386 || BR2_x86_64
diff --git a/package/libva/Config.in b/package/libva/Config.in
index 05369c5..d3308f8 100644
--- a/package/libva/Config.in
+++ b/package/libva/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_LIBVA
 	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_XORG7
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm/libpthread-stubs
 	depends on BR2_LARGEFILE # libdrm
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	help
 	  The main motivation for VA-API (Video Acceleration API) is to enable
 	  hardware accelerated video decode/encode at various entry-points (VLD,
@@ -17,4 +17,4 @@ config BR2_PACKAGE_LIBVA
 
 comment "libva needs a toolchain w/ largefile, threads, dynamic library"
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_PREFER_STATIC_LIB
+		BR2_STATIC_LIBS
diff --git a/package/linux-pam/Config.in b/package/linux-pam/Config.in
index c2cfdc0..6b92886 100644
--- a/package/linux-pam/Config.in
+++ b/package/linux-pam/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_LINUX_PAM
 	# modules. See
 	# https://lists.fedorahosted.org/pipermail/linux-pam-commits/2012-February/000105.html
 	# for details.
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	help
 	  A Security Framework that Provides Authentication for Applications
 
@@ -17,4 +17,4 @@ config BR2_PACKAGE_LINUX_PAM
 
 comment "linux-pam needs a toolchain w/ wchar, locale, dynamic library"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
-		|| BR2_PREFER_STATIC_LIB
+		|| BR2_STATIC_LIBS
diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index b923388..bb39124 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -13,7 +13,7 @@ LIVE555_INSTALL_STAGING = YES
 
 LIVE555_CFLAGS = $(TARGET_CFLAGS)
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 LIVE555_CONFIG_TARGET = linux
 LIVE555_LIBRARY_LINK = $(TARGET_AR) cr
 else
diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index 3bd111e..a79977f 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -25,7 +25,7 @@ LM_SENSORS_MAKE_OPTS = \
 	MACHINE=$(KERNEL_ARCH) \
 	PREFIX=/usr
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 LM_SENSORS_MAKE_OPTS += BUILD_SHARED_LIB=0
 else
 LM_SENSORS_MAKE_OPTS += BUILD_SHARED_LIB=1
diff --git a/package/lockdev/lockdev.mk b/package/lockdev/lockdev.mk
index 21755e0..59561ba 100644
--- a/package/lockdev/lockdev.mk
+++ b/package/lockdev/lockdev.mk
@@ -12,7 +12,7 @@ LOCKDEV_LICENSE = LGPLv2.1
 LOCKDEV_LICENSE_FILES = LICENSE
 LOCKDEV_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 define LOCKDEV_BUILD_CMDS
 	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D) static
 endef
@@ -21,7 +21,7 @@ define LOCKDEV_INSTALL_STAGING_CMDS
 	$(MAKE1) basedir=$(STAGING_DIR)/usr -C $(@D) install_dev
 endef
 
-else # BR2_PREFER_STATIC_LIB
+else # BR2_STATIC_LIBS
 
 define LOCKDEV_BUILD_CMDS
 	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D) static shared
@@ -37,6 +37,6 @@ define LOCKDEV_INSTALL_TARGET_CMDS
 	$(MAKE1) basedir=$(TARGET_DIR)/usr -C $(@D) install_run
 	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(TARGET_DIR)/usr/lib/liblockdev.so.1
 endef
-endif # BR2_PREFER_STATIC_LIB
+endif # BR2_STATIC_LIBS
 
 $(eval $(generic-package))
diff --git a/package/log4cxx/Config.in b/package/log4cxx/Config.in
index bc14226..40c7df9 100644
--- a/package/log4cxx/Config.in
+++ b/package/log4cxx/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_LOG4CXX
 	select BR2_PACKAGE_APR
 	select BR2_PACKAGE_APR_UTIL
 	# apr really needs shared library support
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # apr
@@ -15,5 +15,5 @@ config BR2_PACKAGE_LOG4CXX
 
 comment "log4cxx needs a toolchain w/ C++, threads, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_PREFER_STATIC_LIB
+		BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
diff --git a/package/ltrace/Config.in b/package/ltrace/Config.in
index 08edd45..56e4402 100644
--- a/package/ltrace/Config.in
+++ b/package/ltrace/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_LTRACE
 	select BR2_PACKAGE_ELFUTILS
 	depends on BR2_LARGEFILE # elfutils
 	depends on BR2_USE_WCHAR # elfutils
-	depends on !BR2_PREFER_STATIC_LIB # elfutils
+	depends on !BR2_STATIC_LIBS # elfutils
 	help
 	  Debugging program which runs a specified command until it exits.
 	  While the command is executing, ltrace intercepts and records
@@ -19,4 +19,4 @@ config BR2_PACKAGE_LTRACE
 	  http://ltrace.org
 
 comment "ltrace needs toolchain w/ largefile, wchar, dynamic library"
-	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB
+	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_STATIC_LIBS
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index b88f1e2..f1164ec 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -29,7 +29,7 @@ LUA_CFLAGS += -D_FILE_OFFSET_BITS=32
 endif
 endif
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 	LUA_BUILDMODE = static
 else
 	LUA_BUILDMODE = dynamic
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 85e9f15..b8d8392 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -18,7 +18,7 @@ ifneq ($(BR2_LARGEFILE),y)
 LUAJIT_NO_LARGEFILE = TARGET_LFSFLAGS=
 endif
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 LUAJIT_BUILDMODE = static
 else
 LUAJIT_BUILDMODE = dynamic
diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index 1251fae..4f9ad1d 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_LVM2
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # needs fork()
-	depends on !BR2_PREFER_STATIC_LIB # It fails to build statically
+	depends on !BR2_STATIC_LIBS # It fails to build statically
 	help
 	  This is LVM2, the rewrite of The Linux Logical Volume Manager.
 	  LVM supports enterprise level volume management of disk and disk
@@ -37,5 +37,5 @@ endif
 
 comment "lvm2 needs a toolchain w/ largefile, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || BR2_PREFER_STATIC_LIB || \
+	depends on !BR2_LARGEFILE || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index 761ce4d..38e10d8 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -10,7 +10,7 @@ LZ4_INSTALL_STAGING = YES
 LZ4_LICENSE = BSD-2c
 LZ4_LICENSE_FILES = LICENSE
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 define LZ4_DISABLE_SHARED
 	$(SED) '/SHARED/d' $(@D)/Makefile
 endef
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 74ebbed..eb977b6 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -62,9 +62,9 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
 	  infrastructure.
 
 comment "DRI drivers needs X.Org and a toolchain w/ dynamic library"
-	depends on BR2_PREFER_STATIC_LIB || !BR2_PACKAGE_XORG7
+	depends on BR2_STATIC_LIBS || !BR2_PACKAGE_XORG7
 
-if !BR2_PREFER_STATIC_LIB && BR2_PACKAGE_XORG7
+if !BR2_STATIC_LIBS && BR2_PACKAGE_XORG7
 
 comment "DRI drivers"
 
@@ -99,7 +99,7 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
 	help
 	  Legacy Radeon driver for R100 series GPUs.
 
-endif # !BR2_PREFER_STATIC_LIB && BR2_PACKAGE_XORG7
+endif # !BR2_STATIC_LIBS && BR2_PACKAGE_XORG7
 
 if BR2_PACKAGE_MESA3D_DRIVER
 
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 8dfad6c..f57012b 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -47,7 +47,7 @@ MESA3D_CONF_OPTS += \
 	--disable-xa
 endif
 
-ifeq ($(BR2_PREFER_STATIC_LIB),)
+ifeq ($(BR2_STATIC_LIBS),)
 # fix for "configure: error: Cannot use static libraries for DRI drivers"
 MESA3D_CONF_OPTS += --disable-static
 endif
diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index 9e997f3..bcbe5fa 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -14,7 +14,7 @@ MINIDLNA_DEPENDENCIES = \
 	ffmpeg flac libvorbis libogg libid3tag libexif libjpeg sqlite \
 	host-xutil_makedepend
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 # the configure script / Makefile forgets to link with some of the dependent
 # libraries breaking static linking, so help it along
 MINIDLNA_CONF_ENV = \
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 1d38b1a..edb4169 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -257,7 +257,7 @@ comment "Miscellaneous plugins"
 
 config BR2_PACKAGE_MPD_AVAHI_SUPPORT
 	bool "avahi (zeroconf) support"
-	depends on !BR2_PREFER_STATIC_LIB # avahi
+	depends on !BR2_STATIC_LIBS # avahi
 	select BR2_PACKAGE_AVAHI
 	select BR2_PACKAGE_AVAHI_DAEMON
 	select BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY
@@ -267,7 +267,7 @@ config BR2_PACKAGE_MPD_AVAHI_SUPPORT
 	  MPD to publish service information on a local network.
 
 comment "avahi support needs a toolchain w/ dynamic library"
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
 
 config BR2_PACKAGE_MPD_TCP
 	bool "tcp sockets"
diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index 47b5198..2d8e630 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -15,7 +15,7 @@ MSMTP_DEPENDENCIES += host-pkgconf
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MSMTP_CONF_OPTS += --with-ssl=openssl
 MSMTP_DEPENDENCIES += openssl
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 # openssl uses zlib, so we need to explicitly link with it when static
 MSMTP_CONF_ENV += LIBS=-lz
 endif
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index e7bd967..1ce3818 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -15,7 +15,7 @@ NCURSES_LICENSE_FILES = README
 NCURSES_CONFIG_SCRIPTS = ncurses$(NCURSES_LIB_SUFFIX)5-config
 
 NCURSES_CONF_OPTS = \
-	$(if $(BR2_PREFER_STATIC_LIB),--without-shared,--with-shared) \
+	$(if $(BR2_STATIC_LIBS),--without-shared,--with-shared) \
 	--without-cxx \
 	--without-cxx-binding \
 	--without-ada \
@@ -40,7 +40,7 @@ ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
 NCURSES_CONF_OPTS += --enable-widec
 NCURSES_LIB_SUFFIX = w
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 define NCURSES_LINK_LIBS
 	for lib in $(NCURSES_LIBS-y); do \
 		ln -sf $${lib}$(NCURSES_LIB_SUFFIX).a \
@@ -88,7 +88,7 @@ define NCURSES_BUILD_CMDS
 	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR)
 endef
 
-ifneq ($(BR2_PREFER_STATIC_LIB),y)
+ifneq ($(BR2_STATIC_LIBS),y)
 define NCURSES_INSTALL_TARGET_LIBS
 	for lib in $(NCURSES_LIBS-y); do \
 		cp -dpf $(NCURSES_DIR)/lib/$${lib}$(NCURSES_LIB_SUFFIX).so* \
diff --git a/package/ne10/ne10.mk b/package/ne10/ne10.mk
index cb635e4..b1897c8 100644
--- a/package/ne10/ne10.mk
+++ b/package/ne10/ne10.mk
@@ -11,7 +11,7 @@ NE10_LICENSE_FILES = doc/LICENSE
 
 NE10_CONF_OPTS = -DGNULINUX_PLATFORM=ON
 
-ifeq ($(BR2_PREFER_STATIC_LIB),)
+ifeq ($(BR2_STATIC_LIBS),)
 NE10_CONF_OPTS += \
 	-DNE10_BUILD_SHARED=ON
 endif
@@ -19,7 +19,7 @@ endif
 # The package does not have any install target, so have to provide
 # INSTALL_STAGING_CMDS and INSTALL_TARGET_CMDS.
 
-ifeq ($(BR2_PREFER_STATIC_LIB),)
+ifeq ($(BR2_STATIC_LIBS),)
 define NE10_INSTALL_STAGING_SHARED_LIB
 	cp -dpf $(@D)/modules/libNE10*.so* $(STAGING_DIR)/usr/lib/
 endef
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index d20ce50..6148fb3 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -42,7 +42,7 @@ ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	NETSNMP_DEPENDENCIES += openssl
 	NETSNMP_CONF_OPTS += \
 		--with-openssl=$(STAGING_DIR)/usr/include/openssl
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 	# openssl uses zlib, so we need to explicitly link with it when static
 	NETSNMP_CONF_ENV += LIBS=-lz
 endif
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 16d7c6f..6c26d4d 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -13,10 +13,10 @@ NFTABLES_LICENSE = GPLv2
 NFTABLES_LICENSE_FILES = COPYING
 
 NFTABLES_LIBS = -lncurses
-ifeq ($(BR2_PREFER_STATIC_LIB)$(BR2_PACKAGE_LIBNFTNL_JSON),yy)
+ifeq ($(BR2_STATIC_LIBS)$(BR2_PACKAGE_LIBNFTNL_JSON),yy)
 NFTABLES_LIBS += -ljansson -lm
 endif
-ifeq ($(BR2_PREFER_STATIC_LIB)$(BR2_PACKAGE_LIBNFTNL_XML),yy)
+ifeq ($(BR2_STATIC_LIBS)$(BR2_PACKAGE_LIBNFTNL_XML),yy)
 NFTABLES_LIBS += -lmxml -lpthread
 endif
 
diff --git a/package/ngrep/ngrep.mk b/package/ngrep/ngrep.mk
index eb63e17..f2fcb73 100644
--- a/package/ngrep/ngrep.mk
+++ b/package/ngrep/ngrep.mk
@@ -12,7 +12,7 @@ NGREP_LICENSE_FILES = LICENSE.txt
 NGREP_INSTALL_STAGING = YES
 
 NGREP_LIBS = -lpcap -lpcre
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 NGREP_LIBS += $(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)
 endif
 NGREP_CONF_ENV += LIBS+="$(NGREP_LIBS)"
diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
index 25d3b73..d31f55a 100644
--- a/package/omniorb/omniorb.mk
+++ b/package/omniorb/omniorb.mk
@@ -44,7 +44,7 @@ ifeq ($(BR2_PACKAGE_OMNIORB_WITH_APPS),y)
 OMNIORB_POST_PATCH_HOOKS += OMNIORB_ENABLE_EXTRA_APPS
 endif
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 define OMNIORB_DISABLE_SHARED
 	echo "BuildSharedLibrary =" >> $(@D)/mk/beforeauto.mk
 endef
diff --git a/package/openobex/Config.in b/package/openobex/Config.in
index b52f757..367caa6 100644
--- a/package/openobex/Config.in
+++ b/package/openobex/Config.in
@@ -12,7 +12,7 @@ if BR2_PACKAGE_OPENOBEX
 config BR2_PACKAGE_OPENOBEX_BLUEZ
 	bool "enable bluez support"
 	depends on !BR2_avr32
-	depends on !BR2_PREFER_STATIC_LIB # bluez_utils
+	depends on !BR2_STATIC_LIBS # bluez_utils
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib, libglib2
 	depends on BR2_USE_MMU # dbus
@@ -20,7 +20,7 @@ config BR2_PACKAGE_OPENOBEX_BLUEZ
 
 comment "bluez support needs a toolchain w/ wchar, threads, dynamic library"
 	depends on !BR2_avr32 && BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_OPENOBEX_LIBUSB
 	bool "enable libusb support"
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index fe7ebf2..5dc937a 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -80,14 +80,14 @@ define OPENSSL_CONFIGURE_CMDS
 			--openssldir=/etc/ssl \
 			--libdir=/lib \
 			$(if $(BR2_TOOLCHAIN_HAS_THREADS),threads,no-threads) \
-			$(if $(BR2_PREFER_STATIC_LIB),no-shared,shared) \
+			$(if $(BR2_STATIC_LIBS),no-shared,shared) \
 			no-idea \
 			no-rc5 \
 			enable-camellia \
 			enable-mdc2 \
 			enable-tlsext \
-			$(if $(BR2_PREFER_STATIC_LIB),zlib,zlib-dynamic) \
-			$(if $(BR2_PREFER_STATIC_LIB),no-dso) \
+			$(if $(BR2_STATIC_LIBS),zlib,zlib-dynamic) \
+			$(if $(BR2_STATIC_LIBS),no-dso) \
 	)
 	$(SED) "s:-march=[-a-z0-9] ::" -e "s:-mcpu=[-a-z0-9] ::g" $(@D)/Makefile
 	$(SED) "s:-O[0-9]:$(OPENSSL_CFLAGS):" $(@D)/Makefile
@@ -117,7 +117,7 @@ define OPENSSL_INSTALL_TARGET_CMDS
 endef
 
 # libdl has no business in a static build
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 define OPENSSL_FIXUP_STATIC_PKGCONFIG
 	$(SED) 's/-ldl//' $(STAGING_DIR)/usr/lib/pkgconfig/libcrypto.pc
 	$(SED) 's/-ldl//' $(STAGING_DIR)/usr/lib/pkgconfig/libssl.pc
@@ -126,7 +126,7 @@ endef
 OPENSSL_POST_INSTALL_STAGING_HOOKS += OPENSSL_FIXUP_STATIC_PKGCONFIG
 endif
 
-ifneq ($(BR2_PREFER_STATIC_LIB),y)
+ifneq ($(BR2_STATIC_LIBS),y)
 # libraries gets installed read only, so strip fails
 define OPENSSL_INSTALL_FIXUPS_SHARED
 	chmod +w $(TARGET_DIR)/usr/lib/engines/lib*.so
diff --git a/package/openvmtools/Config.in b/package/openvmtools/Config.in
index b0bdd52..5fc6977 100644
--- a/package/openvmtools/Config.in
+++ b/package/openvmtools/Config.in
@@ -45,12 +45,12 @@ config BR2_PACKAGE_OPENVMTOOLS_PAM
 	select BR2_PACKAGE_LINUX_PAM
 	# linux-pam needs locale and wchar, but we already have this
 	# dependency on the main symbol, above.
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	help
 	  Support for PAM in openvmtools
 
 comment "PAM support needs a toolchain w/ dynamic library"
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
 
 endif
 
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index e0dba35..bb19762 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -11,7 +11,7 @@ OPENVPN_DEPENDENCIES = host-pkgconf
 OPENVPN_LICENSE = GPLv2
 OPENVPN_LICENSE_FILES = COPYRIGHT.GPL
 OPENVPN_CONF_OPTS = --disable-plugin-auth-pam --enable-iproute2 \
-	$(if $(BR2_PREFER_STATIC_LIB),--disable-plugins)
+	$(if $(BR2_STATIC_LIBS),--disable-plugins)
 OPENVPN_CONF_ENV = IFCONFIG=/sbin/ifconfig \
 	NETSTAT=/bin/netstat \
 	ROUTE=/sbin/route
diff --git a/package/p11-kit/Config.in b/package/p11-kit/Config.in
index 2640a32..a6b7261 100644
--- a/package/p11-kit/Config.in
+++ b/package/p11-kit/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_P11_KIT
 	bool "p11-kit"
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBFFI
@@ -14,4 +14,4 @@ config BR2_PACKAGE_P11_KIT
 
 comment "p11-kit needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/parted/parted.mk b/package/parted/parted.mk
index ab2c456..dc7ff2b 100644
--- a/package/parted/parted.mk
+++ b/package/parted/parted.mk
@@ -29,7 +29,7 @@ else
 PARTED_CONF_OPTS += --disable-device-mapper
 endif
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 PARTED_CONF_OPTS += --disable-dynamic-loading
 endif
 
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 2eefdc5..c1aa6b5 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -27,7 +27,7 @@ else
 	PCIUTILS_KMOD = no
 endif
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 	PCIUTILS_SHARED=no
 else
 	PCIUTILS_SHARED=yes
diff --git a/package/pcsc-lite/Config.in b/package/pcsc-lite/Config.in
index bd715be..658ebe3 100644
--- a/package/pcsc-lite/Config.in
+++ b/package/pcsc-lite/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_PCSC_LITE
 	bool "pcsc-lite"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	help
 	  Middleware to access smart card using SCard API (PC/SC).
 
@@ -31,4 +31,4 @@ endif
 
 comment "pcsc-lite needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/perl-gd/Config.in b/package/perl-gd/Config.in
index 7c85cfc..61f7e5d 100644
--- a/package/perl-gd/Config.in
+++ b/package/perl-gd/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_GD
 	bool "perl-gd"
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_FREETYPE
@@ -11,4 +11,4 @@ config BR2_PACKAGE_PERL_GD
 	  https://metacpan.org/release/GD
 
 comment "perl-gd needs a toolchain w/ dynamic library"
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-gdgraph/Config.in b/package/perl-gdgraph/Config.in
index e722c06..10b3cd0 100644
--- a/package/perl-gdgraph/Config.in
+++ b/package/perl-gdgraph/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_GDGRAPH
 	bool "perl-gdgraph"
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_PERL_GD
 	select BR2_PACKAGE_PERL_GDTEXTUTIL
 	help
@@ -9,4 +9,4 @@ config BR2_PACKAGE_PERL_GDGRAPH
 	  https://metacpan.org/release/GDGraph
 
 comment "perl-gdgraph needs a toolchain w/ dynamic library"
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-io-socket-ssl/Config.in b/package/perl-io-socket-ssl/Config.in
index c8d038a..d24e568 100644
--- a/package/perl-io-socket-ssl/Config.in
+++ b/package/perl-io-socket-ssl/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_IO_SOCKET_SSL
 	bool "perl-io-socket-ssl"
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_PERL_NET_SSLEAY
 	help
 	  Nearly transparent SSL encapsulation for IO::Socket::INET.
@@ -8,4 +8,4 @@ config BR2_PACKAGE_PERL_IO_SOCKET_SSL
 	  https://github.com/noxxi/p5-io-socket-ssl
 
 comment "perl-io-socket-ssl needs a toolchain w/ dynamic library"
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-net-ssleay/Config.in b/package/perl-net-ssleay/Config.in
index 7cc5157..80178e0 100644
--- a/package/perl-net-ssleay/Config.in
+++ b/package/perl-net-ssleay/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_NET_SSLEAY
 	bool "perl-net-ssleay"
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Perl extension for using OpenSSL
@@ -8,4 +8,4 @@ config BR2_PACKAGE_PERL_NET_SSLEAY
 	  https://metacpan.org/release/Net-SSLeay
 
 comment "perl-net-ssleay needs a toolchain w/ dynamic library"
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-xml-libxml/Config.in b/package/perl-xml-libxml/Config.in
index 639a1e4..44fe710 100644
--- a/package/perl-xml-libxml/Config.in
+++ b/package/perl-xml-libxml/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_XML_LIBXML
 	bool "perl-xml-libxml"
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_PERL_XML_NAMESPACESUPPORT
@@ -11,4 +11,4 @@ config BR2_PACKAGE_PERL_XML_LIBXML
 	  https://bitbucket.org/shlomif/perl-xml-libxml
 
 comment "perl-xml-libxml needs a toolchain w/ dynamic library"
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 06855ab..b1f2101 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -69,7 +69,7 @@ ifeq ($(shell expr $(PERL_VERSION_MAJOR) % 2), 1)
 PERL_CONF_OPTS += -Dusedevel
 endif
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 PERL_CONF_OPTS += --all-static --no-dynaloader
 endif
 
diff --git a/package/phidgetwebservice/Config.in b/package/phidgetwebservice/Config.in
index df41d2a..db7577d 100644
--- a/package/phidgetwebservice/Config.in
+++ b/package/phidgetwebservice/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PHIDGETWEBSERVICE
 	bool "phidgetwebservice"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb, libphidget
-	depends on !BR2_PREFER_STATIC_LIB # libphidget
+	depends on !BR2_STATIC_LIBS # libphidget
 	select BR2_PACKAGE_LIBPHIDGET
 	help
 	  phidgetwebservice (the Phidget WebService) provides an HTTP
@@ -18,4 +18,4 @@ config BR2_PACKAGE_PHIDGETWEBSERVICE
 
 comment "phidgetwebservice needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
diff --git a/package/php/php.mk b/package/php/php.mk
index ae959db..d5b769f 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -31,7 +31,7 @@ PHP_CONFIG_SCRIPTS = php-config
 PHP_CFLAGS = $(TARGET_CFLAGS)
 
 # We need to force dl "detection"
-ifeq ($(BR2_PREFER_STATIC_LIB),)
+ifeq ($(BR2_STATIC_LIBS),)
 PHP_CONF_ENV += ac_cv_func_dlopen=yes ac_cv_lib_dl_dlopen=yes
 PHP_EXTRA_LIBS += -ldl
 else
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index c8735ef..9cf1ee1 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -73,7 +73,7 @@ define $(2)_CONFIGURE_CMDS
 		-DBUILD_TEST=OFF \
 		-DBUILD_TESTS=OFF \
 		-DBUILD_TESTING=OFF \
-		-DBUILD_SHARED_LIBS=$$(if $$(BR2_PREFER_STATIC_LIB),OFF,ON) \
+		-DBUILD_SHARED_LIBS=$$(if $$(BR2_STATIC_LIBS),OFF,ON) \
 		-DUSE_CCACHE=$$(if $$(BR2_CCACHE),ON,OFF) \
 		$$($$(PKG)_CONF_OPTS) \
 	)
diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index c961536..a27c084 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -35,7 +35,7 @@ endef
 PKGCONF_POST_INSTALL_TARGET_HOOKS += PKGCONF_LINK_PKGCONFIG
 HOST_PKGCONF_POST_INSTALL_HOOKS += HOST_PKGCONF_INSTALL_WRAPPER
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 	HOST_PKGCONF_POST_INSTALL_HOOKS += HOST_PKGCONF_STATIC
 else
 	HOST_PKGCONF_POST_INSTALL_HOOKS += HOST_PKGCONF_SHARED
diff --git a/package/pppd/Config.in b/package/pppd/Config.in
index a110513..b77d7b0 100644
--- a/package/pppd/Config.in
+++ b/package/pppd/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PPPD
 	bool "pppd"
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
 	help
 	  An implementation of the Point-to-point protocol.
@@ -25,5 +25,5 @@ config BR2_PACKAGE_PPPD_RADIUS
 endif
 
 comment "pppd needs a toolchain w/ dynamic library"
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
diff --git a/package/proxychains-ng/Config.in b/package/proxychains-ng/Config.in
index f2a272f..1f89b13 100644
--- a/package/proxychains-ng/Config.in
+++ b/package/proxychains-ng/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_PROXYCHAINS_NG
 	bool "proxychains-ng"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	help
 	  Force any tcp connections to flow through a proxy (or proxy chain)
 
 	  https://github.com/rofl0r/proxychains
 
 comment "proxychains-ng needs a toolchain w/ threads, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/ptpd2/ptpd2.mk b/package/ptpd2/ptpd2.mk
index a4e9654..d1d2c41 100644
--- a/package/ptpd2/ptpd2.mk
+++ b/package/ptpd2/ptpd2.mk
@@ -13,7 +13,7 @@ PTPD2_AUTORECONF = YES
 PTPD2_LICENSE = BSD-2c
 PTPD2_LICENSE_FILES = COPYRIGHT
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 	PTPD2_CONF_OPTS += LIBS="$(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)"
 endif
 
diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index 100c3d9..5dbcaae 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -25,7 +25,7 @@ endif
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 PURE_FTPD_CONF_OPTS += --with-tls
 PURE_FTPD_DEPENDENCIES += openssl
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 PURE_FTPD_CONF_ENV += LIBS='-lssl -lcrypto -lz'
 endif
 else
diff --git a/package/qdecoder/Config.in b/package/qdecoder/Config.in
index edc4d34..4873877 100644
--- a/package/qdecoder/Config.in
+++ b/package/qdecoder/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_QDECODER
 	bool "qdecoder"
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	help
 	  qDecoder is a simple and powerful CGI library
 	  for the C/C++ programming language.
diff --git a/package/qhull/Config.in b/package/qhull/Config.in
index 4f172bd..f671e88 100644
--- a/package/qhull/Config.in
+++ b/package/qhull/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_QHULL
 	bool "qhull"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	help
 	  Qhull computes the convex hull, Delaunay triangulation,
 	  Voronoi diagram, halfspace intersection about a point,
@@ -16,4 +16,4 @@ config BR2_PACKAGE_QHULL
 
 comment "qhull needs a toolchain w/ C++, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
diff --git a/package/qlibc/Config.in b/package/qlibc/Config.in
index 184c283..c6d4f39 100644
--- a/package/qlibc/Config.in
+++ b/package/qlibc/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_QLIBC
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	help
 	  qLibc is currently one of the most functionally complete
 	  public licensed C/C++ libraries.  The C/C++ library which
@@ -14,4 +14,4 @@ config BR2_PACKAGE_QLIBC
 	  https://github.com/wolkykim/qlibc
 
 comment "qlibc needs a toolchain w/ threads, wchar, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || BR2_STATIC_LIBS
diff --git a/package/qt/Config.in b/package/qt/Config.in
index 665725e..543d807 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -48,7 +48,7 @@ choice
 
 config BR2_PACKAGE_QT_SHARED
 	bool "Shared library"
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	help
 	  Create and use shared Qt libraries.
 	  If you have multiple programs that depend on Qt or intend to use
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 6ea7301..7b334b4 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -251,12 +251,12 @@ config BR2_PACKAGE_QT5BASE_ICU
 
 config BR2_PACKAGE_QT5BASE_TSLIB
 	bool "Enable Tslib support"
-	depends on !BR2_PREFER_STATIC_LIB # dlopen
+	depends on !BR2_STATIC_LIBS # dlopen
 	select BR2_PACKAGE_TSLIB
 	help
 	  This options enables the Tslib plugin
 
 comment "tslib support needs a toolchain w/ dynamic library"
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
 
 endif
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 57ea1c8..e03dabc 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -34,7 +34,7 @@ else
 QT5BASE_CONFIGURE_OPTS += -release
 endif
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 QT5BASE_CONFIGURE_OPTS += -static
 else
 # We apparently can't build both the shared and static variants of the
@@ -236,7 +236,7 @@ define QT5BASE_INSTALL_TARGET_EXAMPLES
 	fi
 endef
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 define QT5BASE_INSTALL_TARGET_CMDS
 	$(QT5BASE_INSTALL_TARGET_FONTS)
 	$(QT5BASE_INSTALL_TARGET_EXAMPLES)
diff --git a/package/qt5/qt5connectivity/Config.in b/package/qt5/qt5connectivity/Config.in
index 20778dc..de660ca 100644
--- a/package/qt5/qt5connectivity/Config.in
+++ b/package/qt5/qt5connectivity/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_QT5CONNECTIVITY
 	select BR2_PACKAGE_QT5BASE_CONCURRENT
 	select BR2_PACKAGE_QT5BASE_DBUS
 	depends on !BR2_avr32 # bluez_utils
-	depends on !BR2_PREFER_STATIC_LIB # bluez_utils
+	depends on !BR2_STATIC_LIBS # bluez_utils
 	depends on BR2_USE_WCHAR # bluez_utils
 	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez_utils
 	depends on BR2_USE_MMU # bluez_utils
@@ -19,4 +19,4 @@ config BR2_PACKAGE_QT5CONNECTIVITY
 
 comment "qt5connectivity needs a toolchain w/ wchar, threads, dynamic library"
 	depends on !BR2_avr32 && BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index 34dd14a..1928801 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -34,7 +34,7 @@ define QT5DECLARATIVE_INSTALL_STAGING_CMDS
 	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
-ifeq ($(BR2_PREFER_STATIC_LIB),)
+ifeq ($(BR2_STATIC_LIBS),)
 
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
 define QT5DECLARATIVE_INSTALL_TARGET_QUICK_LIBS
diff --git a/package/qt5/qt5enginio/qt5enginio.mk b/package/qt5/qt5enginio/qt5enginio.mk
index c33a405..36b499b 100644
--- a/package/qt5/qt5enginio/qt5enginio.mk
+++ b/package/qt5/qt5enginio/qt5enginio.mk
@@ -47,7 +47,7 @@ define QT5ENGINIO_INSTALL_TARGET_EXAMPLES
 endef
 endif
 
-ifneq ($(BR2_PREFER_STATIC_LIB),y)
+ifneq ($(BR2_STATIC_LIBS),y)
 define QT5ENGINIO_INSTALL_TARGET_LIBS
 	cp -dpf $(STAGING_DIR)/usr/lib/libEnginio.so.* $(TARGET_DIR)/usr/lib
 endef
diff --git a/package/qt5/qt5imageformats/qt5imageformats.mk b/package/qt5/qt5imageformats/qt5imageformats.mk
index c4049c7..4126f9f 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.mk
+++ b/package/qt5/qt5imageformats/qt5imageformats.mk
@@ -30,7 +30,7 @@ define QT5IMAGEFORMATS_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
 endef
 
-ifeq ($(BR2_PREFER_STATIC_LIB),)
+ifeq ($(BR2_STATIC_LIBS),)
 define QT5IMAGEFORMATS_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/lib/qt/plugins/imageformats/*.so $(TARGET_DIR)/usr/lib/qt/plugins/imageformats/
 endef
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index da26c03..4588f48 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -39,7 +39,7 @@ define QT5MULTIMEDIA_INSTALL_STAGING_CMDS
 	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
-ifeq ($(BR2_PREFER_STATIC_LIB),)
+ifeq ($(BR2_STATIC_LIBS),)
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE),y)
 define QT5MULTIMEDIA_INSTALL_TARGET_QGSTTOOLS_LIB
 	cp -dpf $(STAGING_DIR)/usr/lib/libqgsttools*.so.* $(TARGET_DIR)/usr/lib
diff --git a/package/qt5/qt5quick1/Config.in b/package/qt5/qt5quick1/Config.in
index 32656be..c44a15f 100644
--- a/package/qt5/qt5quick1/Config.in
+++ b/package/qt5/qt5quick1/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_QT5QUICK1
 	select BR2_PACKAGE_QT5SCRIPT
 	select BR2_PACKAGE_QT5XMLPATTERNS
 	# This module does not support static linking
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	help
 	  Qt is a cross-platform application and UI framework for
@@ -19,4 +19,4 @@ config BR2_PACKAGE_QT5QUICK1
 
 comment "qt5quick1 needs a toolchain w/ dynamic library"
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
diff --git a/package/qt5/qt5script/qt5script.mk b/package/qt5/qt5script/qt5script.mk
index a80995c..18067fd 100644
--- a/package/qt5/qt5script/qt5script.mk
+++ b/package/qt5/qt5script/qt5script.mk
@@ -31,7 +31,7 @@ define QT5SCRIPT_INSTALL_STAGING_CMDS
 	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
-ifeq ($(BR2_PREFER_STATIC_LIB),)
+ifeq ($(BR2_STATIC_LIBS),)
 define QT5SCRIPT_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Script*.so.* $(TARGET_DIR)/usr/lib
 endef
diff --git a/package/qt5/qt5sensors/qt5sensors.mk b/package/qt5/qt5sensors/qt5sensors.mk
index 4cc0c99..2f6e567 100644
--- a/package/qt5/qt5sensors/qt5sensors.mk
+++ b/package/qt5/qt5sensors/qt5sensors.mk
@@ -35,7 +35,7 @@ define QT5SENSORS_INSTALL_STAGING_CMDS
 	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
-ifeq ($(BR2_PREFER_STATIC_LIB),)
+ifeq ($(BR2_STATIC_LIBS),)
 define QT5SENSORS_INSTALL_TARGET_LIBS
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Sensors.so.* $(TARGET_DIR)/usr/lib
 	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/sensor* $(TARGET_DIR)/usr/lib/qt/plugins
diff --git a/package/qt5/qt5serialport/qt5serialport.mk b/package/qt5/qt5serialport/qt5serialport.mk
index 719b647..9648ee2 100644
--- a/package/qt5/qt5serialport/qt5serialport.mk
+++ b/package/qt5/qt5serialport/qt5serialport.mk
@@ -31,7 +31,7 @@ define QT5SERIALPORT_INSTALL_STAGING_CMDS
 	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
-ifeq ($(BR2_PREFER_STATIC_LIB),)
+ifeq ($(BR2_STATIC_LIBS),)
 define QT5SERIALPORT_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5SerialPort.so.* $(TARGET_DIR)/usr/lib
 endef
diff --git a/package/qt5/qt5svg/qt5svg.mk b/package/qt5/qt5svg/qt5svg.mk
index a768acb..8f28540 100644
--- a/package/qt5/qt5svg/qt5svg.mk
+++ b/package/qt5/qt5svg/qt5svg.mk
@@ -37,7 +37,7 @@ define QT5SVG_INSTALL_ICONENGINES
 endef
 endif
 
-ifeq ($(BR2_PREFER_STATIC_LIB),)
+ifeq ($(BR2_STATIC_LIBS),)
 define QT5SVG_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Svg*.so.* $(TARGET_DIR)/usr/lib
 	cp -dpf $(STAGING_DIR)/usr/lib/qt/plugins/imageformats/libqsvg.so $(TARGET_DIR)/usr/lib/qt/plugins/imageformats/
diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
index 3a58566..25f0a85 100644
--- a/package/qt5/qt5webkit/Config.in
+++ b/package/qt5/qt5webkit/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_QT5WEBKIT
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_QT5BASE_XCB
 	select BR2_PACKAGE_XLIB_LIBXRENDER if BR2_PACKAGE_QT5BASE_XCB
 	# This module does not support static linking
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	help
 	  Qt is a cross-platform application and UI framework for
diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
index 7776414..e3c4cf3 100644
--- a/package/qt5/qt5websockets/qt5websockets.mk
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -47,7 +47,7 @@ define QT5WEBSOCKETS_INSTALL_TARGET_EXAMPLES
 endef
 endif
 
-ifneq ($(BR2_PREFER_STATIC_LIB),y)
+ifneq ($(BR2_STATIC_LIBS),y)
 define QT5WEBSOCKETS_INSTALL_TARGET_LIBS
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WebSockets.so.* $(TARGET_DIR)/usr/lib
 endef
diff --git a/package/qt5/qt5x11extras/qt5x11extras.mk b/package/qt5/qt5x11extras/qt5x11extras.mk
index fc4beda..1528e88 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.mk
+++ b/package/qt5/qt5x11extras/qt5x11extras.mk
@@ -31,7 +31,7 @@ define QT5X11EXTRAS_INSTALL_STAGING_CMDS
 	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
-ifeq ($(BR2_PREFER_STATIC_LIB),)
+ifeq ($(BR2_STATIC_LIBS),)
 define QT5X11EXTRAS_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5X11Extras.so.* $(TARGET_DIR)/usr/lib
 endef
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index b0d0b06..9f29aa2 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -31,7 +31,7 @@ define QT5XMLPATTERNS_INSTALL_STAGING_CMDS
 	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
-ifeq ($(BR2_PREFER_STATIC_LIB),)
+ifeq ($(BR2_STATIC_LIBS),)
 define QT5XMLPATTERNS_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5XmlPatterns*.so.* $(TARGET_DIR)/usr/lib
 endef
diff --git a/package/rsh-redone/Config.in b/package/rsh-redone/Config.in
index c8f2f51..00cbac5 100644
--- a/package/rsh-redone/Config.in
+++ b/package/rsh-redone/Config.in
@@ -14,13 +14,13 @@ config BR2_PACKAGE_RSH_REDONE_RLOGIN
 
 config BR2_PACKAGE_RSH_REDONE_RLOGIND
 	bool "rlogind"
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_ENABLE_LOCALE && BR2_USE_WCHAR
 	select BR2_PACKAGE_LINUX_PAM
 
 comment "rlogind needs a toolchain w/ wchar, locale, dynamic library"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
-		|| BR2_PREFER_STATIC_LIB
+		|| BR2_STATIC_LIBS
 
 config BR2_PACKAGE_RSH_REDONE_RSH
 	bool "rsh"
@@ -28,11 +28,11 @@ config BR2_PACKAGE_RSH_REDONE_RSH
 config BR2_PACKAGE_RSH_REDONE_RSHD
 	bool "rshd"
 	depends on BR2_ENABLE_LOCALE && BR2_USE_WCHAR
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LINUX_PAM
 
 comment "rshd needs a toolchain w/ wchar, locale, dynamic library"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
-		|| BR2_PREFER_STATIC_LIB
+		|| BR2_STATIC_LIBS
 
 endif
diff --git a/package/rtmpdump/rtmpdump.mk b/package/rtmpdump/rtmpdump.mk
index e8fd0b8..0e2eccc 100644
--- a/package/rtmpdump/rtmpdump.mk
+++ b/package/rtmpdump/rtmpdump.mk
@@ -29,7 +29,7 @@ endif
 
 RTMPDUMP_CFLAGS = $(TARGET_CFLAGS)
 
-ifneq ($(BR2_PREFER_STATIC_LIB),y)
+ifneq ($(BR2_STATIC_LIBS),y)
 RTMPDUMP_CFLAGS += -fPIC
 else
 RTMPDUMP_SHARED = "SHARED="
diff --git a/package/ruby/Config.in b/package/ruby/Config.in
index 2191204..141db90 100644
--- a/package/ruby/Config.in
+++ b/package/ruby/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_RUBY
 	bool "ruby"
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	help
 	  Object Oriented Scripting Language.
 
@@ -10,4 +10,4 @@ config BR2_PACKAGE_RUBY
 
 comment "ruby needs a toolchain w/ wchar, threads, dynamic library"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_PREFER_STATIC_LIB
+		BR2_STATIC_LIBS
diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index 6999535..9d70086 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -46,14 +46,14 @@ config BR2_PACKAGE_SCONESERVER_BLUETOOTH
 	depends on BR2_USE_MMU # bluez->dbus
 	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez->dbus, bluez->libglib2
 	depends on !BR2_avr32 # bluez_utils
-	depends on !BR2_PREFER_STATIC_LIB # bluez_utils
+	depends on !BR2_STATIC_LIBS # bluez_utils
 	select BR2_PACKAGE_BLUEZ_UTILS
 	help
 	  Bluetooth module for Sconeserver
 
 comment "bluetooth support needs a toolchain w/ wchar, threads, dynamic library"
 	depends on !BR2_avr32 && BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_SCONESERVER_RSS
 	bool "rss"
diff --git a/package/smack/Config.in b/package/smack/Config.in
index ffbe73c..67c70bb 100644
--- a/package/smack/Config.in
+++ b/package/smack/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_SMACK
 	bool "smack"
-	depends on !BR2_PREFER_STATIC_LIB # dlfcn.h
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 	help
@@ -31,5 +31,5 @@ config BR2_PACKAGE_SMACK
 	  https://github.com/smack-team/smack
 
 comment "smack needs a toolchain w/ dynamic library, threads, headers >= 3.0"
-	depends on BR2_PREFER_STATIC_LIB || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 \
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/snmppp/Config.in b/package/snmppp/Config.in
index ef217f7..9e800fd 100644
--- a/package/snmppp/Config.in
+++ b/package/snmppp/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_SNMPPP
 	bool "snmp++"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	help
 	  SNMP++v3.x is a C++ API which supports SNMP v1, v2c, and v3.
 
@@ -28,4 +28,4 @@ endif
 
 comment "snmp++ needs a toolchain w/ threads, C++, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_PREFER_STATIC_LIB
+		BR2_STATIC_LIBS
diff --git a/package/snowball-hdmiservice/Config.in b/package/snowball-hdmiservice/Config.in
index f43685f..21a4f3c 100644
--- a/package/snowball-hdmiservice/Config.in
+++ b/package/snowball-hdmiservice/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_SNOWBALL_HDMISERVICE
 	bool "snowball-hdmiservice"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	help
 	  HDMI userspace control daemon
 
@@ -11,4 +11,4 @@ config BR2_PACKAGE_SNOWBALL_HDMISERVICE
 	  http://www.igloocommunity.org
 
 comment "snowball-hdmiservice needs a toolchain w/ threads, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/snowball-init/Config.in b/package/snowball-init/Config.in
index d633d89..03d4752 100644
--- a/package/snowball-init/Config.in
+++ b/package/snowball-init/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_SNOWBALL_INIT
 	# Runtime dependency, needed by snowball startup script
 	select BR2_PACKAGE_BLUEZ_UTILS
 	depends on !BR2_avr32
-	depends on !BR2_PREFER_STATIC_LIB # bluez_utils
+	depends on !BR2_STATIC_LIBS # bluez_utils
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib, libglib2
 	depends on BR2_USE_MMU # dbus
@@ -15,4 +15,4 @@ config BR2_PACKAGE_SNOWBALL_INIT
 
 comment "snowball-init needs a toolchain w/ wchar, threads, dynamic library"
 	depends on !BR2_avr32 && BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/spice/Config.in b/package/spice/Config.in
index b95e32e..f1fcf69 100644
--- a/package/spice/Config.in
+++ b/package/spice/Config.in
@@ -50,14 +50,14 @@ comment "client needs a toolchain w/ threads, C++"
 config BR2_PACKAGE_SPICE_GUI
 	bool "Enable GUI"
 	depends on BR2_PACKAGE_SPICE_CLIENT
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_CEGUI06
 	help
 	  Say 'y' here to enable the Graphical User Interface (GUI)
 	  start dialog.
 
 comment "gui needs a toolchain w/ dynamic library"
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
 
 config BR2_PACKAGE_SPICE_TUNNEL
 	bool "Enable network redirection"
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index aba788e..14f2b1d 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -39,7 +39,7 @@ endif
 
 SQLITE_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) $(SQLITE_CFLAGS)"
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 SQLITE_CONF_OPTS += --enable-dynamic-extensions=no
 endif
 
diff --git a/package/sshfs/Config.in b/package/sshfs/Config.in
index aa7628d..43701a7 100644
--- a/package/sshfs/Config.in
+++ b/package/sshfs/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_SSHFS
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse, glib2
 	depends on BR2_USE_MMU # libfuse, glib2
-	depends on !BR2_PREFER_STATIC_LIB # libfuse
+	depends on !BR2_STATIC_LIBS # libfuse
 	help
 	  FUSE filesystem client based on the SSH File Transfer Protocol.
 
@@ -17,4 +17,4 @@ config BR2_PACKAGE_SSHFS
 
 comment "sshfs needs a toolchain w/ largefile, wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
+	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/stress/stress.mk b/package/stress/stress.mk
index b1536c0..4bb801e 100644
--- a/package/stress/stress.mk
+++ b/package/stress/stress.mk
@@ -15,12 +15,12 @@ STRESS_AUTORECONF = YES
 # SHARED_STATIC_LIBS_OPTS to tell packages to build static libraries,
 # if supported.
 #
-# If the BR2_PREFER_STATIC_LIB is not defined, we have to specify
+# If the BR2_STATIC_LIBS is not defined, we have to specify
 # --disable-static explicitly to get stress linked dynamically.
 #
 # Also, disable documentation by undefining makeinfo
 STRESS_CONF_OPTS = \
-	$(if $(BR2_PREFER_STATIC_LIB),,--disable-static) \
+	$(if $(BR2_STATIC_LIBS),,--disable-static) \
 	MAKEINFO=:
 
 $(eval $(autotools-package))
diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index d2cadf3..3b0f47f 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -92,7 +92,7 @@ if BR2_PACKAGE_STRONGSWAN_EAP
 
 config BR2_PACKAGE_STRONGSWAN_EAP_SIM_PCSC
 	bool "Enable EAP-SIM smart card backend"
-	depends on !BR2_PREFER_STATIC_LIB # pcsc-lite
+	depends on !BR2_STATIC_LIBS # pcsc-lite
 	select BR2_PACKAGE_PCSC_LITE
 
 endif
diff --git a/package/subversion/Config.in b/package/subversion/Config.in
index dc04bdb..776dad5 100644
--- a/package/subversion/Config.in
+++ b/package/subversion/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_SUBVERSION
 	select BR2_PACKAGE_APR
 	select BR2_PACKAGE_APR_UTIL
 	# apr really needs shared library support
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # apr
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_NEON
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 58f76a5..04b1952 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_SYSTEMD
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_INET_IPV6
-	depends on !BR2_PREFER_STATIC_LIB # kmod
+	depends on !BR2_STATIC_LIBS # kmod
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_HAS_UDEV
diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index 1acf7d9..dedeb70 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -16,7 +16,7 @@ TCPDUMP_DEPENDENCIES = zlib libpcap
 # Patching aclocal.m4
 TCPDUMP_AUTORECONF = YES
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 TCPDUMP_CONF_OPTS += LIBS="$(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)"
 endif
 
diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
index e14cb57..f8c3565 100644
--- a/package/thrift/thrift.mk
+++ b/package/thrift/thrift.mk
@@ -17,7 +17,7 @@ THRIFT_AUTORECONF = YES
 THRIFT_LICENSE = Apache-2.0
 THRIFT_LICENSE_FILES = LICENSE
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 # openssl uses zlib, so we need to explicitly link with it when static
 THRIFT_CONF_ENV += LIBS=-lz
 endif
diff --git a/package/tinyalsa/Config.in b/package/tinyalsa/Config.in
index 3021307..65c5a1a 100644
--- a/package/tinyalsa/Config.in
+++ b/package/tinyalsa/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_TINYALSA
 	bool "tinyalsa"
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	help
 	  a small library to interface with ALSA in the Linux kernel
 
@@ -14,4 +14,4 @@ config BR2_PACKAGE_TINYALSA
 	  https://github.com/tinyalsa/tinyalsa
 
 comment "tinyalsa needs toolchain w/ dynamic library"
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
diff --git a/package/trace-cmd/Config.in b/package/trace-cmd/Config.in
index 8b3bc5f..55f896f 100644
--- a/package/trace-cmd/Config.in
+++ b/package/trace-cmd/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_TRACE_CMD
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_avr32 # AVR32 does not have TLS support
 	depends on BR2_USE_MMU # fork()
-	depends on !BR2_PREFER_STATIC_LIB # dlopen()
+	depends on !BR2_STATIC_LIBS # dlopen()
 	help
 	  Command line reader for ftrace.
 
@@ -18,4 +18,4 @@ config BR2_PACKAGE_TRACE_CMD
 comment "trace-cmd needs a toolchain w/ largefile, threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_PREFER_STATIC_LIB
+		|| BR2_STATIC_LIBS
diff --git a/package/tslib/Config.in b/package/tslib/Config.in
index ee70807..050588e 100644
--- a/package/tslib/Config.in
+++ b/package/tslib/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_TSLIB
 	bool "tslib"
-	depends on !BR2_PREFER_STATIC_LIB # dlopen
+	depends on !BR2_STATIC_LIBS # dlopen
 	help
 	  Tslib is an abstraction layer for touchscreen panel events.
 
 	  https://github.com/kergoth/tslib
 
 comment "tslib needs a toolchain w/ dynamic library"
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 2d95ce1..2bb699f 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -398,7 +398,7 @@ endif
 # static/shared libs
 #
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 UCLIBC_SHARED_LIBS_CONFIG = $(call KCONFIG_DISABLE_OPT,HAVE_SHARED,$(@D)/.config)
 else
 UCLIBC_SHARED_LIBS_CONFIG = $(call KCONFIG_ENABLE_OPT,HAVE_SHARED,$(@D)/.config)
@@ -510,7 +510,7 @@ define UCLIBC_INSTALL_TARGET_CMDS
 endef
 
 # STATIC has no ld* tools, only getconf
-ifeq ($(BR2_PREFER_STATIC_LIB),)
+ifeq ($(BR2_STATIC_LIBS),)
 define UCLIBC_INSTALL_UTILS_STAGING
 	$(INSTALL) -D -m 0755 $(@D)/utils/ldd.host $(HOST_DIR)/usr/bin/ldd
 	ln -sf ldd $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-ldd
diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index 76505ff..3eb8bf0 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_UDISKS
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-glib -> glib2
 	depends on BR2_USE_MMU # lvm2
-	depends on !BR2_PREFER_STATIC_LIB # lvm2
+	depends on !BR2_STATIC_LIBS # lvm2
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
 	depends on BR2_USE_WCHAR # dbus-glib -> glib2
@@ -44,4 +44,4 @@ comment "udisks needs a toolchain w/ wchar, threads, dynamic library"
 	depends on !BR2_avr32
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_PREFER_STATIC_LIB
+		BR2_STATIC_LIBS
diff --git a/package/ulogd/Config.in b/package/ulogd/Config.in
index c792973..826a382 100644
--- a/package/ulogd/Config.in
+++ b/package/ulogd/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_ULOGD
 	bool "ulogd"
 	depends on BR2_INET_IPV6
 	depends on BR2_LARGEFILE
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
 	# ulog support removed for kernels >= 3.17
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
@@ -17,6 +17,6 @@ config BR2_PACKAGE_ULOGD
 	  http://www.netfilter.org/projects/ulogd/
 
 comment "ulogd needs a toolchain w/ IPv6, largefile, dynamic library"
-	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || BR2_PREFER_STATIC_LIB
+	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
diff --git a/package/unionfs/Config.in b/package/unionfs/Config.in
index de3d341..ff871d3 100644
--- a/package/unionfs/Config.in
+++ b/package/unionfs/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_UNIONFS
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
 	depends on BR2_USE_MMU # libfuse
-	depends on !BR2_PREFER_STATIC_LIB # libfuse
+	depends on !BR2_STATIC_LIBS # libfuse
 	help
 	  A userspace unionfs implementation.
 
@@ -12,4 +12,4 @@ config BR2_PACKAGE_UNIONFS
 
 comment "unionfs needs a toolchain w/ largefile, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/ushare/Config.in b/package/ushare/Config.in
index d961434..81140ce 100644
--- a/package/ushare/Config.in
+++ b/package/ushare/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_USHARE
 	# ushare has a completely custom configure script that does
 	# broken things with library ordering, which breaks static
 	# linking.
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	help
 	  uShare is a UPnP (TM) A/V & DLNA Media Server.
 	  It implements the server component that provides UPnP media devices
@@ -17,4 +17,4 @@ config BR2_PACKAGE_USHARE
 
 comment "ushare needs a toolchain w/ largefile, threads, dynamic library"
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_PREFER_STATIC_LIB
+		BR2_STATIC_LIBS
diff --git a/package/ussp-push/Config.in b/package/ussp-push/Config.in
index c8facef..c08acc9 100644
--- a/package/ussp-push/Config.in
+++ b/package/ussp-push/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_USSP_PUSH
 	bool "ussp-push"
 	depends on BR2_INET_IPV6
 	depends on !BR2_avr32
-	depends on !BR2_PREFER_STATIC_LIB # bluez_utils
+	depends on !BR2_STATIC_LIBS # bluez_utils
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib, libglib2
 	depends on BR2_USE_MMU # dbus
@@ -17,4 +17,4 @@ config BR2_PACKAGE_USSP_PUSH
 
 comment "ussp-push needs a toolchain w/ wchar, IPv6, threads, dynamic library"
 	depends on !BR2_avr32 && BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6 || BR2_PREFER_STATIC_LIB
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6 || BR2_STATIC_LIBS
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 07e1fbb..5dfd050 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -55,14 +55,14 @@ config BR2_PACKAGE_UTIL_LINUX_ARCH
 config BR2_PACKAGE_UTIL_LINUX_CHFN_CHSH
 	bool "chfn/chsh"
 	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LINUX_PAM
 	help
 	  Change login shell, real user name and information
 
 comment "chfn/chsh needs a toolchain w/ wchar, locale, dynamic library"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
-		|| BR2_PREFER_STATIC_LIB
+		|| BR2_STATIC_LIBS
 
 config BR2_PACKAGE_UTIL_LINUX_CRAMFS
 	bool "cramfs utilities"
@@ -99,14 +99,14 @@ config BR2_PACKAGE_UTIL_LINUX_KILL
 config BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS
 	bool "login utilities"
 	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LINUX_PAM
 	help
 	  Build login utilities (last, login, su, sulogin)
 
 comment "login utilities needs a toolchain w/ wchar, locale, dynamic library"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
-		|| BR2_PREFER_STATIC_LIB
+		|| BR2_STATIC_LIBS
 
 config BR2_PACKAGE_UTIL_LINUX_LOSETUP
 	bool "losetup"
diff --git a/package/vde2/Config.in b/package/vde2/Config.in
index 18ff2e4..f640a4a 100644
--- a/package/vde2/Config.in
+++ b/package/vde2/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_VDE2
 	bool "vde2"
 	depends on BR2_USE_MMU # fork()
-	depends on !BR2_PREFER_STATIC_LIB # dlopen()
+	depends on !BR2_STATIC_LIBS # dlopen()
 	help
 	  VDE is an ethernet compliant virtual network that can be
 	  spawned over a set of physical computers over the Internet.
@@ -11,4 +11,4 @@ config BR2_PACKAGE_VDE2
 
 comment "vde2 needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 19f1058..901f06d 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -45,7 +45,7 @@ VLC_CONF_OPTS += \
 	--disable-opencv
 
 # Building static and shared doesn't work, so force static off.
-ifeq ($(BR2_PREFER_STATIC_LIB),)
+ifeq ($(BR2_STATIC_LIBS),)
 VLC_CONF_OPTS += --disable-static
 endif
 
diff --git a/package/wayland/Config.in b/package/wayland/Config.in
index f90cda6..f58a283 100644
--- a/package/wayland/Config.in
+++ b/package/wayland/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_WAYLAND
 	bool "wayland"
 	depends on !BR2_avr32 # no epoll_create1, timerfd_create or timerfd_settime
-	depends on !BR2_PREFER_STATIC_LIB # dlfcn.h
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_EXPAT
@@ -14,4 +14,4 @@ config BR2_PACKAGE_WAYLAND
 
 comment "wayland needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_avr32
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/weston/Config.in b/package/weston/Config.in
index cf242d1..5fff5bd 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -2,7 +2,7 @@ comment "weston needs udev and a toolchain w/ threads, dynamic library, headers
 	depends on !BR2_avr32
 	depends on BR2_ARCH_HAS_ATOMICS
 	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 || BR2_PREFER_STATIC_LIB
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_WESTON
 	bool "weston"
@@ -15,7 +15,7 @@ config BR2_PACKAGE_WESTON
 	select BR2_PACKAGE_MTDEV
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on !BR2_avr32 # wayland
-	depends on !BR2_PREFER_STATIC_LIB # wayland
+	depends on !BR2_STATIC_LIBS # wayland
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 	depends on BR2_ARCH_HAS_ATOMICS # cairo
diff --git a/package/wireless_tools/Config.in b/package/wireless_tools/Config.in
index 0968fd3..e33af25 100644
--- a/package/wireless_tools/Config.in
+++ b/package/wireless_tools/Config.in
@@ -9,7 +9,7 @@ if BR2_PACKAGE_WIRELESS_TOOLS
 
 config BR2_PACKAGE_WIRELESS_TOOLS_LIB
 	bool "Install shared library"
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	help
 	  The shared library of wireless tools
 
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 311262d..0c4abb5 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -32,7 +32,7 @@ WPA_SUPPLICANT_CONFIG_DISABLE = \
 # And library order matters hence stick -lnl-3 first since it's appended
 # in the wpa_supplicant Makefiles as in LIBS+=-lnl-3 ... thus failing
 ifeq ($(BR2_PACKAGE_LIBNL),y)
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 	WPA_SUPPLICANT_LIBS += -lnl-3 -lm -lpthread
 endif
 	WPA_SUPPLICANT_DEPENDENCIES += libnl
@@ -66,7 +66,7 @@ endif
 # Try to use openssl if it's already available
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	WPA_SUPPLICANT_DEPENDENCIES += openssl
-	WPA_SUPPLICANT_LIBS += $(if $(BR2_PREFER_STATIC_LIB),-lcrypto -lz)
+	WPA_SUPPLICANT_LIBS += $(if $(BR2_STATIC_LIBS),-lcrypto -lz)
 	WPA_SUPPLICANT_CONFIG_EDITS += 's/\#\(CONFIG_TLS=openssl\)/\1/'
 else
 	WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_EAP_PWD
diff --git a/package/wvstreams/wvstreams.mk b/package/wvstreams/wvstreams.mk
index 17b7b0e..1630ff0 100644
--- a/package/wvstreams/wvstreams.mk
+++ b/package/wvstreams/wvstreams.mk
@@ -28,7 +28,7 @@ WVSTREAMS_CONF_OPTS += \
 # needed for openssl detection when statically linking (as ssl needs lz)
 WVSTREAMS_CONF_ENV += LIBS=-lz
 
-ifneq ($(BR2_PREFER_STATIC_LIB),y)
+ifneq ($(BR2_STATIC_LIBS),y)
 	WVSTREAMS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -fPIC"
 endif
 
diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 357d4b4..2fd1ff0 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -2,7 +2,7 @@ menuconfig BR2_PACKAGE_XORG7
 	bool "X.org X Window System"
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_PREFER_STATIC_LIB # dlopen in xlib_libX11
+	depends on !BR2_STATIC_LIBS # dlopen in xlib_libX11
 	help
 	  Support for X11R7 libraries, servers, drivers, and/or
 	  applications in the target.
@@ -264,4 +264,4 @@ if BR2_PACKAGE_XORG7
 endif
 
 comment "X.org needs a toolchain w/ wchar, threads, dynamic library"
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/x11r7/xdriver_xf86-input-tslib/Config.in b/package/x11r7/xdriver_xf86-input-tslib/Config.in
index 7cf5926..9c6e296 100644
--- a/package/x11r7/xdriver_xf86-input-tslib/Config.in
+++ b/package/x11r7/xdriver_xf86-input-tslib/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_TSLIB
 	bool "xf86-input-tslib"
-	depends on !BR2_PREFER_STATIC_LIB # tslib
+	depends on !BR2_STATIC_LIBS # tslib
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
@@ -11,4 +11,4 @@ config BR2_PACKAGE_XDRIVER_XF86_INPUT_TSLIB
 	  http://www.ptxdist.org/software/xf86-input-tslib/index_en.html
 
 comment "xf86-input-tslib needs a toolchain w/ dynamic library"
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
diff --git a/package/x264/x264.mk b/package/x264/x264.mk
index 7060ac1..6352ba3 100644
--- a/package/x264/x264.mk
+++ b/package/x264/x264.mk
@@ -22,7 +22,7 @@ else
 X264_CONF_OPTS += --disable-asm
 endif
 
-ifeq ($(BR2_PREFER_STATIC_LIB),)
+ifeq ($(BR2_STATIC_LIBS),)
 X264_CONF_OPTS += --enable-pic --enable-shared
 endif
 
diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
index a7337d5..95de89d 100644
--- a/package/xbmc/Config.in
+++ b/package/xbmc/Config.in
@@ -111,7 +111,7 @@ config BR2_PACKAGE_XBMC_ALSA_LIB
 
 config BR2_PACKAGE_XBMC_AVAHI
 	bool "avahi"
-	depends on !BR2_PREFER_STATIC_LIB # avahi
+	depends on !BR2_STATIC_LIBS # avahi
 	select BR2_PACKAGE_AVAHI
 	select BR2_PACKAGE_AVAHI_DAEMON
 	help
@@ -127,13 +127,13 @@ config BR2_PACKAGE_XBMC_DBUS
 config BR2_PACKAGE_XBMC_LIBBLURAY
 	bool "blu-ray"
 	select BR2_PACKAGE_LIBBLURAY
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	help
 	  Enable Blu-ray input support.
 	  Select this if you want to play back Blu-ray content.
 
 comment "libbluray support needs a toolchain w/ dynamic library"
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
 
 config BR2_PACKAGE_XBMC_GOOM
 	bool "goom screensaver"
@@ -155,7 +155,7 @@ comment "rsxs needs an OpenGL backend"
 
 config BR2_PACKAGE_XBMC_LIBCEC
 	bool "hdmi cec"
-	depends on !BR2_PREFER_STATIC_LIB # libcec
+	depends on !BR2_STATIC_LIBS # libcec
 	depends on BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_LIBCEC
 	help
@@ -163,7 +163,7 @@ config BR2_PACKAGE_XBMC_LIBCEC
 	  Select this if you want XBMC to support HDMI CEC.
 
 comment "hdmi cec support needs udev /dev management and a toolchain w/ dynamic library"
-	depends on BR2_PREFER_STATIC_LIB || !BR2_PACKAGE_HAS_UDEV
+	depends on BR2_STATIC_LIBS || !BR2_PACKAGE_HAS_UDEV
 
 config BR2_PACKAGE_XBMC_LIBMICROHTTPD
 	bool "web server"
@@ -219,12 +219,12 @@ config BR2_PACKAGE_XBMC_LIBUSB
 config BR2_PACKAGE_XBMC_LIBVA
 	bool "va"
 	select BR2_PACKAGE_LIBVA
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	help
 	  Enable libva support.
 
 comment "libva support needs toolchain w/ dynamic library"
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
 
 config BR2_PACKAGE_XBMC_WAVPACK
 	bool "wavpack"
diff --git a/package/xl2tp/xl2tp.mk b/package/xl2tp/xl2tp.mk
index abed7e8..d6b849a 100644
--- a/package/xl2tp/xl2tp.mk
+++ b/package/xl2tp/xl2tp.mk
@@ -10,7 +10,7 @@ XL2TP_DEPENDENCIES = libpcap openssl
 XL2TP_LICENSE = GPLv2
 XL2TP_LICENSE_FILES = LICENSE
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 XL2TP_LDLIBS = LDLIBS="$(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)"
 endif
 
diff --git a/package/xmlstarlet/xmlstarlet.mk b/package/xmlstarlet/xmlstarlet.mk
index 9386d4a..bc2b377 100644
--- a/package/xmlstarlet/xmlstarlet.mk
+++ b/package/xmlstarlet/xmlstarlet.mk
@@ -17,7 +17,7 @@ XMLSTARLET_CONF_OPTS += \
 	--with-libxslt-prefix=${STAGING_DIR}/usr \
 	--with-libiconv-prefix=${STAGING_DIR}/usr
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 XMLSTARLET_CONF_OPTS += --enable-static-libs
 else
 XMLSTARLET_CONF_OPTS += --disable-static-libs
diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index 987c65b..e8f7c57 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -15,7 +15,7 @@ ZEROMQ_AUTORECONF = YES
 
 # Only tools/curve_keygen.c needs this, but it doesn't hurt to pass it
 # for the rest of the build as well (which automatically includes stdc++).
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 	ZEROMQ_CONF_OPTS += LIBS=-lstdc++
 endif
 
diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index 19accd2..7c849cd 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -11,7 +11,7 @@ ZLIB_LICENSE = zlib license
 ZLIB_LICENSE_FILES = README
 ZLIB_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 ZLIB_PIC =
 ZLIB_SHARED = --static
 else
diff --git a/package/zlog/Config.in b/package/zlog/Config.in
index 4217370..f9c7839 100644
--- a/package/zlog/Config.in
+++ b/package/zlog/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_ZLOG
 	bool "zlog"
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	help
 	  zlog is a reliable, high-performance, thread safe, flexible,
 	  clear-model, pure C logging library.
@@ -10,4 +10,4 @@ config BR2_PACKAGE_ZLOG
 	  https://github.com/HardySimpson/zlog
 
 comment "zlog needs a toolchain w/ threads, largefile, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || BR2_PREFER_STATIC_LIB
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || BR2_STATIC_LIBS
diff --git a/support/scripts/scancpan b/support/scripts/scancpan
index 7ff647d..85c734a 100755
--- a/support/scripts/scancpan
+++ b/support/scripts/scancpan
@@ -632,7 +632,7 @@ while (my ($distname, $dist) = each %dist) {
         open my $fh, q{>}, $cfgname;
         say {$fh} qq{config BR2_PACKAGE_${brname}};
         say {$fh} qq{\tbool "${fsname}"};
-        say {$fh} qq{\tdepends on !BR2_PREFER_STATIC_LIB} if $need_dlopen{$distname};
+        say {$fh} qq{\tdepends on !BR2_STATIC_LIBS} if $need_dlopen{$distname};
         foreach my $dep (sort @{$deps_runtime{$distname}}) {
             my $brdep = brname( fsname( $dep ) );
             say {$fh} qq{\tselect BR2_PACKAGE_${brdep}};
@@ -642,7 +642,7 @@ while (my ($distname, $dist) = each %dist) {
         say {$fh} qq{\t  ${homepage}};
         if ($need_dlopen{$distname}) {
             say {$fh} qq{\ncomment "${fsname} needs a toolchain w/ dynamic library"};
-            say {$fh} qq{\tdepends on BR2_PREFER_STATIC_LIB};
+            say {$fh} qq{\tdepends on BR2_STATIC_LIBS};
         }
         close $fh;
     }
diff --git a/system/Config.in b/system/Config.in
index 39f27c7..a3b7aff 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -95,7 +95,7 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HAS_SSP
 	depends on BR2_USE_MMU
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
 	select BR2_PACKAGE_SYSTEMD
 
@@ -127,14 +127,14 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 	depends on !BR2_avr32 # eudev
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # eudev
 	select BR2_PACKAGE_EUDEV
 
 comment "eudev needs a toolchain w/ largefile, wchar, dynamic library"
 	depends on !BR2_avr32 # eudev
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB
+	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_STATIC_LIBS
 
 endchoice
 
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 53d86dd..2955b2e 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -47,7 +47,7 @@ config BR2_TOOLCHAIN_BUILDROOT_EGLIBC
 		   BR2_sh     || BR2_sh64     || BR2_sparc   || \
 		   BR2_x86_64 || BR2_microblaze || BR2_powerpc64
 	depends on BR2_USE_MMU
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_USES_GLIBC
 	# our eglibc.mk enables RPC support
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
@@ -66,7 +66,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 		   BR2_sh64        || BR2_sparc    || BR2_x86_64  || \
 		   BR2_microblaze
 	depends on BR2_USE_MMU
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	depends on !BR2_powerpc_SPE
 	select BR2_TOOLCHAIN_USES_GLIBC
 	# our glibc.mk enables RPC support
@@ -78,7 +78,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	  http://www.gnu.org/software/libc/
 
 comment "(e)glibc only available with shared lib support"
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_BUILDROOT_MUSL
 	bool "musl (experimental)"
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index c9feac3..b225edf 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -4,7 +4,7 @@ choice
 	prompt "Toolchain"
 
 comment "(e)glibc toolchains only available with shared lib support"
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	bool "Linaro ARM 2014.09"
@@ -12,7 +12,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -30,7 +30,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 comment "Linaro toolchains available for Cortex-A + EABIhf"
 	depends on BR2_arm
 	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	bool "Linaro armeb 2014.09"
@@ -38,7 +38,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -56,14 +56,14 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 comment "Linaro toolchains available for Cortex-A + EABIhf"
 	depends on BR2_armeb
 	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201405
 	bool "Sourcery CodeBench ARM 2014.05"
 	depends on BR2_arm
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABI
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -90,7 +90,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201311
 	depends on BR2_arm
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABI
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_HAS_GCC_BUG_58595 # based-on gcc-4.8.1
 	select BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # based-on gcc-4.8.1
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
@@ -119,7 +119,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305
 	depends on BR2_arm
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABI
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_HAS_GCC_BUG_58595 # based-on gcc-4.7.3
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
@@ -145,7 +145,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305
 comment "Sourcery CodeBench toolchains available for the EABI ABI"
 	depends on BR2_arm
 	depends on !BR2_ARM_EABI
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_201109
 	bool "Arago ARMv7 2011.09"
@@ -154,7 +154,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_201109
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABI
 	depends on BR2_ARM_CPU_HAS_VFPV3 || BR2_ARM_CPU_MAYBE_HAS_VFPV3
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -176,7 +176,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_ARM_CPU_ARMV4
 	depends on BR2_ARM_EABI
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -193,7 +193,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_MIPS_NABI32
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -262,7 +262,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201311
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_MIPS_NABI32
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -331,7 +331,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_MIPS_NABI32
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -397,13 +397,13 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305
 
 comment "Sourcery CodeBench toolchains are only available for MIPS/MIPS64 o32 and n64"
 	depends on BR2_MIPS_NABI32
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
 	bool "Sourcery CodeBench Nios-II 2014.05"
 	depends on BR2_nios2
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -418,7 +418,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
 	bool "Sourcery CodeBench Nios-II 2013.05"
 	depends on BR2_nios2
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -434,7 +434,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201203
 	depends on BR2_powerpc
 	depends on BR2_powerpc_SPE
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -451,7 +451,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103
 	bool "Sourcery CodeBench PowerPC 2011.03"
 	depends on BR2_powerpc
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -483,7 +483,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
 	bool "Sourcery CodeBench PowerPC 2010.09"
 	depends on BR2_powerpc
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -515,7 +515,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201209
 	bool "Sourcery CodeBench SH 2012.09"
 	depends on BR2_sh4a || BR2_sh4aeb
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -539,7 +539,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201203
 	bool "Sourcery CodeBench SH 2012.03"
 	depends on BR2_sh4a || BR2_sh4aeb
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
@@ -562,7 +562,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103
 	bool "Sourcery CodeBench SH 2011.03"
 	depends on BR2_sh4a || BR2_sh4aeb
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -626,7 +626,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209
 	bool "Sourcery CodeBench x86/x86_64 2012.09"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	depends on !BR2_x86_jaguar
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
@@ -653,7 +653,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201203
 	bool "Sourcery CodeBench x86/x86_64 2012.03"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	depends on !BR2_x86_jaguar
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
@@ -679,7 +679,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109
 	bool "Sourcery CodeBench x86/x86_64 2011.09"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	depends on !BR2_x86_jaguar
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
@@ -760,7 +760,7 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_14_3
 	bool "Xilinx Little Endian Microblaze GNU Tools 14.3"
 	depends on BR2_microblazeel
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_DEPRECATED_SINCE_2014_02
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
@@ -775,7 +775,7 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2
 	bool "Xilinx Little Endian Microblaze GNU Tools v2"
 	depends on BR2_microblazeel
 	depends on BR2_HOSTARCH = "x86_64"
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_DEPRECATED_SINCE_2014_02
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
@@ -788,7 +788,7 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_14_3
 	bool "Xilinx Big Endian Microblaze GNU Tools"
 	depends on BR2_microblazebe
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_DEPRECATED_SINCE_2014_02
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
@@ -803,7 +803,7 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2
 	bool "Xilinx Big Endian Microblaze GNU Tools"
 	depends on BR2_microblazebe
 	depends on BR2_HOSTARCH = "x86_64"
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_DEPRECATED_SINCE_2014_02
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
@@ -816,7 +816,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	bool "Linaro AArch64 14.09"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
@@ -830,7 +830,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
 	bool "CodeSourcery AArch64 2014.05"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
@@ -1083,7 +1083,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
 
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC
 	bool "glibc/eglibc"
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	help
 	  Select this option if your external toolchain uses the GNU C
@@ -1096,7 +1096,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC
 	  cause build failures to some packages.
 
 comment "(e)glibc only available with shared lib support"
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL
 	bool "musl"
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 51e0af5..f052e67 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -554,7 +554,7 @@ define TOOLCHAIN_EXTERNAL_INSTALL_CORE
 		fi ; \
 	fi ; \
 	ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}(.*)/$$:\1:"` ; \
-	if test -z "$(BR2_PREFER_STATIC_LIB)" ; then \
+	if test -z "$(BR2_STATIC_LIBS)" ; then \
 		$(call MESSAGE,"Copying external toolchain libraries to target...") ; \
 		for libs in $(LIB_EXTERNAL_LIBS); do \
 			$(call copy_toolchain_lib_root,$${ARCH_SYSROOT_DIR},$${SUPPORT_LIB_DIR},$${ARCH_LIB_DIR},$$libs,/lib); \
-- 
2.1.0
