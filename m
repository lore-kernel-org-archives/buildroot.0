From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 21 Apr 2017 11:24:47 -0400
Subject: [Buildroot] [PATCH 2/7] package configs: clean up ordering.
In-Reply-To: <20170421152452.11236-1-aduskett@codeblue.com>
References: <20170421152452.11236-1-aduskett@codeblue.com>
Message-ID: <20170421152452.11236-2-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The check-package script when ran gives warnings on ordering issues
on all of these Config files.  This patch cleans up all warnings
related to the ordering in the Config files in the package directory.

The appropriate ordering is: type, default, depends on, select, help
See http://nightly.buildroot.org/#_config_files for more information.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/agentpp/Config.in                        |  2 +-
 package/aircrack-ng/Config.in                    |  2 +-
 package/alsa-lib/Config.in                       | 10 +++----
 package/alsa-utils/Config.in                     |  4 +--
 package/alsamixergui/Config.in                   |  4 +--
 package/android-tools/Config.in                  |  4 +--
 package/apache/Config.in                         |  4 +--
 package/apr-util/Config.in                       |  4 +--
 package/atk/Config.in                            |  2 +-
 package/atkmm/Config.in                          |  6 ++---
 package/avrdude/Config.in                        |  8 +++---
 package/axel/Config.in                           |  2 +-
 package/bandwidthd/Config.in                     |  2 +-
 package/bash/Config.in                           |  4 +--
 package/binutils/Config.in                       |  2 +-
 package/binutils/Config.in.host                  |  2 +-
 package/bluez5_utils/Config.in                   |  2 +-
 package/boost/Config.in                          |  4 +--
 package/bustle/Config.in                         |  4 +--
 package/busybox/Config.in                        |  4 +--
 package/cairomm/Config.in                        |  6 ++---
 package/ccid/Config.in                           |  4 +--
 package/cdrkit/Config.in                         |  4 +--
 package/checkpolicy/Config.in                    |  4 +--
 package/clamav/Config.in                         |  4 +--
 package/classpath/Config.in                      |  2 +-
 package/cmake/Config.in                          | 14 +++++-----
 package/connman/Config.in                        |  8 +++---
 package/cpio/Config.in                           |  2 +-
 package/cppcms/Config.in                         |  6 ++---
 package/curlftpfs/Config.in                      |  8 +++---
 package/czmq/Config.in                           |  2 +-
 package/ding-libs/Config.in                      |  2 +-
 package/directfb/Config.in                       |  6 ++---
 package/docker-engine/Config.in                  |  2 +-
 package/dos2unix/Config.in                       |  2 +-
 package/dovecot/Config.in                        |  2 +-
 package/dropwatch/Config.in                      |  4 +--
 package/dvblast/Config.in                        |  4 +--
 package/e2tools/Config.in                        |  2 +-
 package/easydbus/Config.in                       |  2 +-
 package/ecryptfs-utils/Config.in                 | 14 +++++-----
 package/efivar/Config.in                         |  2 +-
 package/elfutils/Config.in                       |  6 ++---
 package/execline/Config.in                       |  2 +-
 package/exiv2/Config.in                          |  2 +-
 package/f2fs-tools/Config.in                     |  2 +-
 package/faifa/Config.in                          |  2 +-
 package/fastd/Config.in                          |  2 +-
 package/fetchmail/Config.in                      |  2 +-
 package/ffmpeg/Config.in                         |  2 +-
 package/filemq/Config.in                         |  6 ++---
 package/flashrom/Config.in                       |  4 +--
 package/freescale-imx/gpu-amd-bin-mx51/Config.in |  8 +++---
 package/freescale-imx/imx-gpu-viv/Config.in      |  6 ++---
 package/gdb/Config.in                            |  6 ++---
 package/gdb/Config.in.host                       |  4 +--
 package/gesftpserver/Config.in                   |  2 +-
 package/glibmm/Config.in                         |  4 +--
 package/gnupg/Config.in                          |  2 +-
 package/gnupg2/Config.in                         |  8 +++---
 package/gnutls/Config.in                         |  2 +-
 package/gptfdisk/Config.in                       |  4 +--
 package/gstreamer/gst-fsl-plugins/Config.in      | 16 +++++------
 package/gstreamer/gst-plugins-bad/Config.in      |  4 +--
 package/gstreamer/gst-plugins-good/Config.in     |  2 +-
 package/gstreamer1/gst1-plugins-bad/Config.in    | 10 +++----
 package/gstreamer1/gst1-plugins-base/Config.in   |  2 +-
 package/gstreamer1/gst1-plugins-good/Config.in   |  6 ++---
 package/gstreamer1/gst1-vaapi/Config.in          |  6 ++---
 package/gupnp-tools/Config.in                    |  2 +-
 package/iftop/Config.in                          |  2 +-
 package/imlib2/Config.in                         |  2 +-
 package/iprutils/Config.in                       |  4 +--
 package/ipsec-tools/Config.in                    |  6 ++---
 package/janus-gateway/Config.in                  |  8 +++---
 package/joe/Config.in                            |  2 +-
 package/jsoncpp/Config.in                        |  2 +-
 package/kbd/Config.in                            |  2 +-
 package/knock/Config.in                          |  2 +-
 package/kodi/Config.in                           |  2 +-
 package/kvm-unit-tests/Config.in                 |  2 +-
 package/lapack/Config.in                         |  2 +-
 package/lesstif/Config.in                        |  2 +-
 package/libcroco/Config.in                       |  4 +--
 package/libdri2/Config.in                        |  4 +--
 package/libdrm/Config.in                         |  4 +--
 package/libepoxy/Config.in                       |  2 +-
 package/libfm-extra/Config.in                    |  2 +-
 package/libfm/Config.in                          |  8 +++---
 package/libfreeglut/Config.in                    |  4 +--
 package/libftdi1/Config.in                       |  6 ++---
 package/libgdiplus/Config.in                     |  8 +++---
 package/libglib2/Config.in                       |  6 ++---
 package/libgtk2/Config.in                        | 12 ++++-----
 package/libgtk3/Config.in                        | 14 +++++-----
 package/libiio/Config.in                         | 12 ++++-----
 package/libmad/Config.in                         |  2 +-
 package/libmatroska/Config.in                    |  2 +-
 package/libnice/Config.in                        |  2 +-
 package/libnss/Config.in                         |  6 ++---
 package/libplayer/Config.in                      |  2 +-
 package/libqmi/Config.in                         |  2 +-
 package/librsvg/Config.in                        | 10 +++----
 package/librtlsdr/Config.in                      |  2 +-
 package/libsecret/Config.in                      |  2 +-
 package/libselinux/Config.in                     |  4 +--
 package/libsemanage/Config.in                    |  8 +++---
 package/libsigrok/Config.in                      |  6 ++---
 package/libsigrokdecode/Config.in                |  4 +--
 package/libstrophe/Config.in                     |  2 +-
 package/libupnpp/Config.in                       |  6 ++---
 package/liburcu/Config.in                        |  2 +-
 package/libva-intel-driver/Config.in             |  6 ++---
 package/libva/Config.in                          |  4 +--
 package/libwebsock/Config.in                     |  2 +-
 package/libxmlpp/Config.in                       |  4 +--
 package/lightning/Config.in                      |  4 +--
 package/linknx/Config.in                         |  4 +--
 package/linphone/Config.in                       |  4 +--
 package/linux-pam/Config.in                      |  4 +--
 package/ljlinenoise/Config.in                    |  4 +--
 package/lmbench/Config.in                        |  4 +--
 package/log4cxx/Config.in                        |  4 +--
 package/logrotate/Config.in                      |  2 +-
 package/lsqlite3/Config.in                       |  2 +-
 package/ltp-testsuite/Config.in                  |  2 +-
 package/ltrace/Config.in                         |  6 ++---
 package/lttng-babeltrace/Config.in               |  6 ++---
 package/lttng-libust/Config.in                   |  6 ++---
 package/lua-coatpersistent/Config.in             |  2 +-
 package/lua-ev/Config.in                         |  2 +-
 package/luaexpat/Config.in                       |  2 +-
 package/luajit/Config.in                         |  2 +-
 package/luasec/Config.in                         |  2 +-
 package/luv/Config.in                            |  2 +-
 package/lxc/Config.in                            |  2 +-
 package/lzlib/Config.in                          |  2 +-
 package/mali-t76x/Config.in                      |  6 ++---
 package/matchbox-common/Config.in                |  2 +-
 package/mediastreamer/Config.in                  |  2 +-
 package/menu-cache/Config.in                     |  4 +--
 package/mesa3d-demos/Config.in                   |  4 +--
 package/mesa3d/Config.in                         |  4 +--
 package/micropython-lib/Config.in                |  2 +-
 package/micropython/Config.in                    |  2 +-
 package/midori/Config.in                         | 12 ++++-----
 package/mjpegtools/Config.in                     |  2 +-
 package/mongrel2/Config.in                       |  4 +--
 package/mtdev2tuio/Config.in                     |  2 +-
 package/musl/Config.in                           |  2 +-
 package/neon/Config.in                           |  2 +-
 package/netcat-openbsd/Config.in                 |  2 +-
 package/netsniff-ng/Config.in                    | 10 +++----
 package/nfs-utils/Config.in                      |  2 +-
 package/nginx/Config.in                          |  4 +--
 package/odroid-mali/Config.in                    |  4 +--
 package/ola/Config.in                            |  6 ++---
 package/on2-8170-libs/Config.in                  |  2 +-
 package/opencv/Config.in                         |  4 +--
 package/opencv3/Config.in                        |  2 +-
 package/opengl/libegl/Config.in                  |  2 +-
 package/opengl/libgl/Config.in                   |  2 +-
 package/opengl/libgles/Config.in                 |  2 +-
 package/opengl/libopenmax/Config.in              |  2 +-
 package/opengl/libopenvg/Config.in               |  2 +-
 package/openocd/Config.in                        | 34 ++++++++++++------------
 package/openpowerlink/Config.in                  |  2 +-
 package/openvmtools/Config.in                    |  2 +-
 package/opkg/Config.in                           |  2 +-
 package/oprofile/Config.in                       |  6 ++---
 package/pangomm/Config.in                        |  8 +++---
 package/pcmanfm/Config.in                        |  8 +++---
 package/php/Config.ext                           |  8 +++---
 package/portaudio/Config.in                      |  2 +-
 package/powerpc-utils/Config.in                  |  2 +-
 package/powervr/Config.in                        |  2 +-
 package/pppd/Config.in                           |  2 +-
 package/pulseaudio/Config.in                     |  2 +-
 package/pulseview/Config.in                      | 16 +++++------
 package/pure-ftpd/Config.in                      |  2 +-
 package/python-crossbar/Config.in                |  2 +-
 package/python-ipaddr/Config.in                  |  2 +-
 package/python-libconfig/Config.in               |  6 ++---
 package/python-msgpack/Config.in                 |  2 +-
 package/python-pylibftdi/Config.in               |  2 +-
 package/python-pysnmp-apps/Config.in             |  2 +-
 package/python-pysnmp-mibs/Config.in             |  2 +-
 package/python-service-identity/Config.in        |  2 +-
 package/python-treq/Config.in                    |  2 +-
 package/python/Config.in                         | 12 ++++-----
 package/qemu/Config.in.host                      |  4 +--
 package/qlibc/Config.in                          |  2 +-
 package/qt-webkit-kiosk/Config.in                |  8 +++---
 package/qt/Config.gfx.in                         |  4 +--
 package/qt/Config.in                             | 22 +++++++--------
 package/qt/Config.mouse.in                       |  2 +-
 package/qt/Config.sql.in                         |  4 +--
 package/qt5/Config.in                            |  4 +--
 package/qt5/qt53d/Config.in                      |  4 +--
 package/qt5/qt5base/Config.in                    | 10 +++----
 package/qt5/qt5canvas3d/Config.in                |  4 +--
 package/qt5/qt5connectivity/Config.in            |  2 +-
 package/qt5/qt5declarative/Config.in             |  4 +--
 package/qt5/qt5graphicaleffects/Config.in        |  4 +--
 package/qt5/qt5quickcontrols/Config.in           |  4 +--
 package/qt5/qt5quickcontrols2/Config.in          |  4 +--
 package/qt5/qt5script/Config.in                  |  2 +-
 package/qt5/qt5webkit/Config.in                  | 10 +++----
 package/qt5/qt5x11extras/Config.in               |  2 +-
 package/qt5cinex/Config.in                       | 10 +++----
 package/rdesktop/Config.in                       |  2 +-
 package/rpcbind/Config.in                        |  3 +--
 package/rpi-firmware/Config.in                   |  4 +--
 package/rsyslog/Config.in                        |  8 +++---
 package/s6-dns/Config.in                         |  2 +-
 package/s6-linux-init/Config.in                  |  2 +-
 package/s6-linux-utils/Config.in                 |  2 +-
 package/s6-networking/Config.in                  |  2 +-
 package/s6-portable-utils/Config.in              |  2 +-
 package/s6-rc/Config.in                          |  2 +-
 package/s6/Config.in                             |  2 +-
 package/sepolgen/Config.in                       |  2 +-
 package/setools/Config.in                        |  8 +++---
 package/sigrok-cli/Config.in                     |  2 +-
 package/sispmctl/Config.in                       |  4 +--
 package/softether/Config.in                      |  6 ++---
 package/speex/Config.in                          |  2 +-
 package/sshfs/Config.in                          |  8 +++---
 package/startup-notification/Config.in           |  2 +-
 package/stella/Config.in                         |  6 ++---
 package/strongswan/Config.in                     |  4 +--
 package/subversion/Config.in                     |  4 +--
 package/sunxi-mali/Config.in                     |  2 +-
 package/syslog-ng/Config.in                      |  8 +++---
 package/sysprof/Config.in                        |  2 +-
 package/sysstat/Config.in                        |  3 +--
 package/tekui/Config.in                          |  6 ++---
 package/tiff/Config.in                           |  6 ++---
 package/tinc/Config.in                           |  4 +--
 package/tpm-tools/Config.in                      |  6 ++---
 package/trousers/Config.in                       |  4 +--
 package/ubus/Config.in                           |  4 +--
 package/uclibc/Config.in                         | 20 +++++++-------
 package/udev/Config.in                           |  2 +-
 package/udisks/Config.in                         |  2 +-
 package/unionfs/Config.in                        |  2 +-
 package/usb_modeswitch_data/Config.in            |  2 +-
 package/ushare/Config.in                         |  4 +--
 package/vtun/Config.in                           |  2 +-
 package/weston/Config.in                         | 10 +++----
 package/wireshark/Config.in                      |  4 +--
 package/wmctrl/Config.in                         |  6 ++---
 package/wpa_supplicant/Config.in                 |  4 +--
 package/x11r7/xapp_luit/Config.in                |  2 +-
 package/x11r7/xapp_xconsole/Config.in            |  2 +-
 package/x11r7/xapp_xdriinfo/Config.in            |  2 +-
 package/x11r7/xapp_xedit/Config.in               |  2 +-
 package/x11r7/xapp_xf86dga/Config.in             |  2 +-
 package/x11r7/xapp_xfs/Config.in                 |  2 +-
 package/x11r7/xcb-util-cursor/Config.in          |  2 +-
 package/x11r7/xcb-util-renderutil/Config.in      |  2 +-
 package/x11r7/xdriver_xf86-video-geode/Config.in |  2 +-
 package/xenomai/Config.in                        |  2 +-
 package/xorriso/Config.in                        |  2 +-
 package/xterm/Config.in                          |  4 +--
 package/xvisor/Config.in                         |  2 +-
 package/ympd/Config.in                           |  2 +-
 268 files changed, 562 insertions(+), 564 deletions(-)

diff --git a/package/agentpp/Config.in b/package/agentpp/Config.in
index 4b70a1a..e591fb5 100644
--- a/package/agentpp/Config.in
+++ b/package/agentpp/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_AGENTPP
 	bool "agent++"
-	select BR2_PACKAGE_SNMPPP
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # snmp++
 	depends on !BR2_STATIC_LIBS # snmp++
+	select BR2_PACKAGE_SNMPPP
 	help
 	  AGENT++ is a set of C++ classes which provides a complete protocol
 	  engine and dispatch table for the development of SNMP agents.
diff --git a/package/aircrack-ng/Config.in b/package/aircrack-ng/Config.in
index 00ce4e4..b6572dc 100644
--- a/package/aircrack-ng/Config.in
+++ b/package/aircrack-ng/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_AIRCRACK_NG
 	bool "aircrack-ng"
 	depends on BR2_USE_MMU # uses fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# libnl has issues when linking statically
 	# they need fixing in libnl itself
 	select BR2_PACKAGE_LIBNL if !BR2_STATIC_LIBS
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
-	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  A set of tools for auditing wireless networks
 
diff --git a/package/alsa-lib/Config.in b/package/alsa-lib/Config.in
index 97e8489..c355b2c 100644
--- a/package/alsa-lib/Config.in
+++ b/package/alsa-lib/Config.in
@@ -3,15 +3,15 @@ comment "alsa-lib needs a toolchain w/ threads"
 
 menuconfig BR2_PACKAGE_ALSA_LIB
 	bool "alsa-lib"
-	# Temporary until
-	# https://bugtrack.alsa-project.org/alsa-bug/view.php?id=4913
-	# is fixed
-	select BR2_PACKAGE_ALSA_LIB_PCM
 	# Even though some parts of alsa-lib use threads only when
 	# available, some PCM plugins use them unconditionally. Since
 	# the usage of alsa-lib on no-thread systems is pretty
 	# unlikely, just require thread support globally for alsa-lib.
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# Temporary until
+	# https://bugtrack.alsa-project.org/alsa-bug/view.php?id=4913
+	# is fixed
+	select BR2_PACKAGE_ALSA_LIB_PCM
 	help
 	  The Advanced Linux Sound Architecture (ALSA) provides audio and MIDI
 	  functionality to the Linux operating system.
@@ -68,8 +68,8 @@ config BR2_PACKAGE_ALSA_LIB_SEQ
 
 config BR2_PACKAGE_ALSA_LIB_ALISP
 	bool "alisp"
-	depends on BR2_USE_MMU
 	default y
+	depends on BR2_USE_MMU
 
 config BR2_PACKAGE_ALSA_LIB_OLD_SYMBOLS
 	bool "old-symbols"
diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
index adc0aab..1d42f2e 100644
--- a/package/alsa-utils/Config.in
+++ b/package/alsa-utils/Config.in
@@ -33,10 +33,10 @@ config BR2_PACKAGE_ALSA_UTILS_ALSALOOP
 
 config BR2_PACKAGE_ALSA_UTILS_ALSAMIXER
 	bool "alsamixer"
+	default y
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_ALSA_LIB_MIXER
-	depends on BR2_USE_WCHAR
-	default y
 
 comment "alsamixer needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
diff --git a/package/alsamixergui/Config.in b/package/alsamixergui/Config.in
index 5b61f38..2016a28 100644
--- a/package/alsamixergui/Config.in
+++ b/package/alsamixergui/Config.in
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_ALSAMIXERGUI
+	bool "alsamixergui"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # fltk fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
 	select BR2_PACKAGE_FLTK
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_ALSA_LIB_PCM
 	select BR2_PACKAGE_ALSA_LIB_MIXER
-	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
-	bool "alsamixergui"
 	help
 	  A nice GUI mixer for Alsa using fltk
 
diff --git a/package/android-tools/Config.in b/package/android-tools/Config.in
index 19772ad..96e36e6 100644
--- a/package/android-tools/Config.in
+++ b/package/android-tools/Config.in
@@ -34,13 +34,13 @@ config BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT_GOOD_KERNEL_HEADERS
 
 config BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT
 	bool "fastboot"
-	select BR2_PACKAGE_LIBSELINUX
-	select BR2_PACKAGE_ZLIB
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libselinux
 	depends on !BR2_STATIC_LIBS # libselinux
 	depends on BR2_TOOLCHAIN_USES_GLIBC # libselinux
 	depends on !BR2_arc # libselinux
 	depends on BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT_GOOD_KERNEL_HEADERS
+	select BR2_PACKAGE_LIBSELINUX
+	select BR2_PACKAGE_ZLIB
 	help
 	  This option will build and install the fastboot utility for
 	  the target, which can be used to reflash other target devices
diff --git a/package/apache/Config.in b/package/apache/Config.in
index 511876d..5916d30 100644
--- a/package/apache/Config.in
+++ b/package/apache/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_APACHE
 	bool "apache"
-	select BR2_PACKAGE_APR_UTIL
-	select BR2_PACKAGE_PCRE
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # apr
+	select BR2_PACKAGE_APR_UTIL
+	select BR2_PACKAGE_PCRE
 	help
 	  The Apache HTTP Server Project is an effort to develop and maintain an
 	  open-source HTTP server for modern operating systems including UNIX
diff --git a/package/apr-util/Config.in b/package/apr-util/Config.in
index 1d7db2b..6c5e3bb 100644
--- a/package/apr-util/Config.in
+++ b/package/apr-util/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_APR_UTIL
 	bool "apr-util"
-	select BR2_PACKAGE_APR
-	select BR2_PACKAGE_EXPAT
 	# apr really needs shared library support
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # apr
+	select BR2_PACKAGE_APR
+	select BR2_PACKAGE_EXPAT
 	help
 	  The utility library for the apache runtime project
 
diff --git a/package/atk/Config.in b/package/atk/Config.in
index 1120a94..c980614 100644
--- a/package/atk/Config.in
+++ b/package/atk/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_ATK
 	bool "atk"
-	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
+	select BR2_PACKAGE_LIBGLIB2
 	help
 	  The ATK accessibility toolkit, needed to build GTK+-2.x.
 
diff --git a/package/atkmm/Config.in b/package/atkmm/Config.in
index 2091eab..edc8383 100644
--- a/package/atkmm/Config.in
+++ b/package/atkmm/Config.in
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_ATKMM
 	bool "atkmm"
-	select BR2_PACKAGE_ATK
-	select BR2_PACKAGE_GLIBMM
-	select BR2_PACKAGE_LIBSIGC
 	depends on BR2_INSTALL_LIBSTDCPP # glibmm
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS # atk/glibmm -> libglib2
 	depends on BR2_USE_MMU # atk/glibmm -> libglib2
 	depends on BR2_USE_WCHAR # atk/glibmm -> libglib2
+	select BR2_PACKAGE_ATK
+	select BR2_PACKAGE_GLIBMM
+	select BR2_PACKAGE_LIBSIGC
 
 	help
 	  The atkmm package is a set of C++ bindings for Atk.
diff --git a/package/avrdude/Config.in b/package/avrdude/Config.in
index 8aca841..3757f17 100644
--- a/package/avrdude/Config.in
+++ b/package/avrdude/Config.in
@@ -1,14 +1,14 @@
 config BR2_PACKAGE_AVRDUDE
 	bool "avrdude"
-	select BR2_PACKAGE_ELFUTILS
-	select BR2_PACKAGE_LIBUSB
-	select BR2_PACKAGE_LIBUSB_COMPAT
-	select BR2_PACKAGE_NCURSES
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR # elfutils
 	depends on !BR2_STATIC_LIBS # elfutils
 	depends on !BR2_bfin # elfutils
 	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
+	select BR2_PACKAGE_ELFUTILS
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_LIBUSB_COMPAT
+	select BR2_PACKAGE_NCURSES
 	help
 	  avrdude is a programmer for Atmel AVR microcontrollers
 	  this package provides a version with new linuxspi driver
diff --git a/package/axel/Config.in b/package/axel/Config.in
index aa93f2a..aea85bf 100644
--- a/package/axel/Config.in
+++ b/package/axel/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_AXEL
 	bool "axel"
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  HTTP/FTP download accelerator.
 
diff --git a/package/bandwidthd/Config.in b/package/bandwidthd/Config.in
index b4a47f2..a503da4 100644
--- a/package/bandwidthd/Config.in
+++ b/package/bandwidthd/Config.in
@@ -32,8 +32,8 @@ if BR2_PACKAGE_BANDWIDTHD
 
 config BR2_PACKAGE_BANDWIDTHD_POSTGRESQL
 	bool "enable postgresql log target support"
-	select BR2_PACKAGE_POSTGRESQL
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_POSTGRESQL
 	help
 	  Enable support for logging the bandwidthd data to a remote
 	  (or local) postgresql server. This data can then be viewed
diff --git a/package/bash/Config.in b/package/bash/Config.in
index 783e4b3..5a9ebb8 100644
--- a/package/bash/Config.in
+++ b/package/bash/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_BASH
 	bool "bash"
-	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_READLINE
 	# uses fork()
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_READLINE
 	help
 	  The standard GNU Bourne again shell.
 
diff --git a/package/binutils/Config.in b/package/binutils/Config.in
index fdfdfe9..360dd5e 100644
--- a/package/binutils/Config.in
+++ b/package/binutils/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_BINUTILS
 	bool "binutils"
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	depends on !BR2_nios2
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Install binutils on the target
 
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 1934fca..15870c3 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -2,8 +2,8 @@ comment "Binutils Options"
 
 choice
 	prompt "Binutils Version"
-	depends on !BR2_arc
 	default BR2_BINUTILS_VERSION_2_27_X
+	depends on !BR2_arc
 	help
 	  Select the version of binutils you wish to use.
 
diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index a7c0ee4..3611c69 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -29,8 +29,8 @@ if BR2_PACKAGE_BLUEZ5_UTILS
 
 config BR2_PACKAGE_BLUEZ5_UTILS_OBEX
 	bool "build OBEX support"
-	select BR2_PACKAGE_LIBICAL
 	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_LIBICAL
 	help
 	  Enable the OBEX support in Bluez 5.x.
 
diff --git a/package/boost/Config.in b/package/boost/Config.in
index 403bbf3..9825c09 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -115,9 +115,9 @@ config BR2_PACKAGE_BOOST_MATH
 	bool "boost-math"
 
 config BR2_PACKAGE_BOOST_METAPARSE
+	bool "boost-metaparse"
 	depends on BR2_USE_MMU # boost-test
 	select BR2_PACKAGE_BOOST_TEST
-	bool "boost-metaparse"
 
 config BR2_PACKAGE_BOOST_MPI
 	bool "boost-mpi"
@@ -126,8 +126,8 @@ config BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	bool "boost-program_options"
 
 config BR2_PACKAGE_BOOST_PYTHON
-	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	bool "boost-python"
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 
 config BR2_PACKAGE_BOOST_RANDOM
 	bool "boost-random"
diff --git a/package/bustle/Config.in b/package/bustle/Config.in
index f213da5..109ebde 100644
--- a/package/bustle/Config.in
+++ b/package/bustle/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_BUSTLE
 	bool "bustle"
-	select BR2_PACKAGE_LIBPCAP
-	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_PACKAGE_DBUS # runtime
+	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Bustle is a better dbus-monitor! It records and draws
 	  sequence diagrams of D-Bus activity, showing signal
diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 504cd8a..7eb7eb9 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -35,12 +35,12 @@ config BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	  by busybox.
 
 config BR2_PACKAGE_BUSYBOX_SELINUX
-	select BR2_PACKAGE_LIBSELINUX
+	bool "Enable SELinux support"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on !BR2_arc
-	bool "Enable SELinux support"
+	select BR2_PACKAGE_LIBSELINUX
 	help
 	  Enable SELinux support in BusyBox. Please note that
 	  depending on your BusyBox configuration and the SELinux
diff --git a/package/cairomm/Config.in b/package/cairomm/Config.in
index c0d5ccd..840549b 100644
--- a/package/cairomm/Config.in
+++ b/package/cairomm/Config.in
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_CAIROMM
 	bool "cairomm"
-	select BR2_PACKAGE_CAIRO
-	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_LIBSIGC
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBSIGC
 	help
 	  The cairomm package is a set of C++ bindings for Cairo.
 
diff --git a/package/ccid/Config.in b/package/ccid/Config.in
index f5bb583..dfb57e8 100644
--- a/package/ccid/Config.in
+++ b/package/ccid/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_CCID
 	bool "ccid"
-	select BR2_PACKAGE_PCSC_LITE
-	select BR2_PACKAGE_LIBUSB
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	depends on BR2_USE_MMU # pcsc-lite
 	depends on !BR2_STATIC_LIBS # pcsc-lite
+	select BR2_PACKAGE_PCSC_LITE
+	select BR2_PACKAGE_LIBUSB
 	help
 	  PC/SC driver for USB CCID smart card readers
 
diff --git a/package/cdrkit/Config.in b/package/cdrkit/Config.in
index af18ba9..c5f43f2 100644
--- a/package/cdrkit/Config.in
+++ b/package/cdrkit/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_CDRKIT
+	bool "cdrkit"
 	# Needed for libbz
+	depends on BR2_USE_MMU # fork
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_LIBCAP
 	select BR2_PACKAGE_ZLIB
-	depends on BR2_USE_MMU # fork
-	bool "cdrkit"
 	help
 	  cdrkit is a suite of programs for recording CDs and DVDs,
 	  blanking CD-RW media, creating ISO-9660 filesystem images,
diff --git a/package/checkpolicy/Config.in b/package/checkpolicy/Config.in
index 99754ce..97ad0b7 100644
--- a/package/checkpolicy/Config.in
+++ b/package/checkpolicy/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_CHECKPOLICY
 	bool "checkpolicy"
-	select BR2_PACKAGE_LIBSELINUX
-	select BR2_PACKAGE_FLEX
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libselinux
 	depends on !BR2_STATIC_LIBS # libselinux
 	depends on BR2_TOOLCHAIN_USES_GLIBC # libselinux
 	depends on !BR2_arc # libselinux
+	select BR2_PACKAGE_LIBSELINUX
+	select BR2_PACKAGE_FLEX
 	help
 	  checkpolicy is the SELinux policy compiler. It uses libsepol
 	  to generate the binary policy. checkpolicy uses the static
diff --git a/package/clamav/Config.in b/package/clamav/Config.in
index f832341..051df0d 100644
--- a/package/clamav/Config.in
+++ b/package/clamav/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_CLAMAV
 	bool "clamav"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBTOOL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_USE_MMU # fork()
 	help
 	  ClamAV is an open source antivirus engine for detecting trojans,
 	  viruses, malware & other malicious threats.
diff --git a/package/classpath/Config.in b/package/classpath/Config.in
index 8051523..0385ccd 100644
--- a/package/classpath/Config.in
+++ b/package/classpath/Config.in
@@ -7,9 +7,9 @@ config BR2_PACKAGE_CLASSPATH_ARCH_SUPPORTS
 
 config BR2_PACKAGE_CLASSPATH
 	bool "classpath"
+	depends on BR2_PACKAGE_CLASSPATH_ARCH_SUPPORTS
 	select BR2_NEEDS_HOST_JAR
 	select BR2_NEEDS_HOST_JAVAC
-	depends on BR2_PACKAGE_CLASSPATH_ARCH_SUPPORTS
 	help
 	  GNU Classpath, Essential Libraries for Java, is a GNU
 	  project to create free core class libraries for use with
diff --git a/package/cmake/Config.in b/package/cmake/Config.in
index 2706db5..1c95d71 100644
--- a/package/cmake/Config.in
+++ b/package/cmake/Config.in
@@ -12,6 +12,13 @@ config BR2_PACKAGE_CMAKE
 
 config BR2_PACKAGE_CMAKE_CTEST
 	bool "ctest"
+	depends on BR2_PACKAGE_CMAKE_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # from jsoncpp
+	depends on BR2_USE_WCHAR # libarchive
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
+	depends on BR2_USE_MMU # libuv
 	select BR2_PACKAGE_CMAKE
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_JSONCPP
@@ -21,13 +28,6 @@ config BR2_PACKAGE_CMAKE_CTEST
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_XZ
 	select BR2_PACKAGE_LIBUV
-	depends on BR2_PACKAGE_CMAKE_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # from jsoncpp
-	depends on BR2_USE_WCHAR # libarchive
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
-	depends on BR2_USE_MMU # libuv
 	help
 	  CTest is a testing tool distributed as a part of CMake. It
 	  can be used to automate updating (using CVS for example),
diff --git a/package/connman/Config.in b/package/connman/Config.in
index 6ed40be..39a81ee 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -1,14 +1,14 @@
 config BR2_PACKAGE_CONNMAN
 	bool "connman"
-	select BR2_PACKAGE_DBUS
-	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_IPTABLES
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus, libglib2
 	depends on !BR2_STATIC_LIBS # needs dlopen()
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_USES_MUSL # mixes userspace and kernel headers
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_IPTABLES
 	help
 	  The Connection Manager (ConnMan) project provides a daemon
 	  for managing internet connections within embedded devices
@@ -50,8 +50,8 @@ config BR2_PACKAGE_CONNMAN_LOOPBACK
 
 config BR2_PACKAGE_CONNMAN_NEARD
 	bool "enable neard support"
-	select BR2_PACKAGE_NEARD
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # neard
+	select BR2_PACKAGE_NEARD
 
 config BR2_PACKAGE_CONNMAN_OFONO
 	bool "enable ofono support"
diff --git a/package/cpio/Config.in b/package/cpio/Config.in
index 1210a0b..3ef0402 100644
--- a/package/cpio/Config.in
+++ b/package/cpio/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_CPIO
 	bool "cpio"
+	depends on BR2_USE_WCHAR
 	# Need argp.h support
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
-	depends on BR2_USE_WCHAR
 	help
 	  cpio archive utility for creation and extraction.
 
diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
index 2cf7005..e930c04 100644
--- a/package/cppcms/Config.in
+++ b/package/cppcms/Config.in
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_CPPCMS
 	bool "cppcms"
-	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_PCRE
-	select BR2_PACKAGE_LIBGCRYPT
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_STATIC_LIBS # dlopen()
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_LIBGCRYPT
 	help
 	  CppCMS is a Free High Performance Web Development Framework
 	  (not a CMS) aimed for Rapid Web Application Development. It
diff --git a/package/curlftpfs/Config.in b/package/curlftpfs/Config.in
index ad3ac24..c2d591a 100644
--- a/package/curlftpfs/Config.in
+++ b/package/curlftpfs/Config.in
@@ -1,15 +1,15 @@
 config BR2_PACKAGE_CURLFTPFS
 	bool "curlftpfs (FUSE)"
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse, glib2
+	depends on BR2_USE_MMU # libfuse, glib2
+	depends on !BR2_STATIC_LIBS # libfuse
 	select BR2_PACKAGE_LIBFUSE
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBCURL
-	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse, glib2
-	depends on BR2_USE_MMU # libfuse, glib2
-	depends on !BR2_STATIC_LIBS # libfuse
 	help
 	  CurlFtpFS is a filesystem for accessing FTP hosts based on FUSE
 	  and libcurl.
diff --git a/package/czmq/Config.in b/package/czmq/Config.in
index cfa5152..71389fc 100644
--- a/package/czmq/Config.in
+++ b/package/czmq/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_CZMQ
 	bool "czmq"
-	select BR2_PACKAGE_ZEROMQ
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
+	select BR2_PACKAGE_ZEROMQ
 	help
 	  High-level C Binding for 0MQ
 
diff --git a/package/ding-libs/Config.in b/package/ding-libs/Config.in
index 7af75b7..d397f29 100644
--- a/package/ding-libs/Config.in
+++ b/package/ding-libs/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_DING_LIBS
 	bool "ding-libs"
+	depends on BR2_USE_WCHAR || !BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	depends on BR2_USE_WCHAR || !BR2_NEEDS_GETTEXT
 	help
 	  The ding-libs packages contain a set of libraries used by
 	  the System Security Services Daemon (SSSD) and other
diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 6a3d718..e3b53e0 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -21,9 +21,9 @@ if BR2_PACKAGE_DIRECTFB
 
 config BR2_PACKAGE_DIRECTFB_MULTI
 	bool "directfb multi application"
-	select BR2_PACKAGE_LINUX_FUSION
 	depends on BR2_USE_MMU # madvise()
 	depends on BR2_LINUX_KERNEL
+	select BR2_PACKAGE_LINUX_FUSION
 	help
 	  Enable use of multiple concurrent DirectFB applications
 
@@ -113,8 +113,8 @@ config BR2_PACKAGE_DIRECTFB_SERIALMOUSE
 
 config BR2_PACKAGE_DIRECTFB_TSLIB
 	bool "enable touchscreen support"
-	depends on !BR2_STATIC_LIBS # tslib
 	default y
+	depends on !BR2_STATIC_LIBS # tslib
 	select BR2_PACKAGE_TSLIB
 
 comment "touchscreen support needs a toolchain w/ dynamic library"
@@ -130,8 +130,8 @@ config BR2_PACKAGE_DIRECTFB_TIFF
 
 config BR2_PACKAGE_DIRECTFB_IMLIB2
 	bool "enable IMLIB2 support"
-	select BR2_PACKAGE_IMLIB2
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_IMLIB2
 
 comment "imlib2 support needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 8cde4a4..caaf639 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -13,11 +13,11 @@ if BR2_PACKAGE_DOCKER_ENGINE
 
 config BR2_PACKAGE_DOCKER_ENGINE_DAEMON
 	bool "docker daemon"
+	default y
 	depends on BR2_USE_MMU # docker-containerd
 	select BR2_PACKAGE_DOCKER_CONTAINERD # runtime dependency
 	select BR2_PACKAGE_IPTABLES # runtime dependency
 	select BR2_PACKAGE_SQLITE # runtime dependency
-	default y
 	help
 	  Build the Docker system daemon.
 	  If not selected, will build client only.
diff --git a/package/dos2unix/Config.in b/package/dos2unix/Config.in
index 0a4f5e2..6945f52 100644
--- a/package/dos2unix/Config.in
+++ b/package/dos2unix/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_DOS2UNIX
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	bool "dos2unix"
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  dos2unix converts text file line endings between CRLF and LF
 
diff --git a/package/dovecot/Config.in b/package/dovecot/Config.in
index d1ff7bc..b93e09f 100644
--- a/package/dovecot/Config.in
+++ b/package/dovecot/Config.in
@@ -17,9 +17,9 @@ if BR2_PACKAGE_DOVECOT
 
 config BR2_PACKAGE_DOVECOT_MYSQL
 	bool "mysql support"
-	select BR2_PACKAGE_MYSQL
 	depends on BR2_INSTALL_LIBSTDCPP # mysql
 	depends on BR2_TOOLCHAIN_HAS_THREADS # mysql
+	select BR2_PACKAGE_MYSQL
 	help
 	  Enable MySQL support.
 
diff --git a/package/dropwatch/Config.in b/package/dropwatch/Config.in
index 6f04c85..127b698 100644
--- a/package/dropwatch/Config.in
+++ b/package/dropwatch/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_DROPWATCH
 	bool "dropwatch"
-	select BR2_PACKAGE_BINUTILS
 	depends on !BR2_nios2 # binutils
 	depends on BR2_USE_WCHAR # binutils
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
+	select BR2_PACKAGE_BINUTILS
 	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_LIBNL
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
 	help
 	  Dropwatch is an interactive utility for monitoring and
 	  recording packets that are dropped by the kernel
diff --git a/package/dvblast/Config.in b/package/dvblast/Config.in
index b7f0c06..c358531 100644
--- a/package/dvblast/Config.in
+++ b/package/dvblast/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_DVBLAST
 	bool "dvblast"
+	depends on !BR2_bfin  # libev
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # clock_nanosleep()
 	select BR2_PACKAGE_BITSTREAM
 	select BR2_PACKAGE_LIBEV
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	depends on !BR2_bfin  # libev
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # clock_nanosleep()
 	help
 	  DVBlast is a simple and powerful MPEG-2/TS demux and
 	  streaming application.
diff --git a/package/e2tools/Config.in b/package/e2tools/Config.in
index 75029f7..e4a35e2 100644
--- a/package/e2tools/Config.in
+++ b/package/e2tools/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_E2TOOLS
 	bool "e2tools"
-	select BR2_PACKAGE_E2FSPROGS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR # uses wchar_t
 	depends on BR2_USE_MMU # e2fsprogs
+	select BR2_PACKAGE_E2FSPROGS
 	help
 	  E2tools is a simple set of GPL'ed utilities to read, write,
 	  and manipulate files in an ext2/ext3 filesystem. These
diff --git a/package/easydbus/Config.in b/package/easydbus/Config.in
index 51519d6..1fe8689 100644
--- a/package/easydbus/Config.in
+++ b/package/easydbus/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_EASYDBUS
 	bool "easydbus"
-	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
+	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Easy to use DBus library for Lua.
 
diff --git a/package/ecryptfs-utils/Config.in b/package/ecryptfs-utils/Config.in
index cb70e00..078ca36 100644
--- a/package/ecryptfs-utils/Config.in
+++ b/package/ecryptfs-utils/Config.in
@@ -1,12 +1,5 @@
 config BR2_PACKAGE_ECRYPTFS_UTILS
 	bool "ecryptfs-utils"
-	select BR2_PACKAGE_KEYUTILS
-	select BR2_PACKAGE_LIBNSS
-	# runtime dependency only, some scripts are using the
-	# 'gettext' program to get translations
-	select BR2_PACKAGE_GETTEXT
-	# runtime dependency only
-	select BR2_PACKAGE_GETENT
 	depends on BR2_USE_WCHAR # gettext
 	depends on BR2_USE_MMU # keyutils
 	depends on !BR2_microblaze # keyutils
@@ -14,6 +7,13 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnss -> libnspr
 	depends on !BR2_MIPS_NABI32 # libnss
 	depends on !BR2_STATIC_LIBS # libnss, keyutils
+	select BR2_PACKAGE_KEYUTILS
+	select BR2_PACKAGE_LIBNSS
+	# runtime dependency only, some scripts are using the
+	# 'gettext' program to get translations
+	select BR2_PACKAGE_GETTEXT
+	# runtime dependency only
+	select BR2_PACKAGE_GETENT
 	help
 	  eCryptfs is a POSIX-compliant enterprise cryptographic
 	  filesystem for Linux. It is stacked on top of any other
diff --git a/package/efivar/Config.in b/package/efivar/Config.in
index 0ec8360..0fa9adf 100644
--- a/package/efivar/Config.in
+++ b/package/efivar/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS
 	bool
+	default y
 	depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64 \
 		|| BR2_powerpc64le || BR2_mipsel || BR2_mips64el
-	default y
 
 config BR2_PACKAGE_EFIVAR
 	bool "efivar"
diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
index 7db8472..3228319 100644
--- a/package/elfutils/Config.in
+++ b/package/elfutils/Config.in
@@ -5,9 +5,6 @@ comment "elfutils needs a uClibc or glibc toolchain w/ wchar, dynamic library"
 
 config BR2_PACKAGE_ELFUTILS
 	bool "elfutils"
-	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS
 	# Only glibc and uClibc implement the myriad of required GNUisms
@@ -15,6 +12,9 @@ config BR2_PACKAGE_ELFUTILS
 	# build issue caused by the _ prefix used on blackfin for
 	# assembly symbols
 	depends on !BR2_bfin
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	help
 	  Libraries/utilities to handle ELF objects (drop in
 	  replacement for libelf).
diff --git a/package/execline/Config.in b/package/execline/Config.in
index 556f9a5..7a2278f 100644
--- a/package/execline/Config.in
+++ b/package/execline/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_EXECLINE
 	bool "execline"
-	select BR2_PACKAGE_SKALIBS
 	depends on BR2_USE_MMU # skalibs
+	select BR2_PACKAGE_SKALIBS
 	help
 	  execline is a (non-interactive) scripting language, like sh;
 	  but its syntax is quite different from a traditional shell
diff --git a/package/exiv2/Config.in b/package/exiv2/Config.in
index 8ca95eb..a94e5cd 100644
--- a/package/exiv2/Config.in
+++ b/package/exiv2/Config.in
@@ -39,8 +39,8 @@ config BR2_PACKAGE_EXIV2_PNG
 
 config BR2_PACKAGE_EXIV2_XMP
 	bool "XMP support"
-	select BR2_PACKAGE_EXPAT
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_EXPAT
 	help
 	  Build with XMP support
 
diff --git a/package/f2fs-tools/Config.in b/package/f2fs-tools/Config.in
index ab81734..f0630e9 100644
--- a/package/f2fs-tools/Config.in
+++ b/package/f2fs-tools/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_F2FS_TOOLS
 	bool "f2fs-tools"
+	depends on BR2_USE_WCHAR # uses wchar_t
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
-	depends on BR2_USE_WCHAR # uses wchar_t
 	help
 	  Tools for Flash-Friendly File System (F2FS)
 
diff --git a/package/faifa/Config.in b/package/faifa/Config.in
index de2cc79..753abc6 100644
--- a/package/faifa/Config.in
+++ b/package/faifa/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_FAIFA
 	bool "faifa"
-	select BR2_PACKAGE_LIBPCAP
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBPCAP
 	help
 	  Faifa can configure any Intellon-based Power Line
 	  Communication device using Intellon INT5000 and INT6000
diff --git a/package/fastd/Config.in b/package/fastd/Config.in
index 546d449..47c76b5 100644
--- a/package/fastd/Config.in
+++ b/package/fastd/Config.in
@@ -16,8 +16,8 @@ if BR2_PACKAGE_FASTD
 config BR2_PACKAGE_FASTD_STATUS_SOCKET
 	bool "status socket support"
 	default y
-	select BR2_PACKAGE_JSON_C
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
+	select BR2_PACKAGE_JSON_C
 	help
 	  Enable support for a socket to get fastd's status.
 
diff --git a/package/fetchmail/Config.in b/package/fetchmail/Config.in
index 1eb0359..1e829a0 100644
--- a/package/fetchmail/Config.in
+++ b/package/fetchmail/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_FETCHMAIL
 	bool "fetchmail"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_CA_CERTIFICATES
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-	depends on BR2_USE_MMU # fork()
 	help
 	  Fetchmail - the mail-retrieval daemon
 	  Client daemon to move mail from POP and IMAP to your local computer
diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index b5850db..383374d 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -40,9 +40,9 @@ config BR2_PACKAGE_FFMPEG_FFMPEG
 
 config BR2_PACKAGE_FFMPEG_FFPLAY
 	bool "Build ffplay"
+	depends on !BR2_STATIC_LIBS # sdl2
 	select BR2_PACKAGE_FFMPEG_SWSCALE
 	select BR2_PACKAGE_SDL2
-	depends on !BR2_STATIC_LIBS # sdl2
 	help
 	  FFplay is a very simple and portable media player using the
 	  FFmpeg libraries and the SDL library.
diff --git a/package/filemq/Config.in b/package/filemq/Config.in
index e06a267..b4720c1 100644
--- a/package/filemq/Config.in
+++ b/package/filemq/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_FILEMQ
 	bool "filemq"
-	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_CZMQ
-	select BR2_PACKAGE_ZEROMQ
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 	depends on BR2_USE_MMU # czmq
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_CZMQ
+	select BR2_PACKAGE_ZEROMQ
 	help
 	  FileMQ is a publish-subscribe file service based on 0MQ.
 
diff --git a/package/flashrom/Config.in b/package/flashrom/Config.in
index adc068c..e7844a0 100644
--- a/package/flashrom/Config.in
+++ b/package/flashrom/Config.in
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_FLASHROM
 	bool "flashrom"
+	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_PCIUTILS
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	select BR2_PACKAGE_LIBFTDI
 	# dmidecode is only a runtime dependency
 	select BR2_PACKAGE_DMIDECODE
-	depends on BR2_i386 || BR2_x86_64
-	depends on BR2_TOOLCHAIN_HAS_THREADS 	# libusb
 	help
 	  flashrom is a utility for identifying, reading, writing,
 	  verifying and erasing flash chips. It is designed to flash
diff --git a/package/freescale-imx/gpu-amd-bin-mx51/Config.in b/package/freescale-imx/gpu-amd-bin-mx51/Config.in
index 337713c..cd66c73 100644
--- a/package/freescale-imx/gpu-amd-bin-mx51/Config.in
+++ b/package/freescale-imx/gpu-amd-bin-mx51/Config.in
@@ -5,12 +5,12 @@ comment "gpu-amd-bin-mx51 needs a glibc EABI toolchain w/ C++"
 
 config BR2_PACKAGE_GPU_AMD_BIN_MX51
 	bool "gpu-amd-bin-mx51 (also imx53)"
-	select BR2_PACKAGE_HAS_LIBEGL
-	select BR2_PACKAGE_HAS_LIBGLES
-	select BR2_PACKAGE_HAS_LIBOPENVG
 	depends on BR2_ARM_EABI
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_HAS_LIBGLES
+	select BR2_PACKAGE_HAS_LIBOPENVG
 	help
 	  Freescale libraries, headers and executables for the
 	  AMD GPU on i.MX5x, containing OpenGL/ES, OpenVG
@@ -26,6 +26,7 @@ choice
 	  Choose here which version to install.
 
 config BR2_PACKAGE_GPU_AMD_BIN_MX51_OUTPUT_X11
+	bool "X11"
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBXCB
 	select BR2_PACKAGE_XLIB_LIBX11
@@ -33,7 +34,6 @@ config BR2_PACKAGE_GPU_AMD_BIN_MX51_OUTPUT_X11
 	select BR2_PACKAGE_XLIB_LIBXRENDER
 	select BR2_PACKAGE_XLIB_LIBXDMCP
 	select BR2_PACKAGE_XLIB_LIBXAU
-	bool "X11"
 
 comment "X11 backend needs X.org enabled"
 	depends on !BR2_PACKAGE_XORG7
diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
index effb24b..dba378c 100644
--- a/package/freescale-imx/imx-gpu-viv/Config.in
+++ b/package/freescale-imx/imx-gpu-viv/Config.in
@@ -4,13 +4,13 @@ comment "imx-gpu-viv needs a glibc toolchain with armhf enabled"
 
 config BR2_PACKAGE_IMX_GPU_VIV
 	bool "imx-gpu-viv"
-	select BR2_PACKAGE_HAS_LIBEGL
-	select BR2_PACKAGE_HAS_LIBGLES
-	select BR2_PACKAGE_HAS_LIBOPENVG
 	# Pre-built binaries only available for ARM EABIhf
 	depends on BR2_ARM_EABIHF
 	# Library binaries are linked against libc.so.6
 	depends on BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_HAS_LIBGLES
+	select BR2_PACKAGE_HAS_LIBOPENVG
 	help
 	  Userspace libraries for Vivante GPU on i.MX6 platforms
 
diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index 809e02d..026cdea 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -4,13 +4,13 @@ comment "gdb/gdbserver needs a toolchain w/ threads, threads debug"
 
 config BR2_PACKAGE_GDB
 	bool "gdb"
+	depends on BR2_TOOLCHAIN_HAS_THREADS && BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	depends on !BR2_nios2 && !BR2_bfin
 	# When the external toolchain gdbserver is copied to the
 	# target, we don't allow building a separate gdbserver. The
 	# one from the external toolchain should be used.
 	select BR2_PACKAGE_GDB_SERVER if \
 		(!BR2_PACKAGE_GDB_DEBUGGER && !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)
-	depends on BR2_TOOLCHAIN_HAS_THREADS && BR2_TOOLCHAIN_HAS_THREADS_DEBUG
-	depends on !BR2_nios2 && !BR2_bfin
 	help
 	  GDB, the GNU Project debugger, allows you to see what is
 	  going on `inside' another program while it executes -- or
@@ -38,9 +38,9 @@ config BR2_PACKAGE_GDB_SERVER
 
 config BR2_PACKAGE_GDB_DEBUGGER
 	bool "full debugger"
-	select BR2_PACKAGE_NCURSES
 	depends on BR2_USE_WCHAR
 	depends on !BR2_sh && !BR2_microblaze
+	select BR2_PACKAGE_NCURSES
 
 comment "full gdb on target needs a toolchain w/ wchar"
 	depends on !BR2_sh && !BR2_microblaze
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 0d8ef7e..2a5ebc1 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -33,9 +33,9 @@ config BR2_PACKAGE_HOST_GDB_SIM
 
 choice
 	prompt "GDB debugger Version"
+	default BR2_GDB_VERSION_7_11
 	depends on !BR2_arc
 	depends on !BR2_microblaze
-	default BR2_GDB_VERSION_7_11
 	help
 	  Select the version of gdb you wish to use.
 
@@ -55,9 +55,9 @@ endif
 # If cross-gdb is not enabled, the latest working version is chosen.
 config BR2_GDB_VERSION
 	string
-	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
 	default "arc-2017.03-eng008-gdb" if BR2_arc
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
 	default "7.10.1"   if BR2_GDB_VERSION_7_10
 	default "7.11.1"   if BR2_GDB_VERSION_7_11 || !BR2_PACKAGE_HOST_GDB
 	default "7.12.1"   if BR2_GDB_VERSION_7_12
+	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
diff --git a/package/gesftpserver/Config.in b/package/gesftpserver/Config.in
index 81cbce9..bce4770 100644
--- a/package/gesftpserver/Config.in
+++ b/package/gesftpserver/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_GESFTPSERVER
 	bool "gesftpserver"
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Green End SFTP Server
 
diff --git a/package/glibmm/Config.in b/package/glibmm/Config.in
index fdbb438..7218db2 100644
--- a/package/glibmm/Config.in
+++ b/package/glibmm/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_GLIBMM
 	bool "glibmm"
-	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_LIBSIGC
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBSIGC
 	help
 	  The GLibmm package is a set of C++ bindings for GLib.
 
diff --git a/package/gnupg/Config.in b/package/gnupg/Config.in
index 30f215f..7c31612 100644
--- a/package/gnupg/Config.in
+++ b/package/gnupg/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_GNUPG
 	bool "gnupg"
+	depends on !BR2_PACKAGE_GNUPG2
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_NCURSES
-	depends on !BR2_PACKAGE_GNUPG2
 	help
 	  GnuPG is the GNU project's complete and free implementation
 	  of the OpenPGP standard as defined by RFC4880. GnuPG allows
diff --git a/package/gnupg2/Config.in b/package/gnupg2/Config.in
index 85a9805..c287089 100644
--- a/package/gnupg2/Config.in
+++ b/package/gnupg2/Config.in
@@ -4,6 +4,10 @@ comment "gnupg2 needs a toolchain w/ threads and dynamic library support"
 
 config BR2_PACKAGE_GNUPG2
 	bool "gnupg2"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpg-error
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnpth
+	depends on BR2_USE_MMU # libassuan, libnpth
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LIBGPG_ERROR
 	select BR2_PACKAGE_LIBGCRYPT
@@ -11,10 +15,6 @@ config BR2_PACKAGE_GNUPG2
 	select BR2_PACKAGE_LIBKSBA
 	select BR2_PACKAGE_LIBNPTH
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpg-error
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libnpth
-	depends on BR2_USE_MMU # libassuan, libnpth
-	depends on !BR2_STATIC_LIBS
 	help
 	  GnuPG is the GNU project's complete and free implementation
 	  of the OpenPGP standard as defined by RFC4880. GnuPG allows
diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
index cfb7cb3..1af00cd 100644
--- a/package/gnutls/Config.in
+++ b/package/gnutls/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_GNUTLS
 	bool "gnutls"
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBTASN1
 	select BR2_PACKAGE_LIBUNISTRING
 	select BR2_PACKAGE_NETTLE
 	select BR2_PACKAGE_PCRE
-	depends on BR2_USE_WCHAR
 	help
 	  GnuTLS is a secure communications library implementing the SSL
 	  and TLS protocols and technologies around them.
diff --git a/package/gptfdisk/Config.in b/package/gptfdisk/Config.in
index 22dc401..d243b90 100644
--- a/package/gptfdisk/Config.in
+++ b/package/gptfdisk/Config.in
@@ -35,10 +35,10 @@ config BR2_PACKAGE_GPTFDISK_SGDISK
 
 config BR2_PACKAGE_GPTFDISK_CGDISK
 	bool "ncurses cgdisk"
-	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_NCURSES_WCHAR # needed because of UTF-16
 	depends on BR2_USE_WCHAR # ncurses wchar
 	depends on !(BR2_bfin && BR2_BINFMT_FLAT) # ncurses wchar support
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_NCURSES_WCHAR # needed because of UTF-16
 	help
 	  Install the ncurses-based GUID partition table (GPT)
 	  manipulator /usr/sbin/cgdisk.
diff --git a/package/gstreamer/gst-fsl-plugins/Config.in b/package/gstreamer/gst-fsl-plugins/Config.in
index 8921aa3..85476b1 100644
--- a/package/gstreamer/gst-fsl-plugins/Config.in
+++ b/package/gstreamer/gst-fsl-plugins/Config.in
@@ -45,12 +45,12 @@ config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX233
 	bool "imx233"
 
 config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX25
-	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX25_3STACK
 	bool "imx25"
+	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX25_3STACK
 
 config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX27
-	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX27ADS
 	bool "imx27"
+	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX27ADS
 
 config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX28
 	bool "imx28"
@@ -62,28 +62,28 @@ config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX35
 	bool "imx35"
 
 config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX37
-	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX37_3STACK
 	bool "imx37"
+	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX37_3STACK
 
 config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX50
-	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX50
 	bool "imx50"
+	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX50
 
 config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX51
-	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX51
 	bool "imx51"
+	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX51
 
 config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX53
-	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX53
 	bool "imx53"
+	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX53
 
 config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX5X
-	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX5X
 	bool "imx5X"
+	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX5X
 
 config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX6
-	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX6Q
 	bool "imx6"
+	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX6Q
 
 endchoice
 
diff --git a/package/gstreamer/gst-plugins-bad/Config.in b/package/gstreamer/gst-plugins-bad/Config.in
index d54415a..939fc7a 100644
--- a/package/gstreamer/gst-plugins-bad/Config.in
+++ b/package/gstreamer/gst-plugins-bad/Config.in
@@ -57,8 +57,8 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DEBUGUTILS
 	bool "debugutils"
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DECKLINK
-	depends on BR2_INSTALL_LIBSTDCPP
 	bool "decklink"
+	depends on BR2_INSTALL_LIBSTDCPP
 
 comment "decklink needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
@@ -261,8 +261,8 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CURL
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DIRECTFB
 	bool "directfb"
-	depends on BR2_PACKAGE_DIRECTFB
 	default y
+	depends on BR2_PACKAGE_DIRECTFB
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVB
 	bool "dvb"
diff --git a/package/gstreamer/gst-plugins-good/Config.in b/package/gstreamer/gst-plugins-good/Config.in
index 65f74e8..a36481a 100644
--- a/package/gstreamer/gst-plugins-good/Config.in
+++ b/package/gstreamer/gst-plugins-good/Config.in
@@ -201,12 +201,12 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_OSS4
 	bool "oss4 (Open Sound System 4)"
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PULSE
+	bool "pulseaudio"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
 	depends on BR2_USE_MMU # pulseaudio
 	depends on !BR2_STATIC_LIBS # pulseaudio
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pulseaudio -> json-c
 	select BR2_PACKAGE_PULSEAUDIO
-	bool "pulseaudio"
 
 comment "pulseaudio support needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 1db5187..17cc22b 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -489,8 +489,8 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DASH
 	  DASH demuxer plugin
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DECKLINK
-	depends on BR2_INSTALL_LIBSTDCPP
 	bool "decklink"
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  Blackmagic Decklink plugin
 
@@ -499,14 +499,14 @@ comment "decklink needs a toolchain w/ C++"
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DIRECTFB
 	bool "directfb"
-	depends on BR2_PACKAGE_DIRECTFB
 	default y
+	depends on BR2_PACKAGE_DIRECTFB
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVB
 	bool "dvb"
-	select BR2_PACKAGE_DTV_SCAN_TABLES
 	# FEC_2_5 / QAM_4_NR definitions
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
+	select BR2_PACKAGE_DTV_SCAN_TABLES
 	help
 	  DVB elements
 
@@ -526,9 +526,9 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FBDEV
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FDK_AAC
 	bool "fdk-aac"
-	select BR2_PACKAGE_FDK_AAC
 	depends on BR2_PACKAGE_FDK_AAC_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_FDK_AAC
 	help
 	  MPEG AAC encoder/decoder
 
@@ -686,9 +686,9 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VOAACENC
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND
 	bool "wayland"
+	default y
 	depends on BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS
-	default y
 	help
 	  Wayland Video Sink
 
diff --git a/package/gstreamer1/gst1-plugins-base/Config.in b/package/gstreamer1/gst1-plugins-base/Config.in
index 897c1d1..a17f2ad 100644
--- a/package/gstreamer1/gst1-plugins-base/Config.in
+++ b/package/gstreamer1/gst1-plugins-base/Config.in
@@ -54,9 +54,9 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_GIO
 	  GIO elements
 
 config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PLAYBACK
-	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_TYPEFIND
 	bool "playback"
 	default y
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_TYPEFIND
 	help
 	  various playback elements
 
diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index 27f24f5..9d23e9f 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -306,9 +306,9 @@ comment "flac needs a toolchain w/ wchar"
 
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_GDKPIXBUF
 	bool "gdkpixbuf"
-	select BR2_PACKAGE_GDK_PIXBUF
 	depends on BR2_USE_WCHAR # gdk-pixbuf -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # gdk-pixbuf -> libglib2
+	select BR2_PACKAGE_GDK_PIXBUF
 	help
 	  GdkPixbuf-based image decoder, overlay and sink
 
@@ -316,12 +316,12 @@ comment "gdkpixbuf needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_PULSE
+	bool "pulseaudio"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
 	depends on BR2_USE_MMU # pulseaudio
 	depends on !BR2_STATIC_LIBS # pulseaudio
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pulseaudio -> json-c
 	select BR2_PACKAGE_PULSEAUDIO
-	bool "pulseaudio"
 	help
 	  PulseAudio plugin library
 
@@ -360,9 +360,9 @@ comment "taglib needs a toolchain w/ C++, wchar"
 
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VPX
 	bool "vpx (webm)"
-	select BR2_PACKAGE_LIBVPX
 	depends on !BR2_bfin # libvpx
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libvpx
+	select BR2_PACKAGE_LIBVPX
 	help
 	  VP8 plugin
 
diff --git a/package/gstreamer1/gst1-vaapi/Config.in b/package/gstreamer1/gst1-vaapi/Config.in
index 0b8ae39..91bd4f8 100644
--- a/package/gstreamer1/gst1-vaapi/Config.in
+++ b/package/gstreamer1/gst1-vaapi/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_GST1_VAAPI
 	bool "gst1-vaapi"
+	depends on !BR2_STATIC_LIBS # dlopen(), libva
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libva, libdrm
+	depends on BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_LIBVA
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_GST1_PLUGINS_BAD # gstreamer-codecparsers
-	depends on !BR2_STATIC_LIBS # dlopen(), libva
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libva, libdrm
-	depends on BR2_PACKAGE_HAS_UDEV
 	help
 	  gstreamer-vaapi consists in a collection of VA-API based
 	  plugins for GStreamer and helper libraries.
diff --git a/package/gupnp-tools/Config.in b/package/gupnp-tools/Config.in
index f9e645a..af66241 100644
--- a/package/gupnp-tools/Config.in
+++ b/package/gupnp-tools/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_GUPNP_TOOLS
 	bool "gupnp-tools"
+	depends on BR2_PACKAGE_LIBGTK3
 	# gssdp, gupnp, libsoup all select on libglib2, so they have
 	# the same dependencies as libgtk3, which we depend on. So for
 	# the same of simplicity, we don't replicate all those
@@ -8,7 +9,6 @@ config BR2_PACKAGE_GUPNP_TOOLS
 	select BR2_PACKAGE_GUPNP
 	select BR2_PACKAGE_LIBSOUP
 	select BR2_PACKAGE_LIBXML2
-	depends on BR2_PACKAGE_LIBGTK3
 	help
 	  GUPnP Tools are free replacements of Intel UPnP tools that
 	  use GUPnP. They provides client and server side tools which
diff --git a/package/iftop/Config.in b/package/iftop/Config.in
index 8c6ae0c..f80a831 100644
--- a/package/iftop/Config.in
+++ b/package/iftop/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_IFTOP
 	bool "iftop"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_LIBPCAP
-	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  iftop does for network usage what top(1) does for CPU usage.
 	  It listens to network traffic on a named interface and displays
diff --git a/package/imlib2/Config.in b/package/imlib2/Config.in
index 7aac074..c47178f 100644
--- a/package/imlib2/Config.in
+++ b/package/imlib2/Config.in
@@ -3,8 +3,8 @@ comment "imlib2 needs a toolchain w/ dynamic library"
 
 config BR2_PACKAGE_IMLIB2
 	bool "imlib2"
-	select BR2_PACKAGE_FREETYPE
 	depends on !BR2_STATIC_LIBS # dlopen()
+	select BR2_PACKAGE_FREETYPE
 	help
 	  Imlib 2 is the successor to Imlib. This library provides
 	  routines to load, save and render images in various formats.
diff --git a/package/iprutils/Config.in b/package/iprutils/Config.in
index b429e71..8e2884a 100644
--- a/package/iprutils/Config.in
+++ b/package/iprutils/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_IPRUTILS
 	bool "iprutils"
+	depends on BR2_USE_MMU # fork()
+	depends on !BR2_bfin # pciutils
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_LIBSYSFS
 	select BR2_PACKAGE_PCIUTILS
-	depends on BR2_USE_MMU # fork()
-	depends on !BR2_bfin # pciutils
 	help
 	  System utilities for IBM Power RAID devices
 
diff --git a/package/ipsec-tools/Config.in b/package/ipsec-tools/Config.in
index 36c5a65..1635675 100644
--- a/package/ipsec-tools/Config.in
+++ b/package/ipsec-tools/Config.in
@@ -12,8 +12,8 @@ config BR2_PACKAGE_IPSEC_TOOLS
 if BR2_PACKAGE_IPSEC_TOOLS
 
 config BR2_PACKAGE_IPSEC_TOOLS_ADMINPORT
-	default y
 	bool "Enable racoonctl(8)"
+	default y
 	help
 	  Lets racoon to listen to racoon admin port, which is to
 	  be contacted by racoonctl(8).
@@ -42,12 +42,12 @@ config BR2_PACKAGE_IPSEC_TOOLS_DPD
 	  Enable dead peer detection support
 
 config BR2_PACKAGE_IPSEC_TOOLS_STATS
-	default y
 	bool "Enable statistics logging function"
+	default y
 
 config BR2_PACKAGE_IPSEC_TOOLS_READLINE
-	select BR2_PACKAGE_READLINE
 	bool "Enable readline input support"
+	select BR2_PACKAGE_READLINE
 
 config BR2_PACKAGE_IPSEC_TOOLS_HYBRID
 	bool "Enable hybrid, both mode-cfg and xauth support"
diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 5c7b633..e07b4ad 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -1,14 +1,14 @@
 menuconfig BR2_PACKAGE_JANUS_GATEWAY
 	bool "janus-gateway"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_WCHAR # libnice -> libglib2
+	depends on BR2_USE_MMU # libnice
+	depends on !BR2_STATIC_LIBS # dlopen
 	select BR2_PACKAGE_JANSSON
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBNICE
 	select BR2_PACKAGE_LIBSRTP
 	select BR2_PACKAGE_OPENSSL
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
-	depends on BR2_USE_WCHAR # libnice -> libglib2
-	depends on BR2_USE_MMU # libnice
-	depends on !BR2_STATIC_LIBS # dlopen
 	help
 	  Janus is an open source, general purpose, WebRTC gateway
 	  designed and developed by Meetecho.
diff --git a/package/joe/Config.in b/package/joe/Config.in
index eabfae7..f335e05 100644
--- a/package/joe/Config.in
+++ b/package/joe/Config.in
@@ -13,8 +13,8 @@ config BR2_PACKAGE_JOE
 
 config BR2_PACKAGE_JOE_FULL
 	bool "full install of rc and syntax highlighting files"
-	depends on BR2_PACKAGE_JOE
 	default y
+	depends on BR2_PACKAGE_JOE
 	help
 	  Install all rc and syntax highlighting files. Without this option
 	  only the joe binary is installed, which contains a default
diff --git a/package/jsoncpp/Config.in b/package/jsoncpp/Config.in
index 83118c4..a6c6b91 100644
--- a/package/jsoncpp/Config.in
+++ b/package/jsoncpp/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_JSONCPP
+	bool "jsoncpp"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
 	depends on BR2_INSTALL_LIBSTDCPP
-	bool "jsoncpp"
 	help
 	  JsonCpp is a C++ library that allows manipulating JSON
 	  values, including serialization and deserialization to and
diff --git a/package/kbd/Config.in b/package/kbd/Config.in
index 44c3163..ab1f1b3 100644
--- a/package/kbd/Config.in
+++ b/package/kbd/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_KBD
 	bool "kbd"
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	# Uses fork()
 	depends on BR2_USE_MMU
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Keytable files and keyboard utilities.
 
diff --git a/package/knock/Config.in b/package/knock/Config.in
index 8778a7e..0060ad0 100644
--- a/package/knock/Config.in
+++ b/package/knock/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_KNOCK
 	bool "knock"
-	select BR2_PACKAGE_LIBPCAP
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBPCAP
 	help
 	  A port knocking implementation.
 	  Provides a daemon and a user application. Port knocking can be
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 5b1b424..ba9557e 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	bool
-	depends on BR2_USE_MMU # libcdio, and others
 	default y if (BR2_arm || (BR2_mipsel && BR2_TOOLCHAIN_USES_GLIBC) || BR2_i386 || BR2_x86_64) \
 		&& BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS \
 		&& BR2_TOOLCHAIN_HAS_SYNC_8
+	depends on BR2_USE_MMU # libcdio, and others
 
 comment "kodi needs python w/ .py modules, a uClibc or glibc toolchain w/ C++, threads, wchar, dynamic library, gcc >= 4.7, host gcc >= 4.6"
 	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
index 7265646..7eab0c2 100644
--- a/package/kvm-unit-tests/Config.in
+++ b/package/kvm-unit-tests/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_KVM_UNIT_TESTS
 	bool "kvm-unit-tests"
-	select BR2_HOSTARCH_NEEDS_IA32_COMPILER if BR2_x86_64=y
 	# on i386 and x86-64, __builtin_reachable is used, so we need
 	# gcc 4.5 at least. on i386, we use the target gcc, while on
 	# x86-64 we use the host gcc (see .mk file for details)
@@ -11,6 +10,7 @@ config BR2_PACKAGE_KVM_UNIT_TESTS
 		BR2_powerpc64 || \
 		BR2_powerpc64le || \
 		(BR2_x86_64 && BR2_HOST_GCC_AT_LEAST_4_5)
+	select BR2_HOSTARCH_NEEDS_IA32_COMPILER if BR2_x86_64=y
 	help
 	  kvm-unit-tests is a project as old as KVM. As its name
 	  suggests, it's purpose is to provide unit tests for KVM. The
diff --git a/package/lapack/Config.in b/package/lapack/Config.in
index b5eca49..9687ace 100644
--- a/package/lapack/Config.in
+++ b/package/lapack/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_LAPACK
 
 config BR2_PACKAGE_LAPACK_COMPLEX
 	bool "Complex/Complex16 support"
-	depends on BR2_PACKAGE_LAPACK
 	default y
+	depends on BR2_PACKAGE_LAPACK
 	help
 	  Builds support for COMPLEX and COMPLEX16 data types.
diff --git a/package/lesstif/Config.in b/package/lesstif/Config.in
index a6a88ec..654ee6f 100644
--- a/package/lesstif/Config.in
+++ b/package/lesstif/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_LESSTIF
 	bool "lesstif"
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_FREETYPE
-	depends on BR2_USE_MMU # fork()
 	help
 	  lesstif is the Hungry Programmers' version of OSF/Motif
 
diff --git a/package/libcroco/Config.in b/package/libcroco/Config.in
index 5baf83d..ad78a14 100644
--- a/package/libcroco/Config.in
+++ b/package/libcroco/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_LIBCROCO
 	bool "libcroco"
-	select BR2_PACKAGE_LIBXML2
-	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Libcroco is a standalone css2 parsing and manipulation
 	  library. The parser provides a low level event driven SAC
diff --git a/package/libdri2/Config.in b/package/libdri2/Config.in
index fff979e..a10df74 100644
--- a/package/libdri2/Config.in
+++ b/package/libdri2/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_LIBDRI2
 	bool "libdri2"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
+	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XPROTO_DRI2PROTO
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
-	depends on BR2_PACKAGE_XORG7
 	help
 	  Library for the DRI2 extension to the X Window System.
 
diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index 81fc5cc..8acd542 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -1,7 +1,7 @@
 menuconfig BR2_PACKAGE_LIBDRM
 	bool "libdrm"
-	select BR2_PACKAGE_LIBPTHREAD_STUBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libpthread-stubs
+	select BR2_PACKAGE_LIBPTHREAD_STUBS
 	help
 	  Direct Rendering Manager
 
@@ -20,9 +20,9 @@ config BR2_PACKAGE_LIBDRM_ENABLE_ATOMIC
 
 config BR2_PACKAGE_LIBDRM_INTEL
 	bool "intel"
-	select BR2_PACKAGE_LIBPCIACCESS
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_PACKAGE_LIBDRM_HAS_ATOMIC
+	select BR2_PACKAGE_LIBPCIACCESS
 	select BR2_PACKAGE_LIBDRM_ENABLE_ATOMIC
 	help
 	  Install intel graphics driver.
diff --git a/package/libepoxy/Config.in b/package/libepoxy/Config.in
index c87366a..9da190b 100644
--- a/package/libepoxy/Config.in
+++ b/package/libepoxy/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBEPOXY
 	bool "libepoxy"
-	select BR2_PACKAGE_XUTIL_UTIL_MACROS
 	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_XUTIL_UTIL_MACROS
 	help
 	  Epoxy is a library for handling OpenGL function pointer
 	  management for you.
diff --git a/package/libfm-extra/Config.in b/package/libfm-extra/Config.in
index 79465f9..eefc022 100644
--- a/package/libfm-extra/Config.in
+++ b/package/libfm-extra/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_LIBFM_EXTRA
 	bool "libfm-extra"
-	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
+	select BR2_PACKAGE_LIBGLIB2
 	help
 	  The libfm-extra package contains a library and other files
 	  required by menu-cache-gen libexec of menu-cache
diff --git a/package/libfm/Config.in b/package/libfm/Config.in
index 0463d1c..92f0034 100644
--- a/package/libfm/Config.in
+++ b/package/libfm/Config.in
@@ -1,15 +1,15 @@
 config BR2_PACKAGE_LIBFM
 	bool "libfm"
-	select BR2_PACKAGE_MENU_CACHE
-	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_LIBGTK2 if !BR2_PACKAGE_LIBGTK3_X11
-	select BR2_PACKAGE_CAIRO
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_INSTALL_LIBSTDCPP # libgtk2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
+	select BR2_PACKAGE_MENU_CACHE
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBGTK2 if !BR2_PACKAGE_LIBGTK3_X11
+	select BR2_PACKAGE_CAIRO
 	help
 	  A glib/gio-based library providing some file management
 	  utilities and related-widgets missing in gtk+/glib. This is
diff --git a/package/libfreeglut/Config.in b/package/libfreeglut/Config.in
index e09e7ef..f7cd90b 100644
--- a/package/libfreeglut/Config.in
+++ b/package/libfreeglut/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_LIBFREEGLUT
 	bool "libfreeglut"
+	depends on BR2_PACKAGE_HAS_LIBGL
+	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBGLU
 	select BR2_PACKAGE_XLIB_LIBXI
 	select BR2_PACKAGE_XLIB_LIBXRANDR
 	select BR2_PACKAGE_XLIB_LIBXXF86VM
-	depends on BR2_PACKAGE_HAS_LIBGL
-	depends on BR2_PACKAGE_XORG7
 	help
 	  FreeGLUT is a free-software/open-source alternative to the
 	  OpenGL Utility Toolkit (GLUT) library. GLUT (and hence
diff --git a/package/libftdi1/Config.in b/package/libftdi1/Config.in
index aca797b..d473213 100644
--- a/package/libftdi1/Config.in
+++ b/package/libftdi1/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBFTDI1
 	bool "libftdi1"
-	select BR2_PACKAGE_LIBUSB
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	select BR2_PACKAGE_LIBUSB
 	help
 	  Userspace access to FTDI USB interface chips (version 1.x)
 
@@ -11,10 +11,10 @@ if BR2_PACKAGE_LIBFTDI1
 
 config BR2_PACKAGE_LIBFTDI1_LIBFTDIPP1
 	bool "libftdipp1"
-	select BR2_PACKAGE_BOOST
 	depends on BR2_INSTALL_LIBSTDCPP # boost
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
 	depends on BR2_USE_WCHAR # boost
+	select BR2_PACKAGE_BOOST
 	help
 	  C++ bindings for libftdi
 
@@ -28,8 +28,8 @@ config BR2_PACKAGE_LIBFTDI1_PYTHON_BINDINGS
 	  Python bindings for libftdi
 
 config BR2_PACKAGE_LIBFTDI1_FDTI_EEPROM
-	select BR2_PACKAGE_LIBCONFUSE
 	bool "ftdi_eeprom tool"
+	select BR2_PACKAGE_LIBCONFUSE
 
 endif # BR2_PACKAGE_LIBFTDI1
 
diff --git a/package/libgdiplus/Config.in b/package/libgdiplus/Config.in
index 6862503..6ddf44f 100644
--- a/package/libgdiplus/Config.in
+++ b/package/libgdiplus/Config.in
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_LIBGDIPLUS
 	bool "libgdiplus"
-	select BR2_PACKAGE_XLIB_LIBXFT
-	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_CAIRO
-	select BR2_PACKAGE_LIBPNG
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_WCHAR # libglib2 -> gettext
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
+	select BR2_PACKAGE_XLIB_LIBXFT
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_LIBPNG
 	help
 	  An Open Source implementation of the GDI+ API.
 
diff --git a/package/libglib2/Config.in b/package/libglib2/Config.in
index 80c7d67..62e29ef 100644
--- a/package/libglib2/Config.in
+++ b/package/libglib2/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_LIBGLIB2
 	bool "libglib2"
+	depends on BR2_USE_WCHAR # gettext
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBFFI
@@ -8,9 +11,6 @@ config BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	select BR2_PACKAGE_ZLIB
-	depends on BR2_USE_WCHAR # gettext
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_USE_MMU # fork()
 	help
 	  Low-level core library that forms the basis of GTK+ and GNOME.
 
diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
index b6cf37e..aa297d7 100644
--- a/package/libgtk2/Config.in
+++ b/package/libgtk2/Config.in
@@ -1,5 +1,11 @@
 config BR2_PACKAGE_LIBGTK2
 	bool "libgtk2"
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
+	depends on BR2_INSTALL_LIBSTDCPP # pango
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	select BR2_PACKAGE_ATK
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PS
@@ -12,12 +18,6 @@ config BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXRENDER
-	depends on BR2_PACKAGE_XORG7
-	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
-	depends on BR2_USE_MMU # glib2
-	depends on BR2_INSTALL_LIBSTDCPP # pango
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	help
 	  The GTK+ version 2 graphical user interface library
 
diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index 738f865..653f5dd 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -12,6 +12,13 @@ comment "libgtk3 needs an OpenGL or an OpenGL-EGL/wayland backend"
 
 config BR2_PACKAGE_LIBGTK3
 	bool "libgtk3"
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
+	depends on BR2_INSTALL_LIBSTDCPP # pango
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
+	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
+		BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_ATK
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PS
@@ -24,13 +31,6 @@ config BR2_PACKAGE_LIBGTK3
 	# At least one backend is required
 	select BR2_PACKAGE_LIBGTK3_BROADWAY if \
 		!(BR2_PACKAGE_LIBGTK3_X11 || BR2_PACKAGE_LIBGTK3_WAYLAND)
-	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
-	depends on BR2_USE_MMU # glib2
-	depends on BR2_INSTALL_LIBSTDCPP # pango
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
-	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
-		BR2_PACKAGE_HAS_LIBGL
 	help
 	  The GTK+ version 3 graphical user interface library
 
diff --git a/package/libiio/Config.in b/package/libiio/Config.in
index 8cde0e9..75f6f3a 100644
--- a/package/libiio/Config.in
+++ b/package/libiio/Config.in
@@ -17,24 +17,24 @@ config BR2_PACKAGE_LIBIIO_LOCAL_BACKEND
 
 config BR2_PACKAGE_LIBIIO_XML_BACKEND
 	bool "XML backend"
-	select BR2_PACKAGE_LIBXML2
 	default y
+	select BR2_PACKAGE_LIBXML2
 	help
 	  Enable the XML backend of the library.
 
 config BR2_PACKAGE_LIBIIO_NETWORK_BACKEND
 	bool "Network backend"
-	select BR2_PACKAGE_LIBIIO_XML_BACKEND
 	default y
+	select BR2_PACKAGE_LIBIIO_XML_BACKEND
 	help
 	  Enable the network backend of the library.
 
 config BR2_PACKAGE_LIBIIO_USB_BACKEND
 	bool "USB backend"
+	default y
 	depends on BR2_TOOLCHAIN_HAS_THREADS # from libusb
 	select BR2_PACKAGE_LIBIIO_XML_BACKEND
 	select BR2_PACKAGE_LIBUSB
-	default y
 	help
 	  Enable the USB backend of the library.
 
@@ -43,18 +43,18 @@ comment "The USB backend needs a toolchain w/ threads"
 
 config BR2_PACKAGE_LIBIIO_SERIAL_BACKEND
 	bool "Serial backend"
+	default y
 	select BR2_PACKAGE_LIBIIO_XML_BACKEND
 	select BR2_PACKAGE_LIBSERIALPORT
-	default y
 	help
 	  Enable the serial backend of the library.
 
 config BR2_PACKAGE_LIBIIO_IIOD
 	bool "IIO Daemon"
-	select BR2_PACKAGE_LIBIIO_LOCAL_BACKEND
+	default y
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_bfin
-	default y
+	select BR2_PACKAGE_LIBIIO_LOCAL_BACKEND
 	help
 	  Install the IIO Daemon.
 
diff --git a/package/libmad/Config.in b/package/libmad/Config.in
index f93f54a..c4feb72 100644
--- a/package/libmad/Config.in
+++ b/package/libmad/Config.in
@@ -37,9 +37,9 @@ config BR2_PACKAGE_LIBMAD_SSO
 
 config BR2_PACKAGE_LIBMAD_ASO
 	bool "Architecture-specific optimizations"
+	default y
 	# arm optimization needs classic arm instructions support
 	depends on !(BR2_arm && !BR2_ARM_CPU_HAS_ARM)
-	default y
 	help
 	  Use certain architecture-specific optimizations.
 
diff --git a/package/libmatroska/Config.in b/package/libmatroska/Config.in
index 5815a46..ec0e841 100644
--- a/package/libmatroska/Config.in
+++ b/package/libmatroska/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_LIBMATROSKA
 	bool "libmatroska"
-	select BR2_PACKAGE_LIBEBML
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_LIBEBML
 	help
 	  Extensible open standard audio/video container format access
 	  library.
diff --git a/package/libnice/Config.in b/package/libnice/Config.in
index 1d7c341..c803a31 100644
--- a/package/libnice/Config.in
+++ b/package/libnice/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_LIBNICE
 	bool "libnice"
-	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Libnice is an implementation of the IETF's Interactive
 	  Connectivity Establishment (ICE) standard (RFC 5245) and the
diff --git a/package/libnss/Config.in b/package/libnss/Config.in
index f07bb04..599c9a6 100644
--- a/package/libnss/Config.in
+++ b/package/libnss/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_LIBNSS
 	bool "libnss"
-	select BR2_PACKAGE_LIBNSPR
-	select BR2_PACKAGE_SQLITE
-	select BR2_PACKAGE_ZLIB
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnspr
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnspr
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBNSPR
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_ZLIB
 	help
 	  Network Security Services (NSS) is a set of libraries designed
 	  to support development of security-enabled client and server
diff --git a/package/libplayer/Config.in b/package/libplayer/Config.in
index 1261c1e..e1e04a1 100644
--- a/package/libplayer/Config.in
+++ b/package/libplayer/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBPLAYER
-	depends on BR2_TOOLCHAIN_HAS_THREADS
 	bool "libplayer"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  libplayer provides a generic A/V API that relies on various multimedia
 	  player for Linux systems. It currently supports MPlayer, xine VLC and
diff --git a/package/libqmi/Config.in b/package/libqmi/Config.in
index a0e896c..cfb0ecd 100644
--- a/package/libqmi/Config.in
+++ b/package/libqmi/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_LIBQMI
 	bool "libqmi"
-	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
+	select BR2_PACKAGE_LIBGLIB2
 	help
 	  libqmi is a glib-based library for talking to WWAN modems and devices
 	  which speak the Qualcomm MSM Interface (QMI) protocol.
diff --git a/package/librsvg/Config.in b/package/librsvg/Config.in
index 7ce9d06..211c53a 100644
--- a/package/librsvg/Config.in
+++ b/package/librsvg/Config.in
@@ -1,5 +1,10 @@
 config BR2_PACKAGE_LIBRSVG
 	bool "librsvg"
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
+	depends on BR2_INSTALL_LIBSTDCPP # pango
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_GDK_PIXBUF
@@ -7,11 +12,6 @@ config BR2_PACKAGE_LIBRSVG
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_PANGO
-	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
-	depends on BR2_USE_MMU # glib2
-	depends on BR2_INSTALL_LIBSTDCPP # pango
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	help
 	  The rsvg library is an efficient renderer for Scalable
 	  Vector Graphics (SVG) pictures.
diff --git a/package/librtlsdr/Config.in b/package/librtlsdr/Config.in
index 1e217bc..c2bf1a9 100644
--- a/package/librtlsdr/Config.in
+++ b/package/librtlsdr/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBRTLSDR
 	bool "librtlsdr"
-	select BR2_PACKAGE_LIBUSB
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBUSB
 	help
 	  Library and command line programs for accessing
 	  RTL2832U SDR dongles.
diff --git a/package/libsecret/Config.in b/package/libsecret/Config.in
index 70f1fe7..a8de8f8 100644
--- a/package/libsecret/Config.in
+++ b/package/libsecret/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_LIBSECRET
 	bool "libsecret"
-	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_WCHAR # gettext dep in libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
+	select BR2_PACKAGE_LIBGLIB2
 	help
 	  libsecret is a library for storing and retrieving passwords and other
 	  secrets. It communicates with the "Secret Service" using DBus.
diff --git a/package/libselinux/Config.in b/package/libselinux/Config.in
index c88669b..6be816d 100644
--- a/package/libselinux/Config.in
+++ b/package/libselinux/Config.in
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_LIBSELINUX
 	bool "libselinux"
-	select BR2_PACKAGE_LIBSEPOL
-	select BR2_PACKAGE_PCRE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	# Uses <fts.h>, not available in musl or uClibc
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	# Toolchain issue: "fixup not contained within frag"
 	depends on !BR2_arc
+	select BR2_PACKAGE_LIBSEPOL
+	select BR2_PACKAGE_PCRE
 	help
 	  libselinux is the runtime SELinux library that provides
 	  interfaces (e.g. library functions for the SELinux kernel
diff --git a/package/libsemanage/Config.in b/package/libsemanage/Config.in
index 4318dbf..7ee9c38 100644
--- a/package/libsemanage/Config.in
+++ b/package/libsemanage/Config.in
@@ -1,9 +1,5 @@
 config BR2_PACKAGE_LIBSEMANAGE
 	bool "libsemanage"
-	select BR2_PACKAGE_AUDIT
-	select BR2_PACKAGE_LIBSELINUX
-	select BR2_PACKAGE_USTR
-	select BR2_PACKAGE_BZIP2
 	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
@@ -12,6 +8,10 @@ config BR2_PACKAGE_LIBSEMANAGE
 	# - audit is not available on musl
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on !BR2_arc
+	select BR2_PACKAGE_AUDIT
+	select BR2_PACKAGE_LIBSELINUX
+	select BR2_PACKAGE_USTR
+	select BR2_PACKAGE_BZIP2
 	help
 	  libsemanage is the policy management library. It uses
 	  libsepol for binary policy manipulation and libselinux for
diff --git a/package/libsigrok/Config.in b/package/libsigrok/Config.in
index ff2d249..d2d022e 100644
--- a/package/libsigrok/Config.in
+++ b/package/libsigrok/Config.in
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_LIBSIGROK
 	bool "libsigrok"
-	select BR2_PACKAGE_LIBZIP
-	select BR2_PACKAGE_LIBGLIB2
 	# libglib2
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
 	# std=c11
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+	select BR2_PACKAGE_LIBZIP
+	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Libsigrok is a shared library written in C, which provides
 	  the basic hardware access drivers for logic analyzers and
@@ -22,9 +22,9 @@ if BR2_PACKAGE_LIBSIGROK
 
 config BR2_PACKAGE_LIBSIGROKCXX
 	bool "build C++ bindings"
-	select BR2_PACKAGE_GLIBMM
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # glibmm
+	select BR2_PACKAGE_GLIBMM
 	help
 	  Build libsigrok C++ bindings as well.
 
diff --git a/package/libsigrokdecode/Config.in b/package/libsigrokdecode/Config.in
index 70f86ce..28cbb5c 100644
--- a/package/libsigrokdecode/Config.in
+++ b/package/libsigrokdecode/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_LIBSIGROKDECODE
 	bool "libsigrokdecode"
-	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_PYTHON3
 	depends on !BR2_PACKAGE_PYTHON # python3
 	depends on BR2_USE_WCHAR # libglib2/python3
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2/python3
 	depends on BR2_USE_MMU # libglib2/python3
 	depends on !BR2_STATIC_LIBS # python3
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_PYTHON3
 	help
 	  Libsigrokdecode is a shared library written in C, which
 	  provides (streaming) protocol decoding functionality. Say
diff --git a/package/libstrophe/Config.in b/package/libstrophe/Config.in
index 55dc162..5fdb918 100644
--- a/package/libstrophe/Config.in
+++ b/package/libstrophe/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_LIBSTROPHE
 	bool "libstrophe"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBXML2 if !BR2_PACKAGE_EXPAT
-	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  libstrophe is a lightweight XMPP client library written in C.
 	  It has minimal dependencies and is configurable for various
diff --git a/package/libupnpp/Config.in b/package/libupnpp/Config.in
index 2d99586..46abd65 100644
--- a/package/libupnpp/Config.in
+++ b/package/libupnpp/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_LIBUPNPP
 	bool "libupnpp"
-	select BR2_PACKAGE_EXPAT
-	select BR2_PACKAGE_LIBCURL
-	select BR2_PACKAGE_LIBUPNP
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnp
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
+	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBUPNP
 	help
 	  The libupnpp C++ library wraps libupnp for easier use by upmpdcli and
 	  upplay.
diff --git a/package/liburcu/Config.in b/package/liburcu/Config.in
index b5b6326..4330255 100644
--- a/package/liburcu/Config.in
+++ b/package/liburcu/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	bool
+	default y
 	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_powerpc || BR2_x86_64
 	depends on BR2_USE_MMU # fork() in test
-	default y
 
 config BR2_PACKAGE_LIBURCU
 	bool "liburcu"
diff --git a/package/libva-intel-driver/Config.in b/package/libva-intel-driver/Config.in
index a39e554..120f152 100644
--- a/package/libva-intel-driver/Config.in
+++ b/package/libva-intel-driver/Config.in
@@ -1,14 +1,14 @@
 config BR2_PACKAGE_LIBVA_INTEL_DRIVER
 	bool "libva-intel-driver"
+	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm/libpthread-stubs
+	depends on !BR2_STATIC_LIBS # libva
 	select BR2_PACKAGE_LIBVA
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBDRM_INTEL
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_XORG7
-	depends on BR2_i386 || BR2_x86_64
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm/libpthread-stubs
-	depends on !BR2_STATIC_LIBS # libva
 	help
 	  VA-API back-end driver for Intel graphics chips
 
diff --git a/package/libva/Config.in b/package/libva/Config.in
index 75692f2..048e4c9 100644
--- a/package/libva/Config.in
+++ b/package/libva/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_LIBVA
 	bool "libva"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm/libpthread-stubs
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_XORG7
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm/libpthread-stubs
-	depends on !BR2_STATIC_LIBS
 	help
 	  The main motivation for VA-API (Video Acceleration API) is to enable
 	  hardware accelerated video decode/encode at various entry-points (VLD,
diff --git a/package/libwebsock/Config.in b/package/libwebsock/Config.in
index 9ef2136..14651cf 100644
--- a/package/libwebsock/Config.in
+++ b/package/libwebsock/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBWEBSOCK
 	bool "libwebsock"
-	select BR2_PACKAGE_LIBEVENT
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBEVENT
 	help
 	  C library for easy WebSockets servers.
 
diff --git a/package/libxmlpp/Config.in b/package/libxmlpp/Config.in
index 0f2da98..6d957ff 100644
--- a/package/libxmlpp/Config.in
+++ b/package/libxmlpp/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_LIBXMLPP
 	bool "libxml++"
-	select BR2_PACKAGE_LIBXML2
-	select BR2_PACKAGE_GLIBMM
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # glibmm -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glibmm -> libglib2
 	depends on BR2_USE_MMU # glibmm -> libglib2
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_GLIBMM
 	help
 	  libxml++ is a C++ wrapper for the libxml XML parser library.
 
diff --git a/package/lightning/Config.in b/package/lightning/Config.in
index d85c964..79f7f86 100644
--- a/package/lightning/Config.in
+++ b/package/lightning/Config.in
@@ -18,10 +18,10 @@ if BR2_PACKAGE_LIGHTNING
 
 config BR2_PACKAGE_LIGHTNING_DISASSEMBLER
 	bool "enable disassembler"
-	select BR2_PACKAGE_BINUTILS
-	select BR2_PACKAGE_ZLIB
 	depends on !BR2_nios2 # binutils
 	depends on BR2_USE_WCHAR # binutils
+	select BR2_PACKAGE_BINUTILS
+	select BR2_PACKAGE_ZLIB
 	help
 	  Enable the GNU lightning disassembler.
 
diff --git a/package/linknx/Config.in b/package/linknx/Config.in
index e858389..478d019 100644
--- a/package/linknx/Config.in
+++ b/package/linknx/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_LINKNX
 	bool "linknx"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # libpthsem
 	select BR2_PACKAGE_LIBPTHSEM
 	select BR2_PACKAGE_LIBCURL # for autoreconf
 	select BR2_PACKAGE_ARGP_STANDALONE \
 	       if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_MMU # libpthsem
 	help
 	  Linknx is an automation platform providing high level functionalities
 	  to EIB/KNX installation.
diff --git a/package/linphone/Config.in b/package/linphone/Config.in
index 2622aa4..2504ca2 100644
--- a/package/linphone/Config.in
+++ b/package/linphone/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_LINPHONE
 	bool "linphone"
-	select BR2_PACKAGE_LIBEXOSIP2
-	select BR2_PACKAGE_SPEEX
 	depends on BR2_INSTALL_LIBSTDCPP # mediastreamer (bundled)
 	depends on BR2_TOOLCHAIN_HAS_THREADS # ortp (bundled)
 	depends on BR2_USE_MMU # libeXosip2
+	select BR2_PACKAGE_LIBEXOSIP2
+	select BR2_PACKAGE_SPEEX
 	help
 	  Linphone is an internet phone or Voice Over IP phone (VoIP).
 
diff --git a/package/linux-pam/Config.in b/package/linux-pam/Config.in
index 3d9835e..ab7cf55 100644
--- a/package/linux-pam/Config.in
+++ b/package/linux-pam/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_LINUX_PAM
 	bool "linux-pam"
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-	select BR2_PACKAGE_FLEX
 	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR)
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_FLEX
 	help
 	  A Security Framework that Provides Authentication for Applications
 
diff --git a/package/ljlinenoise/Config.in b/package/ljlinenoise/Config.in
index be83bdb..61c80df 100644
--- a/package/ljlinenoise/Config.in
+++ b/package/ljlinenoise/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_LJLINENOISE
 	bool "ljlinenoise"
-	# run-time dependency only
-	select BR2_PACKAGE_LJSYSCALL
 	# ljsyscall is specifically for LuaJIT, not Lua.
 	depends on BR2_PACKAGE_LUAJIT
+	# run-time dependency only
+	select BR2_PACKAGE_LJSYSCALL
 	help
 	  ljlinenoise is a pure LuaJIT port of linenoise,
 	  a small alternative to readline and libedit.
diff --git a/package/lmbench/Config.in b/package/lmbench/Config.in
index c4ea522..7b33297 100644
--- a/package/lmbench/Config.in
+++ b/package/lmbench/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_LMBENCH
 	bool "lmbench"
-	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc
-	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc\
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
 	  LMbench is a suite of simple, portable,
 	  ANSI/C microbenchmarks for UNIX/POSIX.
diff --git a/package/log4cxx/Config.in b/package/log4cxx/Config.in
index 6ec67b6..bf739a4 100644
--- a/package/log4cxx/Config.in
+++ b/package/log4cxx/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_LOG4CXX
 	bool "log4cxx"
-	select BR2_PACKAGE_APR
-	select BR2_PACKAGE_APR_UTIL
 	# apr really needs shared library support
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # apr
+	select BR2_PACKAGE_APR
+	select BR2_PACKAGE_APR_UTIL
 	help
 	  Apache log4cxx is a logging framework for C++ patterned
 	  after Apache log4j.
diff --git a/package/logrotate/Config.in b/package/logrotate/Config.in
index 2b1ae64..eea9ec2 100644
--- a/package/logrotate/Config.in
+++ b/package/logrotate/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_LOGROTATE
 	bool "logrotate"
-	select BR2_PACKAGE_POPT
 	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_POPT
 	help
 	  A simple program to rotate logs.
 
diff --git a/package/lsqlite3/Config.in b/package/lsqlite3/Config.in
index cc431ae..223fb59 100644
--- a/package/lsqlite3/Config.in
+++ b/package/lsqlite3/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LSQLITE3
 	bool "lsqlite3"
-	select BR2_PACKAGE_SQLITE
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	select BR2_PACKAGE_SQLITE
 	help
 	  a thin Lua wrapper for the SQLite3 library.
 
diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index 274b03e..04868d7 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -7,9 +7,9 @@ config BR2_PACKAGE_LTP_TESTSUITE
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_MUSL
-	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	# does not build, cachectl.h issue
 	depends on !BR2_nios2
+	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
 	  The Linux Test Project provides a huge testsuite for Linux.
 
diff --git a/package/ltrace/Config.in b/package/ltrace/Config.in
index 7af6be2..0fc1b95 100644
--- a/package/ltrace/Config.in
+++ b/package/ltrace/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_LTRACE
 	bool "ltrace"
+	depends on BR2_USE_WCHAR # elfutils
+	depends on !BR2_STATIC_LIBS # elfutils
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
 	# ltrace normally has mips/mipsel support, but it's currently
 	# broken (error: 'struct ltelf' has no member named
 	# 'relplt_count'). Issue reported upstream at
@@ -7,9 +10,6 @@ config BR2_PACKAGE_LTRACE
 	depends on (BR2_i386 || BR2_arm || BR2_mips || BR2_mipsel \
 		|| BR2_powerpc || BR2_sparc || BR2_x86_64 || BR2_xtensa)
 	select BR2_PACKAGE_ELFUTILS
-	depends on BR2_USE_WCHAR # elfutils
-	depends on !BR2_STATIC_LIBS # elfutils
-	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
 	help
 	  Debugging program which runs a specified command until it exits.
 	  While the command is executing, ltrace intercepts and records
diff --git a/package/lttng-babeltrace/Config.in b/package/lttng-babeltrace/Config.in
index 09fab44..ba6b554 100644
--- a/package/lttng-babeltrace/Config.in
+++ b/package/lttng-babeltrace/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_LTTNG_BABELTRACE
 	bool "lttng-babeltrace"
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_POPT
-	depends on BR2_USE_WCHAR # libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
-	depends on BR2_USE_MMU # libglib2
 	help
 	  The Babeltrace project provides trace read and write
 	  libraries, as well as a trace converter application. Plugins
diff --git a/package/lttng-libust/Config.in b/package/lttng-libust/Config.in
index 4aba188..8472cab 100644
--- a/package/lttng-libust/Config.in
+++ b/package/lttng-libust/Config.in
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_LTTNG_LIBUST
 	bool "lttng-libust"
-	select BR2_PACKAGE_LIBURCU
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	depends on BR2_USE_WCHAR # uses wchar_t
 	# liburcu only works on some architectures and requires threads support"
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBURCU
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  Userspace tracing library for the LTTng 2.x tracing
 	  infrastructure. It allows userspace programs to create
diff --git a/package/lua-coatpersistent/Config.in b/package/lua-coatpersistent/Config.in
index a0f5bdc..d8b3570 100644
--- a/package/lua-coatpersistent/Config.in
+++ b/package/lua-coatpersistent/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_LUA_COATPERSISTENT
 	bool "lua-coatpersistent"
+	depends on BR2_PACKAGE_LSQLITE3 || BR2_PACKAGE_LUASQL_SQLITE3
 	# run-time dependencies
 	select BR2_PACKAGE_DADO
 	select BR2_PACKAGE_LUA_COAT
-	depends on BR2_PACKAGE_LSQLITE3 || BR2_PACKAGE_LUASQL_SQLITE3
 	help
 	  An ORM for lua-Coat.
 
diff --git a/package/lua-ev/Config.in b/package/lua-ev/Config.in
index 4b3f8ed..0cb4c22 100644
--- a/package/lua-ev/Config.in
+++ b/package/lua-ev/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_LUA_EV
 	bool "lua-ev"
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
-	select BR2_PACKAGE_LIBEV
 	depends on !BR2_bfin # libev
+	select BR2_PACKAGE_LIBEV
 	help
 	  Get access to the libev library from Lua.
 
diff --git a/package/luaexpat/Config.in b/package/luaexpat/Config.in
index 6976e40..7139e8c 100644
--- a/package/luaexpat/Config.in
+++ b/package/luaexpat/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LUAEXPAT
 	bool "luaexpat"
-	select BR2_PACKAGE_EXPAT
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	select BR2_PACKAGE_EXPAT
 	help
 	  LuaExpat is a SAX XML parser based on the Expat library.
 
diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index 380f247..1a27c43 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -8,7 +8,6 @@ config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 
 config BR2_PACKAGE_LUAJIT
 	bool "luajit"
-	select BR2_PACKAGE_HAS_LUAINTERPRETER
 	depends on !BR2_STATIC_LIBS # dlopen
 	# Luajit is only available for some target architectures, and
 	# has some complexity wrt 32/64. See luajit.mk for details.
@@ -16,6 +15,7 @@ config BR2_PACKAGE_LUAJIT
 	# luajit.mk uses the "-m32" compiler option to build 32bit
 	# binaries, so check if that option is supported. See
 	# luajit.mk for details.
+	select BR2_PACKAGE_HAS_LUAINTERPRETER
 	select BR2_HOSTARCH_NEEDS_IA32_COMPILER if !BR2_ARCH_IS_64
 	help
 	  LuaJIT implements the full set of language features defined
diff --git a/package/luasec/Config.in b/package/luasec/Config.in
index a8cc9c9..9391cd9 100644
--- a/package/luasec/Config.in
+++ b/package/luasec/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_LUASEC
 	bool "luasec"
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LUASOCKET
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
 	  LuaSec is a binding for OpenSSL library to provide TLS/SSL
 	  communication.
diff --git a/package/luv/Config.in b/package/luv/Config.in
index e9d0109..434cb3b 100644
--- a/package/luv/Config.in
+++ b/package/luv/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_LUV
 	bool "luv"
-	select BR2_PACKAGE_LIBUV
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
 	depends on BR2_USE_MMU # libuv
 	depends on !BR2_STATIC_LIBS # libuv
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
+	select BR2_PACKAGE_LIBUV
 	help
 	  libuv bindings for LuaJIT and Lua.
 
diff --git a/package/lxc/Config.in b/package/lxc/Config.in
index 6a39d2e..c5c75ea 100644
--- a/package/lxc/Config.in
+++ b/package/lxc/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_LXC
 	bool "lxc"
-	select BR2_PACKAGE_LIBCAP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	# build system forcefully builds a shared library
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # setns() system call
+	select BR2_PACKAGE_LIBCAP
 	help
 	  Linux Containers (LXC), provides the ability to group and isolate
 	  of a set of processes in a jail by virtualizing and accounting the
diff --git a/package/lzlib/Config.in b/package/lzlib/Config.in
index 32328c5..59a2e6d 100644
--- a/package/lzlib/Config.in
+++ b/package/lzlib/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LZLIB
 	bool "lzlib"
-	select BR2_PACKAGE_ZLIB
 	depends on BR2_PACKAGE_LUA
+	select BR2_PACKAGE_ZLIB
 	help
 	  This package provides a library to access zlib library
 	  functions and also to read/write gzip files using an
diff --git a/package/mali-t76x/Config.in b/package/mali-t76x/Config.in
index 26a7f6c..07f1f31 100644
--- a/package/mali-t76x/Config.in
+++ b/package/mali-t76x/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_MALI_T76X
 	bool "mali-t76x"
-	select BR2_PACKAGE_MESA3D_HEADERS
-	select BR2_PACKAGE_HAS_LIBEGL
-	select BR2_PACKAGE_HAS_LIBGLES
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_ARM_EABIHF
 	depends on BR2_arm
+	select BR2_PACKAGE_MESA3D_HEADERS
+	select BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_HAS_LIBGLES
 	help
 	  Install the binary user-space components for the ARM Mali Midgard
 	  T76X GPU. This package requires a kernel with the ARM Mali Midgard
diff --git a/package/matchbox-common/Config.in b/package/matchbox-common/Config.in
index 5a038e1..587a069 100644
--- a/package/matchbox-common/Config.in
+++ b/package/matchbox-common/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_MATCHBOX_COMMON
 	bool "matchbox-common"
-	select BR2_PACKAGE_MATCHBOX_LIB
 	depends on BR2_PACKAGE_MATCHBOX_PANEL || BR2_PACKAGE_MATCHBOX_DESKTOP
+	select BR2_PACKAGE_MATCHBOX_LIB
 	help
 	  Common desktop folders and matchbox-session script.
 
diff --git a/package/mediastreamer/Config.in b/package/mediastreamer/Config.in
index 7e62bf2..afaed4a 100644
--- a/package/mediastreamer/Config.in
+++ b/package/mediastreamer/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_MEDIASTREAMER
 	bool "mediastreamer"
-	select BR2_PACKAGE_ORTP
 	depends on BR2_INSTALL_LIBSTDCPP # ortp
 	depends on BR2_TOOLCHAIN_HAS_THREADS # ortp
+	select BR2_PACKAGE_ORTP
 	help
 	  Mediastreamer is a powerful and lightweighted streaming
 	  engine specialized for voice/video telephony applications.
diff --git a/package/menu-cache/Config.in b/package/menu-cache/Config.in
index b75c8ec..e61ca44 100644
--- a/package/menu-cache/Config.in
+++ b/package/menu-cache/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_MENU_CACHE
 	bool "menu-cache"
-	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_LIBFM_EXTRA
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBFM_EXTRA
 	help
 	  Small library from LXDE project used for application menu
 	  integration
diff --git a/package/mesa3d-demos/Config.in b/package/mesa3d-demos/Config.in
index f22c0de..b716cf5 100644
--- a/package/mesa3d-demos/Config.in
+++ b/package/mesa3d-demos/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_MESA3D_DEMOS
 	bool "mesa3d-demos"
+	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES \
+		|| BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBOPENVG
 	select BR2_PACKAGE_LIBGLEW if BR2_PACKAGE_XORG7 && BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_LIBGLU if BR2_PACKAGE_XORG7 && BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7 && BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7 && BR2_PACKAGE_HAS_LIBGL
-	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES \
-		|| BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBOPENVG
 	help
 	  OpenGL demos from the Mesa 3D project.
 
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 099dfd4..e5ff7d7 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -24,14 +24,14 @@ if BR2_PACKAGE_MESA3D
 
 # inform the .mk file of gallium, dri or vulkan driver selection
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
-	select BR2_PACKAGE_MESA3D_DRIVER
 	bool
+	select BR2_PACKAGE_MESA3D_DRIVER
 
 config BR2_PACKAGE_MESA3D_DRI_DRIVER
+	bool
 	select BR2_PACKAGE_MESA3D_DRIVER
 	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_PACKAGE_XPROTO_DRI3PROTO
 	select BR2_PACKAGE_XPROTO_PRESENTPROTO if BR2_PACKAGE_XPROTO_DRI3PROTO
-	bool
 
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER
 	bool
diff --git a/package/micropython-lib/Config.in b/package/micropython-lib/Config.in
index 599af77..76557b2 100644
--- a/package/micropython-lib/Config.in
+++ b/package/micropython-lib/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_MICROPYTHON_LIB
 	bool "micropython-lib"
-	select BR2_PACKAGE_PCRE # runtime
 	depends on BR2_PACKAGE_MICROPYTHON
+	select BR2_PACKAGE_PCRE # runtime
 	help
 	  Core Python libraries ported to MicroPython.
 
diff --git a/package/micropython/Config.in b/package/micropython/Config.in
index ed65d6a..ac06d7f 100644
--- a/package/micropython/Config.in
+++ b/package/micropython/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_MICROPYTHON
 	bool "micropython"
-	select BR2_PACKAGE_LIBFFI
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	# libffi doesn't provide the closure implementation on Blackfin
 	depends on !BR2_bfin
+	select BR2_PACKAGE_LIBFFI
 	help
 	  Micro Python is a lean and fast implementation of the Python 3
 	  programming language that is optimised to run on a microcontroller.
diff --git a/package/midori/Config.in b/package/midori/Config.in
index 0d7672c..cfd0535 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -6,6 +6,12 @@ comment "midori needs libgtk3 and a glibc toolchain w/ C++, gcc >= 4.9"
 config BR2_PACKAGE_MIDORI
 	bool "midori"
 	# GCR can only be used with the X11 backend
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt, gcr, gnupg2
+	depends on BR2_PACKAGE_LIBGTK3
+	depends on BR2_INSTALL_LIBSTDCPP # webkitgtk
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # webkitgtk
+	depends on BR2_TOOLCHAIN_USES_GLIBC # webkitgtk
+	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	select BR2_PACKAGE_GCR if BR2_PACKAGE_LIBGTK3_X11
 	select BR2_PACKAGE_GRANITE
 	select BR2_PACKAGE_LIBSOUP
@@ -15,12 +21,6 @@ config BR2_PACKAGE_MIDORI
 	select BR2_PACKAGE_WEBKITGTK
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt, gcr, gnupg2
-	depends on BR2_PACKAGE_LIBGTK3
-	depends on BR2_INSTALL_LIBSTDCPP # webkitgtk
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # webkitgtk
-	depends on BR2_TOOLCHAIN_USES_GLIBC # webkitgtk
-	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	help
 	  Midori is a lightweight web browser based on WebKit
 
diff --git a/package/mjpegtools/Config.in b/package/mjpegtools/Config.in
index 6a36109..c486361 100644
--- a/package/mjpegtools/Config.in
+++ b/package/mjpegtools/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_MJPEGTOOLS
 	bool "mjpegtools"
-	select BR2_PACKAGE_JPEG
 	depends on BR2_USE_MMU # fork
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_JPEG
 	help
 	  The mjpegtools programs are a set of tools
 	  that can do recording of videos and playback,
diff --git a/package/mongrel2/Config.in b/package/mongrel2/Config.in
index 796bae6..a9b09b7 100644
--- a/package/mongrel2/Config.in
+++ b/package/mongrel2/Config.in
@@ -14,12 +14,12 @@ comment "mongrel2 needs a uClibc or glibc toolchain w/ C++, threads, dynamic lib
 
 config BR2_PACKAGE_MONGREL2
 	bool "mongrel2"
-	select BR2_PACKAGE_SQLITE
-	select BR2_PACKAGE_ZEROMQ
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 	depends on !BR2_STATIC_LIBS # uses dlopen()
 	depends on BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_ZEROMQ
 	help
 	  Mongrel2 is an application, language, and network architecture
 	  agnostic web server that focuses on web applications using
diff --git a/package/mtdev2tuio/Config.in b/package/mtdev2tuio/Config.in
index 4195ecf..3e88d21 100644
--- a/package/mtdev2tuio/Config.in
+++ b/package/mtdev2tuio/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_MTDEV2TUIO
 	bool "mtdev2tuio"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # liblo
 	select BR2_PACKAGE_LIBLO
 	select BR2_PACKAGE_MTDEV
-	depends on BR2_TOOLCHAIN_HAS_THREADS # liblo
 	help
 	  mtdev2tuio is a simple application for converting touch
 	  events captured from libmtdev to TUIO 1.1
diff --git a/package/musl/Config.in b/package/musl/Config.in
index 2775313..bedc50c 100644
--- a/package/musl/Config.in
+++ b/package/musl/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_MUSL
 	bool
-	depends on BR2_TOOLCHAIN_USES_MUSL
 	default y
+	depends on BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_LINUX_HEADERS
 	# SSP broken on i386/ppc: http://www.openwall.com/lists/musl/2016/12/04/2
 	select BR2_TOOLCHAIN_HAS_SSP if !(BR2_i386 || BR2_powerpc)
diff --git a/package/neon/Config.in b/package/neon/Config.in
index e76278c..9831343 100644
--- a/package/neon/Config.in
+++ b/package/neon/Config.in
@@ -27,8 +27,8 @@ config BR2_PACKAGE_NEON_XML
 
 config BR2_PACKAGE_NEON_EXPAT
 	bool "XML support with expat"
-	select BR2_PACKAGE_EXPAT
 	depends on !BR2_PACKAGE_NEON_LIBXML2
+	select BR2_PACKAGE_EXPAT
 	help
 	  Enable XML support in neon, using the Expat XML library.
 
diff --git a/package/netcat-openbsd/Config.in b/package/netcat-openbsd/Config.in
index 0df997c..6df87ec 100644
--- a/package/netcat-openbsd/Config.in
+++ b/package/netcat-openbsd/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_NETCAT_OPENBSD
 	bool "netcat-openbsd"
-	select BR2_PACKAGE_LIBBSD
 	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_LIBBSD
 	help
 	  A simple Unix utility which reads and writes data across network
 	  connections using TCP or UDP protocol. It is designed to be a
diff --git a/package/netsniff-ng/Config.in b/package/netsniff-ng/Config.in
index b59c876..c4803b2 100644
--- a/package/netsniff-ng/Config.in
+++ b/package/netsniff-ng/Config.in
@@ -1,16 +1,16 @@
 config BR2_PACKAGE_NETSNIFF_NG
 	bool "netsniff-ng"
+	# Build with uClibc fails due to missing ceill()
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	select BR2_PACKAGE_LIBNL
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_LIBCLI
 	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
 	select BR2_PACKAGE_LIBURCU
 	select BR2_PACKAGE_LIBNET
-	# Build with uClibc fails due to missing ceill()
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	help
 	  netsniff-ng is a free, performant Linux network analyzer and
 	  networking toolkit. If you will, the Swiss army knife for
diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index bfaddd1..4e13936 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -5,9 +5,9 @@ comment "nfs-utils needs a toolchain w/ threads"
 config BR2_PACKAGE_NFS_UTILS
 	bool "nfs-utils"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libtirpc, rpcbind
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_PACKAGE_RPCBIND # runtime
-	depends on BR2_USE_MMU # fork()
 	help
 	  The NFS Linux kernel server.
 
diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index e6f2d96..36fa69c 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -141,8 +141,8 @@ config BR2_PACKAGE_NGINX_HTTP_CHARSET_MODULE
 
 config BR2_PACKAGE_NGINX_HTTP_GZIP_MODULE
 	bool "ngx_http_gzip_module"
-	select BR2_PACKAGE_ZLIB
 	default y
+	select BR2_PACKAGE_ZLIB
 	help
 	  Enable ngx_http_gzip_module
 
@@ -202,8 +202,8 @@ config BR2_PACKAGE_NGINX_HTTP_REFERER_MODULE
 
 config BR2_PACKAGE_NGINX_HTTP_REWRITE_MODULE
 	bool "ngx_http_rewrite_module"
-	select BR2_PACKAGE_PCRE
 	default y
+	select BR2_PACKAGE_PCRE
 	help
 	  Enable ngx_http_rewrite_module
 
diff --git a/package/odroid-mali/Config.in b/package/odroid-mali/Config.in
index e5c07f2..1c31c2d 100644
--- a/package/odroid-mali/Config.in
+++ b/package/odroid-mali/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_ODROID_MALI
 	bool "odroid-mali"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_aarch64 || BR2_ARM_EABIHF
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_ODROID_SCRIPTS # runtime
-	depends on BR2_TOOLCHAIN_USES_GLIBC
-	depends on BR2_aarch64 || BR2_ARM_EABIHF
 	help
 	  Install the ARM Mali drivers for odroidc2 based systems.
 
diff --git a/package/ola/Config.in b/package/ola/Config.in
index 90a92fd..7c3708d 100644
--- a/package/ola/Config.in
+++ b/package/ola/Config.in
@@ -5,13 +5,13 @@ comment "ola needs a toolchain w/ C++, threads, dynamic library"
 
 menuconfig BR2_PACKAGE_OLA
 	bool "ola (open lighting architecture)"
-	select BR2_PACKAGE_PROTOBUF
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
-	select BR2_PACKAGE_UTIL_LINUX
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf
 	depends on !BR2_STATIC_LIBS # protobuf
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	select BR2_PACKAGE_PROTOBUF
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX
 	help
 	  Open Lighting Architecture provides applications
 	  with a mechanism to send and receive DMX512 & RDM
diff --git a/package/on2-8170-libs/Config.in b/package/on2-8170-libs/Config.in
index 40cad3d..2a60c58 100644
--- a/package/on2-8170-libs/Config.in
+++ b/package/on2-8170-libs/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_ON2_8170_LIBS
+	bool "on2-8170-libs"
 	#This is a binary only package which has been compiled for glibc
 	depends on BR2_arm926t
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_LINUX_KERNEL # on2-8170-modules
 	select BR2_PACKAGE_ON2_8170_MODULES # runtime
-	bool "on2-8170-libs"
 	help
 	  Libraries for Hantro X170 video decoder
 
diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index c046baa..0260851 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -1,9 +1,9 @@
 menuconfig BR2_PACKAGE_OPENCV
 	bool "opencv-2.4"
-	select BR2_PACKAGE_ZLIB
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_ZLIB
 	help
 	  OpenCV (Open Source Computer Vision) is a library of programming
 	  functions for real time computer vision.
@@ -52,13 +52,13 @@ config BR2_PACKAGE_OPENCV_LIB_FLANN
 config BR2_PACKAGE_OPENCV_LIB_GPU
 	bool "gpu"
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # opencv libphoto
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	select BR2_PACKAGE_OPENCV_LIB_LEGACY
 	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT
 	select BR2_PACKAGE_OPENCV_LIB_PHOTO
 	select BR2_PACKAGE_OPENCV_LIB_VIDEO
-	depends on !BR2_STATIC_LIBS
 	help
 	  Include opencv_gpu module into the OpenCV build.
 
diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index ee589f9..3b0a9d6 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -1,12 +1,12 @@
 menuconfig BR2_PACKAGE_OPENCV3
 	bool "opencv3"
-	select BR2_PACKAGE_ZLIB
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS # include dlfcn.h
 	depends on !BR2_PACKAGE_OPENCV
+	select BR2_PACKAGE_ZLIB
 	help
 	  OpenCV (Open Source Computer Vision) is a library of programming
 	  functions for real time computer vision.
diff --git a/package/opengl/libegl/Config.in b/package/opengl/libegl/Config.in
index f756fbe..a236998 100644
--- a/package/opengl/libegl/Config.in
+++ b/package/opengl/libegl/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_HAS_LIBEGL_WAYLAND
 	depends on BR2_PACKAGE_HAS_LIBEGL
 
 config BR2_PACKAGE_PROVIDES_LIBEGL
-	depends on BR2_PACKAGE_HAS_LIBEGL
 	string
+	depends on BR2_PACKAGE_HAS_LIBEGL
diff --git a/package/opengl/libgl/Config.in b/package/opengl/libgl/Config.in
index 8b99e5b..b9a1602 100644
--- a/package/opengl/libgl/Config.in
+++ b/package/opengl/libgl/Config.in
@@ -2,5 +2,5 @@ config BR2_PACKAGE_HAS_LIBGL
 	bool
 
 config BR2_PACKAGE_PROVIDES_LIBGL
-	depends on BR2_PACKAGE_HAS_LIBGL
 	string
+	depends on BR2_PACKAGE_HAS_LIBGL
diff --git a/package/opengl/libgles/Config.in b/package/opengl/libgles/Config.in
index b7b800f..090ef16 100644
--- a/package/opengl/libgles/Config.in
+++ b/package/opengl/libgles/Config.in
@@ -2,5 +2,5 @@ config BR2_PACKAGE_HAS_LIBGLES
 	bool
 
 config BR2_PACKAGE_PROVIDES_LIBGLES
-	depends on BR2_PACKAGE_HAS_LIBGLES
 	string
+	depends on BR2_PACKAGE_HAS_LIBGLES
diff --git a/package/opengl/libopenmax/Config.in b/package/opengl/libopenmax/Config.in
index d50f2ce..901426a 100644
--- a/package/opengl/libopenmax/Config.in
+++ b/package/opengl/libopenmax/Config.in
@@ -2,5 +2,5 @@ config BR2_PACKAGE_HAS_LIBOPENMAX
 	bool
 
 config BR2_PACKAGE_PROVIDES_LIBOPENMAX
-	depends on BR2_PACKAGE_HAS_LIBOPENMAX
 	string
+	depends on BR2_PACKAGE_HAS_LIBOPENMAX
diff --git a/package/opengl/libopenvg/Config.in b/package/opengl/libopenvg/Config.in
index 53cde6a..37d9410 100644
--- a/package/opengl/libopenvg/Config.in
+++ b/package/opengl/libopenvg/Config.in
@@ -2,5 +2,5 @@ config BR2_PACKAGE_HAS_LIBOPENVG
 	bool
 
 config BR2_PACKAGE_PROVIDES_LIBOPENVG
-	depends on BR2_PACKAGE_HAS_LIBOPENVG
 	string
+	depends on BR2_PACKAGE_HAS_LIBOPENVG
diff --git a/package/openocd/Config.in b/package/openocd/Config.in
index 2313671..d4c4719 100644
--- a/package/openocd/Config.in
+++ b/package/openocd/Config.in
@@ -11,109 +11,109 @@ comment "Adapters"
 
 config BR2_PACKAGE_OPENOCD_FTDI
 	bool "MPSSE mode of FTDI based devices"
-	select BR2_PACKAGE_LIBUSB
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	select BR2_PACKAGE_LIBUSB
 	help
 	  Enable building support for the MPSSE mode of FTDI
 	  (FT2xxx/FT4xxx) based devices (default is auto)
 
 config BR2_PACKAGE_OPENOCD_STLINK
 	bool "ST-Link JTAG Programmer"
-	select BR2_PACKAGE_LIBUSB
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	select BR2_PACKAGE_LIBUSB
 	help
 	  Enable building support for the ST-Link JTAG
 	  Programmer (default is auto)
 
 config BR2_PACKAGE_OPENOCD_TI_ICDI
 	bool "TI ICDI JTAG Programmer"
-	select BR2_PACKAGE_LIBUSB
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	select BR2_PACKAGE_LIBUSB
 	help
 	  Enable building support for the TI ICDI JTAG
 	  Programmer (default is auto)
 
 config BR2_PACKAGE_OPENOCD_ULINK
 	bool "Keil ULINK JTAG Programmer"
-	select BR2_PACKAGE_LIBUSB
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	select BR2_PACKAGE_LIBUSB
 	help
 	  Enable building support for the Keil ULINK JTAG
 	  Programmer (default is auto)
 
 config BR2_PACKAGE_OPENOCD_UBLASTER2
 	bool "Altera USB-Blaster II Compatible"
-	select BR2_PACKAGE_LIBUSB
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	select BR2_PACKAGE_LIBUSB
 	help
 	  Enable building support for the Altera USB-Blaster
 	  II Compatible (default is auto)
 
 config BR2_PACKAGE_OPENOCD_JLINK
 	bool "Segger J-Link JTAG Programmer"
-	select BR2_PACKAGE_LIBUSB
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	select BR2_PACKAGE_LIBUSB
 	help
 	  Segger J-Link JTAG Programmer and clone such as Atmel
 	  SAM-ICE
 
 config BR2_PACKAGE_OPENOCD_OSDBM
 	bool "OSDBM JTAG (only) Programmer"
-	select BR2_PACKAGE_LIBUSB
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	select BR2_PACKAGE_LIBUSB
 	help
 	  Enable building support for the OSBDM (JTAG only)
 	  Programmer (default is auto)
 
 config BR2_PACKAGE_OPENOCD_OPENDOUS
 	bool "eStick/opendous JTAG Programmer"
-	select BR2_PACKAGE_LIBUSB
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	select BR2_PACKAGE_LIBUSB
 	help
 	  Enable building support for the eStick/opendous JTAG
 	  Programmer (default is auto)
 
 config BR2_PACKAGE_OPENOCD_AICE
 	bool "Andes JTAG Programmer"
-	select BR2_PACKAGE_LIBUSB
 	depends on BR2_USE_MMU # use fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	select BR2_PACKAGE_LIBUSB
 	help
 	  Enable building support for the Andes JTAG
 	  Programmer (default is auto)
 
 config BR2_PACKAGE_OPENOCD_VSLLINK
 	bool "Versaloon-Link JTAG Programmer"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb-compat -> libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb-compat -> libusb
 	help
 	  Enable building support for the Versaloon-Link JTAG
 	  Programmer (default is auto)
 
 config BR2_PACKAGE_OPENOCD_USBPROG
 	bool "USBProg JTAG Programmer"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb-compat -> libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb-compat -> libusb
 	help
 	  Enable building support for the USBProg JTAG
 	  Programmer (default is auto)
 
 config BR2_PACKAGE_OPENOCD_RLINK
 	bool "Raisonance RLink JTAG Programmer"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb-compat -> libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb-compat -> libusb
 	help
 	  Enable building support for the Raisonance RLink
 	  JTAG Programmer (default is auto)
 
 config BR2_PACKAGE_OPENOCD_ARMEW
 	bool "Olimex ARM-JTAG-EW Programmer"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb-compat -> libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb-compat -> libusb
 	help
 	  Enable building support for the Olimex ARM-JTAG-EW
 	  Programmer (default is auto)
@@ -125,8 +125,8 @@ config BR2_PACKAGE_OPENOCD_PARPORT
 
 config BR2_PACKAGE_OPENOCD_FT2XXX
 	bool "FT2232 based devices (DEPRECATED)"
-	select BR2_PACKAGE_LIBFTDI1
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi -> libusb
+	select BR2_PACKAGE_LIBFTDI1
 	help
 	  (DEPRECATED) Enable building support for FT2232
 	  based devices using the libftdi library
@@ -138,8 +138,8 @@ config BR2_PACKAGE_OPENOCD_VPI
 
 config BR2_PACKAGE_OPENOCD_UBLASTER
 	bool "Altera USB-Blaster"
-	select BR2_PACKAGE_LIBFTDI1
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi -> libusb
+	select BR2_PACKAGE_LIBFTDI1
 	help
 	  Enable building support for the Altera USB-Blaster
 	  using the libftdi driver, opensource alternate of
@@ -178,18 +178,18 @@ config BR2_PACKAGE_OPENOCD_GW16012
 
 config BR2_PACKAGE_OPENOCD_PRESTO
 	bool "ASIX Presto Programmer"
-	select BR2_PACKAGE_LIBFTDI1
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi -> libusb
+	select BR2_PACKAGE_LIBFTDI1
 	help
 	  Enable building support for ASIX Presto Programmer
 	  using the libftdi driver
 
 config BR2_PACKAGE_OPENOCD_OPENJTAG
 	bool "OpenJTAG Programmer"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi -> libusb
 	select BR2_PACKAGE_LIBFTDI1
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT # needs usb.h
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi -> libusb
 	help
 	  Enable building support for the OpenJTAG Programmer
 	  with ftdi driver
diff --git a/package/openpowerlink/Config.in b/package/openpowerlink/Config.in
index d5e9764..68ea751 100644
--- a/package/openpowerlink/Config.in
+++ b/package/openpowerlink/Config.in
@@ -110,8 +110,8 @@ endmenu
 endif # BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_STACK_LIB
 
 config BR2_PACKAGE_OPENPOWERLINK_KERNEL_PCIE_DRIVER
-	depends on BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_PCIE_STACK_LIB
 	bool "PCIe Powerlink Driver"
+	depends on BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_PCIE_STACK_LIB
 
 menu "demos"
 
diff --git a/package/openvmtools/Config.in b/package/openvmtools/Config.in
index 79c503c..f76bdf2 100644
--- a/package/openvmtools/Config.in
+++ b/package/openvmtools/Config.in
@@ -33,11 +33,11 @@ comment "procps support needs BR2_PACKAGE_BUSYBOX_SHOW_OTHERS"
 
 config BR2_PACKAGE_OPENVMTOOLS_PAM
 	bool "PAM support"
-	select BR2_PACKAGE_LINUX_PAM
 	# linux-pam needs locale and wchar, but we already have this
 	# dependency on the main symbol, above.
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
+	select BR2_PACKAGE_LINUX_PAM
 	help
 	  Support for PAM in openvmtools
 
diff --git a/package/opkg/Config.in b/package/opkg/Config.in
index 5a4bbc2..a188a7b 100644
--- a/package/opkg/Config.in
+++ b/package/opkg/Config.in
@@ -4,9 +4,9 @@ comment "opkg needs a toolchain w/ wchar"
 
 config BR2_PACKAGE_OPKG
 	bool "opkg"
-	select BR2_PACKAGE_LIBARCHIVE
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR # libarchive
+	select BR2_PACKAGE_LIBARCHIVE
 	help
 	  Opkg is a lightweight package management system, based on ipkg. It is
 	  written in C and resembles apt/dpkg in operation. It is intended for
diff --git a/package/oprofile/Config.in b/package/oprofile/Config.in
index e2adde5..d99a7e6 100644
--- a/package/oprofile/Config.in
+++ b/package/oprofile/Config.in
@@ -15,14 +15,14 @@ config BR2_PACKAGE_OPROFILE_NEEDS_LIBPFM4
 config BR2_PACKAGE_OPROFILE
 	bool "oprofile"
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_POPT
-	select BR2_PACKAGE_BINUTILS
-	select BR2_PACKAGE_LIBPFM4 if BR2_PACKAGE_OPROFILE_NEEDS_LIBPFM4
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # binutils
 	depends on BR2_PACKAGE_OPROFILE_ARCH_SUPPORTS
 	# libpfm4 is needed on PowerPC, and requires thread support
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_PACKAGE_OPROFILE_NEEDS_LIBPFM4
+	select BR2_PACKAGE_POPT
+	select BR2_PACKAGE_BINUTILS
+	select BR2_PACKAGE_LIBPFM4 if BR2_PACKAGE_OPROFILE_NEEDS_LIBPFM4
 	help
 	  OProfile is a system-wide profiler for Linux systems,
 	  capable of profiling all running code at low overhead.
diff --git a/package/pangomm/Config.in b/package/pangomm/Config.in
index a7c41a0..08c6064 100644
--- a/package/pangomm/Config.in
+++ b/package/pangomm/Config.in
@@ -1,15 +1,15 @@
 config BR2_PACKAGE_PANGOMM
 	bool "pangomm"
-	select BR2_PACKAGE_CAIROMM
-	select BR2_PACKAGE_GLIBMM
-	select BR2_PACKAGE_PANGO
-	select BR2_PACKAGE_LIBSIGC
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	depends on BR2_INSTALL_LIBSTDCPP # glibmm/pango
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS # *mm/pango -> libglib2
 	depends on BR2_USE_MMU # *mm/pango -> libglib2
 	depends on BR2_USE_WCHAR # *mm/pango -> libglib2
+	select BR2_PACKAGE_CAIROMM
+	select BR2_PACKAGE_GLIBMM
+	select BR2_PACKAGE_PANGO
+	select BR2_PACKAGE_LIBSIGC
 	help
 	  The pangomm package is a set of C++ bindings for Pango.
 
diff --git a/package/pcmanfm/Config.in b/package/pcmanfm/Config.in
index 40ebbdf..979e747 100644
--- a/package/pcmanfm/Config.in
+++ b/package/pcmanfm/Config.in
@@ -1,15 +1,15 @@
 config BR2_PACKAGE_PCMANFM
 	bool "pcmanfm"
-	select BR2_PACKAGE_LIBFM
-	select BR2_PACKAGE_MENU_CACHE
-	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_LIBGTK2 if !BR2_PACKAGE_LIBGTK3_X11
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_INSTALL_LIBSTDCPP # libgtk2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
+	select BR2_PACKAGE_LIBFM
+	select BR2_PACKAGE_MENU_CACHE
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBGTK2 if !BR2_PACKAGE_LIBGTK3_X11
 	help
 	  PCMan File Manager (PCManFM) is a file manager application developed
 	  by Hong Jen Yee from Taiwan which is meant to be a replacement for
diff --git a/package/php/Config.ext b/package/php/Config.ext
index 7c3ba7e..43cc4b3 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -53,8 +53,8 @@ config BR2_PACKAGE_PHP_EXT_ZIP
 
 config BR2_PACKAGE_PHP_EXT_ZLIB
 	bool "zlib"
-	select BR2_PACKAGE_ZLIB
 	default y
+	select BR2_PACKAGE_ZLIB
 	help
 	  zlib support
 
@@ -136,9 +136,9 @@ config BR2_PACKAGE_PHP_EXT_PDO_MYSQL
 
 config BR2_PACKAGE_PHP_EXT_PDO_POSTGRESQL
 	bool "PostgreSQL"
-	select BR2_PACKAGE_POSTGRESQL
 	depends on BR2_USE_MMU # postgresql
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_POSTGRESQL
 	help
 	  PDO driver for PostgreSQL
 
@@ -164,8 +164,8 @@ comment "Human language and character encoding support"
 
 config BR2_PACKAGE_PHP_EXT_GETTEXT
 	bool "Gettext"
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	help
 	  Gettext support
 
@@ -180,11 +180,11 @@ config BR2_PACKAGE_PHP_EXT_ICONV
 
 config BR2_PACKAGE_PHP_EXT_INTL
 	bool "intl"
-	select BR2_PACKAGE_ICU
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on !BR2_BINFMT_FLAT # icu
 	depends on BR2_TOOLCHAIN_HAS_THREADS # icu
+	select BR2_PACKAGE_ICU
 	help
 	  Internationalization support
 
diff --git a/package/portaudio/Config.in b/package/portaudio/Config.in
index 252a92a..18e87fd 100644
--- a/package/portaudio/Config.in
+++ b/package/portaudio/Config.in
@@ -14,8 +14,8 @@ if BR2_PACKAGE_PORTAUDIO
 
 config BR2_PACKAGE_PORTAUDIO_ALSA
 	bool "alsa support"
-	select BR2_PACKAGE_ALSA_LIB
 	default y
+	select BR2_PACKAGE_ALSA_LIB
 	help
 	  Compile with ALSA support.
 
diff --git a/package/powerpc-utils/Config.in b/package/powerpc-utils/Config.in
index fb2fb7f..b0ca847 100644
--- a/package/powerpc-utils/Config.in
+++ b/package/powerpc-utils/Config.in
@@ -16,8 +16,8 @@ if BR2_PACKAGE_POWERPC_UTILS
 
 config BR2_PACKAGE_POWERPC_UTILS_RTAS
 	bool "RTAS support"
-	select BR2_PACKAGE_LIBRTAS
 	depends on BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_LIBRTAS
 	help
 	  Enable support for functions that require RTAS.
 
diff --git a/package/powervr/Config.in b/package/powervr/Config.in
index 746e15b..7be2b23 100644
--- a/package/powervr/Config.in
+++ b/package/powervr/Config.in
@@ -2,5 +2,5 @@ config BR2_PACKAGE_HAS_POWERVR
 	bool
 
 config BR2_PACKAGE_PROVIDES_POWERVR
-	depends on BR2_PACKAGE_HAS_POWERVR
 	string
+	depends on BR2_PACKAGE_HAS_POWERVR
diff --git a/package/pppd/Config.in b/package/pppd/Config.in
index b56b623..8c56421 100644
--- a/package/pppd/Config.in
+++ b/package/pppd/Config.in
@@ -11,8 +11,8 @@ config BR2_PACKAGE_PPPD
 if BR2_PACKAGE_PPPD
 
 config BR2_PACKAGE_PPPD_FILTER
-	select BR2_PACKAGE_LIBPCAP
 	bool "filtering"
+	select BR2_PACKAGE_LIBPCAP
 	help
 	  Packet filtering abilities for pppd. If enabled,
 	  the pppd active-filter and pass-filter options
diff --git a/package/pulseaudio/Config.in b/package/pulseaudio/Config.in
index 20aa374..0adfd88 100644
--- a/package/pulseaudio/Config.in
+++ b/package/pulseaudio/Config.in
@@ -4,11 +4,11 @@ config BR2_PACKAGE_PULSEAUDIO
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBTOOL
 	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_LIBSNDFILE
 	select BR2_PACKAGE_SPEEX
-	depends on BR2_USE_MMU # fork()
 	help
 	  PulseAudio is a sound system for POSIX OSes, meaning that it
 	  is a proxy for your sound applications. It allows you to do
diff --git a/package/pulseview/Config.in b/package/pulseview/Config.in
index 46abe78..daa0fba 100644
--- a/package/pulseview/Config.in
+++ b/package/pulseview/Config.in
@@ -1,8 +1,15 @@
 config BR2_PACKAGE_PULSEVIEW
 	bool "pulseview"
+	depends on BR2_PACKAGE_QT5
+	# libsigrok->libglib2:
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
+	depends on BR2_INSTALL_LIBSTDCPP
+	# libsigrok
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	select BR2_PACKAGE_LIBSIGROK
 	select BR2_PACKAGE_LIBSIGROKCXX
-	depends on BR2_PACKAGE_QT5
 	select BR2_PACKAGE_QT5BASE_WIDGETS
 	select BR2_PACKAGE_QT5BASE_PNG
 	select BR2_PACKAGE_QT5SVG
@@ -10,13 +17,6 @@ config BR2_PACKAGE_PULSEVIEW
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
-	# libsigrok->libglib2:
-	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_USE_MMU
-	depends on BR2_INSTALL_LIBSTDCPP
-	# libsigrok
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	help
 	  PulseView is a Qt based logic analyzer, oscilloscope
 	  and MSO GUI for sigrok.
diff --git a/package/pure-ftpd/Config.in b/package/pure-ftpd/Config.in
index 57b78d1..0e1e9c2 100644
--- a/package/pure-ftpd/Config.in
+++ b/package/pure-ftpd/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PURE_FTPD
 	bool "pure-ftpd"
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Pure-FTPd is a free (BSD), secure, production-quality and standard-
 	  conformant FTP server. It doesn't provide useless bells and whistles,
diff --git a/package/python-crossbar/Config.in b/package/python-crossbar/Config.in
index be83325..faec922 100644
--- a/package/python-crossbar/Config.in
+++ b/package/python-crossbar/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_CROSSBAR
 	bool "python-crossbar"
+	depends on BR2_INSTALL_LIBSTDCPP # python-pyasn
 	# All the following dependencies are runtime dependencies
 	select BR2_PACKAGE_PYTHON_AUTOBAHN
 	select BR2_PACKAGE_PYTHON_CBOR
@@ -31,7 +32,6 @@ config BR2_PACKAGE_PYTHON_CROSSBAR
 	select BR2_PACKAGE_PYTHON_UBJSON
 	select BR2_PACKAGE_PYTHON_WATCHDOG
 	select BR2_PACKAGE_PYTHON_WSACCEL
-	depends on BR2_INSTALL_LIBSTDCPP # python-pyasn
 	help
 	  Crossbar.io is an open-source WAMP application router that
 	  allows to build advanced applications from loosely-coupled
diff --git a/package/python-ipaddr/Config.in b/package/python-ipaddr/Config.in
index 9db2dab..5727927 100644
--- a/package/python-ipaddr/Config.in
+++ b/package/python-ipaddr/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_IPADDR
-	depends on BR2_PACKAGE_PYTHON # included since python3.3
 	bool "python-ipaddr"
+	depends on BR2_PACKAGE_PYTHON # included since python3.3
 	help
 	  An IPv4/IPv6 manipulation library in Python. This library is
 	  used to create/poke/manipulate IPv4 and IPv6 addresses and
diff --git a/package/python-libconfig/Config.in b/package/python-libconfig/Config.in
index a222f9a..0068871 100644
--- a/package/python-libconfig/Config.in
+++ b/package/python-libconfig/Config.in
@@ -4,13 +4,13 @@ comment "python-libconfig needs a glibc or uClibc toolchain w/ C++, threads"
 
 config BR2_PACKAGE_PYTHON_LIBCONFIG
 	bool "python-libconfig"
-	select BR2_PACKAGE_BOOST
-	select BR2_PACKAGE_BOOST_PYTHON
-	select BR2_PACKAGE_LIBCONFIG
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# error: invalid use of incomplete type 'struct _IO_FILE'
 	depends on !BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_PYTHON
+	select BR2_PACKAGE_LIBCONFIG
 	help
 	  Python bindings to the C++ library libconfig
 
diff --git a/package/python-msgpack/Config.in b/package/python-msgpack/Config.in
index 7dfe8e8..9aa2b5f 100644
--- a/package/python-msgpack/Config.in
+++ b/package/python-msgpack/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_PYTHON_MSGPACK
 	bool "python-msgpack"
-	select BR2_PACKAGE_MSGPACK
 	depends on BR2_INSTALL_LIBSTDCPP # msgpack
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # msgpack
+	select BR2_PACKAGE_MSGPACK
 	help
 	  MessagePack (http://msgpack.org/) is a fast, compact binary
 	  serialization format, suitable for similar data to JSON.
diff --git a/package/python-pylibftdi/Config.in b/package/python-pylibftdi/Config.in
index f829071..d340974 100644
--- a/package/python-pylibftdi/Config.in
+++ b/package/python-pylibftdi/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_PYLIBFTDI
 	bool "python-pylibftdi"
-	select BR2_PACKAGE_LIBFTDI
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	select BR2_PACKAGE_LIBFTDI
 	help
 	  This package contains the python language binding libftdi.
 
diff --git a/package/python-pysnmp-apps/Config.in b/package/python-pysnmp-apps/Config.in
index b032eba..32e3269 100644
--- a/package/python-pysnmp-apps/Config.in
+++ b/package/python-pysnmp-apps/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_PYSNMP_APPS
 	bool "python-pysnmp-apps"
-	select BR2_PACKAGE_PYTHON_PYSNMP
 	depends on BR2_INSTALL_LIBSTDCPP # pysnmp -> pyasn
+	select BR2_PACKAGE_PYTHON_PYSNMP
 	help
 	  A collection of command-line tools for SNMP management
 	  purposes built on top of the PySNMP package.
diff --git a/package/python-pysnmp-mibs/Config.in b/package/python-pysnmp-mibs/Config.in
index eca17d2..521d95e 100644
--- a/package/python-pysnmp-mibs/Config.in
+++ b/package/python-pysnmp-mibs/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_PYSNMP_MIBS
 	bool "python-pysnmp-mibs"
-	select BR2_PACKAGE_PYTHON_PYSNMP
 	depends on BR2_INSTALL_LIBSTDCPP # pysnmp -> pyasn
+	select BR2_PACKAGE_PYTHON_PYSNMP
 	help
 	  PySNMP MIBs is a set of IETF & IANA MIBs pre-compiled and
 	  packaged to simplify their use with the PySNMP library.
diff --git a/package/python-service-identity/Config.in b/package/python-service-identity/Config.in
index c9cbb6c..304b38a 100644
--- a/package/python-service-identity/Config.in
+++ b/package/python-service-identity/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
 	bool "python-service-identity"
+	depends on BR2_INSTALL_LIBSTDCPP # python-pyopenssl, python-pyasn
 	select BR2_PACKAGE_PYTHON_CHARACTERISTIC # runtime
 	select BR2_PACKAGE_PYTHON_PYASN # runtime
 	select BR2_PACKAGE_PYTHON_PYASN_MODULES # runtime
 	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
-	depends on BR2_INSTALL_LIBSTDCPP # python-pyopenssl, python-pyasn
 	help
 	  Service identity verification for pyOpenSSL.
 
diff --git a/package/python-treq/Config.in b/package/python-treq/Config.in
index 4a23737..2047cc0 100644
--- a/package/python-treq/Config.in
+++ b/package/python-treq/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_PYTHON_TREQ
 	bool "python-treq"
+	depends on BR2_INSTALL_LIBSTDCPP # python-pyopenssl
 	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
 	select BR2_PACKAGE_PYTHON_SERVICE_IDENTITY # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_TWISTED # runtime
 	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
-	depends on BR2_INSTALL_LIBSTDCPP # python-pyopenssl
 	help
 	  treq is an HTTP library inspired by requests but written on
 	  top of Twisted's Agents.  It provides a simple, higher level
diff --git a/package/python/Config.in b/package/python/Config.in
index fa83e77..054ccd2 100644
--- a/package/python/Config.in
+++ b/package/python/Config.in
@@ -39,14 +39,14 @@ menu "core python modules"
 comment "The following modules are unusual or require extra libraries"
 
 config BR2_PACKAGE_PYTHON_BZIP2
-	select BR2_PACKAGE_BZIP2
 	bool "bzip2 module"
+	select BR2_PACKAGE_BZIP2
 	help
 	  bzip2 module for Python
 
 config BR2_PACKAGE_PYTHON_BSDDB
-	select BR2_PACKAGE_BERKELEYDB
 	bool "bsddb module"
+	select BR2_PACKAGE_BERKELEYDB
 	help
 	  bsddb module for Python.
 
@@ -56,8 +56,8 @@ config BR2_PACKAGE_PYTHON_CODECSCJK
 	  Chinese/Japanese/Korean codecs module for Python (large).
 
 config BR2_PACKAGE_PYTHON_CURSES
-	select BR2_PACKAGE_NCURSES
 	bool "curses module"
+	select BR2_PACKAGE_NCURSES
 	help
 	  curses module for Python.
 
@@ -67,15 +67,15 @@ config BR2_PACKAGE_PYTHON_OSSAUDIODEV
 	  ossaudiodev module for Python.
 
 config BR2_PACKAGE_PYTHON_READLINE
-	select BR2_PACKAGE_READLINE
 	bool "readline"
+	select BR2_PACKAGE_READLINE
 	help
 	  readline module for Python (required for command-line
 	  editing in the Python shell).
 
 config BR2_PACKAGE_PYTHON_SSL
-	select BR2_PACKAGE_OPENSSL
 	bool "ssl"
+	select BR2_PACKAGE_OPENSSL
 	help
 	  _ssl module for Python (required for https in urllib etc).
 
@@ -110,8 +110,8 @@ config BR2_PACKAGE_PYTHON_SQLITE
 	  SQLite database support
 
 config BR2_PACKAGE_PYTHON_PYEXPAT
-	select BR2_PACKAGE_EXPAT
 	bool "xml module"
+	select BR2_PACKAGE_EXPAT
 	help
 	  pyexpat and xml libraries for Python
 
diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index b3eb590..c0df9de 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_HOST_QEMU
 	bool "host qemu"
-	select BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE \
-	       if !BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE
 	depends on BR2_arm       || BR2_armeb       || BR2_aarch64      || \
 		BR2_i386         || BR2_m68k        || BR2_microblazeel || \
 		BR2_microblazebe || BR2_mips        || BR2_mipsel       || \
 		BR2_mips64       || BR2_mips64el    || BR2_powerpc      || \
 		BR2_powerpc64    || BR2_powerpc64le || BR2_sh           || \
 		BR2_sparc        || BR2_x86_64
+	select BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE \
+	if !BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE
 	help
 	  QEMU is a generic and open source machine emulator and virtualizer.
 
diff --git a/package/qlibc/Config.in b/package/qlibc/Config.in
index 170da49..ad6f1fe 100644
--- a/package/qlibc/Config.in
+++ b/package/qlibc/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_QLIBC
 	bool "qlibc"
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  qLibc is currently one of the most functionally complete
 	  public licensed C/C++ libraries. The C/C++ library which
diff --git a/package/qt-webkit-kiosk/Config.in b/package/qt-webkit-kiosk/Config.in
index 1b0e0de..703f128 100644
--- a/package/qt-webkit-kiosk/Config.in
+++ b/package/qt-webkit-kiosk/Config.in
@@ -1,15 +1,15 @@
 config BR2_PACKAGE_QT_WEBKIT_KIOSK
 	bool "qt-webkit-kiosk"
 	depends on BR2_PACKAGE_QT5
+	depends on !BR2_STATIC_LIBS # qt5webkit
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5webkit
+	depends on !BR2_BINFMT_FLAT # qt5webkit
+	depends on !BR2_MIPS_SOFT_FLOAT # qt5webkit
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_WIDGETS
 	select BR2_PACKAGE_QT5WEBKIT
 	select BR2_PACKAGE_QT5MULTIMEDIA
-	depends on !BR2_STATIC_LIBS # qt5webkit
-	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5webkit
-	depends on !BR2_BINFMT_FLAT # qt5webkit
-	depends on !BR2_MIPS_SOFT_FLOAT # qt5webkit
 	help
 	  Simple kiosk-mode browser powered by Qt5Webkit
 
diff --git a/package/qt/Config.gfx.in b/package/qt/Config.gfx.in
index 70adeef..5e6619c 100644
--- a/package/qt/Config.gfx.in
+++ b/package/qt/Config.gfx.in
@@ -20,12 +20,12 @@ comment "directfb Qt driver not available (need directfb)"
 	depends on !BR2_PACKAGE_DIRECTFB
 
 config BR2_PACKAGE_QT_GFX_DIRECTFB
-	depends on BR2_PACKAGE_DIRECTFB
 	bool "directFB"
+	depends on BR2_PACKAGE_DIRECTFB
 
 config BR2_PACKAGE_QT_GFX_POWERVR
+	bool "powervr"
 	depends on BR2_PACKAGE_QT_OPENGL_ES
 	depends on BR2_PACKAGE_HAS_POWERVR
-	bool "powervr"
 
 endmenu
diff --git a/package/qt/Config.in b/package/qt/Config.in
index a761759..a568b15 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -134,9 +134,9 @@ config BR2_PACKAGE_QT_QT3SUPPORT
 
 config BR2_PACKAGE_QT_GUI_MODULE
 	bool "Gui Module"
+	default y
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # nios2 Binutils 2.25.1 bug
 	select BR2_PACKAGE_QT_NETWORK
-	default y
 	help
 	  Turns on support for Gui applications. If your board doesn't have
 	  video output, or you don't require Qt GUI, say n.
@@ -187,8 +187,8 @@ menu "Fonts"
 
 config BR2_PACKAGE_QT_FONT_TRUETYPE
 	bool "dejavu/vera"
-	depends on BR2_PACKAGE_QT_QTFREETYPE || BR2_PACKAGE_QT_SYSTEMFREETYPE
 	default y
+	depends on BR2_PACKAGE_QT_QTFREETYPE || BR2_PACKAGE_QT_SYSTEMFREETYPE
 
 comment "dejavu/vera fonts need freetype support"
 	depends on !BR2_PACKAGE_QT_QTFREETYPE && !BR2_PACKAGE_QT_SYSTEMFREETYPE
@@ -266,8 +266,8 @@ config BR2_PACKAGE_QT_NOJPEG
 	  Disable JPEG support
 
 config BR2_PACKAGE_QT_SYSTEMJPEG
-	select BR2_PACKAGE_JPEG
 	bool "System libjpeg"
+	select BR2_PACKAGE_JPEG
 	help
 	  Link against system libjpeg
 
@@ -346,9 +346,9 @@ endif
 
 config BR2_PACKAGE_QT_PHONON
 	bool "Phonon Module"
+	default y
 	depends on BR2_PACKAGE_GSTREAMER
 	select BR2_PACKAGE_GST_PLUGINS_BASE
-	default y
 	help
 	  Build the Phonon module. Support for different audio/video
 	  formats can be configured at the GStreamer package.
@@ -366,9 +366,9 @@ config BR2_PACKAGE_QT_PHONON_BACKEND
 
 config BR2_PACKAGE_QT_OPENGL
 	bool "OpenGL support"
+	default y
 	depends on (BR2_PACKAGE_HAS_LIBGL && BR2_PACKAGE_QT_X11) || \
 		   (BR2_PACKAGE_HAS_LIBEGL && BR2_PACKAGE_HAS_LIBGLES)
-	default y
 	help
 	  This option enables OpenGL support.
 
@@ -404,9 +404,9 @@ endif
 
 config BR2_PACKAGE_QT_DBUS
 	bool "DBus Module"
-	select BR2_PACKAGE_DBUS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_USE_MMU # dbus
+	select BR2_PACKAGE_DBUS
 	help
 	  Build the Qt DBus module.
 
@@ -436,8 +436,8 @@ config BR2_PACKAGE_QT_MULTIMEDIA
 config BR2_PACKAGE_QT_AUDIO_BACKEND
 	bool "QtMultimedia Audio backend"
 	depends on BR2_PACKAGE_QT_MULTIMEDIA
-	select BR2_PACKAGE_ALSA_LIB
 	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
+	select BR2_PACKAGE_ALSA_LIB
 	help
 	  Build the ALSA audio backend into QtMultimedia
 
@@ -457,7 +457,6 @@ config BR2_PACKAGE_QT_NETWORK
 
 config BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
 	bool
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	# see src/3rdparty/webkit/Source/JavaScriptCore/wtf/Platform.h
 	# see http://lists.busybox.net/pipermail/buildroot/2014-November/112605.html
 	default y if BR2_arc || BR2_arm || BR2_armeb || BR2_i386 || BR2_microblazeel || \
@@ -468,6 +467,7 @@ config BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
 	# with an assertion failure in binutils.
 	default y if (BR2_sh4 || BR2_sh4eb || BR2_sh4a || BR2_sh4aeb) && \
 		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
 config BR2_PACKAGE_QT_WEBKIT
 	bool "WebKit Module"
@@ -513,19 +513,19 @@ config BR2_PACKAGE_QT_OPENSSL
 
 config BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT
 	bool
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	# see http://lists.busybox.net/pipermail/buildroot/2014-November/112605.html
 	default y if BR2_arc || BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || \
 		BR2_microblazeel || BR2_microblazebe || BR2_mips || BR2_mipsel || \
 		BR2_mips64 || BR2_mips64el || BR2_nios2 || BR2_powerpc || \
 		BR2_powerpc64 || BR2_powerpc64le || BR2_sh4 || BR2_sh4eb || \
 		BR2_sh4a || BR2_sh4aeb || BR2_x86_64
-
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	
 config BR2_PACKAGE_QT_SCRIPT
 	bool "Script Module"
+	default y
 	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # needs pthread_getattr_np()
-	default y
 	help
 	  Build the Qt Script module.
 	  if unsure, say y.
diff --git a/package/qt/Config.mouse.in b/package/qt/Config.mouse.in
index 11da956..07573eb 100644
--- a/package/qt/Config.mouse.in
+++ b/package/qt/Config.mouse.in
@@ -11,8 +11,8 @@ config BR2_PACKAGE_QT_MOUSE_LINUXINPUT
 
 config BR2_PACKAGE_QT_MOUSE_TSLIB
 	bool "tslib"
-	select BR2_PACKAGE_TSLIB
 	depends on !BR2_STATIC_LIBS # tslib
+	select BR2_PACKAGE_TSLIB
 
 comment "tslib support needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
diff --git a/package/qt/Config.sql.in b/package/qt/Config.sql.in
index 5bd63d2..6d39bb9 100644
--- a/package/qt/Config.sql.in
+++ b/package/qt/Config.sql.in
@@ -6,10 +6,10 @@ menuconfig BR2_PACKAGE_QT_SQL_MODULE
 if BR2_PACKAGE_QT_SQL_MODULE
 config BR2_PACKAGE_QT_MYSQL
 	bool "MySQL Driver"
+	depends on BR2_USE_MMU # mysql
 	select BR2_PACKAGE_MYSQL
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_READLINE
-	depends on BR2_USE_MMU # mysql
 	help
 	  Build MySQL driver
 	  If unsure, say n.
@@ -23,8 +23,8 @@ config BR2_PACKAGE_QT_ODBC
 
 config BR2_PACKAGE_QT_PSQL
 	bool "PostgreSQL Driver"
-	select BR2_PACKAGE_POSTGRESQL
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_POSTGRESQL
 	help
 	  Build PostgreSQL driver
 	  If unsure, say n.
diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 626e9b2..04dccea 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -1,15 +1,15 @@
 config BR2_PACKAGE_QT5_GL_AVAILABLE
 	bool
-	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
 	default y
+	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
 
 config BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	bool
+	default y
 	# Javascript engine is only available on certain architectures
 	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
 	# ARM needs BLX, so v5t+
 	depends on !BR2_ARM_CPU_ARMV4
-	default y
 
 comment "Qt5 needs a toolchain w/ wchar, NPTL, C++, dynamic library"
 	depends on !BR2_PACKAGE_QT
diff --git a/package/qt5/qt53d/Config.in b/package/qt5/qt53d/Config.in
index 27f27a8..f776da2 100644
--- a/package/qt5/qt53d/Config.in
+++ b/package/qt5/qt53d/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_QT53D
 	bool "qt53d"
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
+	depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5declarative_quick
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5DECLARATIVE
 	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
-	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
-	depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5declarative_quick
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 337dcf2..a2e0bfa 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -73,19 +73,19 @@ config BR2_PACKAGE_QT5BASE_SQL
 if BR2_PACKAGE_QT5BASE_SQL
 config BR2_PACKAGE_QT5BASE_MYSQL
 	bool "MySQL Plugin"
+	depends on BR2_USE_MMU # mysql
 	select BR2_PACKAGE_MYSQL
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_READLINE
-	depends on BR2_USE_MMU # mysql
 	help
 	  Build MySQL plugin
 	  If unsure, say n.
 
 config BR2_PACKAGE_QT5BASE_PSQL
 	bool "PostgreSQL Plugin"
-	select BR2_PACKAGE_POSTGRESQL
 	depends on BR2_USE_MMU # postgresql
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_POSTGRESQL
 	help
 	  Build PostgreSQL plugin
 	  If unsure, say n.
@@ -210,9 +210,9 @@ comment "X.org XCB backend available if X.org is enabled"
 
 config BR2_PACKAGE_QT5BASE_EGLFS
 	bool "eglfs support"
-	select BR2_PACKAGE_QT5BASE_OPENGL
 	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
+	select BR2_PACKAGE_QT5BASE_OPENGL
 
 comment "eglfs backend available if OpenGL and EGL are enabled"
 	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_QT5_GL_AVAILABLE
@@ -262,16 +262,16 @@ endif
 
 config BR2_PACKAGE_QT5BASE_DBUS
 	bool "DBus module"
-	select BR2_PACKAGE_DBUS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
+	select BR2_PACKAGE_DBUS
 	help
 	  This option enables the D-Bus module.
 
 config BR2_PACKAGE_QT5BASE_ICU
 	bool "Enable ICU support"
-	select BR2_PACKAGE_ICU
 	depends on !BR2_BINFMT_FLAT # icu
+	select BR2_PACKAGE_ICU
 	help
 	  This option enables ICU support in Qt5. This is for example
 	  needed for Qt5Webkit.
diff --git a/package/qt5/qt5canvas3d/Config.in b/package/qt5/qt5canvas3d/Config.in
index 8058a2e..04c0473 100644
--- a/package/qt5/qt5canvas3d/Config.in
+++ b/package/qt5/qt5canvas3d/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_QT5CANVAS3D
 	bool "qt5canvas3d"
-	select BR2_PACKAGE_QT5DECLARATIVE
-	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
 	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
+	select BR2_PACKAGE_QT5DECLARATIVE
+	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
diff --git a/package/qt5/qt5connectivity/Config.in b/package/qt5/qt5connectivity/Config.in
index 8903fc9..8bda8de 100644
--- a/package/qt5/qt5connectivity/Config.in
+++ b/package/qt5/qt5connectivity/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_QT5CONNECTIVITY
 	bool "qt5connectivity"
+	depends on BR2_PACKAGE_NEARD || BR2_PACKAGE_BLUEZ_UTILS || BR2_PACKAGE_BLUEZ5_UTILS
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_CONCURRENT
 	select BR2_PACKAGE_QT5BASE_DBUS
-	depends on BR2_PACKAGE_NEARD || BR2_PACKAGE_BLUEZ_UTILS || BR2_PACKAGE_BLUEZ5_UTILS
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
diff --git a/package/qt5/qt5declarative/Config.in b/package/qt5/qt5declarative/Config.in
index 853322c..5384b5f 100644
--- a/package/qt5/qt5declarative/Config.in
+++ b/package/qt5/qt5declarative/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_QT5DECLARATIVE
 	bool "qt5declarative"
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	select BR2_PACKAGE_QT5XMLPATTERNS
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_GUI
-	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
@@ -21,7 +21,7 @@ comment "quick module needs an OpenGL-capable backend"
 
 config BR2_PACKAGE_QT5DECLARATIVE_QUICK
 	bool "quick module"
-	select BR2_PACKAGE_QT5BASE_OPENGL
 	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
+	select BR2_PACKAGE_QT5BASE_OPENGL
 
 endif
diff --git a/package/qt5/qt5graphicaleffects/Config.in b/package/qt5/qt5graphicaleffects/Config.in
index df23425..69b7fca 100644
--- a/package/qt5/qt5graphicaleffects/Config.in
+++ b/package/qt5/qt5graphicaleffects/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_QT5GRAPHICALEFFECTS
 	bool "qt5graphicaleffects"
-	select BR2_PACKAGE_QT5DECLARATIVE
-	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
 	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
+	select BR2_PACKAGE_QT5DECLARATIVE
+	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
diff --git a/package/qt5/qt5quickcontrols/Config.in b/package/qt5/qt5quickcontrols/Config.in
index 3ab6ded..3cc5821 100644
--- a/package/qt5/qt5quickcontrols/Config.in
+++ b/package/qt5/qt5quickcontrols/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_QT5QUICKCONTROLS
 	bool "qt5quickcontrols"
-	select BR2_PACKAGE_QT5DECLARATIVE
-	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
 	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
+	select BR2_PACKAGE_QT5DECLARATIVE
+	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
diff --git a/package/qt5/qt5quickcontrols2/Config.in b/package/qt5/qt5quickcontrols2/Config.in
index adf89d0..1066b17 100644
--- a/package/qt5/qt5quickcontrols2/Config.in
+++ b/package/qt5/qt5quickcontrols2/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_QT5QUICKCONTROLS2
 	bool "qt5quickcontrols2"
-	select BR2_PACKAGE_QT5DECLARATIVE
-	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
 	depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5declarative/quick
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative/quick
+	select BR2_PACKAGE_QT5DECLARATIVE
+	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
diff --git a/package/qt5/qt5script/Config.in b/package/qt5/qt5script/Config.in
index ad19727..034b7d2 100644
--- a/package/qt5/qt5script/Config.in
+++ b/package/qt5/qt5script/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_QT5SCRIPT
 	bool "qt5script"
-	select BR2_PACKAGE_QT5BASE
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
+	select BR2_PACKAGE_QT5BASE
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
index 2534360..637996a 100644
--- a/package/qt5/qt5webkit/Config.in
+++ b/package/qt5/qt5webkit/Config.in
@@ -1,16 +1,16 @@
 config BR2_PACKAGE_QT5WEBKIT
 	bool "qt5webkit"
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
+	depends on !BR2_BINFMT_FLAT # icu
+	# assumes a FPU is available on MIPS
+	depends on !BR2_MIPS_SOFT_FLOAT
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_ICU
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_QT5BASE_XCB
 	select BR2_PACKAGE_XLIB_LIBXRENDER if BR2_PACKAGE_QT5BASE_XCB
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
-	depends on !BR2_BINFMT_FLAT # icu
-	# assumes a FPU is available on MIPS
-	depends on !BR2_MIPS_SOFT_FLOAT
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
diff --git a/package/qt5/qt5x11extras/Config.in b/package/qt5/qt5x11extras/Config.in
index 9c514cd..ff4cc11 100644
--- a/package/qt5/qt5x11extras/Config.in
+++ b/package/qt5/qt5x11extras/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_QT5X11EXTRAS
 	bool "qt5x11extras"
-	select BR2_PACKAGE_QT5BASE_WIDGETS
 	depends on BR2_PACKAGE_QT5BASE_XCB
+	select BR2_PACKAGE_QT5BASE_WIDGETS
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
diff --git a/package/qt5cinex/Config.in b/package/qt5cinex/Config.in
index b273231..5adf6c3 100644
--- a/package/qt5cinex/Config.in
+++ b/package/qt5cinex/Config.in
@@ -6,16 +6,16 @@ comment "qt5cinex needs an Open(E)GL-capable backend"
 config BR2_PACKAGE_QT5CINEX
 	bool "qt5cinex"
 	depends on BR2_PACKAGE_QT5
-	select BR2_PACKAGE_QT5BASE_NETWORK
-	select BR2_PACKAGE_QT5BASE_PNG
-	select BR2_PACKAGE_QT5BASE_WIDGETS
-	select BR2_PACKAGE_QT5BASE_EGLFS
-	select BR2_PACKAGE_QT5GRAPHICALEFFECTS
 	depends on BR2_PACKAGE_HAS_LIBEGL # qt5base-eglfs
 	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
 	# No comment needed for this option, it's an architecture
 	# dependency.
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
+	select BR2_PACKAGE_QT5BASE_NETWORK
+	select BR2_PACKAGE_QT5BASE_PNG
+	select BR2_PACKAGE_QT5BASE_WIDGETS
+	select BR2_PACKAGE_QT5BASE_EGLFS
+	select BR2_PACKAGE_QT5GRAPHICALEFFECTS
 	help
 	  This application demonstrates the power of Qt5 and few of the new
 	  additions available in QtQuick 2.0.
diff --git a/package/rdesktop/Config.in b/package/rdesktop/Config.in
index f683ed3..0335bee 100644
--- a/package/rdesktop/Config.in
+++ b/package/rdesktop/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_RDESKTOP
 	bool "rdesktop"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXT
-	depends on BR2_PACKAGE_XORG7
 	help
 	  rdesktop is an open source client for Windows NT Terminal
 	  Server and Windows 2000/2003 Terminal Services, capable of
diff --git a/package/rpcbind/Config.in b/package/rpcbind/Config.in
index 9ff64a5..9998200 100644
--- a/package/rpcbind/Config.in
+++ b/package/rpcbind/Config.in
@@ -3,9 +3,8 @@ config BR2_PACKAGE_RPCBIND
 	# We really need libtirpc and can't work with the native RPC
 	# implementation of toolchains.
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libtirpc
+	depends on BR2_USE_MMU 	# fork()
 	select BR2_PACKAGE_LIBTIRPC
-	# fork()
-	depends on BR2_USE_MMU
 	help
 	  The rpcbind utility is a server that converts RPC program numbers
 	  into universal addresses.
diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index 7b37a30..4efef86 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -47,8 +47,8 @@ config BR2_PACKAGE_RPI_FIRMWARE_BOOT
 
 config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS
 	bool "Install Device Tree Blobs (DTBs)"
-	depends on !BR2_LINUX_KERNEL_DTS_SUPPORT
 	default y
+	depends on !BR2_LINUX_KERNEL_DTS_SUPPORT
 	help
 	  If you are using a Linux kernel <= 3.18, you should say 'y' here.
 
@@ -58,9 +58,9 @@ config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS
 
 config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
 	bool "Install DTB overlays"
+	default y
 	depends on BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS \
 		|| BR2_LINUX_KERNEL_DTS_SUPPORT
-	default y
 	help
 	  Say 'y' here if you need to load one or more of the DTB overlays,
 	  to support HATs (Hardware Attached on Top, add-on modules).
diff --git a/package/rsyslog/Config.in b/package/rsyslog/Config.in
index c4dc97a..8c024e6 100644
--- a/package/rsyslog/Config.in
+++ b/package/rsyslog/Config.in
@@ -1,9 +1,5 @@
 config BR2_PACKAGE_RSYSLOG
 	bool "rsyslog"
-	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_LIBESTR
-	select BR2_PACKAGE_LIBLOGGING
-	select BR2_PACKAGE_LIBFASTJSON
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # modules
@@ -12,6 +8,10 @@ config BR2_PACKAGE_RSYSLOG
 	# even though rsyslog already depends on threads for itself:
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LIBESTR
+	select BR2_PACKAGE_LIBLOGGING
+	select BR2_PACKAGE_LIBFASTJSON
 	help
 	  Rsyslog is a powerful and flexible syslog implementation
 
diff --git a/package/s6-dns/Config.in b/package/s6-dns/Config.in
index 75917f9..e982fda 100644
--- a/package/s6-dns/Config.in
+++ b/package/s6-dns/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_S6_DNS
 	bool "s6-dns"
-	select BR2_PACKAGE_SKALIBS
 	depends on BR2_USE_MMU # skalibs
+	select BR2_PACKAGE_SKALIBS
 	help
 	  s6-dns is a suite of DNS client programs and libraries for
 	  Unix systems, as an alternative to the BIND, djbdns or other
diff --git a/package/s6-linux-init/Config.in b/package/s6-linux-init/Config.in
index d930e2f..b56b861 100644
--- a/package/s6-linux-init/Config.in
+++ b/package/s6-linux-init/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_S6_LINUX_INIT
 	bool "s6-linux-init"
+	depends on BR2_USE_MMU # s6
 	select BR2_PACKAGE_S6
 	select BR2_PACKAGE_S6_LINUX_UTILS
 	select BR2_PACKAGE_S6_PORTABLE_UTILS
-	depends on BR2_USE_MMU # s6
 	help
 	  s6-linux-init is a set of minimalistic tools to create a
 	  s6-based init system, including a /sbin/init binary, on a
diff --git a/package/s6-linux-utils/Config.in b/package/s6-linux-utils/Config.in
index 14af3cf..43e6bb9 100644
--- a/package/s6-linux-utils/Config.in
+++ b/package/s6-linux-utils/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_S6_LINUX_UTILS
 	bool "s6-linux-utils"
-	select BR2_PACKAGE_SKALIBS
 	depends on BR2_USE_MMU # skalibs
+	select BR2_PACKAGE_SKALIBS
 	help
 	  s6-linux-utils is a set of minimalistic Linux-specific
 	  system utilities.
diff --git a/package/s6-networking/Config.in b/package/s6-networking/Config.in
index ebb77a7..bdf5847 100644
--- a/package/s6-networking/Config.in
+++ b/package/s6-networking/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_S6_NETWORKING
 	bool "s6-networking"
+	depends on BR2_USE_MMU # s6
 	select BR2_PACKAGE_S6_DNS
 	select BR2_PACKAGE_S6
-	depends on BR2_USE_MMU # s6
 	help
 	  s6-networking is a suite of small networking utilities for
 	  Unix systems. It includes command-line client and server
diff --git a/package/s6-portable-utils/Config.in b/package/s6-portable-utils/Config.in
index 86ebc4c..8521ecf 100644
--- a/package/s6-portable-utils/Config.in
+++ b/package/s6-portable-utils/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_S6_PORTABLE_UTILS
 	bool "s6-portable-utils"
-	select BR2_PACKAGE_SKALIBS
 	depends on BR2_USE_MMU # skalibs
+	select BR2_PACKAGE_SKALIBS
 	help
 	  s6-portable-utils is a set of tiny general Unix utilities,
 	  often performing well-known tasks such as cut and grep, but
diff --git a/package/s6-rc/Config.in b/package/s6-rc/Config.in
index d2ec75e..39a924e 100644
--- a/package/s6-rc/Config.in
+++ b/package/s6-rc/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_S6_RC
 	bool "s6-rc"
-	select BR2_PACKAGE_S6
 	depends on BR2_USE_MMU # s6
+	select BR2_PACKAGE_S6
 	help
 	  s6-rc is a service manager for s6-based systems, i.e. a
 	  suite of programs that can start and stop services, both
diff --git a/package/s6/Config.in b/package/s6/Config.in
index 7c192c1..043380f 100644
--- a/package/s6/Config.in
+++ b/package/s6/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_S6
 	bool "s6"
-	select BR2_PACKAGE_EXECLINE
 	depends on BR2_USE_MMU # execline
+	select BR2_PACKAGE_EXECLINE
 	help
 	  s6 is a small suite of programs for UNIX, designed to allow
 	  process supervision (a.k.a service supervision), in the line
diff --git a/package/sepolgen/Config.in b/package/sepolgen/Config.in
index 3671816..8dd9038 100644
--- a/package/sepolgen/Config.in
+++ b/package/sepolgen/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_SEPOLGEN
 	bool "sepolgen"
-	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
 	depends on BR2_USE_WCHAR # python3
 	depends on BR2_USE_MMU # python3
 	depends on BR2_TOOLCHAIN_HAS_THREADS # python3
 	depends on !BR2_STATIC_LIBS # python3
+	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
 	help
 	  This package contains a Python module that forms the core of
 	  the modern audit2allow (which is a part of the package
diff --git a/package/setools/Config.in b/package/setools/Config.in
index 5e7f39d..d7b119f 100644
--- a/package/setools/Config.in
+++ b/package/setools/Config.in
@@ -1,9 +1,5 @@
 config BR2_PACKAGE_SETOOLS
 	bool "setools"
-	select BR2_PACKAGE_LIBSELINUX
-	select BR2_PACKAGE_SQLITE
-	select BR2_PACKAGE_LIBXML2
-	select BR2_PACKAGE_BZIP2
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -14,6 +10,10 @@ config BR2_PACKAGE_SETOOLS
 	# section for versioned symbol"
 	# arc: libselinux not available
 	depends on !BR2_nios2 && !BR2_bfin && !BR2_arc
+	select BR2_PACKAGE_LIBSELINUX
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_BZIP2
 	help
 	  SETools is an open source project designed to facilitate
 	  SELinux policy analysis. The primary tools are:
diff --git a/package/sigrok-cli/Config.in b/package/sigrok-cli/Config.in
index b8eb60d..2361665 100644
--- a/package/sigrok-cli/Config.in
+++ b/package/sigrok-cli/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_SIGROK_CLI
 	bool "sigrok-cli"
-	select BR2_PACKAGE_LIBSIGROK
 	# libsigrok->libglib2:
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
 	# libsigrok
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+	select BR2_PACKAGE_LIBSIGROK
 	help
 	  Sigrok-cli is a command-line frontend for the sigrok
 	  software suite.
diff --git a/package/sispmctl/Config.in b/package/sispmctl/Config.in
index 976b08f..6066dc0 100644
--- a/package/sispmctl/Config.in
+++ b/package/sispmctl/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_SISPMCTL
 	bool "sispmctl"
-	select BR2_PACKAGE_LIBUSB
-	select BR2_PACKAGE_LIBUSB_COMPAT
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
 	  sispmctl is an application enabling the use of the GEMBIRD
 	  SiS-PM and mSiS(sispm) USB-controlled power-outlet device
diff --git a/package/softether/Config.in b/package/softether/Config.in
index 60f1357..55e5426 100644
--- a/package/softether/Config.in
+++ b/package/softether/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_SOFTETHER
 	bool "softether"
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_READLINE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_READLINE
 	help
 	  The SoftEther Server is a fully integrated implementation of the SSTP,
 	  L2TP, L2TPv3, OpenVPN, and IPSec virtual private networking protocols
diff --git a/package/speex/Config.in b/package/speex/Config.in
index f18e866..c4e3df5 100644
--- a/package/speex/Config.in
+++ b/package/speex/Config.in
@@ -16,8 +16,8 @@ config BR2_PACKAGE_SPEEX_ARM4
 	depends on BR2_ARM_CPU_ARMV4
 
 config BR2_PACKAGE_SPEEX_ARM5E
-	default y
 	bool
+	default y
 	depends on BR2_arm && !BR2_PACKAGE_SPEEX_ARM4
 
 endif
diff --git a/package/sshfs/Config.in b/package/sshfs/Config.in
index 31fef9f..54aa831 100644
--- a/package/sshfs/Config.in
+++ b/package/sshfs/Config.in
@@ -1,14 +1,14 @@
 config BR2_PACKAGE_SSHFS
 	bool "sshfs (FUSE)"
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse, glib2
+	depends on BR2_USE_MMU # libfuse, glib2
+	depends on !BR2_STATIC_LIBS # libfuse
 	select BR2_PACKAGE_LIBFUSE
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_OPENSSH
-	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse, glib2
-	depends on BR2_USE_MMU # libfuse, glib2
-	depends on !BR2_STATIC_LIBS # libfuse
 	help
 	  FUSE filesystem client based on the SSH File Transfer Protocol.
 
diff --git a/package/startup-notification/Config.in b/package/startup-notification/Config.in
index 1fc6dad..24771ea 100644
--- a/package/startup-notification/Config.in
+++ b/package/startup-notification/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_STARTUP_NOTIFICATION
 	bool "startup-notification"
-	select BR2_PACKAGE_XLIB_LIBX11
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_XLIB_LIBX11
 	help
 	  Startup-notification is a library used to monitor application startup.
 
diff --git a/package/stella/Config.in b/package/stella/Config.in
index 55f177f..dd8e32a 100644
--- a/package/stella/Config.in
+++ b/package/stella/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_STELLA
 	bool "stella"
-	select BR2_PACKAGE_SDL2
-	select BR2_PACKAGE_LIBPNG
-	select BR2_PACKAGE_ZLIB
 	depends on !BR2_STATIC_LIBS # sdl2
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	select BR2_PACKAGE_SDL2
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_ZLIB
 	help
 	  Stella is a multi-platform Atari 2600 VCS emulator.
 
diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 0a95ac0..5119706 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -120,12 +120,12 @@ config BR2_PACKAGE_STRONGSWAN_SCEP
 
 config BR2_PACKAGE_STRONGSWAN_SCRIPTS
 	bool "Enable additional utilities (found in scripts directory)"
-	depends on BR2_PACKAGE_STRONGSWAN_CHARON
 	default y
+	depends on BR2_PACKAGE_STRONGSWAN_CHARON
 
 config BR2_PACKAGE_STRONGSWAN_VICI
 	bool "Enable vici/swanctl"
-	depends on BR2_PACKAGE_STRONGSWAN_CHARON
 	default y
+	depends on BR2_PACKAGE_STRONGSWAN_CHARON
 
 endif
diff --git a/package/subversion/Config.in b/package/subversion/Config.in
index ffe424a..ecac518 100644
--- a/package/subversion/Config.in
+++ b/package/subversion/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_SUBVERSION
 	bool "subversion"
-	select BR2_PACKAGE_APR
-	select BR2_PACKAGE_APR_UTIL
 	# apr really needs shared library support
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # apr
+	select BR2_PACKAGE_APR
+	select BR2_PACKAGE_APR_UTIL
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_SQLITE
diff --git a/package/sunxi-mali/Config.in b/package/sunxi-mali/Config.in
index c6754c2..71b1195 100644
--- a/package/sunxi-mali/Config.in
+++ b/package/sunxi-mali/Config.in
@@ -51,8 +51,8 @@ comment "r3p0 requires an EABIhf toolchain"
 	depends on !BR2_ARM_EABIHF
 
 config BR2_PACKAGE_SUNXI_MALI_R3P1
-	depends on BR2_ARM_EABIHF
 	bool "r3p1"
+	depends on BR2_ARM_EABIHF
 
 comment "r3p1 requires an EABIhf toolchain"
 	depends on !BR2_ARM_EABIHF
diff --git a/package/syslog-ng/Config.in b/package/syslog-ng/Config.in
index 7f47d86..fbc2362 100644
--- a/package/syslog-ng/Config.in
+++ b/package/syslog-ng/Config.in
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_SYSLOG_NG
 	bool "syslog-ng"
-	select BR2_PACKAGE_EVENTLOG
-	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_PCRE
-	select BR2_PACKAGE_OPENSSL
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_EVENTLOG
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_OPENSSL
 	help
 	  syslog-ng is an enhanced log daemon, supporting a wide range
 	  of input and output methods: syslog, unstructured text,
diff --git a/package/sysprof/Config.in b/package/sysprof/Config.in
index e1b0488..3913274 100644
--- a/package/sysprof/Config.in
+++ b/package/sysprof/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_SYSPROF
 	bool "sysprof"
-	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
 	# In its util.h file, sysprof contains architecture-specific
 	# code
 	depends on BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_sh4a || BR2_sh4aeb
+	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Sysprof is a statistical, system-wide profiler that can
 	  profile user and kernel code using the perf API.
diff --git a/package/sysstat/Config.in b/package/sysstat/Config.in
index c262799..923c48a 100644
--- a/package/sysstat/Config.in
+++ b/package/sysstat/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_SYSSTAT
 	bool "sysstat"
+	depends on BR2_USE_MMU 	# fork()
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-	# Uses fork()
-	depends on BR2_USE_MMU
 	help
 	  The sysstat utilities are a collection of performance
 	  monitoring tools for Linux. These include sar, sadf, mpstat,
diff --git a/package/tekui/Config.in b/package/tekui/Config.in
index 1203667..b0f86bf 100644
--- a/package/tekui/Config.in
+++ b/package/tekui/Config.in
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_TEKUI
 	bool "tekui"
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_LUAFILESYSTEM	# runtime only
 	select BR2_PACKAGE_LUAEXPAT		# runtime only
 	select BR2_PACKAGE_LUASOCKET		# runtime only
 	select BR2_PACKAGE_LUAPOSIX		# runtime only
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
-	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  TekUI is a small, freestanding and portable graphical user interface
 	  (GUI) toolkit written in Lua and C. It was initially developed for
diff --git a/package/tiff/Config.in b/package/tiff/Config.in
index 092a7f3..f842c2e 100644
--- a/package/tiff/Config.in
+++ b/package/tiff/Config.in
@@ -37,8 +37,8 @@ config BR2_PACKAGE_TIFF_MDI
 
 config BR2_PACKAGE_TIFF_ZLIB
 	bool "Zlib usage (required for Deflate compression)"
-	select BR2_PACKAGE_ZLIB
 	default y
+	select BR2_PACKAGE_ZLIB
 
 config BR2_PACKAGE_TIFF_XZ
 	bool "XZ compression"
@@ -46,13 +46,13 @@ config BR2_PACKAGE_TIFF_XZ
 
 config BR2_PACKAGE_TIFF_PIXARLOG
 	bool "Pixar log-format algorithm (requires Zlib)"
-	select BR2_PACKAGE_TIFF_ZLIB
 	default y
+	select BR2_PACKAGE_TIFF_ZLIB
 
 config BR2_PACKAGE_TIFF_JPEG
 	bool "JPEG compression"
-	select BR2_PACKAGE_JPEG
 	default y
+	select BR2_PACKAGE_JPEG
 
 config BR2_PACKAGE_TIFF_OLD_JPEG
 	bool "Old JPEG decompression"
diff --git a/package/tinc/Config.in b/package/tinc/Config.in
index 1d8e2c4..837f556 100644
--- a/package/tinc/Config.in
+++ b/package/tinc/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_TINC
 	bool "tinc"
+	depends on !BR2_STATIC_LIBS # tinc requires libdl for OpenSSL
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
-	depends on !BR2_STATIC_LIBS # tinc requires libdl for OpenSSL
-	depends on BR2_USE_MMU # fork()
 	help
 	  tinc is a Virtual Private Network (VPN) daemon that uses
 	  tunnelling and encryption to create a secure private network
diff --git a/package/tpm-tools/Config.in b/package/tpm-tools/Config.in
index 83b65f3..091f424 100644
--- a/package/tpm-tools/Config.in
+++ b/package/tpm-tools/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_TPM_TOOLS
 	bool "tpm-tools"
-	select BR2_PACKAGE_TROUSERS
-	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # trousers
 	depends on !BR2_STATIC_LIBS # trousers
 	depends on !BR2_arc # trousers
+	select BR2_PACKAGE_TROUSERS
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Tools to manage and diagnose a TPM
 
diff --git a/package/trousers/Config.in b/package/trousers/Config.in
index de3b951..eb791d1 100644
--- a/package/trousers/Config.in
+++ b/package/trousers/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_TROUSERS
 	bool "trousers"
-	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# doesn't build properly in static only configurations
 	depends on !BR2_STATIC_LIBS
 	# ARC toolchain issue
 	depends on !BR2_arc
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  The open-source TCG Software Stack (TSS).
 
diff --git a/package/ubus/Config.in b/package/ubus/Config.in
index c14f6a8..3d34121 100644
--- a/package/ubus/Config.in
+++ b/package/ubus/Config.in
@@ -4,10 +4,10 @@ comment "ubus needs a toolchain w/ dynamic library"
 
 config BR2_PACKAGE_UBUS
 	bool "ubus"
-	select BR2_PACKAGE_LIBUBOX
-	select BR2_PACKAGE_JSON_C
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
 	depends on !BR2_STATIC_LIBS # libubox
+	select BR2_PACKAGE_LIBUBOX
+	select BR2_PACKAGE_JSON_C
 	help
 	  IPC/RPC bus that allows communication between processes.
 
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index bfce45c..b0b0b01 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -47,15 +47,15 @@ choice
 
 config BR2_PTHREADS_NATIVE
 	bool "Native POSIX Threading (NPTL)"
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU
 	depends on !BR2_m68k && !BR2_microblaze && !BR2_or1k
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
 config BR2_PTHREADS
 	bool "linuxthreads"
-	select BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_bfin || BR2_m68k || BR2_microblaze || BR2_or1k || BR2_arm || BR2_armeb || BR2_xtensa
+	select BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PTHREADS_NONE
 	bool "none"
@@ -109,45 +109,44 @@ config BR2_UCLIBC_TARGET_ARCH
 
 config BR2_UCLIBC_ARC_TYPE
 	string
-	depends on BR2_UCLIBC_TARGET_ARCH = "arc"
 	default "ARC_CPU_700"	if BR2_arc750d
 	default "ARC_CPU_700"	if BR2_arc770d
 	default "ARC_CPU_HS"	if BR2_archs38
+	depends on BR2_UCLIBC_TARGET_ARCH = "arc"
 
 config BR2_UCLIBC_MIPS_ABI
 	string
-	depends on BR2_UCLIBC_TARGET_ARCH = "mips"
 	default "O32" if BR2_MIPS_OABI32
 	default "N32" if BR2_MIPS_NABI32
 	default "N64" if BR2_MIPS_NABI64
+	depends on BR2_UCLIBC_TARGET_ARCH = "mips"
 
 config BR2_UCLIBC_MIPS_NAN
 	string
-	depends on BR2_UCLIBC_TARGET_ARCH = "mips"
 	default "LEGACY" if BR2_MIPS_CPU_MIPS32 || BR2_MIPS_CPU_MIPS64
 	default "2008" if BR2_MIPS_CPU_MIPS32R6 || BR2_MIPS_CPU_MIPS64R6
+	depends on BR2_UCLIBC_TARGET_ARCH = "mips"
 
 config BR2_UCLIBC_SH_TYPE
 	string
-	depends on BR2_UCLIBC_TARGET_ARCH = "sh"
 	default "SH2A" if BR2_sh2a
 	default "SH4"  if BR2_sh4 || BR2_sh4eb
+	depends on BR2_UCLIBC_TARGET_ARCH = "sh"
 
 config BR2_UCLIBC_SPARC_TYPE
 	string
-	depends on BR2_UCLIBC_TARGET_ARCH = "sparc"
 	default "V7"	if BR2_sparc_v7 || BR2_sparc_sparchfleon || BR2_sparc_sparcsfleon
 	default "V8"	if BR2_sparc_v8 || BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleonv8
+	depends on BR2_UCLIBC_TARGET_ARCH = "sparc"
 
 config BR2_UCLIBC_POWERPC_TYPE
 	string
-	depends on BR2_UCLIBC_TARGET_ARCH = "powerpc"
 	default "CLASSIC" if !BR2_powerpc_8540 && !BR2_powerpc_8548
 	default "E500"    if BR2_powerpc_8540 || BR2_powerpc_8548
+	depends on BR2_UCLIBC_TARGET_ARCH = "powerpc"
 
 config BR2_UCLIBC_X86_TYPE
 	string
-	depends on BR2_UCLIBC_TARGET_ARCH = "i386"
 	default "486"        if BR2_x86_i486
 	default "586"        if BR2_x86_i586
 	default "586MMX"     if BR2_x86_pentium_mmx
@@ -156,5 +155,6 @@ config BR2_UCLIBC_X86_TYPE
 	default "PENTIUMIII" if BR2_x86_pentium3
 	default "PENTIUM4"   if BR2_x86_pentium4 || BR2_x86_pentium_m || \
 	                        BR2_x86_nocona || BR2_x86_core2 || BR2_x86_corei7
+	depends on BR2_UCLIBC_TARGET_ARCH = "i386"
 
 endif # BR2_TOOLCHAIN_BUILDROOT_UCLIBC
diff --git a/package/udev/Config.in b/package/udev/Config.in
index 941a515..814a625 100644
--- a/package/udev/Config.in
+++ b/package/udev/Config.in
@@ -2,5 +2,5 @@ config BR2_PACKAGE_HAS_UDEV
 	bool
 
 config BR2_PACKAGE_PROVIDES_UDEV
-	depends on BR2_PACKAGE_HAS_UDEV
 	string
+	depends on BR2_PACKAGE_HAS_UDEV
diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index 475f498..a506813 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -6,9 +6,9 @@ config BR2_PACKAGE_UDISKS
 	depends on !BR2_STATIC_LIBS # lvm2
 	depends on !BR2_TOOLCHAIN_USES_MUSL # lvm2
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # lvm2
+	depends on BR2_USE_WCHAR # dbus-glib -> glib2
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
-	depends on BR2_USE_WCHAR # dbus-glib -> glib2
 	select BR2_PACKAGE_SG3_UTILS
 	select BR2_PACKAGE_POLKIT
 	select BR2_PACKAGE_PARTED
diff --git a/package/unionfs/Config.in b/package/unionfs/Config.in
index ece83a5..fe03b95 100644
--- a/package/unionfs/Config.in
+++ b/package/unionfs/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_UNIONFS
 	bool "unionfs (FUSE)"
-	select BR2_PACKAGE_LIBFUSE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
 	depends on BR2_USE_MMU # libfuse
 	depends on !BR2_STATIC_LIBS # libfuse
+	select BR2_PACKAGE_LIBFUSE
 	help
 	  A userspace unionfs implementation.
 
diff --git a/package/usb_modeswitch_data/Config.in b/package/usb_modeswitch_data/Config.in
index ad96726..95b2a07 100644
--- a/package/usb_modeswitch_data/Config.in
+++ b/package/usb_modeswitch_data/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_USB_MODESWITCH_DATA
 	bool "usb_modeswitch_data"
-	select BR2_PACKAGE_USB_MODESWITCH
 	depends on BR2_TOOLCHAIN_HAS_THREADS # usb_modeswitch -> libusb
+	select BR2_PACKAGE_USB_MODESWITCH
 	help
 	  USB mode switch data
 	  Contains udev rules and events to allow usb_modeswitch to
diff --git a/package/ushare/Config.in b/package/ushare/Config.in
index eba7acf..70bf24a 100644
--- a/package/ushare/Config.in
+++ b/package/ushare/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_USHARE
 	bool "ushare"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnp
-	select BR2_PACKAGE_LIBUPNP
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	# ushare has a completely custom configure script that does
 	# broken things with library ordering, which breaks static
 	# linking.
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBUPNP
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  uShare is a UPnP (TM) A/V & DLNA Media Server.
 	  It implements the server component that provides UPnP media devices
diff --git a/package/vtun/Config.in b/package/vtun/Config.in
index c1f6d38..bb8919c 100644
--- a/package/vtun/Config.in
+++ b/package/vtun/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_VTUN
 	bool "vtun"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
-	depends on BR2_USE_MMU # fork()
 	help
 	  Tool for easily creating Virtual Tunnels over TCP/IP networks
 	  with traffic shaping, compression, and encryption.
diff --git a/package/weston/Config.in b/package/weston/Config.in
index b4e198d..454a14d 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -5,6 +5,11 @@ comment "weston needs udev and a toolchain w/ locale, threads, dynamic library,
 
 config BR2_PACKAGE_WESTON
 	bool "weston"
+	depends on BR2_ENABLE_LOCALE # libinput
+	depends on BR2_PACKAGE_HAS_UDEV
+	depends on !BR2_STATIC_LIBS # wayland
+	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 	select BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS
 	select BR2_PACKAGE_LIBXKBCOMMON
@@ -14,11 +19,6 @@ config BR2_PACKAGE_WESTON
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_MTDEV
 	select BR2_PACKAGE_LIBINPUT
-	depends on BR2_ENABLE_LOCALE # libinput
-	depends on BR2_PACKAGE_HAS_UDEV
-	depends on !BR2_STATIC_LIBS # wayland
-	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 	# Runtime dependency
 	select BR2_PACKAGE_XKEYBOARD_CONFIG
 	# Make sure at least one compositor is selected.
diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
index c5b5c3e..4d5a215 100644
--- a/package/wireshark/Config.in
+++ b/package/wireshark/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_WIRESHARK
 	bool "wireshark"
-	select BR2_PACKAGE_LIBPCAP
-	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_MMU # fork(), glib2
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Network traffic sniffer and protocol decoder.
 
diff --git a/package/wmctrl/Config.in b/package/wmctrl/Config.in
index bc09431..37a1f25 100644
--- a/package/wmctrl/Config.in
+++ b/package/wmctrl/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_WMCTRL
 	bool "wmctrl"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXMU
-	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXMU
+	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Provides command line access to almost all the features
 	  defined in the EWMH specification. It can be used, for
diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 9250a3b..0f62916 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -11,8 +11,8 @@ if BR2_PACKAGE_WPA_SUPPLICANT
 config BR2_PACKAGE_WPA_SUPPLICANT_NL80211
 	bool "Enable nl80211 support"
 	default y
-	select BR2_PACKAGE_LIBNL
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
+	select BR2_PACKAGE_LIBNL
 	help
 	  Enable support for nl80211.  This is the current wireless
 	  API for Linux, supported by all wireless drivers in vanilla
@@ -83,8 +83,8 @@ config BR2_PACKAGE_WPA_SUPPLICANT_CLI
 	  Install wpa_cli command line utility
 
 config BR2_PACKAGE_WPA_SUPPLICANT_WPA_CLIENT_SO
-	depends on !BR2_STATIC_LIBS
 	bool "Install wpa_client shared library"
+	depends on !BR2_STATIC_LIBS
 	help
 	  Install libwpa_client.so.
 
diff --git a/package/x11r7/xapp_luit/Config.in b/package/x11r7/xapp_luit/Config.in
index 3e314de..69da570 100644
--- a/package/x11r7/xapp_luit/Config.in
+++ b/package/x11r7/xapp_luit/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_XAPP_LUIT
 	bool "luit"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBFONTENC
-	depends on BR2_USE_MMU # fork()
 	help
 	  Locale and ISO 2022 support for Unicode terminals
diff --git a/package/x11r7/xapp_xconsole/Config.in b/package/x11r7/xapp_xconsole/Config.in
index 1aaa118..7baf4ff 100644
--- a/package/x11r7/xapp_xconsole/Config.in
+++ b/package/x11r7/xapp_xconsole/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_XAPP_XCONSOLE
 	bool "xconsole"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXAW
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_XPROTO_XPROTO
 	select BR2_PACKAGE_XLIB_LIBXMU
-	depends on BR2_USE_MMU # fork()
 	help
 	  xconsole - monitor system console messages with X
diff --git a/package/x11r7/xapp_xdriinfo/Config.in b/package/x11r7/xapp_xdriinfo/Config.in
index 36dc577..2b204d9 100644
--- a/package/x11r7/xapp_xdriinfo/Config.in
+++ b/package/x11r7/xapp_xdriinfo/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_XAPP_XDRIINFO
 	bool "xdriinfo"
+	depends on BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XPROTO_GLPROTO
-	depends on BR2_PACKAGE_HAS_LIBGL
 	help
 	  query configuration information of DRI drivers
 
diff --git a/package/x11r7/xapp_xedit/Config.in b/package/x11r7/xapp_xedit/Config.in
index feaea74..876d541 100644
--- a/package/x11r7/xapp_xedit/Config.in
+++ b/package/x11r7/xapp_xedit/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_XAPP_XEDIT
 	bool "xedit"
-	select BR2_PACKAGE_XLIB_LIBXAW
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_XLIB_LIBXAW
 	help
 	  simple text editor for X
diff --git a/package/x11r7/xapp_xf86dga/Config.in b/package/x11r7/xapp_xf86dga/Config.in
index 8a13bd4..5d81203 100644
--- a/package/x11r7/xapp_xf86dga/Config.in
+++ b/package/x11r7/xapp_xf86dga/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_XAPP_XF86DGA
 	bool "xf86dga"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXXF86DGA
-	depends on BR2_USE_MMU # fork()
 	help
 	  test program for the XFree86-DGA extension
diff --git a/package/x11r7/xapp_xfs/Config.in b/package/x11r7/xapp_xfs/Config.in
index 8b72445..0a5d711 100644
--- a/package/x11r7/xapp_xfs/Config.in
+++ b/package/x11r7/xapp_xfs/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_XAPP_XFS
 	bool "xfs"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_XLIB_LIBFS
 	select BR2_PACKAGE_XLIB_LIBXFONT
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	depends on BR2_USE_MMU # fork()
 	help
 	  X font server
diff --git a/package/x11r7/xcb-util-cursor/Config.in b/package/x11r7/xcb-util-cursor/Config.in
index ca30494..aa81615 100644
--- a/package/x11r7/xcb-util-cursor/Config.in
+++ b/package/x11r7/xcb-util-cursor/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_XCB_UTIL_CURSOR
 	bool "xcb-util-cursor"
+	depends on BR2_PACKAGE_LIBXCB
 	select BR2_PACKAGE_XCB_UTIL
 	select BR2_PACKAGE_XCB_UTIL_IMAGE
 	select BR2_PACKAGE_XCB_UTIL_RENDERUTIL
-	depends on BR2_PACKAGE_LIBXCB
 	help
 	  The XCB util modules provides a number of libraries which
 	  sit on top of libxcb, the core X protocol library, and some
diff --git a/package/x11r7/xcb-util-renderutil/Config.in b/package/x11r7/xcb-util-renderutil/Config.in
index 53b2a8c..088bb18 100644
--- a/package/x11r7/xcb-util-renderutil/Config.in
+++ b/package/x11r7/xcb-util-renderutil/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_XCB_UTIL_RENDERUTIL
 	bool "xcb-util-renderutil"
-	select BR2_PACKAGE_XCB_UTIL
 	depends on BR2_PACKAGE_LIBXCB # xcb-util
+	select BR2_PACKAGE_XCB_UTIL
 	help
 	  The XCB util modules provides a number of libraries which
 	  sit on top of libxcb, the core X protocol library, and some
diff --git a/package/x11r7/xdriver_xf86-video-geode/Config.in b/package/x11r7/xdriver_xf86-video-geode/Config.in
index 0b45fb1..fe217b9 100644
--- a/package/x11r7/xdriver_xf86-video-geode/Config.in
+++ b/package/x11r7/xdriver_xf86-video-geode/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GEODE
 	bool "xf86-video-geode"
+	depends on BR2_i386
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
-	depends on BR2_i386
 	help
 	  video driver for geode device
diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index 4bbffb2..87a844d 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -98,10 +98,10 @@ config BR2_PACKAGE_XENOMAI_ENABLE_SMP
 
 config BR2_PACKAGE_XENOMAI_ENABLE_REGISTRY
 	bool "Enable registry"
-	select BR2_PACKAGE_LIBFUSE
 	depends on !BR2_STATIC_LIBS # libfuse
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
 	depends on BR2_USE_MMU # libfuse
+	select BR2_PACKAGE_LIBFUSE
 	help
 	  Xenomai APIs can export their internal state through a
 	  pseudo-filesystem, whose files may be read to obtain
diff --git a/package/xorriso/Config.in b/package/xorriso/Config.in
index f9bb10a..60b2642 100644
--- a/package/xorriso/Config.in
+++ b/package/xorriso/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_XORRISO
 	bool "xorriso"
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  xorriso copies file objects from POSIX compliant
 	  filesystems into Rock Ridge enhanced ISO 9660 filesystems
diff --git a/package/xterm/Config.in b/package/xterm/Config.in
index f11aafa..f3bc450 100644
--- a/package/xterm/Config.in
+++ b/package/xterm/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_XTERM
 	bool "xterm"
-	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_XLIB_LIBXAW
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU # fork()
 	# ARC toolchain issue
 	depends on !BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_XLIB_LIBXAW
 	help
 	  xterm terminal emulator
 
diff --git a/package/xvisor/Config.in b/package/xvisor/Config.in
index 996d37a..1f8fd1f 100644
--- a/package/xvisor/Config.in
+++ b/package/xvisor/Config.in
@@ -32,12 +32,12 @@ endchoice
 
 config BR2_PACKAGE_XVISOR_DEFCONFIG
 	string "Defconfig name"
-	depends on BR2_PACKAGE_XVISOR_USE_DEFCONFIG
 	default "generic-v5" if BR2_ARM_CPU_ARMV5
 	default "generic-v6" if BR2_ARM_CPU_ARMV6
 	default "generic-v7" if BR2_ARM_CPU_ARMV7A
 	default "generic-v8" if BR2_AARCH64
 	default "x86_64_generic" if BR2_x86_64
+	depends on BR2_PACKAGE_XVISOR_USE_DEFCONFIG
 	help
 	  Name of the Xvisor defconfig file to use, without the
 	  trailing -defconfig. The defconfig is located in
diff --git a/package/ympd/Config.in b/package/ympd/Config.in
index d0901c7..39b3a86 100644
--- a/package/ympd/Config.in
+++ b/package/ympd/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_YMPD
 	bool "ympd"
-	select BR2_PACKAGE_LIBMPDCLIENT
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBMPDCLIENT
 	help
 	  ympd, a standalone MPD Web GUI written in C, utilizing
 	  Websockets and Bootstrap/JS
-- 
2.9.3
