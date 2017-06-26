From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 26 Jun 2017 12:25:37 -0400
Subject: [Buildroot] [PATCH v3 2/3] package configs: add select
	BR2_PACKAGE_LIBSSL
In-Reply-To: <20170626162538.27101-1-aduskett@codeblue.com>
References: <20170626162538.27101-1-aduskett@codeblue.com>
Message-ID: <20170626162538.27101-2-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Many packages select BR2_PACKAGE_OPENSSL.  This will build openssl
without a problem; however, in menuconfig, this doesn't select
libssl, which may confuse users.

This patch adds select BR2_PACKAGE_LIBSSL to any package that
selects select BR2_PACKAGE_OPENSSL.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/aircrack-ng/Config.in                 | 1 +
 package/alljoyn-base/Config.in                | 1 +
 package/alljoyn/Config.in                     | 1 +
 package/android-tools/Config.in               | 2 ++
 package/clamav/Config.in                      | 1 +
 package/collectd/Config.in                    | 1 +
 package/curlftpfs/Config.in                   | 1 +
 package/domoticz/Config.in                    | 1 +
 package/dovecot/Config.in                     | 1 +
 package/ejabberd/Config.in                    | 1 +
 package/erlang-p1-tls/Config.in               | 1 +
 package/fetchmail/Config.in                   | 1 +
 package/filemq/Config.in                      | 1 +
 package/flickcurl/Config.in                   | 1 +
 package/freerdp/Config.in                     | 1 +
 package/freeswitch/Config.in                  | 1 +
 package/git-crypt/Config.in                   | 1 +
 package/gstreamer/gst-plugins-bad/Config.in   | 1 +
 package/gstreamer1/gst1-plugins-bad/Config.in | 2 ++
 package/ipmitool/Config.in                    | 1 +
 package/ipsec-tools/Config.in                 | 1 +
 package/irssi/Config.in                       | 1 +
 package/janus-gateway/Config.in               | 1 +
 package/keepalived/Config.in                  | 1 +
 package/kodi/Config.in                        | 1 +
 package/lftp/Config.in                        | 1 +
 package/libfreefare/Config.in                 | 1 +
 package/libldns/Config.in                     | 1 +
 package/liboauth/Config.in                    | 1 +
 package/libssh/Config.in                      | 1 +
 package/libssh2/Config.in                     | 1 +
 package/libstrophe/Config.in                  | 1 +
 package/lighttpd/Config.in                    | 1 +
 package/luacrypto/Config.in                   | 1 +
 package/luaossl/Config.in                     | 1 +
 package/luasec/Config.in                      | 1 +
 package/mysql/Config.in                       | 1 +
 package/neon/Config.in                        | 1 +
 package/netatalk/Config.in                    | 1 +
 package/nginx-upload/Config.in                | 1 +
 package/nginx/Config.in                       | 2 ++
 package/nodejs/Config.in                      | 1 +
 package/ntp/Config.in                         | 1 +
 package/openssh/Config.in                     | 1 +
 package/openvpn/Config.in                     | 1 +
 package/perl-crypt-openssl-random/Config.in   | 1 +
 package/perl-net-ssleay/Config.in             | 1 +
 package/poco/Config.in                        | 2 ++
 package/pound/Config.in                       | 1 +
 package/python-cryptography/Config.in         | 1 +
 package/python/Config.in                      | 1 +
 package/python3/Config.in                     | 1 +
 package/qt-webkit-kiosk/Config.in             | 1 +
 package/qt/Config.in                          | 1 +
 package/qt5/qt5enginio/Config.in              | 1 +
 package/rabbitmq-server/Config.in             | 1 +
 package/rdesktop/Config.in                    | 1 +
 package/rtorrent/Config.in                    | 1 +
 package/scrypt/Config.in                      | 1 +
 package/shairport-sync/Config.in              | 1 +
 package/shellinabox/Config.in                 | 1 +
 package/snmppp/Config.in                      | 1 +
 package/softether/Config.in                   | 1 +
 package/spice/Config.in                       | 1 +
 package/sqlcipher/Config.in                   | 1 +
 package/strongswan/Config.in                  | 1 +
 package/stunnel/Config.in                     | 1 +
 package/synergy/Config.in                     | 1 +
 package/syslog-ng/Config.in                   | 1 +
 package/thrift/Config.in                      | 1 +
 package/tinc/Config.in                        | 1 +
 package/tor/Config.in                         | 1 +
 package/tpm-tools/Config.in                   | 1 +
 package/transmission/Config.in                | 1 +
 package/trousers/Config.in                    | 1 +
 package/tvheadend/Config.in                   | 1 +
 package/uboot-tools/Config.in                 | 1 +
 package/ustream-ssl/Config.in                 | 1 +
 package/vtun/Config.in                        | 1 +
 package/xen/Config.in                         | 1 +
 package/xl2tp/Config.in                       | 1 +
 81 files changed, 85 insertions(+)

diff --git a/package/aircrack-ng/Config.in b/package/aircrack-ng/Config.in
index 2164ad4..0f8b8bf 100644
--- a/package/aircrack-ng/Config.in
+++ b/package/aircrack-ng/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_AIRCRACK_NG
 	# libnl has issues when linking statically
 	# they need fixing in libnl itself
 	select BR2_PACKAGE_LIBNL if !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
diff --git a/package/alljoyn-base/Config.in b/package/alljoyn-base/Config.in
index 8556d66..b6fcad8 100644
--- a/package/alljoyn-base/Config.in
+++ b/package/alljoyn-base/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_ALLJOYN_BASE
 	depends on BR2_USE_WCHAR # alljoyn
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # alljoyn
 	select BR2_PACKAGE_ALLJOYN
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ALLJOYN_BASE_CONTROLPANEL if \
 		!BR2_PACKAGE_ALLJOYN_BASE_NOTIFICATION && \
diff --git a/package/alljoyn/Config.in b/package/alljoyn/Config.in
index 6eb417d..c33515a 100644
--- a/package/alljoyn/Config.in
+++ b/package/alljoyn/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_ALLJOYN
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBCAP
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  The AllJoyn framework defines a common way for devices and
diff --git a/package/android-tools/Config.in b/package/android-tools/Config.in
index 96e36e6..0addf3b 100644
--- a/package/android-tools/Config.in
+++ b/package/android-tools/Config.in
@@ -58,6 +58,7 @@ comment "fastboot needs headers >= 3.10 (PowerPC64), headers >= 3.16 (MIPS64)"
 config BR2_PACKAGE_ANDROID_TOOLS_ADB
 	bool "adb"
 	depends on BR2_USE_MMU # uses fork()
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
@@ -68,6 +69,7 @@ config BR2_PACKAGE_ANDROID_TOOLS_ADB
 config BR2_PACKAGE_ANDROID_TOOLS_ADBD
 	bool "adbd"
 	depends on BR2_USE_MMU # uses fork()
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
diff --git a/package/clamav/Config.in b/package/clamav/Config.in
index a962103..ddc7c96 100644
--- a/package/clamav/Config.in
+++ b/package/clamav/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_CLAMAV
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBTOOL
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index ccd3fbe..ecbc7d2 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -67,6 +67,7 @@ config BR2_PACKAGE_COLLECTD_NOTIFY_EMAIL
 	bool "notify_email"
 	depends on !BR2_STATIC_LIBS # libesmtp
 	select BR2_PACKAGE_LIBESMTP
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Send an E-mail with the notification message to the
diff --git a/package/curlftpfs/Config.in b/package/curlftpfs/Config.in
index 986faf1..2e75196 100644
--- a/package/curlftpfs/Config.in
+++ b/package/curlftpfs/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_CURLFTPFS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBCURL
 	help
diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
index c03f84a..d4913d6 100644
--- a/package/domoticz/Config.in
+++ b/package/domoticz/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_DOMOTICZ
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
 	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_MOSQUITTO
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_SQLITE
diff --git a/package/dovecot/Config.in b/package/dovecot/Config.in
index 377fd4d..8cd74e5 100644
--- a/package/dovecot/Config.in
+++ b/package/dovecot/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_DOVECOT
 	bool "dovecot"
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
diff --git a/package/ejabberd/Config.in b/package/ejabberd/Config.in
index a7542cd..0fc814f 100644
--- a/package/ejabberd/Config.in
+++ b/package/ejabberd/Config.in
@@ -17,6 +17,7 @@ config BR2_PACKAGE_EJABBERD
 	select BR2_PACKAGE_ERLANG_P1_YAML
 	select BR2_PACKAGE_ERLANG_P1_ZLIB
 	select BR2_PACKAGE_GETENT
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Ejabberd is a Jabber/XMPP instant messaging server, written
diff --git a/package/erlang-p1-tls/Config.in b/package/erlang-p1-tls/Config.in
index a684fbb..d949cd3 100644
--- a/package/erlang-p1-tls/Config.in
+++ b/package/erlang-p1-tls/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_ERLANG_P1_TLS
 	bool "erlang-p1-tls"
 	select BR2_PACKAGE_ERLANG_P1_UTILS
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Erlang interface to OpenSSL
diff --git a/package/fetchmail/Config.in b/package/fetchmail/Config.in
index 62f4f84..98e3015 100644
--- a/package/fetchmail/Config.in
+++ b/package/fetchmail/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_FETCHMAIL
 	bool "fetchmail"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_CA_CERTIFICATES
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Fetchmail - the mail-retrieval daemon
diff --git a/package/filemq/Config.in b/package/filemq/Config.in
index b4720c1..61114a1 100644
--- a/package/filemq/Config.in
+++ b/package/filemq/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_FILEMQ
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 	depends on BR2_USE_MMU # czmq
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_CZMQ
 	select BR2_PACKAGE_ZEROMQ
diff --git a/package/flickcurl/Config.in b/package/flickcurl/Config.in
index 426ceec..61d5fd1 100644
--- a/package/flickcurl/Config.in
+++ b/package/flickcurl/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_FLICKCURL
 	bool "flickcurl"
 	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBSSL if !(BR2_PACKAGE_GNUTLS || BR2_PACKAGE_LIBNSS)
 	select BR2_PACKAGE_LIBXML2
 	# Ensure that libcurl is built with crypto support, since
 	# flickcurl must access https:// URLs.
diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
index 9dd2505..aa2f904 100644
--- a/package/freerdp/Config.in
+++ b/package/freerdp/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_FREERDP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LIBGLIB2
diff --git a/package/freeswitch/Config.in b/package/freeswitch/Config.in
index 1f64593..55419b7 100644
--- a/package/freeswitch/Config.in
+++ b/package/freeswitch/Config.in
@@ -14,6 +14,7 @@ config BR2_PACKAGE_FREESWITCH
 	select BR2_PACKAGE_OPENCV_LIB_HIGHGUI if BR2_PACKAGE_OPENCV
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC if BR2_PACKAGE_OPENCV
 	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT if BR2_PACKAGE_OPENCV
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_SPEEX
diff --git a/package/git-crypt/Config.in b/package/git-crypt/Config.in
index 362fe9a..720fcb5 100644
--- a/package/git-crypt/Config.in
+++ b/package/git-crypt/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_GIT_CRYPT
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # git
 	select BR2_PACKAGE_GIT # runtime
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  git-crypt enables transparent encryption and decryption of
diff --git a/package/gstreamer/gst-plugins-bad/Config.in b/package/gstreamer/gst-plugins-bad/Config.in
index 939fc7a..66a347f 100644
--- a/package/gstreamer/gst-plugins-bad/Config.in
+++ b/package/gstreamer/gst-plugins-bad/Config.in
@@ -244,6 +244,7 @@ comment "plugins with external dependencies (there may be more available)"
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_APEXSINK
 	bool "apexsink"
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_BZ2
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 17cc22b..eba8293 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -222,6 +222,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DEBUGUTILS
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DTLS
 	bool "dtls"
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  DTLS plugin
@@ -464,6 +465,7 @@ comment "plugins with external dependencies"
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_APEXSINK
 	bool "apexsink"
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ASSRENDER
diff --git a/package/ipmitool/Config.in b/package/ipmitool/Config.in
index 1da0ace..8d30409 100644
--- a/package/ipmitool/Config.in
+++ b/package/ipmitool/Config.in
@@ -10,6 +10,7 @@ if BR2_PACKAGE_IPMITOOL
 
 config BR2_PACKAGE_IPMITOOL_LANPLUS
 	bool "enable lanplus interface"
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Enables the IPMI v2.0 RMCP+ LAN interface typically used to send IPMI
diff --git a/package/ipsec-tools/Config.in b/package/ipsec-tools/Config.in
index 1635675..1a97a43 100644
--- a/package/ipsec-tools/Config.in
+++ b/package/ipsec-tools/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_IPSEC_TOOLS
 	bool "ipsec-tools"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_TOOLCHAIN_USES_MUSL # Use __P() macro all over the tree
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_FLEX
 	help
diff --git a/package/irssi/Config.in b/package/irssi/Config.in
index 6361cff..6004021 100644
--- a/package/irssi/Config.in
+++ b/package/irssi/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_IRSSI
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Irssi is a terminal based IRC client for UNIX systems.
diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 5bd4e95..94ecbec 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -8,6 +8,7 @@ menuconfig BR2_PACKAGE_JANUS_GATEWAY
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBNICE
 	select BR2_PACKAGE_LIBSRTP
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Janus is an open source, general purpose, WebRTC gateway
diff --git a/package/keepalived/Config.in b/package/keepalived/Config.in
index 0140e62..81d2cd5 100644
--- a/package/keepalived/Config.in
+++ b/package/keepalived/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_KEEPALIVED
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS # uses libdl
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_POPT
 	help
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 6586701..cb1b4aa 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -63,6 +63,7 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_LIBGLU if BR2_PACKAGE_KODI_GL_EGL
 	select BR2_PACKAGE_LIBPLIST
 	select BR2_PACKAGE_LIBSAMPLERATE
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/lftp/Config.in b/package/lftp/Config.in
index fb4ac13..884192d 100644
--- a/package/lftp/Config.in
+++ b/package/lftp/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_LFTP
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LIBSSL if !BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_GNUTLS
 	help
 	  LFTP is a sophisticated ftp/http client, and a file transfer program
diff --git a/package/libfreefare/Config.in b/package/libfreefare/Config.in
index 2bb0c93..b43789f 100644
--- a/package/libfreefare/Config.in
+++ b/package/libfreefare/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBFREEFARE
 	bool "libfreefare"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBNFC
 	help
diff --git a/package/libldns/Config.in b/package/libldns/Config.in
index 696fec9..f850102 100644
--- a/package/libldns/Config.in
+++ b/package/libldns/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBLDNS
 	bool "libldns"
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  The goal of ldns is to simplify DNS programming, it supports
diff --git a/package/liboauth/Config.in b/package/liboauth/Config.in
index 77a78f1..ad1c7b8 100644
--- a/package/liboauth/Config.in
+++ b/package/liboauth/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBOAUTH
 	bool "liboauth"
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  liboauth is a collection of c functions implementing the oAuth
diff --git a/package/libssh/Config.in b/package/libssh/Config.in
index 3dbfa7d..5009bab 100644
--- a/package/libssh/Config.in
+++ b/package/libssh/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LIBSSH
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# Either OpenSSL or libgcrypt are mandatory
+	select BR2_PACKAGE_LIBSSL if !BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBGCRYPT
 	help
 	  libssh is a multiplatform C library implementing the SSHv2
diff --git a/package/libssh2/Config.in b/package/libssh2/Config.in
index 2944624..b9d3e77 100644
--- a/package/libssh2/Config.in
+++ b/package/libssh2/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBSSH2
 	bool "libssh2"
+	select BR2_PACKAGE_LIBSSL if !BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBGCRYPT
 	help
 	  libssh2 is a client-side C library implementing the SSH2
diff --git a/package/libstrophe/Config.in b/package/libstrophe/Config.in
index 5fdb918..6e38ffe 100644
--- a/package/libstrophe/Config.in
+++ b/package/libstrophe/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBSTROPHE
 	bool "libstrophe"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBXML2 if !BR2_PACKAGE_EXPAT
 	help
diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index f62ccb9..6c28060 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -21,6 +21,7 @@ if BR2_PACKAGE_LIGHTTPD
 
 config BR2_PACKAGE_LIGHTTPD_OPENSSL
 	bool "openssl support"
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Enable OpenSSL support for lighttpd.
diff --git a/package/luacrypto/Config.in b/package/luacrypto/Config.in
index 8d13eec..73d98eb 100644
--- a/package/luacrypto/Config.in
+++ b/package/luacrypto/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LUACRYPTO
 	bool "luacrypto"
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  LuaCrypto provides a Lua frontend to the OpenSSL cryptographic
diff --git a/package/luaossl/Config.in b/package/luaossl/Config.in
index d8763e7..236f3af 100644
--- a/package/luaossl/Config.in
+++ b/package/luaossl/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LUAOSSL
 	bool "luaossl"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  luaossl is a comprehensive binding to OpenSSL for Lua 5.1,
diff --git a/package/luasec/Config.in b/package/luasec/Config.in
index 9391cd9..7ffc886 100644
--- a/package/luasec/Config.in
+++ b/package/luasec/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LUASEC
 	bool "luasec"
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LUASOCKET
 	help
diff --git a/package/mysql/Config.in b/package/mysql/Config.in
index 69ad586..b3093ff 100644
--- a/package/mysql/Config.in
+++ b/package/mysql/Config.in
@@ -18,6 +18,7 @@ config BR2_PACKAGE_MARIADB
 	bool "mariadb"
 	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 	select BR2_PACKAGE_LIBAIO
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/neon/Config.in b/package/neon/Config.in
index 9831343..2f21ffb 100644
--- a/package/neon/Config.in
+++ b/package/neon/Config.in
@@ -15,6 +15,7 @@ config BR2_PACKAGE_NEON_ZLIB
 
 config BR2_PACKAGE_NEON_SSL
 	bool "SSL support"
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  build with SSL support
diff --git a/package/netatalk/Config.in b/package/netatalk/Config.in
index ce17318..db1fd7f 100644
--- a/package/netatalk/Config.in
+++ b/package/netatalk/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_NETATALK
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_BERKELEYDB
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBEVENT
 	select BR2_PACKAGE_LIBGCRYPT
diff --git a/package/nginx-upload/Config.in b/package/nginx-upload/Config.in
index 6bc1c3d..0be58d4 100644
--- a/package/nginx-upload/Config.in
+++ b/package/nginx-upload/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NGINX_UPLOAD
 	bool "nginx-upload"
 	depends on BR2_PACKAGE_NGINX_HTTP
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  A module for nginx web server for handling file uploads
diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index 36fa69c..32451d0 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -34,12 +34,14 @@ if BR2_PACKAGE_NGINX_HTTP
 
 config BR2_PACKAGE_NGINX_HTTP_CACHE
 	bool "http cache support"
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 
 comment "http modules"
 
 config BR2_PACKAGE_NGINX_HTTP_SSL_MODULE
 	bool "ngx_http_ssl_module"
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Enable ngx_http_ssl_module
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 3022f9c..44a91ef 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -34,6 +34,7 @@ if BR2_PACKAGE_NODEJS
 
 config BR2_PACKAGE_NODEJS_NPM
 	bool "NPM for the target"
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  NPM is the package manager for the Node JavaScript platform.
diff --git a/package/ntp/Config.in b/package/ntp/Config.in
index 1af02db..385a60c 100644
--- a/package/ntp/Config.in
+++ b/package/ntp/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NTP
 	bool "ntp"
 	select BR2_PACKAGE_LIBEVENT
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Network Time Protocol suite/programs.
diff --git a/package/openssh/Config.in b/package/openssh/Config.in
index 7591140..9106ceb 100644
--- a/package/openssh/Config.in
+++ b/package/openssh/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_OPENSSH
 	bool "openssh"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
diff --git a/package/openvpn/Config.in b/package/openvpn/Config.in
index 0a16755..1d6c6c2 100644
--- a/package/openvpn/Config.in
+++ b/package/openvpn/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_OPENVPN
 	bool "openvpn"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  OpenVPN is a full-featured SSL VPN solution which can
diff --git a/package/perl-crypt-openssl-random/Config.in b/package/perl-crypt-openssl-random/Config.in
index 2ceb78d..07c2d5f 100644
--- a/package/perl-crypt-openssl-random/Config.in
+++ b/package/perl-crypt-openssl-random/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PERL_CRYPT_OPENSSL_RANDOM
 	bool "perl-crypt-openssl-random"
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  OpenSSL/LibreSSL pseudo-random number generator access
diff --git a/package/perl-net-ssleay/Config.in b/package/perl-net-ssleay/Config.in
index 80178e0..4ce4c57 100644
--- a/package/perl-net-ssleay/Config.in
+++ b/package/perl-net-ssleay/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PERL_NET_SSLEAY
 	bool "perl-net-ssleay"
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Perl extension for using OpenSSL
diff --git a/package/poco/Config.in b/package/poco/Config.in
index b3b247f..cbcf9c7 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -30,10 +30,12 @@ config BR2_PACKAGE_POCO_NET
 
 config BR2_PACKAGE_POCO_CRYPTO
 	bool "crypto"
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 
 config BR2_PACKAGE_POCO_NETSSL_OPENSSL
 	bool "netssl_openssl"
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_POCO_NET
 	select BR2_PACKAGE_POCO_CRYPTO
 	select BR2_PACKAGE_POCO_UTIL
diff --git a/package/pound/Config.in b/package/pound/Config.in
index 91c29ea..ca8f617 100644
--- a/package/pound/Config.in
+++ b/package/pound/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_POUND
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  The Pound program is a reverse proxy, load balancer and HTTPS
diff --git a/package/python-cryptography/Config.in b/package/python-cryptography/Config.in
index 9827cf8..44be117 100644
--- a/package/python-cryptography/Config.in
+++ b/package/python-cryptography/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
 	bool "python-cryptography"
 	depends on BR2_INSTALL_LIBSTDCPP # python-pyasn
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	select BR2_PACKAGE_PYTHON_IDNA # runtime
diff --git a/package/python/Config.in b/package/python/Config.in
index 054ccd2..8ef1664 100644
--- a/package/python/Config.in
+++ b/package/python/Config.in
@@ -123,6 +123,7 @@ config BR2_PACKAGE_PYTHON_ZLIB
 
 config BR2_PACKAGE_PYTHON_HASHLIB
 	bool "hashlib module"
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  hashlib support in Python
diff --git a/package/python3/Config.in b/package/python3/Config.in
index 35f57e6..e0231a1 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -76,6 +76,7 @@ config BR2_PACKAGE_PYTHON3_READLINE
 
 config BR2_PACKAGE_PYTHON3_SSL
 	bool "ssl"
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  _ssl module for Python3 (required for https in urllib etc).
diff --git a/package/qt-webkit-kiosk/Config.in b/package/qt-webkit-kiosk/Config.in
index 703f128..d379cfc 100644
--- a/package/qt-webkit-kiosk/Config.in
+++ b/package/qt-webkit-kiosk/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_QT_WEBKIT_KIOSK
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5webkit
 	depends on !BR2_BINFMT_FLAT # qt5webkit
 	depends on !BR2_MIPS_SOFT_FLOAT # qt5webkit
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_WIDGETS
diff --git a/package/qt/Config.in b/package/qt/Config.in
index 7710b09..4c66102 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -483,6 +483,7 @@ config BR2_PACKAGE_QT_STL
 config BR2_PACKAGE_QT_OPENSSL
 	bool "Enable OpenSSL support"
 	depends on BR2_PACKAGE_QT_NETWORK
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Enable support for the OpenSSL encryption library. If you use
diff --git a/package/qt5/qt5enginio/Config.in b/package/qt5/qt5enginio/Config.in
index 102058e..6b12b5d 100644
--- a/package/qt5/qt5enginio/Config.in
+++ b/package/qt5/qt5enginio/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_QT5ENGINIO
 	bool "qt5enginio"
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_GUI
diff --git a/package/rabbitmq-server/Config.in b/package/rabbitmq-server/Config.in
index 6a323af..be96be3 100644
--- a/package/rabbitmq-server/Config.in
+++ b/package/rabbitmq-server/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_RABBITMQ_SERVER
 	bool "rabbitmq-server"
 	depends on BR2_PACKAGE_ERLANG
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_LIBXSLT
 	select BR2_PACKAGE_OPENSSL # Required to build Erlang's crypto and ssl
 	                           # applications
diff --git a/package/rdesktop/Config.in b/package/rdesktop/Config.in
index 0335bee..7d9c349 100644
--- a/package/rdesktop/Config.in
+++ b/package/rdesktop/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_RDESKTOP
 	bool "rdesktop"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXT
diff --git a/package/rtorrent/Config.in b/package/rtorrent/Config.in
index 190e50f..0bfe812 100644
--- a/package/rtorrent/Config.in
+++ b/package/rtorrent/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_RTORRENT
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1 && BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBTORRENT
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_OPENSSL
 	help
diff --git a/package/scrypt/Config.in b/package/scrypt/Config.in
index e6d1ac1..98c6637 100644
--- a/package/scrypt/Config.in
+++ b/package/scrypt/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SCRYPT
 	bool "scrypt"
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  A password-based key derivation function specifically
diff --git a/package/shairport-sync/Config.in b/package/shairport-sync/Config.in
index c2a5565..c72fb2d 100644
--- a/package/shairport-sync/Config.in
+++ b/package/shairport-sync/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_SHAIRPORT_SYNC
 	select BR2_PACKAGE_ALSA_LIB_MIXER
 	select BR2_PACKAGE_LIBCONFIG
 	select BR2_PACKAGE_LIBDAEMON
+	select BR2_PACKAGE_LIBSSL if !BR2_PACKAGE_MBEDTLS
 	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_MBEDTLS
 	select BR2_PACKAGE_POPT
 	help
diff --git a/package/shellinabox/Config.in b/package/shellinabox/Config.in
index 63a298d..52ad266 100644
--- a/package/shellinabox/Config.in
+++ b/package/shellinabox/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_SHELLINABOX
 	bool "shellinabox"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # dlfcn.h
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
diff --git a/package/snmppp/Config.in b/package/snmppp/Config.in
index 8d28467..30da608 100644
--- a/package/snmppp/Config.in
+++ b/package/snmppp/Config.in
@@ -21,6 +21,7 @@ config BR2_PACKAGE_SNMPPP_LOGGING
 config BR2_PACKAGE_SNMPPP_SNMPV3
 	bool "enable SNMPv3"
 	default y
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Enable optional support for SNMP++. This selects OpenSSL.
diff --git a/package/softether/Config.in b/package/softether/Config.in
index 55e5426..8ad2d15 100644
--- a/package/softether/Config.in
+++ b/package/softether/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_SOFTETHER
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_READLINE
 	help
diff --git a/package/spice/Config.in b/package/spice/Config.in
index 2241b55..6cd3472 100644
--- a/package/spice/Config.in
+++ b/package/spice/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_SPICE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_SPICE_PROTOCOL
diff --git a/package/sqlcipher/Config.in b/package/sqlcipher/Config.in
index 98b2f89..3679984 100644
--- a/package/sqlcipher/Config.in
+++ b/package/sqlcipher/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_SQLCIPHER
 	bool "sqlcipher"
 	depends on !BR2_PACKAGE_SQLITE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  SQLCipher is an SQLite extension that provides 256 bits AES
diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 5119706..308baf1 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -31,6 +31,7 @@ choice
 
 config BR2_PACKAGE_STRONGSWAN_OPENSSL
 	bool "OpenSSL"
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 
 config BR2_PACKAGE_STRONGSWAN_GCRYPT
diff --git a/package/stunnel/Config.in b/package/stunnel/Config.in
index e4a9567..3522758 100644
--- a/package/stunnel/Config.in
+++ b/package/stunnel/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_STUNNEL
 	bool "stunnel"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Stunnel is a program that wraps any TCP connection with an SSL
diff --git a/package/synergy/Config.in b/package/synergy/Config.in
index 3bb8b8e..c91ef9f 100644
--- a/package/synergy/Config.in
+++ b/package/synergy/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_SYNERGY
 	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXTST
diff --git a/package/syslog-ng/Config.in b/package/syslog-ng/Config.in
index fbc2362..0759fef 100644
--- a/package/syslog-ng/Config.in
+++ b/package/syslog-ng/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_SYSLOG_NG
 	select BR2_PACKAGE_EVENTLOG
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  syslog-ng is an enhanced log daemon, supporting a wide range
diff --git a/package/thrift/Config.in b/package/thrift/Config.in
index 0ee3f00..729158f 100644
--- a/package/thrift/Config.in
+++ b/package/thrift/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_THRIFT
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_LIBEVENT
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
diff --git a/package/tinc/Config.in b/package/tinc/Config.in
index 837f556..277d663 100644
--- a/package/tinc/Config.in
+++ b/package/tinc/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_TINC
 	bool "tinc"
 	depends on !BR2_STATIC_LIBS # tinc requires libdl for OpenSSL
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
diff --git a/package/tor/Config.in b/package/tor/Config.in
index 5200926..d7c700e 100644
--- a/package/tor/Config.in
+++ b/package/tor/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_TOR
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_LIBEVENT
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
diff --git a/package/tpm-tools/Config.in b/package/tpm-tools/Config.in
index 091f424..e4327ff 100644
--- a/package/tpm-tools/Config.in
+++ b/package/tpm-tools/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_TPM_TOOLS
 	depends on !BR2_STATIC_LIBS # trousers
 	depends on !BR2_arc # trousers
 	select BR2_PACKAGE_TROUSERS
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
diff --git a/package/transmission/Config.in b/package/transmission/Config.in
index b47c36f..ecdbd34 100644
--- a/package/transmission/Config.in
+++ b/package/transmission/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_TRANSMISSION
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBEVENT
diff --git a/package/trousers/Config.in b/package/trousers/Config.in
index eb791d1..f41c9b0 100644
--- a/package/trousers/Config.in
+++ b/package/trousers/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_TROUSERS
 	depends on !BR2_STATIC_LIBS
 	# ARC toolchain issue
 	depends on !BR2_arc
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index fc39d6f..886ca22 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -15,6 +15,7 @@ config BR2_PACKAGE_TVHEADEND
 	select BR2_PACKAGE_LIBVPX if BR2_PACKAGE_FFMPEG && !BR2_bfin # libvpx
 	select BR2_PACKAGE_X264 if BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Tvheadend is a TV streaming server for Linux supporting DVB-S,
diff --git a/package/uboot-tools/Config.in b/package/uboot-tools/Config.in
index f55614b..a511e40 100644
--- a/package/uboot-tools/Config.in
+++ b/package/uboot-tools/Config.in
@@ -28,6 +28,7 @@ if BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT
 
 config BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT
 	bool "FIT signature verification support"
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Enables support for FIT Signature Verification.
diff --git a/package/ustream-ssl/Config.in b/package/ustream-ssl/Config.in
index 540e436..a614678 100644
--- a/package/ustream-ssl/Config.in
+++ b/package/ustream-ssl/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_USTREAM_SSL
 	bool "ustream-ssl"
 	depends on !BR2_STATIC_LIBS #libubox
 	select BR2_PACKAGE_LIBUBOX
+	select BR2_PACKAGE_LIBSSL if !BR2_PACKAGE_MBEDTLS
 	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_MBEDTLS
 	help
 	  ustream SSL wrapper
diff --git a/package/vtun/Config.in b/package/vtun/Config.in
index bb8919c..400d32b 100644
--- a/package/vtun/Config.in
+++ b/package/vtun/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_VTUN
 	bool "vtun"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LZO
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
diff --git a/package/xen/Config.in b/package/xen/Config.in
index b5dcbf2..e6173df 100644
--- a/package/xen/Config.in
+++ b/package/xen/Config.in
@@ -27,6 +27,7 @@ config BR2_PACKAGE_XEN_TOOLS
 	select BR2_PACKAGE_LIBAIO
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_UTIL_LINUX
diff --git a/package/xl2tp/Config.in b/package/xl2tp/Config.in
index f0b1e83..d518926 100644
--- a/package/xl2tp/Config.in
+++ b/package/xl2tp/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_XL2TP
 	bool "xl2tp"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Layer 2 Tunnelling Protocol (RFC2661).
-- 
2.9.4
