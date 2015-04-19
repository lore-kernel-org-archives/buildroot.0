From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 19 Apr 2015 09:40:00 -0300
Subject: [Buildroot] [PATCH v2 09/11] packages: remove non-IPv6 dependencies
	and tweaks
In-Reply-To: <1429447202-13722-1-git-send-email-gustavo@zacarias.com.ar>
References: <1429447202-13722-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1429447202-13722-10-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that IPv6 is mandatory remove package dependencies and conditionals
for it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/aiccu/Config.in                      |  5 ++---
 package/argus/Config.in                      |  5 ++---
 package/atftp/Config.in                      |  5 ++---
 package/batctl/Config.in                     |  5 ++---
 package/bind/Config.in                       |  5 ++---
 package/bluez5_utils/Config.in               |  6 ++----
 package/chrony/chrony.mk                     |  4 ----
 package/civetweb/civetweb.mk                 |  6 +-----
 package/classpath/Config.in                  |  5 -----
 package/collectd/Config.in                   |  7 ++-----
 package/connman/Config.in                    |  5 ++---
 package/conntrack-tools/Config.in            |  6 ++----
 package/cppzmq/Config.in                     |  7 +++----
 package/czmq/Config.in                       |  7 +++----
 package/dhcp/dhcp.mk                         |  4 ----
 package/dhcpcd/dhcpcd.mk                     |  4 ----
 package/dnsmasq/dnsmasq.mk                   |  4 ----
 package/dovecot/Config.in                    |  5 -----
 package/ebtables/Config.in                   |  5 -----
 package/ffmpeg/Config.in                     |  6 ------
 package/filemq/Config.in                     |  7 +++----
 package/gnuradio/Config.in                   |  6 ++----
 package/gnutls/gnutls.mk                     |  2 +-
 package/gpsd/gpsd.mk                         |  5 -----
 package/gstreamer/gst-ffmpeg/Config.in       |  4 ----
 package/gstreamer/gst-plugins-good/Config.in |  4 ----
 package/hiawatha/hiawatha.mk                 |  1 -
 package/hostapd/hostapd.mk                   |  4 ----
 package/iftop/Config.in                      |  5 ++---
 package/iptables/iptables.mk                 |  8 --------
 package/iptraf-ng/Config.in                  |  5 -----
 package/iputils/Config.in                    |  2 +-
 package/iputils/iputils.mk                   | 21 ++++++---------------
 package/jamvm/Config.in                      |  4 +---
 package/kodi/Config.in                       |  5 ++---
 package/libiio/libiio.mk                     |  2 +-
 package/libndp/Config.in                     |  4 ----
 package/libnetfilter_queue/Config.in         |  4 ----
 package/libnftnl/Config.in                   |  4 ----
 package/libnspr/libnspr.mk                   |  1 -
 package/liboping/Config.in                   |  4 ----
 package/libshairplay/Config.in               |  5 ++---
 package/libsoup/libsoup.mk                   |  7 -------
 package/libuv/Config.in                      |  5 ++---
 package/libvncserver/libvncserver.mk         |  4 ----
 package/libwebsockets/libwebsockets.mk       |  9 +--------
 package/linphone/Config.in                   |  6 ++----
 package/lsof/lsof.mk                         |  9 ++-------
 package/ltp-testsuite/Config.in              |  6 ++----
 package/lxc/Config.in                        |  5 ++---
 package/mediastreamer/Config.in              |  6 ++----
 package/minidlna/Config.in                   |  5 ++---
 package/modem-manager/Config.in              |  7 +++----
 package/mongrel2/Config.in                   |  5 ++---
 package/mono/Config.in                       |  5 ++---
 package/mpd/Config.in                        |  4 ----
 package/mplayer/mplayer.mk                   | 14 +-------------
 package/mtd/Config.in                        |  4 ----
 package/ndisc6/Config.in                     |  5 -----
 package/net-tools/net-tools.mk               |  4 +---
 package/netsnmp/netsnmp.mk                   | 11 +----------
 package/network-manager/Config.in            |  6 ++----
 package/nftables/Config.in                   |  6 ++----
 package/nginx/nginx.mk                       |  6 +++---
 package/nmap/Config.in                       |  5 ++---
 package/nodejs/Config.in                     |  6 ++----
 package/ntp/ntp.mk                           |  4 ----
 package/odhcp6c/Config.in                    |  5 -----
 package/olsr/Config.in                       |  5 ++---
 package/opencv/Config.in                     |  4 ----
 package/openntpd/Config.in                   |  5 ++---
 package/openobex/Config.in                   |  4 ----
 package/openpgm/Config.in                    |  5 ++---
 package/openvmtools/Config.in                |  5 ++---
 package/openvpn/Config.in                    |  5 -----
 package/php-zmq/Config.in                    |  7 +++----
 package/php/Config.ext                       |  4 ----
 package/php/php.mk                           |  7 -------
 package/postgresql/postgresql.mk             |  8 +-------
 package/pppd/pppd.mk                         |  5 +----
 package/proftpd/proftpd.mk                   |  3 +--
 package/python-pyzmq/Config.in               |  7 +++----
 package/qemu/Config.in                       |  5 ++---
 package/qt/qt.mk                             |  7 -------
 package/qt5/Config.in                        |  5 ++---
 package/quagga/Config.in                     |  5 -----
 package/radvd/Config.in                      |  5 -----
 package/redis/Config.in                      |  5 ++---
 package/samba/samba.mk                       |  2 +-
 package/sconeserver/sconeserver.mk           |  8 +-------
 package/ser2net/Config.in                    |  5 -----
 package/smcroute/Config.in                   |  5 -----
 package/sofia-sip/sofia-sip.mk               |  5 -----
 package/spawn-fcgi/spawn-fcgi.mk             |  4 ----
 package/squid/Config.in                      |  6 ++----
 package/strongswan/Config.in                 |  3 ---
 package/strongswan/strongswan.mk             |  4 ++--
 package/tcl/Config.in                        |  6 ++----
 package/tftpd/tftpd.mk                       |  4 ----
 package/tovid/Config.in                      |  5 ++---
 package/transmission/Config.in               |  5 ++---
 package/trinity/trinity.mk                   |  4 ----
 package/tvheadend/Config.in                  |  5 ++---
 package/ulogd/Config.in                      |  5 ++---
 package/ussp-push/Config.in                  |  5 ++---
 package/x11vnc/x11vnc.mk                     |  6 ------
 package/zeromq/Config.in                     |  7 +++----
 package/zmqpp/Config.in                      |  7 +++----
 package/zyre/Config.in                       |  7 +++----
 109 files changed, 132 insertions(+), 454 deletions(-)

diff --git a/package/aiccu/Config.in b/package/aiccu/Config.in
index bd67bac..4a0d20d 100644
--- a/package/aiccu/Config.in
+++ b/package/aiccu/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_AICCU
 	bool "aiccu"
-	depends on BR2_INET_IPV6
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
@@ -22,8 +21,8 @@ config BR2_PACKAGE_AICCU
 
 	  http://www.sixxs.net/tools/aiccu/
 
-comment "aiccu needs a toolchain w/ IPv6, wchar, threads"
+comment "aiccu needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
-	depends on !(BR2_INET_IPV6 && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
+	depends on !(BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
diff --git a/package/argus/Config.in b/package/argus/Config.in
index 6d47734..7a7d2b6 100644
--- a/package/argus/Config.in
+++ b/package/argus/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_ARGUS
 	bool "argus"
-	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBPCAP
@@ -10,6 +9,6 @@ config BR2_PACKAGE_ARGUS
 
 	  http://qosient.com/argus/
 
-comment "argus needs a toolchain w/ threads, IPv6"
-	depends on !(BR2_TOOLCHAIN_HAS_THREADS && BR2_INET_IPV6)
+comment "argus needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
diff --git a/package/atftp/Config.in b/package/atftp/Config.in
index 2a3df76..7074716 100644
--- a/package/atftp/Config.in
+++ b/package/atftp/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_ATFTP
 	bool "atftp"
-	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  atftp is a client/server implementation of the TFTP
@@ -11,5 +10,5 @@ config BR2_PACKAGE_ATFTP
 
 	  http://sourceforge.net/projects/atftp/
 
-comment "atftp needs a toolchain w/ threads, IPv6"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6
+comment "atftp needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/batctl/Config.in b/package/batctl/Config.in
index a60f4f6..2557418 100644
--- a/package/batctl/Config.in
+++ b/package/batctl/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_BATCTL
 	bool "batctl"
-	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
 	select BR2_PACKAGE_LIBNL
 	help
@@ -8,5 +7,5 @@ config BR2_PACKAGE_BATCTL
 
 	  http://www.open-mesh.org/projects/batman-adv/wiki/Using-batctl
 
-comment "batctl needs a toolchain w/ IPv6, threads"
-	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
+comment "batctl needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/bind/Config.in b/package/bind/Config.in
index 95bbab1..d758884 100644
--- a/package/bind/Config.in
+++ b/package/bind/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_BIND
 	bool "bind"
-	depends on BR2_INET_IPV6
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
 	help
@@ -38,6 +37,6 @@ config BR2_PACKAGE_BIND_TOOLS
 
 endif
 
-comment "bind needs a toolchain w/ IPv6, dynamic library"
+comment "bind needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_INET_IPV6 || BR2_STATIC_LIBS
+	depends on BR2_STATIC_LIBS
diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index 8841649..0131822 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_BLUEZ5_UTILS
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus
-	depends on BR2_INET_IPV6
 	depends on !BR2_STATIC_LIBS # uses dlfcn
 	depends on !BR2_PACKAGE_BLUEZ_UTILS # conflicts with 4.x version
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
@@ -62,10 +61,9 @@ config BR2_PACKAGE_BLUEZ5_UTILS_TEST
 
 endif
 
-comment "bluez5-utils needs a toolchain w/ wchar, threads, IPv6, headers >= 3.4, dynamic library"
+comment "bluez5-utils needs a toolchain w/ wchar, threads, headers >= 3.4, dynamic library"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_INET_IPV6 || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 || \
-		BR2_STATIC_LIBS
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 || BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
 
 comment "bluez5-utils conflicts with older bluez-utils version"
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index de80b52..8e41ddc 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -23,10 +23,6 @@ else
 CHRONY_CONF_OPTS += --disable-readline
 endif
 
-ifneq ($(BR2_INET_IPV6),y)
-CHRONY_CONF_OPTS += --disable-ipv6
-endif
-
 # Ditch the doc build, needs makeinfo and we don't need them
 define CHRONY_DISABLE_DOCS
 	$(SED) 's/chronyc chrony.txt/chronyc/' $(@D)/Makefile.in
diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index c688f0d..048c91f 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -9,16 +9,12 @@ CIVETWEB_SITE = $(call github,sunsetbrew,civetweb,$(CIVETWEB_VERSION))
 CIVETWEB_LICENSE = MIT
 CIVETWEB_LICENSE_FILES = LICENSE.md
 
-CIVETWEB_CONF_OPTS = TARGET_OS=LINUX
+CIVETWEB_CONF_OPTS = TARGET_OS=LINUX WITH_IPV6=1
 CIVETWEB_COPT = $(TARGET_CFLAGS) -DHAVE_POSIX_FALLOCATE=0
 CIVETWEB_LIBS = -lpthread -lm -ldl
 CIVETWEB_SYSCONFDIR = /etc
 CIVETWEB_HTMLDIR = /var/www
 
-ifeq ($(BR2_INET_IPV6),y)
-CIVETWEB_CONF_OPTS += WITH_IPV6=1
-endif
-
 ifeq ($(BR2_CIVETWEB_WITH_LUA),y)
 CIVETWEB_CONF_OPTS += WITH_LUA=1
 endif
diff --git a/package/classpath/Config.in b/package/classpath/Config.in
index a11845c..ce71160 100644
--- a/package/classpath/Config.in
+++ b/package/classpath/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_CLASSPATH
 	select BR2_NEEDS_HOST_JAR
 	select BR2_NEEDS_HOST_JAVAC
 	depends on BR2_PACKAGE_JAMVM
-	depends on BR2_INET_IPV6
 	help
 	  GNU Classpath, Essential Libraries for Java, is a GNU
 	  project to create free core class libraries for use with
@@ -11,7 +10,3 @@ config BR2_PACKAGE_CLASSPATH
 	  language.
 
 	  http://classpath.org
-
-comment "classpath needs a toolchain w/ IPv6"
-	depends on BR2_PACKAGE_JAMVM
-	depends on !BR2_INET_IPV6
diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 98eb51e..ba290c3 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_COLLECTD
 	bool "collectd"
 	# Uses fork()
 	depends on BR2_USE_MMU
-	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	help
@@ -305,7 +304,6 @@ config BR2_PACKAGE_COLLECTD_OPENVPN
 
 config BR2_PACKAGE_COLLECTD_PING
 	bool "ping"
-	depends on BR2_INET_IPV6
 	select BR2_PACKAGE_LIBOPING
 	help
 	  Mesures network latency using ICMP "echo requests".
@@ -446,7 +444,6 @@ config BR2_PACKAGE_COLLECTD_GRAPHITE
 
 config BR2_PACKAGE_COLLECTD_NETWORK
 	bool "network"
-	depends on BR2_INET_IPV6
 	help
 	  Send/receive values from other instances of collectd.
 
@@ -489,6 +486,6 @@ endmenu
 
 endif
 
-comment "collectd needs a toolchain w/ IPv6, threads, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6 || BR2_STATIC_LIBS
+comment "collectd needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
diff --git a/package/connman/Config.in b/package/connman/Config.in
index 39a8ed4..a887c2f 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_CONNMAN
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_IPTABLES
 	depends on BR2_USE_WCHAR # libglib2
-	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus, libglib2
 	depends on !BR2_STATIC_LIBS # needs dlopen()
@@ -64,6 +63,6 @@ config BR2_PACKAGE_CONNMAN_CLIENT
 
 endif # BR2_PACKAGE_CONNMAN
 
-comment "connman needs a toolchain w/ IPv6, wchar, threads, resolver, dynamic library"
+comment "connman needs a toolchain w/ wchar, threads, resolver, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/conntrack-tools/Config.in b/package/conntrack-tools/Config.in
index a928352..84d3fd4 100644
--- a/package/conntrack-tools/Config.in
+++ b/package/conntrack-tools/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_CONNTRACK_TOOLS
 	bool "conntrack-tools"
-	depends on BR2_INET_IPV6
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc
 	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
@@ -16,7 +15,6 @@ config BR2_PACKAGE_CONNTRACK_TOOLS
 
 	  http://www.netfilter.org/projects/conntrack-tools/
 
-comment "conntrack-tools needs a toolchain w/ IPv6, threads"
+comment "conntrack-tools needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_INET_IPV6 || \
-		!(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
+	depends on !(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
diff --git a/package/cppzmq/Config.in b/package/cppzmq/Config.in
index d064901..788fd0b 100644
--- a/package/cppzmq/Config.in
+++ b/package/cppzmq/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_CPPZMQ
 	bool "cppzmq"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_INET_IPV6 # zeromq
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 	select BR2_PACKAGE_ZEROMQ
@@ -10,6 +9,6 @@ config BR2_PACKAGE_CPPZMQ
 
 	  http://github.com/zeromq/cppzmq
 
-comment "cppzmq needs a toolchain w/ C++, IPv6, wchar, threads"
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && \
-		BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
+comment "cppzmq needs a toolchain w/ C++, wchar, threads"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && \
+		BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/czmq/Config.in b/package/czmq/Config.in
index 66c0437..6a99336 100644
--- a/package/czmq/Config.in
+++ b/package/czmq/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_CZMQ
 	select BR2_PACKAGE_ZEROMQ
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
-	depends on BR2_INET_IPV6 # zeromq
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 	help
@@ -11,7 +10,7 @@ config BR2_PACKAGE_CZMQ
 
 	  http://czmq.zeromq.org/
 
-comment "czmq needs a toolchain w/ C++, IPv6, wchar, threads"
+comment "czmq needs a toolchain w/ C++, wchar, threads"
 	depends on BR2_USE_MMU
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && \
-		BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && \
+		BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index e6465ed..c0d4588 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -31,10 +31,6 @@ ifeq ($(BR2_PACKAGE_DHCP_SERVER_DELAYED_ACK),y)
 DHCP_CONF_OPTS += --enable-delayed-ack
 endif
 
-ifneq ($(BR2_INET_IPV6),y)
-DHCP_CONF_OPTS += --disable-dhcpv6
-endif
-
 ifeq ($(BR2_PACKAGE_DHCP_SERVER),y)
 define DHCP_INSTALL_SERVER
 	mkdir -p $(TARGET_DIR)/var/lib
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 6f82090..7e30422 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -10,10 +10,6 @@ DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd
 DHCPCD_DEPENDENCIES = host-pkgconf
 DHCPCD_LICENSE = BSD-2c
 
-ifeq ($(BR2_INET_IPV6),)
-DHCPCD_CONFIG_OPTS += --disable-ipv6
-endif
-
 ifeq ($(BR2_STATIC_LIBS),y)
 DHCPCD_CONFIG_OPTS += --enable-static
 endif
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 3b05590..4b0999b 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -14,10 +14,6 @@ DNSMASQ_DEPENDENCIES = host-pkgconf
 DNSMASQ_LICENSE = Dual GPLv2/GPLv3
 DNSMASQ_LICENSE_FILES = COPYING COPYING-v3
 
-ifneq ($(BR2_INET_IPV6),y)
-DNSMASQ_COPTS += -DNO_IPV6
-endif
-
 ifneq ($(BR2_PACKAGE_DNSMASQ_DHCP),y)
 DNSMASQ_COPTS += -DNO_DHCP
 endif
diff --git a/package/dovecot/Config.in b/package/dovecot/Config.in
index fedc4d9..5fd1714 100644
--- a/package/dovecot/Config.in
+++ b/package/dovecot/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_DOVECOT
 	bool "dovecot"
-	depends on BR2_INET_IPV6
 	depends on BR2_USE_MMU # fork()
 	help
 	  Dovecot is an open source IMAP and POP3 email server for Linux/UNIX-
@@ -52,7 +51,3 @@ config BR2_PACKAGE_DOVECOT_ZLIB
 source package/dovecot-pigeonhole/Config.in
 
 endif # BR2_PACKAGE_DOVECOT
-
-comment "dovecot needs a toolchain w/ IPv6"
-	depends on BR2_USE_MMU
-	depends on !BR2_INET_IPV6
diff --git a/package/ebtables/Config.in b/package/ebtables/Config.in
index 3a678ad..18fff24 100644
--- a/package/ebtables/Config.in
+++ b/package/ebtables/Config.in
@@ -1,12 +1,7 @@
 config BR2_PACKAGE_EBTABLES
 	bool "ebtables"
-	depends on BR2_INET_IPV6
 	depends on BR2_USE_MMU # fork()
 	help
 	  Ethernet bridge frame table administration
 
 	  http://ebtables.sourceforge.net
-
-comment "ebtables needs a toolchain w/ IPv6"
-	depends on BR2_USE_MMU
-	depends on !BR2_INET_IPV6
diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index bfdc624..00163ba 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -1,11 +1,5 @@
-comment "ffmpeg needs a toolchain w/ IPv6"
-	depends on !BR2_INET_IPV6
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
-
 menuconfig BR2_PACKAGE_FFMPEG
 	bool "ffmpeg"
-	depends on BR2_INET_IPV6
 	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
diff --git a/package/filemq/Config.in b/package/filemq/Config.in
index 4015b92..4460f87 100644
--- a/package/filemq/Config.in
+++ b/package/filemq/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_FILEMQ
 	select BR2_PACKAGE_CZMQ
 	select BR2_PACKAGE_ZEROMQ
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
-	depends on BR2_INET_IPV6 # zeromq
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 	depends on BR2_USE_MMU # czmq
@@ -13,7 +12,7 @@ config BR2_PACKAGE_FILEMQ
 
 	  http://github.com/zeromq/filemq
 
-comment "filemq needs a toolchain w/ C++, IPv6, wchar, threads"
+comment "filemq needs a toolchain w/ C++, wchar, threads"
 	depends on BR2_USE_MMU
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && \
-		BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && \
+		BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index a33deeb..752a50b 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -1,12 +1,10 @@
-comment "gnuradio needs a toolchain w/ C++, IPV6, NPTL, wchar, dynamic library"
+comment "gnuradio needs a toolchain w/ C++, NPTL, wchar, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_INET_IPV6 || \
-		BR2_STATIC_LIBS
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_GNURADIO
 	bool "gnuradio"
-	depends on BR2_INET_IPV6 # boost
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 47c07f9..b99cacb 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -22,7 +22,7 @@ GNUTLS_CONF_OPTS = \
 	--disable-doc \
 	--disable-guile \
 	--enable-local-libopts
-GNUTLS_CONF_ENV = gl_cv_socket_ipv6=$(if $(BR2_INET_IPV6),yes,no) \
+GNUTLS_CONF_ENV = gl_cv_socket_ipv6=yes \
 	ac_cv_header_wchar_h=$(if $(BR2_USE_WCHAR),yes,no) \
 	gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no) \
 	gt_cv_c_wint_t=$(if $(BR2_USE_WCHAR),yes,no) \
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 9623d75..1bf4415 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -29,11 +29,6 @@ else
 GPSD_SCONS_OPTS += ncurses=no
 endif
 
-# Disable IPv6, if we don't support it
-ifneq ($(BR2_INET_IPV6),y)
-GPSD_SCONS_OPTS += ipv6=no
-endif
-
 # Build libgpsmm if we've got C++
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 GPSD_LDFLAGS += -lstdc++
diff --git a/package/gstreamer/gst-ffmpeg/Config.in b/package/gstreamer/gst-ffmpeg/Config.in
index fc2906f..c89070f 100644
--- a/package/gstreamer/gst-ffmpeg/Config.in
+++ b/package/gstreamer/gst-ffmpeg/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_GST_FFMPEG
 	bool "gst-ffmpeg"
 	select BR2_PACKAGE_GST_PLUGINS_BASE
-	depends on BR2_INET_IPV6
 	help
 	  GStreamer plugin containing one plugin with a set of elements using
 	  the Libav library.  It contains most popular decoders as well as
@@ -21,6 +20,3 @@ config BR2_PACKAGE_GST_FFMPEG_GPL
 	  be under GPL.
 
 endif
-
-comment "gst-ffmpeg needs a toolchain w/ IPv6"
-	depends on !BR2_INET_IPV6
diff --git a/package/gstreamer/gst-plugins-good/Config.in b/package/gstreamer/gst-plugins-good/Config.in
index 6fb1a84..70ae9c1 100644
--- a/package/gstreamer/gst-plugins-good/Config.in
+++ b/package/gstreamer/gst-plugins-good/Config.in
@@ -139,12 +139,8 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SPECTRUM
 	bool "spectrum"
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_UDP
-	depends on BR2_INET_IPV6
 	bool "udp"
 
-comment "udp needs a toolchain w/ IPv6"
-	depends on !BR2_INET_IPV6
-
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOBOX
 	bool "videobox"
 
diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index 76619e0..91c972d 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -17,7 +17,6 @@ HIAWATHA_CONF_OPTS += -DENABLE_SSL=OFF
 endif
 
 HIAWATHA_CONF_OPTS += \
-	$(if $(BR2_INET_IPV6),,-DENABLE_IPV6=OFF) \
 	-DENABLE_TOOLKIT=OFF \
 	-DENABLE_XSLT=OFF \
 	-DCONFIG_DIR=/etc/hiawatha \
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index a933d79..1ad32a2 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -35,10 +35,6 @@ ifeq ($(BR2_STATIC_LIBS),y)
 HOSTAPD_LIBS += -lnl-3 -lm -lpthread
 endif
 
-ifeq ($(BR2_INET_IPV6),)
-HOSTAPD_CONFIG_DISABLE += CONFIG_IPV6
-endif
-
 # Try to use openssl if it's already available
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 HOSTAPD_DEPENDENCIES += openssl
diff --git a/package/iftop/Config.in b/package/iftop/Config.in
index eb40a30..8c6ae0c 100644
--- a/package/iftop/Config.in
+++ b/package/iftop/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_IFTOP
 	bool "iftop"
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_LIBPCAP
-	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  iftop does for network usage what top(1) does for CPU usage.
@@ -12,5 +11,5 @@ config BR2_PACKAGE_IFTOP
 
 	  http://www.ex-parrot.com/pdw/iftop/
 
-comment "iftop needs a toolchain w/ IPv6, threads"
-	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
+comment "iftop needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 38faa68..e425ec6 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -40,16 +40,8 @@ define IPTABLES_TARGET_IPV6_SYMLINK_CREATE
 	ln -sf xtables-multi $(TARGET_DIR)/usr/sbin/ip6tables-restore
 endef
 
-define IPTABLES_TARGET_IPV6_REMOVE
-	rm -f $(TARGET_DIR)/usr/lib/libip6tc.*
-endef
-
 IPTABLES_POST_INSTALL_TARGET_HOOKS += IPTABLES_TARGET_SYMLINK_CREATE
 
-ifeq ($(BR2_INET_IPV6),y)
 IPTABLES_POST_INSTALL_TARGET_HOOKS += IPTABLES_TARGET_IPV6_SYMLINK_CREATE
-else
-IPTABLES_POST_INSTALL_TARGET_HOOKS += IPTABLES_TARGET_IPV6_REMOVE
-endif
 
 $(eval $(autotools-package))
diff --git a/package/iptraf-ng/Config.in b/package/iptraf-ng/Config.in
index 64e19d2..5574cfa 100644
--- a/package/iptraf-ng/Config.in
+++ b/package/iptraf-ng/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_IPTRAF_NG
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_NCURSES_TARGET_PANEL
-	depends on BR2_INET_IPV6
 	help
 	  IPTraf-ng is a ncurses-based network monitoring utility. It gathers
 	  data like TCP connection packet and byte counts, interface statistics
@@ -12,7 +11,3 @@ config BR2_PACKAGE_IPTRAF_NG
 	  https://fedorahosted.org/iptraf-ng/
 
 	  IPTraf-ng is a fork of original IPTraf v3.0.0 (http://iptraf.seul.org).
-
-comment "iptraf-ng needs a toolchain w/ IPv6"
-	depends on BR2_USE_MMU
-	depends on !BR2_INET_IPV6
diff --git a/package/iputils/Config.in b/package/iputils/Config.in
index fdddb52..5324639 100644
--- a/package/iputils/Config.in
+++ b/package/iputils/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_IPUTILS
 	bool "iputils"
-	select BR2_PACKAGE_OPENSSL if BR2_INET_IPV6
+	select BR2_PACKAGE_OPENSSL
 	depends on BR2_USE_MMU # fork()
 	help
 	  This package is set of small useful utilities for Linux networking.
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 735ed65..332e20f 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -10,6 +10,7 @@ IPUTILS_SOURCE = iputils-$(IPUTILS_VERSION).tar.bz2
 IPUTILS_LICENSE = GPLv2+ BSD-3c
 # Only includes a license file for BSD
 IPUTILS_LICENSE_FILES = ninfod/COPYING
+IPUTILS_DEPENDENCIES = openssl
 
 # Build after busybox so target ends up with this package's full
 # versions of the applications instead of busybox applets.
@@ -20,20 +21,8 @@ endif
 # Disabling CAP_SETPCAP (file capabilities)
 IPUTILS_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) USE_CAP=no USE_SYSFS=no\
 	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
-	arping clockdiff ping rarpd rdisc tftpd tracepath
-
-ifeq ($(BR2_INET_IPV6),y)
-# To support md5 for ping6
-IPUTILS_DEPENDENCIES += openssl
-
-IPUTILS_MAKE_OPTS += ping6 tracepath6 traceroute6
-
-define IPUTILS_IPV6_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 755 $(@D)/ping6       $(TARGET_DIR)/bin/ping6
-	$(INSTALL) -D -m 755 $(@D)/tracepath6  $(TARGET_DIR)/bin/tracepath6
-	$(INSTALL) -D -m 755 $(@D)/traceroute6 $(TARGET_DIR)/bin/traceroute6
-endef
-endif
+	arping clockdiff ping rarpd rdisc tftpd tracepath \
+	ping6 tracepath6 traceroute6
 
 define IPUTILS_BUILD_CMDS
 	$(MAKE) -C $(@D) $(IPUTILS_MAKE_OPTS)
@@ -47,7 +36,9 @@ define IPUTILS_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 755 $(@D)/rdisc       $(TARGET_DIR)/sbin/rdisc
 	$(INSTALL) -D -m 755 $(@D)/tftpd       $(TARGET_DIR)/usr/sbin/in.tftpd
 	$(INSTALL) -D -m 755 $(@D)/tracepath   $(TARGET_DIR)/bin/tracepath
-	$(IPUTILS_IPV6_INSTALL_TARGET_CMDS)
+	$(INSTALL) -D -m 755 $(@D)/ping6       $(TARGET_DIR)/bin/ping6
+	$(INSTALL) -D -m 755 $(@D)/tracepath6  $(TARGET_DIR)/bin/tracepath6
+	$(INSTALL) -D -m 755 $(@D)/traceroute6 $(TARGET_DIR)/bin/traceroute6
 endef
 
 $(eval $(generic-package))
diff --git a/package/jamvm/Config.in b/package/jamvm/Config.in
index 375bded..3b5ff3e 100644
--- a/package/jamvm/Config.in
+++ b/package/jamvm/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_JAMVM
 	bool "jamvm"
-	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_x86_64 \
 		|| BR2_mips || BR2_mipsel || BR2_powerpc
@@ -12,8 +11,7 @@ config BR2_PACKAGE_JAMVM
 
 	  http://jamvm.sf.net
 
-comment "jamvm needs a toolchain w/ IPv6, threads"
+comment "jamvm needs a toolchain w/ threads"
 	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_x86_64 \
 		|| BR2_mips || BR2_mipsel || BR2_powerpc
-	depends on !BR2_INET_IPV6
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 91c1cce..254a1df 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -2,9 +2,9 @@ config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	bool
 	default y if BR2_arm || BR2_i386 || BR2_x86_64
 
-comment "kodi needs a toolchain w/ C++, IPv6, threads, wchar"
+comment "kodi needs a toolchain w/ C++, threads, wchar"
 	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
-	depends on !BR2_INET_IPV6 || !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 	depends on BR2_USE_MMU
 
 config BR2_PACKAGE_KODI_EGL_GLES
@@ -91,7 +91,6 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_YAJL
 	select BR2_PACKAGE_ZLIB
 	select BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY if BR2_TOOLCHAIN_USES_GLIBC # runtime UTF conversion support
-	depends on BR2_INET_IPV6
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_KODI_EGL_GLES || BR2_PACKAGE_KODI_GL
diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index 7082e89..9b63e12 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -10,7 +10,7 @@ LIBIIO_INSTALL_STAGING = YES
 LIBIIO_LICENSE = LGPLv2.1+
 LIBIIO_LICENSE_FILES = COPYING
 
-LIBIIO_CONF_OPTS = -DENABLE_IPV6=$(if $(BR2_INET_IPV6),ON,OFF) \
+LIBIIO_CONF_OPTS = -DENABLE_IPV6=ON \
 	-DWITH_LOCAL_BACKEND=$(if $(BR2_PACKAGE_LIBIIO_LOCAL_BACKEND),ON,OFF) \
 	-DWITH_TESTS=$(if $(BR2_PACKAGE_LIBIIO_TESTS),ON,OFF)
 
diff --git a/package/libndp/Config.in b/package/libndp/Config.in
index bb9093b..6639bb5 100644
--- a/package/libndp/Config.in
+++ b/package/libndp/Config.in
@@ -1,12 +1,8 @@
 config BR2_PACKAGE_LIBNDP
 	bool "libndp"
-	depends on BR2_INET_IPV6
 	help
 	  This package contains a library which provides a wrapper
 	  for IPv6 Neighbor Discovery Protocol. It also provides a tool
 	  named ndptool for sending and receiving NDP messages.
 
 	  https://github.com/jpirko/libndp
-
-comment "libndp needs a toolchain w/ IPv6"
-	depends on !BR2_INET_IPV6
diff --git a/package/libnetfilter_queue/Config.in b/package/libnetfilter_queue/Config.in
index 767f44a..e93e8ea 100644
--- a/package/libnetfilter_queue/Config.in
+++ b/package/libnetfilter_queue/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBNETFILTER_QUEUE
 	bool "libnetfilter_queue"
-	depends on BR2_INET_IPV6
 	select BR2_PACKAGE_LIBNFNETLINK
 	select BR2_PACKAGE_LIBMNL
 	help
@@ -9,6 +8,3 @@ config BR2_PACKAGE_LIBNETFILTER_QUEUE
 	  connection tracking timeout infrastructure.
 
 	  http://www.netfilter.org/projects/libnetfilter_queue/
-
-comment "libnetfilter_queue needs a toolchain w/ IPv6"
-	depends on !BR2_INET_IPV6
diff --git a/package/libnftnl/Config.in b/package/libnftnl/Config.in
index 0d3db5b..dcbfde0 100644
--- a/package/libnftnl/Config.in
+++ b/package/libnftnl/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBNFTNL
 	bool "libnftnl"
-	depends on BR2_INET_IPV6
 	# bad headers, no sa_family_t in linux/socket.h
 	depends on !(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 || BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009)
 	select BR2_PACKAGE_LIBMNL
@@ -32,6 +31,3 @@ comment "libnftnl XML parsing support needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 endif
-
-comment "libnftnl needs a toolchain w/ IPv6"
-	depends on !BR2_INET_IPV6
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 91a740a..752af87 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -20,7 +20,6 @@ LIBNSPR_CONF_ENV = \
 # NSPR mixes up --build and --host
 LIBNSPR_CONF_OPTS = --host=$(GNU_HOST_NAME)
 LIBNSPR_CONF_OPTS += --$(if $(BR2_ARCH_IS_64),en,dis)able-64bit
-LIBNSPR_CONF_OPTS += --$(if $(BR2_INET_IPV6),en,dis)able-ipv6
 
 ifeq ($(BR2_STATIC_LIBS),y)
 LIBNSPR_MAKE_OPTS = SHARED_LIBRARY=
diff --git a/package/liboping/Config.in b/package/liboping/Config.in
index 65e7c88..1d2de31 100644
--- a/package/liboping/Config.in
+++ b/package/liboping/Config.in
@@ -1,11 +1,7 @@
 config BR2_PACKAGE_LIBOPING
 	bool "liboping"
-	depends on BR2_INET_IPV6
 	help
 	  liboping is a C library to generate ICMP echo requests,
 	  better known as "ping packets".
 
 	  http://noping.cc/
-
-comment "liboping needs a toolchain w/ IPv6"
-	depends on !BR2_INET_IPV6
diff --git a/package/libshairplay/Config.in b/package/libshairplay/Config.in
index 0895cd2..1cfbdfe 100644
--- a/package/libshairplay/Config.in
+++ b/package/libshairplay/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBSHAIRPLAY
 	bool "libshairplay"
-	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # avahi
 	depends on !BR2_STATIC_LIBS # avahi
@@ -13,6 +12,6 @@ config BR2_PACKAGE_LIBSHAIRPLAY
 
 	  https://github.com/juhovh/shairplay
 
-comment "libshairplay needs a toolchain w/ IPv6, threads, dynamic library"
+comment "libshairplay needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 70f1074..8cbd0cb 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -11,15 +11,8 @@ LIBSOUP_SITE = http://ftp.gnome.org/pub/gnome/sources/libsoup/$(LIBSOUP_VERSION_
 LIBSOUP_LICENSE = LGPLv2+
 LIBSOUP_LICENSE_FILES = COPYING
 LIBSOUP_INSTALL_STAGING = YES
-
 LIBSOUP_CONF_ENV = ac_cv_path_GLIB_GENMARSHAL=$(LIBGLIB2_HOST_BINARY)
-
-ifneq ($(BR2_INET_IPV6),y)
-LIBSOUP_CONF_ENV += soup_cv_ipv6=no
-endif
-
 LIBSOUP_CONF_OPTS = --disable-glibtest
-
 LIBSOUP_DEPENDENCIES = host-pkgconf host-libglib2 \
 	libglib2 libxml2 sqlite host-intltool
 
diff --git a/package/libuv/Config.in b/package/libuv/Config.in
index f6d7e5f..66cd3f2 100644
--- a/package/libuv/Config.in
+++ b/package/libuv/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBUV
 	bool "libuv"
-	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	help
@@ -9,6 +8,6 @@ config BR2_PACKAGE_LIBUV
 
 	  https://github.com/libuv/libuv
 
-comment "libuv needs a toolchain w/ IPv6, threads"
-	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
+comment "libuv needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index 87bcf45..92cb1e1 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -28,10 +28,6 @@ ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 LIBVNCSERVER_CONF_OPTS += --without-pthread
 endif
 
-ifneq ($(BR2_INET_IPV6),y)
-LIBVNCSERVER_CONF_OPTS += --without-ipv6
-endif
-
 # openssl supports needs NPTL thread support
 ifeq ($(BR2_PACKAGE_OPENSSL)$(BR2_TOOLCHAIN_HAS_THREADS_NPTL),yy)
 LIBVNCSERVER_DEPENDENCIES += openssl
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index da1a872..9e62f1c 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -11,14 +11,7 @@ LIBWEBSOCKETS_LICENSE = LGPLv2.1 with exceptions
 LIBWEBSOCKETS_LICENSE_FILES = LICENSE
 LIBWEBSOCKETS_DEPENDENCIES = zlib
 LIBWEBSOCKETS_INSTALL_STAGING = YES
-
-LIBWEBSOCKETS_CONF_OPTS += -DWITHOUT_TESTAPPS=ON
-
-ifeq ($(BR2_INET_IPV6),y)
-LIBWEBSOCKETS_CONF_OPTS += -DLWS_IPV6=ON
-else
-LIBWEBSOCKETS_CONF_OPTS += -DLWS_IPV6=OFF
-endif
+LIBWEBSOCKETS_CONF_OPTS = -DWITHOUT_TESTAPPS=ON -DLWS_IPV6=ON
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBWEBSOCKETS_DEPENDENCIES += openssl host-openssl
diff --git a/package/linphone/Config.in b/package/linphone/Config.in
index 72eca7d..6d6ffae 100644
--- a/package/linphone/Config.in
+++ b/package/linphone/Config.in
@@ -7,7 +7,6 @@ config BR2_PACKAGE_LINPHONE
 	depends on BR2_INSTALL_LIBSTDCPP # mediastreamer
 	depends on BR2_TOOLCHAIN_HAS_THREADS # ortp
 	depends on BR2_USE_MMU # libeXosip2
-	depends on BR2_INET_IPV6 # mediastreamer
 	help
 	  Linphone is an internet phone or Voice Over IP phone (VoIP).
 
@@ -26,7 +25,6 @@ config BR2_PACKAGE_LINPHONE
 
 	  http://www.linphone.org/
 
-comment "linphone needs a toolchain w/ threads, C++, IPv6"
+comment "linphone needs a toolchain w/ threads, C++"
 	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_INET_IPV6
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index 5d1f564..19b303b 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -16,11 +16,6 @@ LSOF_LICENSE_FILES = dialects/linux/dproto.h
 # Make certain full-blown lsof gets built after the busybox version (1.20+)
 LSOF_DEPENDENCIES += $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 
-BR2_LSOF_CFLAGS =
-ifeq ($(BR2_INET_IPV6),)
-BR2_LSOF_CFLAGS += -UHASIPv6
-endif
-
 ifeq ($(BR2_USE_WCHAR),)
 define LSOF_CONFIGURE_WCHAR_FIXUPS
 	$(SED) 's,^#define[[:space:]]*HASWIDECHAR.*,#undef HASWIDECHAR,' \
@@ -44,7 +39,7 @@ endef
 
 define LSOF_CONFIGURE_CMDS
 	(cd $(@D) ; \
-		echo n | $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS) $(BR2_LSOF_CFLAGS)" \
+		echo n | $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS)" \
 		LSOF_INCLUDE="$(STAGING_DIR)/usr/include" LSOF_CFLAGS_OVERRIDE=1 \
 		LINUX_CLIB=-DGLIBCV=2 ./Configure linux)
 	$(LSOF_CONFIGURE_WCHAR_FIXUPS)
@@ -52,7 +47,7 @@ define LSOF_CONFIGURE_CMDS
 endef
 
 define LSOF_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS) $(BR2_LSOF_CFLAGS)" -C $(@D)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS)" -C $(@D)
 endef
 
 define LSOF_INSTALL_TARGET_CMDS
diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index 4929bbc..52c02ce 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_LTP_TESTSUITE
 	bool "ltp-testsuite"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	# does not build, cachectl.h issue
 	depends on !BR2_nios2
@@ -22,8 +21,7 @@ config BR2_PACKAGE_LTP_TESTSUITE
 
 	  http://ltp.sourceforge.net/
 
-comment "ltp-testsuite needs a toolchain w/ IPv6, RPC, threads"
+comment "ltp-testsuite needs a toolchain w/ RPC, threads"
 	depends on !BR2_nios2
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6 || \
-		!BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/package/lxc/Config.in b/package/lxc/Config.in
index dc287c1..10a668d 100644
--- a/package/lxc/Config.in
+++ b/package/lxc/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LXC
 	bool "lxc"
 	select BR2_PACKAGE_LIBCAP
-	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	# the toolchain doesn't support setns syscall
@@ -15,9 +14,9 @@ config BR2_PACKAGE_LXC
 
 	  https://linuxcontainers.org/
 
-comment "lxc needs a toolchain w/ IPv6, threads, headers >= 3.0"
+comment "lxc needs a toolchain w/ threads, headers >= 3.0"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
-	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS \
+	depends on !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
diff --git a/package/mediastreamer/Config.in b/package/mediastreamer/Config.in
index ebcb647..396f7e4 100644
--- a/package/mediastreamer/Config.in
+++ b/package/mediastreamer/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_MEDIASTREAMER
 	select BR2_PACKAGE_ORTP
 	depends on BR2_INSTALL_LIBSTDCPP # until fixed
 	depends on BR2_TOOLCHAIN_HAS_THREADS # ortp
-	depends on BR2_INET_IPV6
 	help
 	  Mediastreamer is a powerful and lightweighted streaming
 	  engine specialized for voice/video telephony applications.
@@ -14,6 +13,5 @@ config BR2_PACKAGE_MEDIASTREAMER
 
 	  http://www.linphone.org/eng/documentation/dev/mediastreamer2.html
 
-comment "mediastreamer needs a toolchain w/ threads, C++, IPv6"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_INET_IPV6
+comment "mediastreamer needs a toolchain w/ threads, C++"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/minidlna/Config.in b/package/minidlna/Config.in
index c78f1b6..0eef751 100644
--- a/package/minidlna/Config.in
+++ b/package/minidlna/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_MINIDLNA
 	bool "minidlna"
-	depends on BR2_INET_IPV6 # ffmpeg
 	depends on BR2_USE_WCHAR # flac
 	depends on BR2_USE_MMU # fork
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -22,6 +21,6 @@ config BR2_PACKAGE_MINIDLNA
 
 	  http://minidlna.sourceforge.net/
 
-comment "minidlna needs a toolchain w/ IPv6, threads, wchar"
+comment "minidlna needs a toolchain w/ threads, wchar"
 	depends on BR2_USE_MMU
-	depends on !(BR2_INET_IPV6 && BR2_TOOLCHAIN_HAS_THREADS && BR2_USE_WCHAR)
+	depends on !(BR2_TOOLCHAIN_HAS_THREADS && BR2_USE_WCHAR)
diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
index 1c565ee..59b8d88 100644
--- a/package/modem-manager/Config.in
+++ b/package/modem-manager/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_MODEM_MANAGER
 	bool "modemmanager"
 	depends on BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_DBUS
-	depends on BR2_INET_IPV6
 	depends on BR2_USE_WCHAR # libglib2 and gnutls
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus
@@ -28,7 +27,7 @@ config BR2_PACKAGE_MODEM_MANAGER_LIBQMI
 	  This option enables support for QMI protocol
 endif
 
-comment "modemmanager needs udev /dev management and a toolchain w/ wchar, threads, IPv6"
-	depends on !BR2_INET_IPV6 || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_HAS_UDEV
+comment "modemmanager needs udev /dev management and a toolchain w/ wchar, threads"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_PACKAGE_HAS_UDEV
 	depends on BR2_USE_MMU
diff --git a/package/mongrel2/Config.in b/package/mongrel2/Config.in
index 77ca921..1afba77 100644
--- a/package/mongrel2/Config.in
+++ b/package/mongrel2/Config.in
@@ -1,8 +1,8 @@
-comment "mongrel2 needs a toolchain w/ C++, IPv6, threads, wchar"
+comment "mongrel2 needs a toolchain w/ C++, threads, wchar"
 	depends on BR2_UCLIBC_VERSION_SNAPSHOT || \
 		BR2_TOOLCHAIN_USES_GLIBC || \
 		BR2_arm
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_INET_IPV6 || \
+	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 
 config BR2_PACKAGE_MONGREL2
@@ -10,7 +10,6 @@ config BR2_PACKAGE_MONGREL2
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_ZEROMQ
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
-	depends on BR2_INET_IPV6 # zeromq
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 	depends on BR2_USE_WCHAR # zeromq -> util-linux
 	# {get,make,swap}context functions present in
diff --git a/package/mono/Config.in b/package/mono/Config.in
index cc015e6..1db5df4 100644
--- a/package/mono/Config.in
+++ b/package/mono/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_MONO_ARCH_SUPPORTS
 config BR2_PACKAGE_MONO
 	bool "mono"
 	depends on BR2_PACKAGE_MONO_ARCH_SUPPORTS
-	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_MONO_45 if !BR2_PACKAGE_MONO_20 && !BR2_PACKAGE_MONO_40
 	help
@@ -37,5 +36,5 @@ config BR2_PACKAGE_MONO_45
 
 endif
 
-comment "mono needs a toolchain w/ IPv6, threads"
-	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
+comment "mono needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 8ed1149..5e19297 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -78,15 +78,11 @@ config BR2_PACKAGE_MPD_FAAD2
 config BR2_PACKAGE_MPD_FFMPEG
 	bool "ffmpeg"
 	select BR2_PACKAGE_FFMPEG
-	depends on BR2_INET_IPV6
 	help
 	  Enable ffmpeg input support.
 	  Select this if you want to play back files supported by
 	  ffmpeg.
 
-comment "ffmpeg support needs a toolchain w/ IPv6"
-	depends on !BR2_INET_IPV6
-
 config BR2_PACKAGE_MPD_FLAC
 	bool "flac"
 	select BR2_PACKAGE_FLAC
diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 55cf421..3a61b8f 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -264,22 +264,10 @@ define MPLAYER_CONFIGURE_CMDS
 		--enable-cross-compile \
 		--disable-ivtv \
 		--enable-dynamic-plugins \
+		--enable-inet6 \
 	)
 endef
 
-# this is available on uClibc 0.9.31 even without ipv6 support, breaking the
-# build in ffmpeg/libavformat/udp.c
-ifneq ($(BR2_INET_IPV6),y)
-define MPLAYER_FIXUP_IPV6_MREQ_DETECTION
-	$(SED) 's/\(#define HAVE_STRUCT_IPV6_MREQ\) 1/\1 0/' $(@D)/config.h
-endef
-
-MPLAYER_POST_CONFIGURE_HOOKS += MPLAYER_FIXUP_IPV6_MREQ_DETECTION
-MPLAYER_CONF_OPTS += --disable-inet6
-else
-MPLAYER_CONF_OPTS += --enable-inet6
-endif
-
 define MPLAYER_BUILD_CMDS
 	$(MAKE) -C $(@D)
 endef
diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index bef5178..6653464 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -90,12 +90,8 @@ config BR2_PACKAGE_MTD_NFTL_FORMAT
 	bool "nftl_format"
 
 config BR2_PACKAGE_MTD_RECV_IMAGE
-	depends on BR2_INET_IPV6
 	bool "recv_image"
 
-comment "recv_image needs a toolchain w/ IPv6"
-	depends on !BR2_INET_IPV6
-
 config BR2_PACKAGE_MTD_RFDDUMP
 	bool "rfddump"
 
diff --git a/package/ndisc6/Config.in b/package/ndisc6/Config.in
index 0fad92a..321bfbc 100644
--- a/package/ndisc6/Config.in
+++ b/package/ndisc6/Config.in
@@ -1,10 +1,5 @@
-comment "ndisc6 needs a toolchain w/ IPv6"
-	depends on BR2_USE_MMU
-	depends on !BR2_INET_IPV6
-
 config BR2_PACKAGE_NDISC6
 	bool "ndisc6 tools"
-	depends on BR2_INET_IPV6
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
diff --git a/package/net-tools/net-tools.mk b/package/net-tools/net-tools.mk
index ee69648..ab0dd7c 100644
--- a/package/net-tools/net-tools.mk
+++ b/package/net-tools/net-tools.mk
@@ -28,12 +28,10 @@ define NET_TOOLS_ENABLE_I18N
 endef
 endif
 
-# Enable IPv6 when appropiate
-ifeq ($(BR2_INET_IPV6),y)
+# Enable IPv6
 define NET_TOOLS_ENABLE_IPV6
 	$(SED) 's:_AFINET6 0:_AFINET6 1:' $(@D)/config.h
 endef
-endif
 
 NET_TOOLS_POST_CONFIGURE_HOOKS += NET_TOOLS_ENABLE_I18N NET_TOOLS_ENABLE_IPV6
 
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index f747011..6eff5e3 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -17,7 +17,7 @@ NETSNMP_CONF_OPTS = \
 	--enable-mini-agent \
 	--without-rpm \
 	--with-logfile=none \
-	--without-kmem-usage $(DISABLE_IPV6) \
+	--without-kmem-usage \
 	--enable-as-needed \
 	--without-perl-modules \
 	--disable-embedded-perl \
@@ -81,15 +81,6 @@ else
 NETSNMP_CONF_OPTS += --disable-applications
 endif
 
-# Remove IPv6 MIBs if there's no IPv6
-ifneq ($(BR2_INET_IPV6),y)
-define NETSNMP_REMOVE_MIBS_IPV6
-	rm -f $(TARGET_DIR)/usr/share/snmp/mibs/IPV6*
-endef
-
-NETSNMP_POST_INSTALL_TARGET_HOOKS += NETSNMP_REMOVE_MIBS_IPV6
-endif
-
 define NETSNMP_REMOVE_BLOAT_MIBS
 	for mib in $(NETSNMP_BLOAT_MIBS); do \
 		rm -f $(TARGET_DIR)/usr/share/snmp/mibs/$$mib-MIB.txt; \
diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index e68a4dd..cc8f616 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_NETWORK_MANAGER
 	bool "networkmanager"
-	depends on BR2_INET_IPV6
 	depends on BR2_USE_WCHAR # libglib2 and gnutls
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus
@@ -51,8 +50,7 @@ config BR2_PACKAGE_NETWORK_MANAGER_PPPD
 	  This option enables support for PPPD daemon
 endif
 
-comment "NetworkManager needs udev /dev management and a toolchain w/ IPv6, wchar, threads, headers >= 3.7"
+comment "NetworkManager needs udev /dev management and a toolchain w/ wchar, threads, headers >= 3.7"
 	depends on BR2_USE_MMU
-	depends on !BR2_INET_IPV6 || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || \
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
diff --git a/package/nftables/Config.in b/package/nftables/Config.in
index 9779ae9..9b20b90 100644
--- a/package/nftables/Config.in
+++ b/package/nftables/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_NFTABLES
 	bool "nftables"
-	depends on BR2_INET_IPV6
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
 	select BR2_PACKAGE_GMP
@@ -16,6 +15,5 @@ config BR2_PACKAGE_NFTABLES
 
 	  http://www.netfilter.org/projects/nftables/index.html
 
-comment "nftables needs a toolchain w/ IPv6, wchar, headers >= 3.4"
-	depends on !BR2_INET_IPV6 || \
-		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
+comment "nftables needs a toolchain w/ wchar, headers >= 3.4"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index be9bd0a..90ebbcc 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -14,7 +14,8 @@ NGINX_CONF_OPTS = \
 	--with-cc="$(TARGET_CC)" \
 	--with-cpp="$(TARGET_CC)" \
 	--with-cc-opt="$(TARGET_CFLAGS)" \
-	--with-ld-opt="$(TARGET_LDFLAGS)"
+	--with-ld-opt="$(TARGET_LDFLAGS)" \
+	--with-ipv6
 
 # www-data user and group are used for nginx. Because these user and group
 # are already set by buildroot, it is not necessary to redefine them.
@@ -63,8 +64,7 @@ NGINX_CONF_OPTS += \
 	--http-uwsgi-temp-path=/var/tmp/nginx/uwsgi
 
 NGINX_CONF_OPTS += \
-	$(if $(BR2_PACKAGE_NGINX_FILE_AIO),--with-file-aio) \
-	$(if $(BR2_INET_IPV6),--with-ipv6)
+	$(if $(BR2_PACKAGE_NGINX_FILE_AIO),--with-file-aio)
 
 ifeq ($(BR2_PACKAGE_PCRE),y)
 NGINX_DEPENDENCIES += pcre
diff --git a/package/nmap/Config.in b/package/nmap/Config.in
index 2364dac..79f587a 100644
--- a/package/nmap/Config.in
+++ b/package/nmap/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_NMAP
 	bool "nmap"
-	depends on BR2_INET_IPV6
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -12,6 +11,6 @@ config BR2_PACKAGE_NMAP
 
 	  http://nmap.org
 
-comment "nmap needs a toolchain w/ C++, IPv6, threads"
+comment "nmap needs a toolchain w/ C++, threads"
 	depends on BR2_USE_MMU
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_TOOLCHAIN_HAS_THREADS)
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 5f1346c..d044c8e 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_NODEJS
 	bool "nodejs"
-	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
@@ -15,12 +14,11 @@ config BR2_PACKAGE_NODEJS
 
 	  http://nodejs.org/
 
-comment "nodejs needs a toolchain w/ C++, IPv6, threads"
+comment "nodejs needs a toolchain w/ C++, threads"
 	depends on BR2_USE_MMU
 	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
 	depends on !BR2_ARM_CPU_ARMV4
-	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
 if BR2_PACKAGE_NODEJS
 
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index c91cc70..554094d 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -18,10 +18,6 @@ NTP_CONF_OPTS = \
 	--with-yielding-select=yes \
 	--disable-local-libevent
 
-ifneq ($(BR2_INET_IPV6),y)
-NTP_CONF_ENV += isc_cv_have_in6addr_any=no
-endif
-
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 NTP_CONF_OPTS += --with-crypto
 NTP_DEPENDENCIES += openssl
diff --git a/package/odhcp6c/Config.in b/package/odhcp6c/Config.in
index 9e5f3ef..329b55c 100644
--- a/package/odhcp6c/Config.in
+++ b/package/odhcp6c/Config.in
@@ -1,10 +1,5 @@
-comment "odhcp6c needs a toolchain w/ IPv6"
-	depends on !BR2_INET_IPV6
-	depends on BR2_USE_MMU
-
 config BR2_PACKAGE_ODHCP6C
 	bool "odhcp6c"
-	depends on BR2_INET_IPV6
 	depends on BR2_USE_MMU # fork()
 	help
 	  odhcp6c is a minimal DHCPv6 and RA-client for use in embedded Linux
diff --git a/package/olsr/Config.in b/package/olsr/Config.in
index 707191a..70e5a48 100644
--- a/package/olsr/Config.in
+++ b/package/olsr/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_OLSR
 	bool "olsrd"
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  The Optimized Link State Routing protocol (OLSR) is a
@@ -13,6 +12,6 @@ config BR2_PACKAGE_OLSR
 
 	  http://www.olsr.org/
 
-comment "olsr needs a toolchain w/ IPv6, threads"
+comment "olsr needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index b1cab9c..e40437f 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -129,16 +129,12 @@ comment "3rd party support"
 
 config BR2_PACKAGE_OPENCV_WITH_FFMPEG
 	bool "ffmpeg support"
-	depends on BR2_INET_IPV6
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_SWSCALE
 	help
 	  Use ffmpeg from the target system.
 
-comment "ffmpeg support needs a toolchain w/ IPv6"
-	depends on !BR2_INET_IPV6
-
 config BR2_PACKAGE_OPENCV_WITH_GSTREAMER
 	bool "gstreamer support"
 	depends on BR2_USE_MMU # gstreamer -> libglib2
diff --git a/package/openntpd/Config.in b/package/openntpd/Config.in
index 192576f..1433b09 100644
--- a/package/openntpd/Config.in
+++ b/package/openntpd/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_OPENNTPD
 	bool "openntpd"
-	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU # fork ()
 	depends on !BR2_PACKAGE_NTP # conflicting binaries
@@ -12,6 +11,6 @@ config BR2_PACKAGE_OPENNTPD
 
 	  http://www.openntpd.org/
 
-comment "openntpd needs a toolchain w/ NPTL, IPv6"
+comment "openntpd needs a toolchain w/ NPTL"
 	depends on BR2_USE_MMU
-	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
diff --git a/package/openobex/Config.in b/package/openobex/Config.in
index c56692d..5f606fe 100644
--- a/package/openobex/Config.in
+++ b/package/openobex/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_OPENOBEX
 	bool "openobex"
-	depends on BR2_INET_IPV6
 	help
 	  Free open source implementation of the Object Exchange (OBEX)
 	  protocol.
@@ -41,6 +40,3 @@ config BR2_PACKAGE_OPENOBEX_DUMP
 	bool "enable protocol dumping for debugging"
 
 endif
-
-comment "openobex needs a toolchain w/ IPv6"
-	depends on !BR2_INET_IPV6
diff --git a/package/openpgm/Config.in b/package/openpgm/Config.in
index 8d03c84..cef5ed4 100644
--- a/package/openpgm/Config.in
+++ b/package/openpgm/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_OPENPGM
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_INET_IPV6
 	depends on BR2_USE_WCHAR
 	help
 	  OpenPGM is an open source implementation of the Pragmatic General
@@ -16,5 +15,5 @@ config BR2_PACKAGE_OPENPGM
 
 	  http://code.google.com/p/openpgm/
 
-comment "openpgm needs a toolchain w/ wchar, threads, IPv6"
-	depends on !(BR2_TOOLCHAIN_HAS_THREADS && BR2_INET_IPV6 && BR2_USE_WCHAR)
+comment "openpgm needs a toolchain w/ wchar, threads"
+	depends on !(BR2_TOOLCHAIN_HAS_THREADS && BR2_USE_WCHAR)
diff --git a/package/openvmtools/Config.in b/package/openvmtools/Config.in
index bcc9ad0..ebad876 100644
--- a/package/openvmtools/Config.in
+++ b/package/openvmtools/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_OPENVMTOOLS
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_USE_WCHAR # libglib2
-	depends on BR2_INET_IPV6 # libdnet
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	depends on BR2_ENABLE_LOCALE
@@ -45,8 +44,8 @@ comment "PAM support needs a toolchain w/ dynamic library"
 
 endif
 
-comment "openvmtools needs a toolchain w/ wchar, IPv6, threads, RPC, locale"
+comment "openvmtools needs a toolchain w/ wchar, threads, RPC, locale"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS || \
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		   !BR2_TOOLCHAIN_HAS_NATIVE_RPC || !BR2_ENABLE_LOCALE
diff --git a/package/openvpn/Config.in b/package/openvpn/Config.in
index 26b6b98..5edb479 100644
--- a/package/openvpn/Config.in
+++ b/package/openvpn/Config.in
@@ -1,10 +1,5 @@
-comment "openvpn needs a toolchain w/ IPv6"
-	depends on BR2_USE_MMU
-	depends on !BR2_INET_IPV6
-
 config BR2_PACKAGE_OPENVPN
 	bool "openvpn"
-	depends on BR2_INET_IPV6
 	depends on BR2_USE_MMU # fork()
 	help
 	  OpenVPN is a full-featured SSL VPN solution which can
diff --git a/package/php-zmq/Config.in b/package/php-zmq/Config.in
index 37322a2..c258272 100644
--- a/package/php-zmq/Config.in
+++ b/package/php-zmq/Config.in
@@ -1,12 +1,11 @@
-comment "php-zmq needs a toolchain w/ C++, IPv6, wchar, threads"
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 \
-		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
+comment "php-zmq needs a toolchain w/ C++, wchar, threads"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR \
+		&& BR2_TOOLCHAIN_HAS_THREADS)
 
 config BR2_PACKAGE_PHP_ZMQ
 	bool "php-zmq"
 	depends on BR2_PACKAGE_PHP
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_INET_IPV6
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_ZEROMQ
diff --git a/package/php/Config.ext b/package/php/Config.ext
index a0898b9..e529409 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -274,13 +274,9 @@ config BR2_PACKAGE_PHP_EXT_SNMP
 
 config BR2_PACKAGE_PHP_EXT_SOCKETS
 	bool "sockets"
-	depends on BR2_INET_IPV6
 	help
 	  Sockets support
 
-comment "sockets support needs a toolchain w/ IPv6"
-	depends on !BR2_INET_IPV6
-
 comment "Process Control"
 
 config BR2_PACKAGE_PHP_EXT_PCNTL
diff --git a/package/php/php.mk b/package/php/php.mk
index f305afa..e4331f2 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -61,13 +61,6 @@ else
 PHP_CONF_ENV += ac_cv_func_dlopen=no ac_cv_lib_dl_dlopen=no
 endif
 
-# Workaround for non-IPv6 uClibc toolchain
-ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-ifneq ($(BR2_INET_IPV6),y)
-PHP_CFLAGS += -DHAVE_DEPRECATED_DNS_FUNCS
-endif
-endif
-
 PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_CLI),,--disable-cli)
 PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_CGI),,--disable-cgi)
 PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_FPM),--enable-fpm,--disable-fpm)
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 006e79b..85ac0e6 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -9,17 +9,11 @@ POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
 POSTGRESQL_LICENSE_FILES = COPYRIGHT
-
 POSTGRESQL_INSTALL_STAGING = YES
 POSTGRESQL_CONFIG_SCRIPTS = pg_config
+POSTGRESQL_CONF_ENV = ac_cv_type_struct_sockaddr_in6=yes
 
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-# overwrite IPV6 detection
-ifeq ($(BR2_INET_IPV6),y)
-POSTGRESQL_CONF_ENV += ac_cv_type_struct_sockaddr_in6=yes
-else
-POSTGRESQL_CONF_ENV += ac_cv_type_struct_sockaddr_in6=no
-endif
 # PostgreSQL does not build against uClibc with locales
 # enabled, due to an uClibc bug, see
 # http://lists.uclibc.org/pipermail/uclibc/2014-April/048326.html
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 31d6e06..e143321 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -7,6 +7,7 @@
 PPPD_VERSION = 2.4.7
 PPPD_SOURCE = ppp-$(PPPD_VERSION).tar.gz
 PPPD_SITE = ftp://ftp.samba.org/pub/ppp
+PPPD_MAKE_OPTS = HAVE_INET6=y
 PPPD_LICENSE = LGPLv2+ LGPL BSD-4c BSD-3c GPLv2+
 PPPD_LICENSE_FILES = \
 	pppd/tdb.c pppd/plugins/pppoatm/COPYING \
@@ -24,10 +25,6 @@ PPPD_DEPENDENCIES += libpcap
 PPPD_MAKE_OPTS += FILTER=y
 endif
 
-ifeq ($(BR2_INET_IPV6),y)
-PPPD_MAKE_OPTS += HAVE_INET6=y
-endif
-
 # pppd bundles some but not all of the needed kernel headers. The embedded
 # if_pppol2tp.h is unfortunately not compatible with kernel headers > 2.6.34,
 # and has been part of the kernel headers since 2.6.23, so drop it
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 575c381..023b4dd 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -48,8 +48,7 @@ PROFTPD_MAKE = $(MAKE1)
 
 define PROFTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/proftpd $(TARGET_DIR)/usr/sbin/proftpd
-	$(INSTALL) -m 0644 -D $(@D)/sample-configurations/basic.conf $(TARGET_DIR)/etc/proftpd.conf; \
-	$(if $(BR2_INET_IPV6),,$(SED) 's/^UseIPv6/# UseIPv6/' $(TARGET_DIR)/etc/proftpd.conf;)
+	$(INSTALL) -m 0644 -D $(@D)/sample-configurations/basic.conf $(TARGET_DIR)/etc/proftpd.conf
 endef
 
 define PROFTPD_INSTALL_INIT_SYSV
diff --git a/package/python-pyzmq/Config.in b/package/python-pyzmq/Config.in
index c521706..af4467f 100644
--- a/package/python-pyzmq/Config.in
+++ b/package/python-pyzmq/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_PYZMQ
 	bool "python-pyzmq"
-	depends on BR2_INET_IPV6 # zeromq
 	depends on BR2_USE_WCHAR # zeromq
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
@@ -10,7 +9,7 @@ config BR2_PACKAGE_PYTHON_PYZMQ
 
 	  http://zeromq.org/bindings:python
 
-comment "python-pyzmq needs a toolchain w/ C++, IPv6, wchar, threads"
+comment "python-pyzmq needs a toolchain w/ C++, wchar, threads"
 	depends on BR2_PACKAGE_PYTHON
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && \
-		BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && \
+		BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 65421c0..fff786d 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -1,7 +1,7 @@
-comment "QEMU requires a toolchain with IPv6, wchar, threads"
+comment "QEMU requires a toolchain with wchar, threads"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU
-	depends on !(BR2_TOOLCHAIN_HAS_THREADS && BR2_USE_WCHAR && BR2_INET_IPV6)
+	depends on !(BR2_TOOLCHAIN_HAS_THREADS && BR2_USE_WCHAR)
 
 config BR2_PACKAGE_QEMU
 	bool "QEMU"
@@ -9,7 +9,6 @@ config BR2_PACKAGE_QEMU
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR # gettext
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_INET_IPV6 # for linux-user
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_ZLIB
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 76acbfc..d1615ae 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -474,13 +474,6 @@ define QT_QMAKE_SET
 	$(SED) '/include.*qws.conf/a$(1) = $(2)' $(3)/mkspecs/qws/linux-$(QT_EMB_PLATFORM)-g++/qmake.conf
 endef
 
-ifneq ($(BR2_INET_IPV6),y)
-define QT_CONFIGURE_IPV6
-	$(SED) 's/^CFG_IPV6=auto/CFG_IPV6=no/' $(@D)/configure
-	$(SED) 's/^CFG_IPV6IFNAME=auto/CFG_IPV6IFNAME=no/' $(@D)/configure
-endef
-endif
-
 ifneq ($(QT_CONFIG_FILE),)
 define QT_CONFIGURE_CONFIG_FILE
 	cp $(QT_CONFIG_FILE) $(@D)/src/corelib/global/qconfig-buildroot.h
diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 9d316b1..e8ec7d9 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -11,15 +11,14 @@ config BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	depends on !BR2_ARM_CPU_ARMV4
 	default y
 
-comment "Qt5 needs a toolchain w/ wchar, IPv6, NPTL, C++"
+comment "Qt5 needs a toolchain w/ wchar, NPTL, C++"
 	depends on !BR2_PACKAGE_QT
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
 menuconfig BR2_PACKAGE_QT5
 	bool "Qt5"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
-	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT5BASE
diff --git a/package/quagga/Config.in b/package/quagga/Config.in
index 4a9f8bb..89ff6f2 100644
--- a/package/quagga/Config.in
+++ b/package/quagga/Config.in
@@ -1,11 +1,6 @@
-comment "quagga needs a toolchain w/ IPv6"
-	depends on BR2_USE_MMU
-	depends on !BR2_INET_IPV6
-
 config BR2_PACKAGE_QUAGGA
 	bool "quagga"
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_INET_IPV6
 	help
 	  Routing software suite, providing implementations of
 	  OSPFv2, OSPFv3 (IPv6), RIP v1 and v2, RIPng (IPv6) and BGPv4+.
diff --git a/package/radvd/Config.in b/package/radvd/Config.in
index c04a8e5..48aeedc 100644
--- a/package/radvd/Config.in
+++ b/package/radvd/Config.in
@@ -1,13 +1,8 @@
 config BR2_PACKAGE_RADVD
 	bool "radvd"
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_INET_IPV6
 	select BR2_PACKAGE_FLEX
 	help
 	  IPv6 Router Advertisement Daemon.
 
 	  http://www.litech.org/radvd/
-
-comment "radvd needs a toolchain w/ IPv6"
-	depends on BR2_USE_MMU
-	depends on !BR2_INET_IPV6
diff --git a/package/redis/Config.in b/package/redis/Config.in
index 695bd91..3b7b743 100644
--- a/package/redis/Config.in
+++ b/package/redis/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_REDIS
 	bool "redis"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_INET_IPV6
 	help
 	  Redis is an open source, advanced key-value store. It is
 	  often referred to as a data structure server since keys can
@@ -10,6 +9,6 @@ config BR2_PACKAGE_REDIS
 
 	  http://www.redis.io
 
-comment "redis needs a toolchain w/ IPv6, threads"
+comment "redis needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index f4f07ac..68da9d9 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -29,7 +29,7 @@ SAMBA_CONF_ENV = \
 	libreplace_cv_HAVE_SECURE_MKSTEMP=yes \
 	samba_cv_CC_NEGATIVE_ENUM_VALUES=yes \
 	samba_cv_fpie=no \
-	libreplace_cv_HAVE_IPV6=$(if $(BR2_INET_IPV6),yes,no) \
+	libreplace_cv_HAVE_IPV6=yes \
 	$(if $(BR2_PACKAGE_SAMBA_AVAHI),AVAHI_LIBS=-pthread)
 
 SAMBA_CONF_OPTS = \
diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index d619ad1..3ff891b 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -13,7 +13,7 @@ SCONESERVER_LICENSE_FILES = COPYING
 
 SCONESERVER_AUTORECONF = YES
 SCONESERVER_DEPENDENCIES += pcre
-SCONESERVER_CONF_OPTS += --with-ip --with-local
+SCONESERVER_CONF_OPTS += --with-ip --with-local --with-ip6
 
 # Sconeserver configure script fails to find the libxml2 headers.
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
@@ -21,12 +21,6 @@ SCONESERVER_CONF_OPTS += \
 	--with-xml2-config="$(STAGING_DIR)/usr/bin/xml2-config"
 endif
 
-ifeq ($(BR2_INET_IPV6),y)
-SCONESERVER_CONF_OPTS += --with-ip6
-else
-SCONESERVER_CONF_OPTS += --without-ip6
-endif
-
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 SCONESERVER_DEPENDENCIES += openssl
 SCONESERVER_CONF_OPTS += --with-ssl
diff --git a/package/ser2net/Config.in b/package/ser2net/Config.in
index 552ab0f..3f0d15b 100644
--- a/package/ser2net/Config.in
+++ b/package/ser2net/Config.in
@@ -1,13 +1,8 @@
 config BR2_PACKAGE_SER2NET
 	bool "ser2net"
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_INET_IPV6
 	help
 	  Ser2net provides a way for a user to connect from a network
 	  connection to a serial port..
 
 	  http://ser2net.sourceforge.net
-
-comment "ser2net needs a toolchain w/ IPv6"
-	depends on BR2_USE_MMU
-	depends on !BR2_INET_IPV6
diff --git a/package/smcroute/Config.in b/package/smcroute/Config.in
index c244cb9..f9a81f6 100755
--- a/package/smcroute/Config.in
+++ b/package/smcroute/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_SMCROUTE
 	bool "smcroute"
-	depends on BR2_INET_IPV6
 	depends on BR2_USE_MMU # fork()
 	help
 	  SMCRoute is a command line tool to manipulate the multicast
@@ -11,7 +10,3 @@ config BR2_PACKAGE_SMCROUTE
 	  MLD signaling exists.
 
 	  https://github.com/troglobit/smcroute
-
-comment "smcroute needs a toolchain w/ IPv6"
-	depends on !BR2_INET_IPV6
-	depends on BR2_USE_MMU
diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
index 8bb40f1..5ece448 100644
--- a/package/sofia-sip/sofia-sip.mk
+++ b/package/sofia-sip/sofia-sip.mk
@@ -10,13 +10,8 @@ SOFIA_SIP_INSTALL_STAGING = YES
 SOFIA_SIP_DEPENDENCIES = host-pkgconf
 SOFIA_SIP_LICENSE = LGPLv2.1+
 SOFIA_SIP_LICENSE_FILES = COPYING COPYRIGHTS
-
 SOFIA_SIP_CONF_OPTS = --with-doxygen=no
 
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT_INET_IPV6),)
-SOFIA_SIP_CONF_OPTS = --disable-ip6
-endif
-
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
 SOFIA_SIP_CONF_OPTS += --with-glib
 SOFIA_SIP_DEPENDENCIES += libglib2
diff --git a/package/spawn-fcgi/spawn-fcgi.mk b/package/spawn-fcgi/spawn-fcgi.mk
index aac2f9e..13357bb 100644
--- a/package/spawn-fcgi/spawn-fcgi.mk
+++ b/package/spawn-fcgi/spawn-fcgi.mk
@@ -10,8 +10,4 @@ SPAWN_FCGI_SOURCE = spawn-fcgi-$(SPAWN_FCGI_VERSION).tar.bz2
 SPAWN_FCGI_LICENSE = BSD-3c
 SPAWN_FCGI_LICENSE_FILES = COPYING
 
-ifneq ($(BR2_INET_IPV6),y)
-SPAWN_FCGI_CONF_OPTS = --disable-ipv6
-endif
-
 $(eval $(autotools-package))
diff --git a/package/squid/Config.in b/package/squid/Config.in
index a9300d8..0ab6b37 100644
--- a/package/squid/Config.in
+++ b/package/squid/Config.in
@@ -1,12 +1,10 @@
-comment "squid needs a toolchain w/ C++, IPv6, headers >= 3.0"
+comment "squid needs a toolchain w/ C++, headers >= 3.0"
 	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_INET_IPV6 \
-		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 
 config BR2_PACKAGE_SQUID
 	bool "squid"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_INET_IPV6
 	# needs fork()
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # libcap
diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index bdbbb50..dbf07c5 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -24,9 +24,6 @@ menuconfig BR2_PACKAGE_STRONGSWAN
 
 if BR2_PACKAGE_STRONGSWAN
 
-comment "kernel-netlink and socket-default options need a toolchain w/ IPv6"
-	depends on !BR2_INET_IPV6
-
 choice
 	prompt "Cryptographic backend"
 	default BR2_PACKAGE_STRONGSWAN_GMP
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 057870f..af21dda 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -14,8 +14,8 @@ STRONGSWAN_CONF_OPTS += \
 	--without-lib-prefix \
 	--enable-led \
 	--enable-pkcs11=yes \
-	--enable-kernel-netlink=$(if $(BR2_INET_IPV6),yes,no) \
-	--enable-socket-default=$(if $(BR2_INET_IPV6),yes,no) \
+	--enable-kernel-netlink=yes \
+	--enable-socket-default=yes \
 	--enable-openssl=$(if $(BR2_PACKAGE_STRONGSWAN_OPENSSL),yes,no) \
 	--enable-gcrypt=$(if $(BR2_PACKAGE_STRONGSWAN_GCRYPT),yes,no) \
 	--enable-gmp=$(if $(BR2_PACKAGE_STRONGSWAN_GMP),yes,no) \
diff --git a/package/tcl/Config.in b/package/tcl/Config.in
index 11d46d3..63d1b25 100644
--- a/package/tcl/Config.in
+++ b/package/tcl/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_TCL
 	bool "tcl"
 	# fork()
 	depends on BR2_USE_MMU
-	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# See this mailing list thread:
 	# http://lists.busybox.net/pipermail/buildroot/2015-March/121198.html
@@ -12,10 +11,9 @@ config BR2_PACKAGE_TCL
 
 	  http://www.tcl.tk
 
-comment "tcl needs a toolchain w/ ipv6, threads, dynamic library"
+comment "tcl needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 if BR2_PACKAGE_TCL
 
diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
index 778d45f..78df835 100644
--- a/package/tftpd/tftpd.mk
+++ b/package/tftpd/tftpd.mk
@@ -9,10 +9,6 @@ TFTPD_SOURCE = tftp-hpa-$(TFTPD_VERSION).tar.xz
 TFTPD_SITE = $(BR2_KERNEL_MIRROR)/software/network/tftp/tftp-hpa
 TFTPD_CONF_OPTS = --without-tcpwrappers
 
-ifneq ($(BR2_INET_IPV6),y)
-TFTPD_CONF_OPTS += --without-ipv6
-endif
-
 # Override BusyBox implementations if BusyBox is enabled.
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 TFTPD_DEPENDENCIES += busybox
diff --git a/package/tovid/Config.in b/package/tovid/Config.in
index 11c8085..ccf031e 100644
--- a/package/tovid/Config.in
+++ b/package/tovid/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_TOVID
 	bool "tovid"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_INET_IPV6 # ffmpeg
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
@@ -28,11 +27,11 @@ config BR2_PACKAGE_TOVID
 
 	  http://tovid.wikia.com/wiki/Installing_tovid
 
-comment "tovid needs a toolchain w/ threads, IPv6, C++, wchar"
+comment "tovid needs a toolchain w/ threads, C++, wchar"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_INET_IPV6 || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_USE_WCHAR
 
 comment "tovid depends on python or python3"
diff --git a/package/transmission/Config.in b/package/transmission/Config.in
index 5d37309..b47c36f 100644
--- a/package/transmission/Config.in
+++ b/package/transmission/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_TRANSMISSION
 	bool "transmission"
-	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_ZLIB
@@ -48,6 +47,6 @@ comment "transmission-gtk needs a toolchain w/ locale"
 	depends on BR2_PACKAGE_LIBGTK2 && !BR2_ENABLE_LOCALE
 endif
 
-comment "transmission needs a toolchain w/ IPv6, threads"
+comment "transmission needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/trinity/trinity.mk b/package/trinity/trinity.mk
index ecd82f8..211f1b6 100644
--- a/package/trinity/trinity.mk
+++ b/package/trinity/trinity.mk
@@ -9,10 +9,6 @@ TRINITY_SITE = $(call github,kernelslacker,trinity,$(TRINITY_VERSION))
 TRINITY_LICENSE = GPLv2
 TRINITY_LICENSE_FILES = COPYING
 
-ifeq ($(BR2_INET_IPV6),)
-TARGET_CONFIGURE_OPTS += IPV6=no
-endif
-
 define TRINITY_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure.sh)
 endef
diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index 27138ec..4edf014 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -1,9 +1,8 @@
-comment "tvheadend needs a toolchain w/ IPv6, NPTL, headers >= 3.2"
-	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+comment "tvheadend needs a toolchain w/ NPTL, headers >= 3.2"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 
 config BR2_PACKAGE_TVHEADEND
 	bool "tvheadend"
-	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 	select BR2_PACKAGE_DTV_SCAN_TABLES
diff --git a/package/ulogd/Config.in b/package/ulogd/Config.in
index 7092409..bcd7d0d 100644
--- a/package/ulogd/Config.in
+++ b/package/ulogd/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_ULOGD
 	bool "ulogd"
-	depends on BR2_INET_IPV6
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
 	# ulog support removed for kernels >= 3.17
@@ -15,7 +14,7 @@ config BR2_PACKAGE_ULOGD
 
 	  http://www.netfilter.org/projects/ulogd/
 
-comment "ulogd needs a toolchain w/ IPv6, dynamic library"
-	depends on !BR2_INET_IPV6 || BR2_STATIC_LIBS
+comment "ulogd needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
diff --git a/package/ussp-push/Config.in b/package/ussp-push/Config.in
index c3f6b86..e6695bb 100644
--- a/package/ussp-push/Config.in
+++ b/package/ussp-push/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_USSP_PUSH
 	bool "ussp-push"
-	depends on BR2_INET_IPV6
 	depends on !BR2_STATIC_LIBS # bluez_utils
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib, libglib2
@@ -14,6 +13,6 @@ config BR2_PACKAGE_USSP_PUSH
 
 	  http://www.xmailserver.org/ussp-push.html
 
-comment "ussp-push needs a toolchain w/ wchar, IPv6, threads, dynamic library"
+comment "ussp-push needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6 || BR2_STATIC_LIBS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/x11vnc/x11vnc.mk b/package/x11vnc/x11vnc.mk
index 57d6f8d..cdb3237 100644
--- a/package/x11vnc/x11vnc.mk
+++ b/package/x11vnc/x11vnc.mk
@@ -13,12 +13,6 @@ X11VNC_DEPENDENCIES = xlib_libXt xlib_libXext xlib_libXtst
 X11VNC_LICENSE = GPLv2+
 X11VNC_LICENSE_FILES = COPYING
 
-ifneq ($(BR2_INET_IPV6),y)
-# configure option only used for libvncserver
-X11VNC_CONF_OPTS += --without-ipv6
-X11VNC_CONF_ENV += CFLAGS='$(TARGET_CFLAGS) -DX11VNC_IPV6=0'
-endif
-
 ifeq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yy)
 X11VNC_DEPENDENCIES += avahi dbus
 else
diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
index d44af60..00fc048 100644
--- a/package/zeromq/Config.in
+++ b/package/zeromq/Config.in
@@ -1,11 +1,10 @@
-comment "zeromq needs a toolchain w/ C++, IPv6, wchar, threads"
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && \
-		BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
+comment "zeromq needs a toolchain w/ C++, wchar, threads"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && \
+		BR2_TOOLCHAIN_HAS_THREADS)
 
 config BR2_PACKAGE_ZEROMQ
 	bool "zeromq"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_INET_IPV6
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_UTIL_LINUX
diff --git a/package/zmqpp/Config.in b/package/zmqpp/Config.in
index d92a37a..f3d10c9 100644
--- a/package/zmqpp/Config.in
+++ b/package/zmqpp/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_ZMQPP
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 # c++0x support
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009 # c++0x support
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_INET_IPV6 # zeromq
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 	select BR2_PACKAGE_ZEROMQ
@@ -18,9 +17,9 @@ config BR2_PACKAGE_ZMQPP
 
 	  http://github.com/benjamg/zmqpp
 
-comment "zmqpp needs a toolchain w/ C++, IPv6, wchar, threads"
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && \
-		BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
+comment "zmqpp needs a toolchain w/ C++, wchar, threads"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && \
+		BR2_TOOLCHAIN_HAS_THREADS)
 
 if BR2_PACKAGE_ZMQPP
 
diff --git a/package/zyre/Config.in b/package/zyre/Config.in
index 14075f0..95cbf95 100644
--- a/package/zyre/Config.in
+++ b/package/zyre/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_ZYRE
 	bool "zyre"
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
-	depends on BR2_INET_IPV6 # zeromq
 	depends on BR2_USE_WCHAR # zeromq
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 	depends on BR2_USE_MMU # czmq
@@ -16,8 +15,8 @@ config BR2_PACKAGE_ZYRE
 
 	  http://zyre.org
 
-comment "zyre needs a toolchain w/ C++, IPv6, wchar, threads"
+comment "zyre needs a toolchain w/ C++, wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && \
-		BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && \
+		BR2_TOOLCHAIN_HAS_THREADS)
-- 
2.0.5
