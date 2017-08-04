From: Adam Duskett <aduskett@gmail.com>
Date: Fri,  4 Aug 2017 14:55:14 -0400
Subject: [Buildroot] [PATCH 03/10] convert dependencies to libssl
In-Reply-To: <20170804185521.12320-1-Adamduskett@outlook.com>
References: <20170804185521.12320-1-Adamduskett@outlook.com>
Message-ID: <20170804185521.12320-4-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Convert the remaining packages that select or depend on OpenSSL and
OpenSSL-host to instead select or depend on libssl or libssl-host.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/aircrack-ng/Config.in                                  |  2 +-
 package/aircrack-ng/aircrack-ng.mk                             |  2 +-
 package/alljoyn-base/Config.in                                 |  2 +-
 package/alljoyn-base/alljoyn-base.mk                           |  2 +-
 package/alljoyn/Config.in                                      |  2 +-
 package/alljoyn/alljoyn.mk                                     |  2 +-
 package/android-tools/Config.in                                |  4 ++--
 package/android-tools/android-tools.mk                         |  6 +++---
 package/apache/apache.mk                                       |  4 ++--
 package/apr-util/apr-util.mk                                   |  4 ++--
 package/azure-iot-sdk-c/Config.in                              |  2 +-
 package/azure-iot-sdk-c/azure-iot-sdk-c.mk                     |  2 +-
 package/bind/bind.mk                                           |  4 ++--
 package/botan/botan.mk                                         |  4 ++--
 package/c-icap/c-icap.mk                                       |  4 ++--
 package/ca-certificates/ca-certificates.mk                     |  2 +-
 package/civetweb/civetweb.mk                                   |  4 ++--
 package/clamav/Config.in                                       |  2 +-
 package/clamav/clamav.mk                                       |  2 +-
 package/collectd/Config.in                                     |  2 +-
 package/coreutils/coreutils.mk                                 |  4 ++--
 package/cryptsetup/cryptsetup.mk                               |  4 ++--
 package/ctorrent/ctorrent.mk                                   |  4 ++--
 package/curlftpfs/Config.in                                    |  2 +-
 package/dillo/dillo.mk                                         |  4 ++--
 package/domoticz/Config.in                                     |  2 +-
 package/domoticz/domoticz.mk                                   |  2 +-
 package/dovecot/Config.in                                      |  2 +-
 package/dovecot/dovecot.mk                                     |  2 +-
 package/easy-rsa/Config.in                                     |  4 ++--
 package/ecryptfs-utils/ecryptfs-utils.mk                       |  4 ++--
 package/efl/efl.mk                                             |  6 +++---
 package/ejabberd/Config.in                                     |  2 +-
 package/ejabberd/ejabberd.mk                                   |  2 +-
 package/erlang-p1-tls/Config.in                                |  2 +-
 package/erlang-p1-tls/erlang-p1-tls.mk                         |  2 +-
 package/erlang/erlang.mk                                       |  6 +++---
 package/exim/exim.mk                                           |  4 ++--
 package/fastd/fastd.mk                                         |  4 ++--
 package/fetchmail/Config.in                                    |  2 +-
 package/fetchmail/fetchmail.mk                                 |  2 +-
 package/ffmpeg/ffmpeg.mk                                       |  4 ++--
 package/filemq/Config.in                                       |  2 +-
 package/filemq/filemq.mk                                       |  2 +-
 package/flickcurl/Config.in                                    |  2 +-
 package/freerdp/Config.in                                      |  2 +-
 package/freerdp/freerdp.mk                                     |  2 +-
 package/freeswitch/Config.in                                   |  2 +-
 package/freeswitch/freeswitch.mk                               |  2 +-
 package/git-crypt/Config.in                                    |  2 +-
 package/git-crypt/git-crypt.mk                                 |  2 +-
 package/git/git.mk                                             |  4 ++--
 package/gstreamer/gst-plugins-bad/Config.in                    |  2 +-
 package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk           |  2 +-
 package/gstreamer1/gst1-plugins-bad/Config.in                  |  4 ++--
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk        |  4 ++--
 package/heirloom-mailx/heirloom-mailx.mk                       |  4 ++--
 package/hostapd/hostapd.mk                                     |  4 ++--
 package/ibrcommon/ibrcommon.mk                                 |  4 ++--
 package/ibrdtnd/ibrdtnd.mk                                     |  4 ++--
 package/inadyn/inadyn.mk                                       |  4 ++--
 package/ipmitool/Config.in                                     |  2 +-
 package/ipmitool/ipmitool.mk                                   |  2 +-
 package/ipmiutil/ipmiutil.mk                                   |  4 ++--
 package/ipsec-tools/Config.in                                  |  2 +-
 package/ipsec-tools/ipsec-tools.mk                             |  2 +-
 package/iputils/iputils.mk                                     |  4 ++--
 package/irssi/Config.in                                        |  2 +-
 package/irssi/irssi.mk                                         |  2 +-
 package/janus-gateway/Config.in                                |  2 +-
 package/keepalived/Config.in                                   |  2 +-
 package/keepalived/keepalived.mk                               |  2 +-
 package/kodi/Config.in                                         |  2 +-
 package/kodi/kodi.mk                                           |  2 +-
 package/lftp/Config.in                                         |  2 +-
 package/lftp/lftp.mk                                           |  4 ++--
 package/libarchive/libarchive.mk                               |  4 ++--
 package/libcurl/libcurl.mk                                     |  6 +++---
 package/libeXosip2/libeXosip2.mk                               |  4 ++--
 package/libesmtp/libesmtp.mk                                   |  2 +-
 package/libevent/libevent.mk                                   |  4 ++--
 package/libfreefare/Config.in                                  |  2 +-
 package/libfreefare/libfreefare.mk                             |  2 +-
 package/libldns/Config.in                                      |  2 +-
 package/libldns/libldns.mk                                     |  2 +-
 package/liboauth/Config.in                                     |  2 +-
 package/liboauth/liboauth.mk                                   |  2 +-
 package/libpjsip/libpjsip.mk                                   |  4 ++--
 package/libshout/libshout.mk                                   |  4 ++--
 package/libsrtp/libsrtp.mk                                     |  4 ++--
 package/libssh/Config.in                                       |  2 +-
 package/libssh/libssh.mk                                       |  2 +-
 package/libssh2/Config.in                                      |  2 +-
 package/libssh2/libssh2.mk                                     |  2 +-
 package/libstrophe/Config.in                                   |  2 +-
 package/libstrophe/libstrophe.mk                               |  2 +-
 package/libvncserver/libvncserver.mk                           |  4 ++--
 package/libwebsock/libwebsock.mk                               |  4 ++--
 package/libwebsockets/libwebsockets.mk                         |  2 +-
 package/lighttpd/Config.in                                     |  2 +-
 package/lighttpd/lighttpd.mk                                   |  4 ++--
 package/links/links.mk                                         |  4 ++--
 package/luacrypto/Config.in                                    |  2 +-
 package/luacrypto/luacrypto.mk                                 |  2 +-
 package/luaossl/Config.in                                      |  2 +-
 package/luaossl/luaossl.mk                                     |  2 +-
 package/luasec/Config.in                                       |  2 +-
 package/luasec/luasec.mk                                       |  2 +-
 package/mariadb/mariadb.mk                                     |  2 +-
 package/mongodb/mongodb.mk                                     |  4 ++--
 package/mongoose/mongoose.mk                                   |  4 ++--
 package/monit/monit.mk                                         |  4 ++--
 package/mosh/Config.in                                         |  2 +-
 package/mosh/mosh.mk                                           |  4 ++--
 package/mosquitto/mosquitto.mk                                 |  4 ++--
 package/msmtp/msmtp.mk                                         |  4 ++--
 package/mutt/mutt.mk                                           |  4 ++--
 package/mysql/Config.in                                        |  2 +-
 package/neon/Config.in                                         |  2 +-
 package/neon/neon.mk                                           |  2 +-
 package/netatalk/Config.in                                     |  2 +-
 package/netatalk/netatalk.mk                                   |  2 +-
 package/netsnmp/Config.in                                      |  2 +-
 package/netsnmp/netsnmp.mk                                     |  4 ++--
 package/nginx-upload/Config.in                                 |  2 +-
 package/nginx-upload/nginx-upload.mk                           |  2 +-
 package/nginx/Config.in                                        | 10 +++++-----
 package/nginx/nginx.mk                                         | 10 +++++-----
 package/nmap/nmap.mk                                           |  4 ++--
 package/ntp/Config.in                                          |  2 +-
 package/ntp/ntp.mk                                             |  2 +-
 package/nut/nut.mk                                             |  4 ++--
 package/omniorb/omniorb.mk                                     |  4 ++--
 package/openipmi/openipmi.mk                                   |  4 ++--
 package/openldap/openldap.mk                                   |  8 ++++----
 package/openssh/Config.in                                      |  2 +-
 package/openssh/openssh.mk                                     |  2 +-
 package/openswan/openswan.mk                                   |  4 ++--
 package/openvmtools/openvmtools.mk                             |  4 ++--
 package/openvpn/Config.in                                      |  2 +-
 package/openvpn/openvpn.mk                                     |  2 +-
 package/opusfile/opusfile.mk                                   |  4 ++--
 package/oracle-mysql/oracle-mysql.mk                           |  4 ++--
 package/paho-mqtt-c/paho-mqtt-c.mk                             |  4 ++--
 package/perl-crypt-openssl-random/Config.in                    |  2 +-
 package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk |  2 +-
 package/perl-net-ssleay/Config.in                              |  2 +-
 package/perl-net-ssleay/perl-net-ssleay.mk                     |  2 +-
 package/php/php.mk                                             |  2 +-
 package/poco/Config.in                                         |  4 ++--
 package/postgresql/postgresql.mk                               |  4 ++--
 package/pound/Config.in                                        |  2 +-
 package/pound/pound.mk                                         |  2 +-
 package/pure-ftpd/pure-ftpd.mk                                 |  4 ++--
 package/python/Config.in                                       |  4 ++--
 package/python/python.mk                                       |  4 ++--
 package/python3/Config.in                                      |  2 +-
 package/python3/python3.mk                                     |  2 +-
 package/qt-webkit-kiosk/Config.in                              |  2 +-
 package/qt/Config.in                                           |  2 +-
 package/qt/qt.mk                                               |  2 +-
 package/qt5/qt5base/qt5base.mk                                 |  4 ++--
 package/qt5/qt5enginio/Config.in                               |  2 +-
 package/qt5/qt5enginio/qt5enginio.mk                           |  2 +-
 package/rabbitmq-c/rabbitmq-c.mk                               |  4 ++--
 package/rabbitmq-server/Config.in                              |  2 +-
 package/rdesktop/Config.in                                     |  2 +-
 package/rdesktop/rdesktop.mk                                   |  2 +-
 package/rhash/rhash.mk                                         |  4 ++--
 package/rtmpdump/rtmpdump.mk                                   |  4 ++--
 package/rtorrent/Config.in                                     |  2 +-
 package/ruby/ruby.mk                                           |  4 ++--
 package/sconeserver/sconeserver.mk                             |  4 ++--
 package/scrypt/Config.in                                       |  2 +-
 package/scrypt/scrypt.mk                                       |  2 +-
 package/shairport-sync/Config.in                               |  2 +-
 package/shairport-sync/shairport-sync.mk                       |  6 +++---
 package/shellinabox/Config.in                                  |  2 +-
 package/shellinabox/shellinabox.mk                             |  2 +-
 package/sngrep/sngrep.mk                                       |  4 ++--
 package/snmppp/Config.in                                       |  2 +-
 package/snmppp/snmppp.mk                                       |  2 +-
 package/socat/socat.mk                                         |  4 ++--
 package/sofia-sip/sofia-sip.mk                                 |  4 ++--
 package/softether/Config.in                                    |  2 +-
 package/softether/softether.mk                                 |  4 ++--
 package/spice/Config.in                                        |  2 +-
 package/spice/spice.mk                                         |  2 +-
 package/sqlcipher/Config.in                                    |  2 +-
 package/sqlcipher/sqlcipher.mk                                 |  2 +-
 package/squid/squid.mk                                         |  4 ++--
 package/strongswan/Config.in                                   |  2 +-
 package/swupdate/Config.in                                     |  2 +-
 package/swupdate/swupdate.mk                                   |  4 ++--
 package/sylpheed/sylpheed.mk                                   |  4 ++--
 package/synergy/Config.in                                      |  2 +-
 package/synergy/synergy.mk                                     |  2 +-
 package/syslog-ng/Config.in                                    |  2 +-
 package/syslog-ng/syslog-ng.mk                                 |  2 +-
 package/thrift/Config.in                                       |  2 +-
 package/tinc/Config.in                                         |  2 +-
 package/tinc/tinc.mk                                           |  2 +-
 package/tn5250/tn5250.mk                                       |  4 ++--
 package/tor/Config.in                                          |  2 +-
 package/tor/tor.mk                                             |  2 +-
 package/tpm-tools/Config.in                                    |  2 +-
 package/tpm-tools/tpm-tools.mk                                 |  2 +-
 package/transmission/Config.in                                 |  2 +-
 package/transmission/transmission.mk                           |  2 +-
 package/trousers/Config.in                                     |  2 +-
 package/trousers/trousers.mk                                   |  2 +-
 package/turbolua/turbolua.mk                                   |  4 ++--
 package/tvheadend/Config.in                                    |  2 +-
 package/uboot-tools/Config.in                                  |  2 +-
 package/uboot-tools/uboot-tools.mk                             |  4 ++--
 package/ustream-ssl/Config.in                                  |  2 +-
 package/ustream-ssl/ustream-ssl.mk                             |  2 +-
 package/vboot-utils/vboot-utils.mk                             |  2 +-
 package/vsftpd/vsftpd.mk                                       |  4 ++--
 package/vtun/Config.in                                         |  2 +-
 package/vtun/vtun.mk                                           |  2 +-
 package/wget/wget.mk                                           |  4 ++--
 package/wpa_supplicant/wpa_supplicant.mk                       |  6 +++---
 package/x11r7/xserver_xorg-server/Config.in                    |  2 +-
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk       |  4 ++--
 package/x11vnc/x11vnc.mk                                       |  4 ++--
 package/xen/Config.in                                          |  2 +-
 package/xen/xen.mk                                             |  2 +-
 package/xl2tp/Config.in                                        |  2 +-
 package/xl2tp/xl2tp.mk                                         |  2 +-
 package/znc/znc.mk                                             |  4 ++--
 231 files changed, 334 insertions(+), 334 deletions(-)

diff --git a/package/aircrack-ng/Config.in b/package/aircrack-ng/Config.in
index 2164ad407..478a97215 100644
--- a/package/aircrack-ng/Config.in
+++ b/package/aircrack-ng/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_AIRCRACK_NG
 	# libnl has issues when linking statically
 	# they need fixing in libnl itself
 	select BR2_PACKAGE_LIBNL if !BR2_STATIC_LIBS
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_ZLIB
 	help
 	  A set of tools for auditing wireless networks
diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
index 6b384c072..53b428925 100644
--- a/package/aircrack-ng/aircrack-ng.mk
+++ b/package/aircrack-ng/aircrack-ng.mk
@@ -8,7 +8,7 @@ AIRCRACK_NG_VERSION = 1.2-rc4
 AIRCRACK_NG_SITE = http://download.aircrack-ng.org
 AIRCRACK_NG_LICENSE = GPL-2.0+
 AIRCRACK_NG_LICENSE_FILES = LICENSE
-AIRCRACK_NG_DEPENDENCIES = openssl zlib host-pkgconf
+AIRCRACK_NG_DEPENDENCIES = libssl zlib host-pkgconf
 # Enable buddy-ng, easside-ng, tkiptun-ng, wesside-ng
 AIRCRACK_NG_MAKE_OPTS = unstable=true
 
diff --git a/package/alljoyn-base/Config.in b/package/alljoyn-base/Config.in
index 8556d66c6..d0ecf41ae 100644
--- a/package/alljoyn-base/Config.in
+++ b/package/alljoyn-base/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_ALLJOYN_BASE
 	depends on BR2_USE_WCHAR # alljoyn
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # alljoyn
 	select BR2_PACKAGE_ALLJOYN
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_ALLJOYN_BASE_CONTROLPANEL if \
 		!BR2_PACKAGE_ALLJOYN_BASE_NOTIFICATION && \
 		!BR2_PACKAGE_ALLJOYN_BASE_ONBOARDING
diff --git a/package/alljoyn-base/alljoyn-base.mk b/package/alljoyn-base/alljoyn-base.mk
index ad1980282..84d988e8f 100644
--- a/package/alljoyn-base/alljoyn-base.mk
+++ b/package/alljoyn-base/alljoyn-base.mk
@@ -11,7 +11,7 @@ ALLJOYN_BASE_SITE = \
 # See https://allseenalliance.org/alliance/ip-policy
 ALLJOYN_BASE_LICENSE = ISC
 
-ALLJOYN_BASE_DEPENDENCIES = host-scons alljoyn openssl
+ALLJOYN_BASE_DEPENDENCIES = host-scons alljoyn libssl
 ALLJOYN_BASE_INSTALL_STAGING = YES
 
 ALLJOYN_BASE_CRYPTO = openssl
diff --git a/package/alljoyn/Config.in b/package/alljoyn/Config.in
index 6eb417daf..60df10df0 100644
--- a/package/alljoyn/Config.in
+++ b/package/alljoyn/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_ALLJOYN
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBCAP
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	help
 	  The AllJoyn framework defines a common way for devices and
 	  apps to communicate with one another regardless of brands,
diff --git a/package/alljoyn/alljoyn.mk b/package/alljoyn/alljoyn.mk
index 69d5dedc4..8e403f8f1 100644
--- a/package/alljoyn/alljoyn.mk
+++ b/package/alljoyn/alljoyn.mk
@@ -11,7 +11,7 @@ ALLJOYN_SITE = https://mirrors.kernel.org/allseenalliance/alljoyn/$(ALLJOYN_REV)
 # See https://allseenalliance.org/alliance/ip-policy
 ALLJOYN_LICENSE = ISC
 
-ALLJOYN_DEPENDENCIES = host-scons libcap openssl
+ALLJOYN_DEPENDENCIES = host-scons libcap libssl
 ALLJOYN_INSTALL_STAGING = YES
 
 ALLJOYN_CRYPTO = openssl
diff --git a/package/android-tools/Config.in b/package/android-tools/Config.in
index 96e36e6cd..80a468028 100644
--- a/package/android-tools/Config.in
+++ b/package/android-tools/Config.in
@@ -58,7 +58,7 @@ comment "fastboot needs headers >= 3.10 (PowerPC64), headers >= 3.16 (MIPS64)"
 config BR2_PACKAGE_ANDROID_TOOLS_ADB
 	bool "adb"
 	depends on BR2_USE_MMU # uses fork()
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_ZLIB
 	help
 	  This option will build and install the adb utility for the
@@ -68,7 +68,7 @@ config BR2_PACKAGE_ANDROID_TOOLS_ADB
 config BR2_PACKAGE_ANDROID_TOOLS_ADBD
 	bool "adbd"
 	depends on BR2_USE_MMU # uses fork()
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_ZLIB
 	help
 	  This option will build and install the adbd utility for the
diff --git a/package/android-tools/android-tools.mk b/package/android-tools/android-tools.mk
index f6c6913a6..05cdf00ad 100644
--- a/package/android-tools/android-tools.mk
+++ b/package/android-tools/android-tools.mk
@@ -37,7 +37,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_HOST_ANDROID_TOOLS_ADB),y)
 HOST_ANDROID_TOOLS_TARGETS += adb
-HOST_ANDROID_TOOLS_DEPENDENCIES += host-zlib host-openssl
+HOST_ANDROID_TOOLS_DEPENDENCIES += host-zlib host-libssl
 endif
 
 ifeq ($(BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT),y)
@@ -47,12 +47,12 @@ endif
 
 ifeq ($(BR2_PACKAGE_ANDROID_TOOLS_ADB),y)
 ANDROID_TOOLS_TARGETS += adb
-ANDROID_TOOLS_DEPENDENCIES += zlib openssl
+ANDROID_TOOLS_DEPENDENCIES += zlib libssl
 endif
 
 ifeq ($(BR2_PACKAGE_ANDROID_TOOLS_ADBD),y)
 ANDROID_TOOLS_TARGETS += adbd
-ANDROID_TOOLS_DEPENDENCIES += zlib openssl
+ANDROID_TOOLS_DEPENDENCIES += zlib libssl
 endif
 
 # Build each tool in its own directory not to share object files
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 857e53834..741e2dba5 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -57,8 +57,8 @@ APACHE_CONF_OPTS += \
 	--disable-proxy-html
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-APACHE_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
+APACHE_DEPENDENCIES += libssl
 APACHE_CONF_OPTS += \
 	--enable-ssl \
 	--with-ssl=$(STAGING_DIR)/usr
diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index bc0572e11..dc3f28055 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -46,9 +46,9 @@ else
 APR_UTIL_CONF_OPTS += --without-sqlite3
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
 APR_UTIL_CONF_OPTS += --with-crypto --with-openssl="$(STAGING_DIR)/usr"
-APR_UTIL_DEPENDENCIES += openssl
+APR_UTIL_DEPENDENCIES += libssl
 else
 APR_UTIL_CONF_OPTS += --without-crypto
 endif
diff --git a/package/azure-iot-sdk-c/Config.in b/package/azure-iot-sdk-c/Config.in
index 366dc91ea..34996d1a8 100644
--- a/package/azure-iot-sdk-c/Config.in
+++ b/package/azure-iot-sdk-c/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_AZURE_IOT_SDK_C
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBXML2
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
index 18c3e2498..9af2cad58 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
@@ -11,7 +11,7 @@ AZURE_IOT_SDK_C_GIT_SUBMODULES = YES
 AZURE_IOT_SDK_C_LICENSE = MIT
 AZURE_IOT_SDK_C_LICENSE_FILES = LICENSE
 AZURE_IOT_SDK_C_INSTALL_STAGING = YES
-AZURE_IOT_SDK_C_DEPENDENCIES = libxml2 openssl libcurl util-linux
+AZURE_IOT_SDK_C_DEPENDENCIES = libxml2 libssl libcurl util-linux
 AZURE_IOT_SDK_C_CONF_OPTS = -Dskip_samples=ON
 
 # The project only supports building one kind of library.
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 988f40e1c..f912880f1 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -52,8 +52,8 @@ else
 BIND_CONF_OPTS += --with-libxml2=no
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-BIND_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
+BIND_DEPENDENCIES += libssl
 BIND_CONF_ENV += \
 	ac_cv_func_EVP_sha256=yes \
 	ac_cv_func_EVP_sha384=yes \
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index e42bb61cb..286289fe5 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -33,8 +33,8 @@ BOTAN_DEPENDENCIES += gmp
 BOTAN_CONF_OPTS += --with-gnump
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-BOTAN_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
+BOTAN_DEPENDENCIES += libssl
 BOTAN_CONF_OPTS += --with-openssl
 endif
 
diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
index c722098c5..ef5de4993 100644
--- a/package/c-icap/c-icap.mk
+++ b/package/c-icap/c-icap.mk
@@ -54,9 +54,9 @@ else
 C_ICAP_CONF_OPTS += --without-ldap
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
 C_ICAP_CONF_OPTS += --with-openssl
-C_ICAP_DEPENDENCIES += openssl
+C_ICAP_DEPENDENCIES += libssl
 else
 C_ICAP_CONF_OPTS += --without-openssl
 endif
diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index f712e7988..7221afb00 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -7,7 +7,7 @@
 CA_CERTIFICATES_VERSION = 20161130
 CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
 CA_CERTIFICATES_SITE = http://snapshot.debian.org/archive/debian/20161205T153846Z/pool/main/c/ca-certificates
-CA_CERTIFICATES_DEPENDENCIES = host-openssl
+CA_CERTIFICATES_DEPENDENCIES = host-libssl
 # ca-certificates can be built with either python 2 or python 3
 # but it must be at least python 2.7
 CA_CERTIFICATES_DEPENDENCIES += \
diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index d29765b87..a22234ed2 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -20,10 +20,10 @@ CIVETWEB_CONF_OPTS += WITH_LUA=1
 CIVETWEB_LIBS += -ldl
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
 CIVETWEB_COPT += -DNO_SSL_DL
 CIVETWEB_LIBS += -lssl -lcrypto -lz
-CIVETWEB_DEPENDENCIES += openssl
+CIVETWEB_DEPENDENCIES += libssl
 else
 CIVETWEB_COPT += -DNO_SSL
 endif
diff --git a/package/clamav/Config.in b/package/clamav/Config.in
index bc934ea45..9a834505e 100644
--- a/package/clamav/Config.in
+++ b/package/clamav/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_CLAMAV
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBTOOL
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_ZLIB
 	help
 	  ClamAV is an open source antivirus engine for detecting
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 5429abb98..e97de1fb0 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -13,7 +13,7 @@ CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
 CLAMAV_DEPENDENCIES = \
 	host-pkgconf \
 	libtool \
-	openssl \
+	libssl \
 	zlib \
 	$(TARGET_NLS_DEPENDENCIES)
 
diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index ccd3fbe13..ed27716ff 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -67,7 +67,7 @@ config BR2_PACKAGE_COLLECTD_NOTIFY_EMAIL
 	bool "notify_email"
 	depends on !BR2_STATIC_LIBS # libesmtp
 	select BR2_PACKAGE_LIBESMTP
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	help
 	  Send an E-mail with the notification message to the
 	  configured recipients.
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 6a8a31b06..46f16b4dc 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -96,9 +96,9 @@ else
 COREUTILS_CONF_OPTS += --disable-libcap
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
 COREUTILS_CONF_OPTS += --with-openssl=yes
-COREUTILS_DEPENDENCIES += openssl
+COREUTILS_DEPENDENCIES += libssl
 endif
 
 ifeq ($(BR2_ROOTFS_MERGED_USR),)
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 549658302..3cff7c7d0 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -21,8 +21,8 @@ ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 CRYPTSETUP_DEPENDENCIES += libgcrypt
 CRYPTSETUP_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
 CRYPTSETUP_CONF_OPTS += --with-crypto_backend=gcrypt
-else ifeq ($(BR2_PACKAGE_OPENSSL),y)
-CRYPTSETUP_DEPENDENCIES += openssl
+else ifeq ($(BR2_PACKAGE_LIBSSL),y)
+CRYPTSETUP_DEPENDENCIES += libssl
 CRYPTSETUP_CONF_OPTS += --with-crypto_backend=openssl
 else
 CRYPTSETUP_CONF_OPTS += --with-crypto_backend=kernel
diff --git a/package/ctorrent/ctorrent.mk b/package/ctorrent/ctorrent.mk
index 959e543f7..59ba018cd 100644
--- a/package/ctorrent/ctorrent.mk
+++ b/package/ctorrent/ctorrent.mk
@@ -9,9 +9,9 @@ CTORRENT_SITE = http://www.rahul.net/dholmes/ctorrent
 CTORRENT_LICENSE = GPL-2.0
 CTORRENT_LICENSE_FILES = COPYING
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
 CTORRENT_CONF_OPTS += --with-ssl=yes
-CTORRENT_DEPENDENCIES += openssl
+CTORRENT_DEPENDENCIES += libssl
 else
 CTORRENT_CONF_OPTS += --with-ssl=no
 endif
diff --git a/package/curlftpfs/Config.in b/package/curlftpfs/Config.in
index c8c432f20..2f737ac03 100644
--- a/package/curlftpfs/Config.in
+++ b/package/curlftpfs/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_CURLFTPFS
 	select BR2_PACKAGE_LIBFUSE
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_LIBCURL
 	help
 	  CurlFtpFS is a filesystem for accessing FTP hosts based on
diff --git a/package/dillo/dillo.mk b/package/dillo/dillo.mk
index a6885f5c1..1bf75061f 100644
--- a/package/dillo/dillo.mk
+++ b/package/dillo/dillo.mk
@@ -15,9 +15,9 @@ DILLO_DEPENDENCIES = fltk zlib \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 DILLO_CONF_ENV = ac_cv_path_FLTK_CONFIG=$(STAGING_DIR)/usr/bin/fltk-config
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
 DILLO_CONF_OPTS += --enable-ssl
-DILLO_DEPENDENCIES += openssl
+DILLO_DEPENDENCIES += libssl
 else
 DILLO_CONF_OPTS += --disable-ssl
 endif
diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
index c03f84ae4..544bff907 100644
--- a/package/domoticz/Config.in
+++ b/package/domoticz/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_DOMOTICZ
 	select BR2_PACKAGE_BOOST_THREAD
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_MOSQUITTO
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_ZLIB
 	help
diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index 59731b514..c61b3c230 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -14,7 +14,7 @@ DOMOTICZ_DEPENDENCIES = \
 	libcurl \
 	lua \
 	mosquitto \
-	openssl \
+	libssl \
 	sqlite \
 	zlib
 
diff --git a/package/dovecot/Config.in b/package/dovecot/Config.in
index 377fd4dbb..47c409b07 100644
--- a/package/dovecot/Config.in
+++ b/package/dovecot/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_DOVECOT
 	bool "dovecot"
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_ZLIB
 	help
 	  Dovecot is an open source IMAP and POP3 email server for
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 4cc6ae4de..a1410e973 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -13,7 +13,7 @@ DOVECOT_LICENSE_FILES = COPYING COPYING.LGPL COPYING.MIT
 DOVECOT_DEPENDENCIES = \
 	host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
-	openssl
+	libssl
 
 DOVECOT_CONF_ENV = \
 	RPCGEN=__disable_RPCGEN_rquota \
diff --git a/package/easy-rsa/Config.in b/package/easy-rsa/Config.in
index 883d679e9..d6a43a57f 100644
--- a/package/easy-rsa/Config.in
+++ b/package/easy-rsa/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_EASY_RSA
 	bool "easy-rsa"
-	select BR2_PACKAGE_OPENSSL # runtime
-	select BR2_PACKAGE_OPENSSL_BIN
+	select BR2_PACKAGE_LIBSSL # runtime
+	select BR2_PACKAGE_LIBSSL_BIN
 	help
 	  Simple shell based CA utility
 
diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
index eb3194b6d..3737e56f7 100644
--- a/package/ecryptfs-utils/ecryptfs-utils.mk
+++ b/package/ecryptfs-utils/ecryptfs-utils.mk
@@ -18,9 +18,9 @@ ECRYPTFS_UTILS_CONF_ENV = \
 	NSS_CFLAGS="-I$(STAGING_DIR)/usr/include/nss -I$(STAGING_DIR)/usr/include/nspr" \
 	NSS_LIBS="-lnss3"
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
 ECRYPTFS_UTILS_CONF_OPTS += --enable-openssl
-ECRYPTFS_UTILS_DEPENDENCIES += openssl
+ECRYPTFS_UTILS_DEPENDENCIES += libssl
 else
 ECRYPTFS_UTILS_CONF_OPTS += --disable-openssl
 endif
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 9cbbabb1e..9eba57cbf 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -146,8 +146,8 @@ EFL_CONF_OPTS += --with-glib=no
 endif
 
 # Prefer openssl (the default) over gnutls.
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-EFL_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
+EFL_DEPENDENCIES += libssl
 EFL_CONF_OPTS += --with-crypto=openssl
 else ifeq ($(BR2_PACKAGE_GNUTLS)$(BR2_PACKAGE_LIBGCRYPT),yy)
 EFL_DEPENDENCIES += gnutls libgcrypt
@@ -155,7 +155,7 @@ EFL_CONF_OPTS += --with-crypto=gnutls \
 	--with-libgcrypt-prefix=$(STAGING_DIR)/usr
 else
 EFL_CONF_OPTS += --with-crypto=none
-endif # BR2_PACKAGE_OPENSSL
+endif # BR2_PACKAGE_LIBSSL
 
 ifeq ($(BR2_PACKAGE_EFL_ELPUT),y)
 EFL_CONF_OPTS += --enable-elput
diff --git a/package/ejabberd/Config.in b/package/ejabberd/Config.in
index a7542cd12..eab98bb97 100644
--- a/package/ejabberd/Config.in
+++ b/package/ejabberd/Config.in
@@ -17,7 +17,7 @@ config BR2_PACKAGE_EJABBERD
 	select BR2_PACKAGE_ERLANG_P1_YAML
 	select BR2_PACKAGE_ERLANG_P1_ZLIB
 	select BR2_PACKAGE_GETENT
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	help
 	  Ejabberd is a Jabber/XMPP instant messaging server, written
 	  in Erlang/OTP. Among other features, ejabberd is
diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
index 9baa1124a..05c49af2f 100644
--- a/package/ejabberd/ejabberd.mk
+++ b/package/ejabberd/ejabberd.mk
@@ -9,7 +9,7 @@ EJABBERD_SOURCE = ejabberd-$(EJABBERD_VERSION).tgz
 EJABBERD_SITE = https://www.process-one.net/downloads/ejabberd/$(EJABBERD_VERSION)
 EJABBERD_LICENSE = GPL-2.0+ with OpenSSL exception
 EJABBERD_LICENSE_FILES = COPYING
-EJABBERD_DEPENDENCIES = getent openssl host-erlang-lager erlang-lager \
+EJABBERD_DEPENDENCIES = getent libssl host-erlang-lager erlang-lager \
 	erlang-p1-cache-tab erlang-p1-iconv erlang-p1-sip \
 	erlang-p1-stringprep erlang-p1-stun erlang-p1-tls \
 	erlang-p1-utils erlang-p1-xml erlang-p1-xmpp erlang-p1-yaml \
diff --git a/package/erlang-p1-tls/Config.in b/package/erlang-p1-tls/Config.in
index a684fbb6a..3de87cd18 100644
--- a/package/erlang-p1-tls/Config.in
+++ b/package/erlang-p1-tls/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_ERLANG_P1_TLS
 	bool "erlang-p1-tls"
 	select BR2_PACKAGE_ERLANG_P1_UTILS
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	help
 	  Erlang interface to OpenSSL
 
diff --git a/package/erlang-p1-tls/erlang-p1-tls.mk b/package/erlang-p1-tls/erlang-p1-tls.mk
index 63d0112cc..9f9b6607d 100644
--- a/package/erlang-p1-tls/erlang-p1-tls.mk
+++ b/package/erlang-p1-tls/erlang-p1-tls.mk
@@ -9,6 +9,6 @@ ERLANG_P1_TLS_SITE = $(call github,processone,fast_tls,$(ERLANG_P1_TLS_VERSION))
 ERLANG_P1_TLS_LICENSE = Apache-2.0
 ERLANG_P1_TLS_LICENSE_FILES = LICENSE.txt
 ERLANG_P1_TLS_INSTALL_STAGING = YES
-ERLANG_P1_TLS_DEPENDENCIES = openssl erlang-p1-utils
+ERLANG_P1_TLS_DEPENDENCIES = libssl erlang-p1-utils
 
 $(eval $(rebar-package))
diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index f3684d0c9..b6a2d1290 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -38,7 +38,7 @@ HOST_ERLANG_CONF_ENV += ERL_TOP=$(@D)
 
 # erlang uses openssl for all things crypto. Since the host tools (such as
 # rebar) uses crypto, we need to build host-erlang with support for openssl.
-HOST_ERLANG_DEPENDENCIES = host-openssl
+HOST_ERLANG_DEPENDENCIES = host-libssl
 HOST_ERLANG_CONF_OPTS = --without-javac --with-ssl=$(HOST_DIR)
 
 HOST_ERLANG_CONF_OPTS += --without-termcap
@@ -54,9 +54,9 @@ else
 ERLANG_CONF_OPTS += --without-termcap
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
 ERLANG_CONF_OPTS += --with-ssl
-ERLANG_DEPENDENCIES += openssl
+ERLANG_DEPENDENCIES += libssl
 else
 ERLANG_CONF_OPTS += --without-ssl
 endif
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 45cb57db1..08a3d583e 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -64,8 +64,8 @@ define EXIM_USE_DEFAULT_CONFIG_FILE_CLAMAV
 endef
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-EXIM_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
+EXIM_DEPENDENCIES += libssl
 define EXIM_USE_DEFAULT_CONFIG_FILE_OPENSSL
 	$(call exim-config-change,SUPPORT_TLS,yes)
 	$(call exim-config-change,USE_OPENSSL_PC,openssl)
diff --git a/package/fastd/fastd.mk b/package/fastd/fastd.mk
index e67acdbf1..4ffe948a9 100644
--- a/package/fastd/fastd.mk
+++ b/package/fastd/fastd.mk
@@ -12,9 +12,9 @@ FASTD_LICENSE_FILES = COPYRIGHT
 FASTD_CONF_OPTS = -DENABLE_LIBSODIUM=ON
 FASTD_DEPENDENCIES = host-bison host-pkgconf libuecc libsodium libcap
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
 FASTD_CONF_OPTS += -DENABLE_OPENSSL=ON
-FASTD_DEPENDENCIES += openssl
+FASTD_DEPENDENCIES += libssl
 else
 FASTD_CONF_OPTS += -DENABLE_OPENSSL=OFF
 endif
diff --git a/package/fetchmail/Config.in b/package/fetchmail/Config.in
index a4bf5a7c2..416a004ea 100644
--- a/package/fetchmail/Config.in
+++ b/package/fetchmail/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_FETCHMAIL
 	bool "fetchmail"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_CA_CERTIFICATES
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	help
 	  Fetchmail - the mail-retrieval daemon
 	  Client daemon to move mail from POP and IMAP to your local
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 37bbeabf6..dad77faaa 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -24,7 +24,7 @@ FETCHMAIL_CONF_OPTS = \
 
 FETCHMAIL_DEPENDENCIES = \
 	ca-certificates \
-	openssl \
+	libssl \
 	$(TARGET_NLS_DEPENDENCIES)
 
 # fetchmailconf.py script is not (yet) python3-compliant.
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index f50b410b0..5d403f75e 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -208,13 +208,13 @@ FFMPEG_CONF_OPTS += --enable-gnutls --disable-openssl
 FFMPEG_DEPENDENCIES += gnutls
 else
 FFMPEG_CONF_OPTS += --disable-gnutls
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
 # openssl isn't license compatible with GPL
 ifeq ($(BR2_PACKAGE_FFMPEG_GPL)x$(BR2_PACKAGE_FFMPEG_NONFREE),yx)
 FFMPEG_CONF_OPTS += --disable-openssl
 else
 FFMPEG_CONF_OPTS += --enable-openssl
-FFMPEG_DEPENDENCIES += openssl
+FFMPEG_DEPENDENCIES += libssl
 endif
 else
 FFMPEG_CONF_OPTS += --disable-openssl
diff --git a/package/filemq/Config.in b/package/filemq/Config.in
index b4720c1d4..d8371bd5e 100644
--- a/package/filemq/Config.in
+++ b/package/filemq/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_FILEMQ
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 	depends on BR2_USE_MMU # czmq
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_CZMQ
 	select BR2_PACKAGE_ZEROMQ
 	help
diff --git a/package/filemq/filemq.mk b/package/filemq/filemq.mk
index 75d8bd992..e1f34f629 100644
--- a/package/filemq/filemq.mk
+++ b/package/filemq/filemq.mk
@@ -10,7 +10,7 @@ FILEMQ_SITE = $(call github,zeromq,filemq,$(FILEMQ_VERSION))
 FILEMQ_AUTORECONF = YES
 FILEMQ_CONF_ENV = filemq_have_asciidoc=no
 FILEMQ_INSTALL_STAGING = YES
-FILEMQ_DEPENDENCIES = czmq openssl zeromq
+FILEMQ_DEPENDENCIES = czmq libssl zeromq
 FILEMQ_LICENSE = MPL-2.0
 FILEMQ_LICENSE_FILES = LICENSE
 
diff --git a/package/flickcurl/Config.in b/package/flickcurl/Config.in
index 426ceecba..8f40422e0 100644
--- a/package/flickcurl/Config.in
+++ b/package/flickcurl/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_FLICKCURL
 	select BR2_PACKAGE_LIBXML2
 	# Ensure that libcurl is built with crypto support, since
 	# flickcurl must access https:// URLs.
-	select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_GNUTLS || BR2_PACKAGE_LIBNSS)
+	select BR2_PACKAGE_LIBSSL if !(BR2_PACKAGE_GNUTLS || BR2_PACKAGE_LIBNSS)
 	select BR2_PACKAGE_CA_CERTIFICATES # runtime
 	help
 	  Flickcurl is a C library for the Flickr API, handling
diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
index 9dd2505a4..892c2ef73 100644
--- a/package/freerdp/Config.in
+++ b/package/freerdp/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_FREERDP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LIBGLIB2
 	help
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index c3a3e55d0..ad43ef3f4 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -7,7 +7,7 @@
 # Changeset on the master branch
 FREERDP_VERSION = 17834af7bb378f85a3b3cc4dcadaa5125a337e16
 FREERDP_SITE = $(call github,FreeRDP,FreeRDP,$(FREERDP_VERSION))
-FREERDP_DEPENDENCIES = libglib2 openssl zlib
+FREERDP_DEPENDENCIES = libglib2 libssl zlib
 FREERDP_LICENSE = Apache-2.0
 FREERDP_LICENSE_FILES = LICENSE
 
diff --git a/package/freeswitch/Config.in b/package/freeswitch/Config.in
index 1f6459335..8bcab123c 100644
--- a/package/freeswitch/Config.in
+++ b/package/freeswitch/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_FREESWITCH
 	select BR2_PACKAGE_OPENCV_LIB_HIGHGUI if BR2_PACKAGE_OPENCV
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC if BR2_PACKAGE_OPENCV
 	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT if BR2_PACKAGE_OPENCV
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_SPEEX
 	select BR2_PACKAGE_SQLITE
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index e5c8854e3..e09bf3753 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -30,7 +30,7 @@ FREESWITCH_DEPENDENCIES = \
 	host-pkgconf \
 	jpeg \
 	libcurl \
-	openssl \
+	libssl \
 	pcre \
 	speex \
 	sqlite \
diff --git a/package/git-crypt/Config.in b/package/git-crypt/Config.in
index 362fe9a60..745a4ac0e 100644
--- a/package/git-crypt/Config.in
+++ b/package/git-crypt/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_GIT_CRYPT
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # git
 	select BR2_PACKAGE_GIT # runtime
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	help
 	  git-crypt enables transparent encryption and decryption of
 	  files in a git repository.
diff --git a/package/git-crypt/git-crypt.mk b/package/git-crypt/git-crypt.mk
index 6cae456fd..215086257 100644
--- a/package/git-crypt/git-crypt.mk
+++ b/package/git-crypt/git-crypt.mk
@@ -6,7 +6,7 @@
 
 GIT_CRYPT_VERSION = 0.5.0
 GIT_CRYPT_SITE = https://www.agwa.name/projects/git-crypt/downloads
-GIT_CRYPT_DEPENDENCIES = host-pkgconf openssl
+GIT_CRYPT_DEPENDENCIES = host-pkgconf libssl
 GIT_CRYPT_LICENSE = GPL-3.0+, MIT
 GIT_CRYPT_LICENSE_FILES = COPYING parse_options.hpp
 
diff --git a/package/git/git.mk b/package/git/git.mk
index d95c2fec3..1f92757a7 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -11,8 +11,8 @@ GIT_LICENSE = GPL-2.0, LGPL-2.1+
 GIT_LICENSE_FILES = COPYING LGPL-2.1
 GIT_DEPENDENCIES = zlib $(TARGET_NLS_DEPENDENCIES)
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-GIT_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
+GIT_DEPENDENCIES += libssl
 GIT_CONF_OPTS += --with-openssl
 GIT_CONF_ENV_LIBS += $(if $(BR2_STATIC_LIBS),-lz)
 else
diff --git a/package/gstreamer/gst-plugins-bad/Config.in b/package/gstreamer/gst-plugins-bad/Config.in
index 939fc7a7f..b710a4da3 100644
--- a/package/gstreamer/gst-plugins-bad/Config.in
+++ b/package/gstreamer/gst-plugins-bad/Config.in
@@ -244,7 +244,7 @@ comment "plugins with external dependencies (there may be more available)"
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_APEXSINK
 	bool "apexsink"
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_BZ2
 	bool "bz2"
diff --git a/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk b/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
index b9416db34..18baf37b9 100644
--- a/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
@@ -473,7 +473,7 @@ endif
 # plugins with deps
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_APEXSINK),y)
 GST_PLUGINS_BAD_CONF_OPTS += --enable-apexsink
-GST_PLUGINS_BAD_DEPENDENCIES += openssl
+GST_PLUGINS_BAD_DEPENDENCIES += libssl
 else
 GST_PLUGINS_BAD_CONF_OPTS += --disable-apexsink
 endif
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 0c9789997..840c2e6ac 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -519,7 +519,7 @@ comment "gl needs the gst1-plugins-bad opengl library"
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS
 	bool "hls"
-	select BR2_PACKAGE_NETTLE if !(BR2_PACKAGE_LIBGCRYPT || BR2_PACKAGE_OPENSSL)
+	select BR2_PACKAGE_NETTLE if !(BR2_PACKAGE_LIBGCRYPT || BR2_PACKAGE_LIBSSL)
 	help
 	  Fragmented streaming plugins
 
@@ -543,7 +543,7 @@ comment "libmms needs a toolchain w/ wchar, threads"
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DTLS
 	bool "dtls"
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	help
 	  DTLS plugin
 
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 7a32689b8..69336cf39 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -607,7 +607,7 @@ GST1_PLUGINS_BAD_DEPENDENCIES += libgcrypt
 GST1_PLUGINS_BAD_CONF_OPTS += --with-hls-crypto=libgcrypt \
 	--with-libgcrypt-prefix=$(STAGING_DIR)/usr
 else
-GST1_PLUGINS_BAD_DEPENDENCIES += openssl
+GST1_PLUGINS_BAD_DEPENDENCIES += libssl
 GST1_PLUGINS_BAD_CONF_OPTS += --with-hls-crypto=openssl
 endif
 
@@ -631,7 +631,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DTLS),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-dtls
-GST1_PLUGINS_BAD_DEPENDENCIES += openssl
+GST1_PLUGINS_BAD_DEPENDENCIES += libssl
 else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-dtls
 endif
diff --git a/package/heirloom-mailx/heirloom-mailx.mk b/package/heirloom-mailx/heirloom-mailx.mk
index 2f7e635e0..79098ee20 100644
--- a/package/heirloom-mailx/heirloom-mailx.mk
+++ b/package/heirloom-mailx/heirloom-mailx.mk
@@ -10,8 +10,8 @@ HEIRLOOM_MAILX_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z
 HEIRLOOM_MAILX_LICENSE = BSD-4-Clause, Bellcore (base64), OpenVision (imap_gssapi), RSA Data Security (md5), Network Working Group (hmac), MPL-1.1 (nss)
 HEIRLOOM_MAILX_LICENSE_FILES = COPYING
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-HEIRLOOM_MAILX_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
+HEIRLOOM_MAILX_DEPENDENCIES += libssl
 endif
 
 define HEIRLOOM_MAILX_CONFIGURE_CMDS
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index dc28d1323..799a8b485 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -35,8 +35,8 @@ HOSTAPD_LIBS += -lnl-3 -lm -lpthread
 endif
 
 # Try to use openssl if it's already available
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-HOSTAPD_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
+HOSTAPD_DEPENDENCIES += libssl
 HOSTAPD_LIBS += $(if $(BR2_STATIC_LIBS),-lcrypto -lz)
 HOSTAPD_CONFIG_EDITS += 's/\#\(CONFIG_TLS=openssl\)/\1/'
 else
diff --git a/package/ibrcommon/ibrcommon.mk b/package/ibrcommon/ibrcommon.mk
index 4d2d351c8..237c1bb2f 100644
--- a/package/ibrcommon/ibrcommon.mk
+++ b/package/ibrcommon/ibrcommon.mk
@@ -11,8 +11,8 @@ IBRCOMMON_LICENSE = Apache-2.0
 IBRCOMMON_LICENSE_FILES = COPYING README
 IBRCOMMON_DEPENDENCIES = host-pkgconf
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-IBRCOMMON_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
+IBRCOMMON_DEPENDENCIES += libssl
 IBRCOMMON_CONF_OPTS += --with-openssl
 else
 IBRCOMMON_CONF_OPTS += --without-openssl
diff --git a/package/ibrdtnd/ibrdtnd.mk b/package/ibrdtnd/ibrdtnd.mk
index 0632ed36b..ccfd3039d 100644
--- a/package/ibrdtnd/ibrdtnd.mk
+++ b/package/ibrdtnd/ibrdtnd.mk
@@ -41,9 +41,9 @@ else
 IBRDTND_CONF_OPTS += --without-sqlite
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
 IBRDTND_CONF_OPTS += --with-tls
-IBRDTND_DEPENDENCIES += openssl
+IBRDTND_DEPENDENCIES += libssl
 else
 IBRDTND_CONF_OPTS += --without-tls
 endif
diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index 0ef8b5a52..fef676e13 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -11,9 +11,9 @@ INADYN_LICENSE = GPL-2.0+
 INADYN_LICENSE_FILES = COPYING
 INADYN_DEPENDENCIES = host-pkgconf libconfuse libite
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
 INADYN_CONF_OPTS += --enable-openssl
-INADYN_DEPENDENCIES += openssl
+INADYN_DEPENDENCIES += libssl
 else ifeq ($(BR2_PACKAGE_GNUTLS),y)
 INADYN_DEPENDENCIES += gnutls
 else
diff --git a/package/ipmitool/Config.in b/package/ipmitool/Config.in
index 826bc094b..342bebfe5 100644
--- a/package/ipmitool/Config.in
+++ b/package/ipmitool/Config.in
@@ -11,7 +11,7 @@ if BR2_PACKAGE_IPMITOOL
 
 config BR2_PACKAGE_IPMITOOL_LANPLUS
 	bool "enable lanplus interface"
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	help
 	  Enables the IPMI v2.0 RMCP+ LAN interface typically used to
 	  send IPMI commands to the BMC of a remote server.
diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
index 525466887..ffa90b8c9 100644
--- a/package/ipmitool/ipmitool.mk
+++ b/package/ipmitool/ipmitool.mk
@@ -11,7 +11,7 @@ IPMITOOL_LICENSE = BSD-3-Clause
 IPMITOOL_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_IPMITOOL_LANPLUS),y)
-IPMITOOL_DEPENDENCIES += openssl
+IPMITOOL_DEPENDENCIES += libssl
 IPMITOOL_CONF_OPTS += --enable-intf-lanplus
 else
 IPMITOOL_CONF_OPTS += --disable-intf-lanplus
diff --git a/package/ipmiutil/ipmiutil.mk b/package/ipmiutil/ipmiutil.mk
index a5a6b4931..9764a8f44 100644
--- a/package/ipmiutil/ipmiutil.mk
+++ b/package/ipmiutil/ipmiutil.mk
@@ -14,12 +14,12 @@ IPMIUTIL_AUTORECONF = YES
 IPMIUTIL_MAKE = $(MAKE1)
 
 # forgets to link against libcrypto dependencies breaking static link
-ifeq ($(BR2_PACKAGE_OPENSSL)x$(BR2_STATIC_LIBS),yx)
+ifeq ($(BR2_PACKAGE_LIBSSL)x$(BR2_STATIC_LIBS),yx)
 # tests against distro libcrypto so it might get a false positive when
 # the openssl version is old, so force it off
 # SKIP_MD2 can be used only if ALLOW_GNU is defined.
 IPMIUTIL_CONF_OPTS += CPPFLAGS="$(TARGET_CPPFLAGS) -DALLOW_GNU -DSKIP_MD2"
-IPMIUTIL_DEPENDENCIES += openssl
+IPMIUTIL_DEPENDENCIES += libssl
 else
 IPMIUTIL_CONF_OPTS += --disable-lanplus
 endif
diff --git a/package/ipsec-tools/Config.in b/package/ipsec-tools/Config.in
index 1635675a3..8cd6cac47 100644
--- a/package/ipsec-tools/Config.in
+++ b/package/ipsec-tools/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_IPSEC_TOOLS
 	bool "ipsec-tools"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_TOOLCHAIN_USES_MUSL # Use __P() macro all over the tree
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_FLEX
 	help
 	  This package is required to support IPSec for Linux 2.6+
diff --git a/package/ipsec-tools/ipsec-tools.mk b/package/ipsec-tools/ipsec-tools.mk
index c0b180de5..b974a6563 100644
--- a/package/ipsec-tools/ipsec-tools.mk
+++ b/package/ipsec-tools/ipsec-tools.mk
@@ -9,7 +9,7 @@ IPSEC_TOOLS_SOURCE = ipsec-tools-$(IPSEC_TOOLS_VERSION).tar.bz2
 IPSEC_TOOLS_SITE = http://sourceforge.net/projects/ipsec-tools/files/ipsec-tools/$(IPSEC_TOOLS_VERSION)
 IPSEC_TOOLS_INSTALL_STAGING = YES
 IPSEC_TOOLS_MAKE = $(MAKE1)
-IPSEC_TOOLS_DEPENDENCIES = openssl flex host-flex
+IPSEC_TOOLS_DEPENDENCIES = libssl flex host-flex
 # we patch configure.ac
 IPSEC_TOOLS_AUTORECONF = YES
 
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index b20cd12b7..3fccb06fb 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -47,9 +47,9 @@ else
 IPUTILS_MAKE_OPTS += USE_NETTLE=no
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
 IPUTILS_MAKE_OPTS += USE_CRYPTO=yes
-IPUTILS_DEPENDENCIES += openssl
+IPUTILS_DEPENDENCIES += libssl
 else
 IPUTILS_MAKE_OPTS += USE_CRYPTO=no
 endif
diff --git a/package/irssi/Config.in b/package/irssi/Config.in
index 6361cff31..cd8bd97e6 100644
--- a/package/irssi/Config.in
+++ b/package/irssi/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_IRSSI
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	help
 	  Irssi is a terminal based IRC client for UNIX systems.
 
diff --git a/package/irssi/irssi.mk b/package/irssi/irssi.mk
index d2b816947..6f867b288 100644
--- a/package/irssi/irssi.mk
+++ b/package/irssi/irssi.mk
@@ -11,7 +11,7 @@ IRSSI_SOURCE = irssi-$(IRSSI_VERSION).tar.xz
 IRSSI_SITE = https://github.com/irssi/irssi/releases/download/$(IRSSI_VERSION)
 IRSSI_LICENSE = GPL-2.0+
 IRSSI_LICENSE_FILES = COPYING
-IRSSI_DEPENDENCIES = host-pkgconf libglib2 ncurses openssl
+IRSSI_DEPENDENCIES = host-pkgconf libglib2 ncurses libssl
 
 IRSSI_CONF_OPTS = \
 	--disable-glibtest \
diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 5bd4e9586..cd72c39c0 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -8,7 +8,7 @@ menuconfig BR2_PACKAGE_JANUS_GATEWAY
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBNICE
 	select BR2_PACKAGE_LIBSRTP
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	help
 	  Janus is an open source, general purpose, WebRTC gateway
 	  designed and developed by Meetecho.
diff --git a/package/keepalived/Config.in b/package/keepalived/Config.in
index 0140e62ae..5c24b013c 100644
--- a/package/keepalived/Config.in
+++ b/package/keepalived/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_KEEPALIVED
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS # uses libdl
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_POPT
 	help
 	  The main goal of the keepalived project is to add a strong &
diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index 59d3cb5cf..7ccb865a1 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -6,7 +6,7 @@
 
 KEEPALIVED_VERSION = 1.3.5
 KEEPALIVED_SITE = http://www.keepalived.org/software
-KEEPALIVED_DEPENDENCIES = host-pkgconf openssl popt
+KEEPALIVED_DEPENDENCIES = host-pkgconf libssl popt
 KEEPALIVED_LICENSE = GPL-2.0+
 KEEPALIVED_LICENSE_FILES = COPYING
 KEEPALIVED_CONF_OPTS += --disable-dbus
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 1115a1e92..cf148c888 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -65,7 +65,7 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_LIBSAMPLERATE
 	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_PCRE_UCP
 	select BR2_PACKAGE_PYTHON_BSDDB
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 0bf7331dd..bc0d2e3b4 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -35,7 +35,7 @@ KODI_DEPENDENCIES = \
 	libsamplerate \
 	lzo \
 	ncurses \
-	openssl \
+	libssl \
 	pcre \
 	python \
 	readline \
diff --git a/package/lftp/Config.in b/package/lftp/Config.in
index ebe8882e9..d79bf238c 100644
--- a/package/lftp/Config.in
+++ b/package/lftp/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_LFTP
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_LIBSSL if !BR2_PACKAGE_GNUTLS
 	help
 	  LFTP is a sophisticated ftp/http client, and a file transfer
 	  program supporting a number of network protocols. Like BASH,
diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index de4ebb852..5237fbbbd 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -34,8 +34,8 @@ else
 LFTP_CONF_OPTS += --without-gnutls
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-LFTP_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
+LFTP_DEPENDENCIES += libssl
 LFTP_CONF_OPTS += --with-openssl
 else
 LFTP_CONF_OPTS += --without-openssl
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 9956b63d4..0a33f5574 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -90,8 +90,8 @@ else
 LIBARCHIVE_CONF_OPTS += --without-nettle
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-LIBARCHIVE_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
+LIBARCHIVE_DEPENDENCIES += libssl
 else
 LIBARCHIVE_CONF_OPTS += --without-openssl
 endif
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 684844919..673a32ca6 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -30,8 +30,8 @@ endif
 
 LIBCURL_CONFIG_SCRIPTS = curl-config
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-LIBCURL_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
+LIBCURL_DEPENDENCIES += libssl
 LIBCURL_CONF_ENV += ac_cv_lib_crypto_CRYPTO_lock=yes
 # configure adds the cross openssl dir to LD_LIBRARY_PATH which screws up
 # native stuff during the rest of configure when target == host.
@@ -73,7 +73,7 @@ endif
 define LIBCURL_FIX_DOT_PC
 	printf 'Requires: openssl\n' >>$(@D)/libcurl.pc.in
 endef
-LIBCURL_POST_PATCH_HOOKS += $(if $(BR2_PACKAGE_OPENSSL),LIBCURL_FIX_DOT_PC)
+LIBCURL_POST_PATCH_HOOKS += $(if $(BR2_PACKAGE_LIBSSL),LIBCURL_FIX_DOT_PC)
 
 ifeq ($(BR2_PACKAGE_CURL),)
 define LIBCURL_TARGET_CLEANUP
diff --git a/package/libeXosip2/libeXosip2.mk b/package/libeXosip2/libeXosip2.mk
index 04f8672c4..2a869143c 100644
--- a/package/libeXosip2/libeXosip2.mk
+++ b/package/libeXosip2/libeXosip2.mk
@@ -24,8 +24,8 @@ ifeq ($(BR2_PACKAGE_C_ARES),y)
 LIBEXOSIP2_DEPENDENCIES += c-ares
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-LIBEXOSIP2_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
+LIBEXOSIP2_DEPENDENCIES += libssl
 LIBEXOSIP2_CONF_OPTS += --enable-openssl
 else
 LIBEXOSIP2_CONF_OPTS += --disable-openssl
diff --git a/package/libesmtp/libesmtp.mk b/package/libesmtp/libesmtp.mk
index b0f88c7a3..462dd41b0 100644
--- a/package/libesmtp/libesmtp.mk
+++ b/package/libesmtp/libesmtp.mk
@@ -9,7 +9,7 @@ LIBESMTP_SOURCE = libesmtp-$(LIBESMTP_VERSION).tar.bz2
 LIBESMTP_SITE = http://www.stafford.uklinux.net/libesmtp
 LIBESMTP_INSTALL_STAGING = YES
 LIBESMTP_CONFIG_SCRIPTS = libesmtp-config
-LIBESMTP_DEPENDENCIES = $(if $(BR2_PACKAGE_OPENSSL),openssl)
+LIBESMTP_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBSSL),libssl)
 LIBESMTP_LICENSE = GPL-2.0+ (examples), LGPL-2.1+ (library)
 LIBESMTP_LICENSE_FILES = COPYING COPYING.LIB
 
diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index 36bca0b21..66b2edb51 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -23,8 +23,8 @@ ifneq ($(BR2_PACKAGE_PYTHON),y)
 LIBEVENT_POST_INSTALL_TARGET_HOOKS += LIBEVENT_REMOVE_PYSCRIPT
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-LIBEVENT_DEPENDENCIES += host-pkgconf openssl
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
+LIBEVENT_DEPENDENCIES += host-pkgconf libssl
 LIBEVENT_CONF_OPTS += --enable-openssl
 else
 LIBEVENT_CONF_OPTS += --disable-openssl
diff --git a/package/libfreefare/Config.in b/package/libfreefare/Config.in
index 2bb0c93dd..a2b584247 100644
--- a/package/libfreefare/Config.in
+++ b/package/libfreefare/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBFREEFARE
 	bool "libfreefare"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_LIBNFC
 	help
 	  Library for high level manipulation of MIFARE cards.
diff --git a/package/libfreefare/libfreefare.mk b/package/libfreefare/libfreefare.mk
index 13e6f2ad5..141ad9ae9 100644
--- a/package/libfreefare/libfreefare.mk
+++ b/package/libfreefare/libfreefare.mk
@@ -9,7 +9,7 @@ LIBFREEFARE_SOURCE = libfreefare-$(LIBFREEFARE_VERSION).tar.bz2
 # Do not use the github helper here, the generated tarball is *NOT*
 # the same as the one uploaded by upstream for the release.
 LIBFREEFARE_SITE = https://github.com/nfc-tools/libfreefare/releases/download/libfreefare-$(LIBFREEFARE_VERSION)
-LIBFREEFARE_DEPENDENCIES = libnfc openssl
+LIBFREEFARE_DEPENDENCIES = libnfc libssl
 LIBFREEFARE_LICENSE = LGPL-3.0+ with exception
 LIBFREEFARE_LICENSE_FILES = COPYING
 
diff --git a/package/libldns/Config.in b/package/libldns/Config.in
index 696fec97b..0ed621d2b 100644
--- a/package/libldns/Config.in
+++ b/package/libldns/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBLDNS
 	bool "libldns"
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	help
 	  The goal of ldns is to simplify DNS programming, it supports
 	  recent RFCs like the DNSSEC documents, and allows developers
diff --git a/package/libldns/libldns.mk b/package/libldns/libldns.mk
index d3c89bb6b..f1b4bba31 100644
--- a/package/libldns/libldns.mk
+++ b/package/libldns/libldns.mk
@@ -10,7 +10,7 @@ LIBLDNS_SITE = http://www.nlnetlabs.nl/downloads/ldns
 LIBLDNS_LICENSE = BSD-3-Clause
 LIBLDNS_LICENSE_FILES = LICENSE
 LIBLDNS_INSTALL_STAGING = YES
-LIBLDNS_DEPENDENCIES = openssl
+LIBLDNS_DEPENDENCIES = libssl
 # --disable-dane-verify can be removed after openssl bump to 1.1.x
 LIBLDNS_CONF_OPTS = \
 	--with-ssl=$(STAGING_DIR)/usr \
diff --git a/package/liboauth/Config.in b/package/liboauth/Config.in
index 4ed0efa6b..95d322ba6 100644
--- a/package/liboauth/Config.in
+++ b/package/liboauth/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBOAUTH
 	bool "liboauth"
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	help
 	  liboauth is a collection of c functions implementing the oAuth
 	  Core 1.0 Rev A standard API. liboauth provides basic functions
diff --git a/package/liboauth/liboauth.mk b/package/liboauth/liboauth.mk
index bd54330dd..f7a2c78f3 100644
--- a/package/liboauth/liboauth.mk
+++ b/package/liboauth/liboauth.mk
@@ -7,7 +7,7 @@
 LIBOAUTH_VERSION = 1.0.3
 LIBOAUTH_SITE = http://downloads.sourceforge.net/project/liboauth
 LIBOAUTH_INSTALL_STAGING = YES
-LIBOAUTH_DEPENDENCIES += host-pkgconf openssl
+LIBOAUTH_DEPENDENCIES += host-pkgconf libssl
 LIBOAUTH_LICENSE = MIT
 LIBOAUTH_LICENSE_FILES = COPYING.MIT
 
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 4e2da7d32..281efe176 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -59,8 +59,8 @@ LIBPJSIP_CONF_OPTS = \
 # so we want to use it.
 LIBPJSIP_CONF_OPTS += --enable-epoll
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-LIBPJSIP_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
+LIBPJSIP_DEPENDENCIES += libssl
 LIBPJSIP_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr
 else
 LIBPJSIP_CONF_OPTS += --disable-ssl
diff --git a/package/libshout/libshout.mk b/package/libshout/libshout.mk
index 8fd850fb1..b601ba99f 100644
--- a/package/libshout/libshout.mk
+++ b/package/libshout/libshout.mk
@@ -28,9 +28,9 @@ else
 LIBSHOUT_CONF_OPTS += --disable-speex
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
 LIBSHOUT_CONF_OPTS += --with-openssl
-LIBSHOUT_DEPENDENCIES += openssl
+LIBSHOUT_DEPENDENCIES += libssl
 else
 LIBSHOUT_CONF_OPTS += --without-openssl
 endif
diff --git a/package/libsrtp/libsrtp.mk b/package/libsrtp/libsrtp.mk
index 9e72856c4..c081de71c 100644
--- a/package/libsrtp/libsrtp.mk
+++ b/package/libsrtp/libsrtp.mk
@@ -25,8 +25,8 @@ endif
 LIBSRTP_DEPENDENCIES = host-pkgconf
 
 # openssl handling needs libdl support
-ifeq ($(BR2_PACKAGE_OPENSSL)x$(BR2_STATIC_LIBS),yx)
-LIBSRTP_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBSSL)x$(BR2_STATIC_LIBS),yx)
+LIBSRTP_DEPENDENCIES += libssl
 LIBSRTP_CONF_OPTS += --enable-openssl
 else
 LIBSRTP_CONF_OPTS += --disable-openssl
diff --git a/package/libssh/Config.in b/package/libssh/Config.in
index 3dbfa7d56..6c34d1a07 100644
--- a/package/libssh/Config.in
+++ b/package/libssh/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_LIBSSH
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# Either OpenSSL or libgcrypt are mandatory
-	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBGCRYPT
+	select BR2_PACKAGE_LIBSSL if !BR2_PACKAGE_LIBGCRYPT
 	help
 	  libssh is a multiplatform C library implementing the SSHv2
 	  and SSHv1 protocol on client and server side. With libssh,
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 34716c502..f951cf712 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -30,7 +30,7 @@ LIBSSH_CONF_OPTS += -DWITH_GCRYPT=ON
 LIBSSH_DEPENDENCIES += libgcrypt
 else
 LIBSSH_CONF_OPTS += -DWITH_GCRYPT=OFF
-LIBSSH_DEPENDENCIES += openssl
+LIBSSH_DEPENDENCIES += libssl
 endif
 
 $(eval $(cmake-package))
diff --git a/package/libssh2/Config.in b/package/libssh2/Config.in
index 9b60823e7..3c14c6c14 100644
--- a/package/libssh2/Config.in
+++ b/package/libssh2/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBSSH2
 	bool "libssh2"
-	select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_MBEDTLS || BR2_PACKAGE_LIBGCRYPT)
+	select BR2_PACKAGE_LIBSSL if !(BR2_PACKAGE_MBEDTLS || BR2_PACKAGE_LIBGCRYPT)
 	help
 	  libssh2 is a client-side C library implementing the SSH2
 	  protocol as defined by Internet Drafts: SECSH-TRANS(22),
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index 412793427..4a62e6c43 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -26,7 +26,7 @@ LIBSSH2_CONF_OPTS += --with-libgcrypt=$(STAGING_DIR)/usr \
 # linking
 LIBSSH2_CONF_ENV += LIBS="`$(STAGING_DIR)/usr/bin/libgcrypt-config --libs`"
 else
-LIBSSH2_DEPENDENCIES += openssl
+LIBSSH2_DEPENDENCIES += libssl
 LIBSSH2_CONF_OPTS += --with-openssl \
 	--with-libssl-prefix=$(STAGING_DIR)/usr \
 	--without-libgcrypt --without-mbedtls
diff --git a/package/libstrophe/Config.in b/package/libstrophe/Config.in
index 5fdb918d7..2d2f434ff 100644
--- a/package/libstrophe/Config.in
+++ b/package/libstrophe/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBSTROPHE
 	bool "libstrophe"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_LIBXML2 if !BR2_PACKAGE_EXPAT
 	help
 	  libstrophe is a lightweight XMPP client library written in C.
diff --git a/package/libstrophe/libstrophe.mk b/package/libstrophe/libstrophe.mk
index 4b5a10a55..80f0e0a02 100644
--- a/package/libstrophe/libstrophe.mk
+++ b/package/libstrophe/libstrophe.mk
@@ -6,7 +6,7 @@
 
 LIBSTROPHE_VERSION = 0.8.8
 LIBSTROPHE_SITE = $(call github,strophe,libstrophe,$(LIBSTROPHE_VERSION))
-LIBSTROPHE_DEPENDENCIES = openssl host-pkgconf
+LIBSTROPHE_DEPENDENCIES = libssl host-pkgconf
 # Doesn't ship configure
 LIBSTROPHE_AUTORECONF = YES
 LIBSTROPHE_LICENSE = MIT or GPL-3.0
diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index 8063570d9..04ddf5712 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -29,8 +29,8 @@ LIBVNCSERVER_CONF_OPTS += --without-pthread
 endif
 
 # openssl supports needs NPTL thread support
-ifeq ($(BR2_PACKAGE_OPENSSL)$(BR2_TOOLCHAIN_HAS_THREADS_NPTL),yy)
-LIBVNCSERVER_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBSSL)$(BR2_TOOLCHAIN_HAS_THREADS_NPTL),yy)
+LIBVNCSERVER_DEPENDENCIES += libssl
 else
 LIBVNCSERVER_CONF_OPTS += --without-crypto --without-ssl
 endif
diff --git a/package/libwebsock/libwebsock.mk b/package/libwebsock/libwebsock.mk
index df3af3b05..5ae7299fe 100644
--- a/package/libwebsock/libwebsock.mk
+++ b/package/libwebsock/libwebsock.mk
@@ -12,8 +12,8 @@ LIBWEBSOCK_INSTALL_STAGING = YES
 LIBWEBSOCK_LICENSE = LGPL-3.0
 LIBWEBSOCK_LICENSE_FILES = COPYING.lesser
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-LIBWEBSOCK_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
+LIBWEBSOCK_DEPENDENCIES += libssl
 LIBWEBSOCK_CONF_OPTS += --with-ssl
 else
 LIBWEBSOCK_CONF_OPTS += --without-ssl
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index b29a2f14c..64797bf45 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -22,7 +22,7 @@ LIBWEBSOCKETS_CONF_OPTS += -DLWS_MAX_SMP=
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-LIBWEBSOCKETS_DEPENDENCIES += openssl host-openssl
+LIBWEBSOCKETS_DEPENDENCIES += libssl host-libssl
 LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_SSL=ON
 else
 LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_SSL=OFF
diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index 383c10f70..546627e20 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -22,7 +22,7 @@ if BR2_PACKAGE_LIGHTTPD
 
 config BR2_PACKAGE_LIGHTTPD_OPENSSL
 	bool "openssl support"
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	help
 	  Enable OpenSSL support for lighttpd.
 
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 97ddfc63b..9e8080d1e 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -15,8 +15,8 @@ LIGHTTPD_CONF_OPTS = \
 	--libdir=/usr/lib/lighttpd \
 	--libexecdir=/usr/lib
 
-ifeq ($(BR2_PACKAGE_LIGHTTPD_OPENSSL),y)
-LIGHTTPD_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIGHTTPD_LIBSSL),y)
+LIGHTTPD_DEPENDENCIES += libssl
 LIGHTTPD_CONF_OPTS += --with-openssl
 else
 LIGHTTPD_CONF_OPTS += --without-openssl
diff --git a/package/links/links.mk b/package/links/links.mk
index dd6adb29b..9339d57ad 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -73,9 +73,9 @@ else
 LINKS_CONF_OPTS += --without-libevent
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
 LINKS_CONF_OPTS += --with-ssl --enable-ssl-pkgconfig
-LINKS_DEPENDENCIES += openssl
+LINKS_DEPENDENCIES += libssl
 else
 LINKS_CONF_OPTS += --without-ssl
 endif
diff --git a/package/luacrypto/Config.in b/package/luacrypto/Config.in
index e9d43cd80..29a1bf203 100644
--- a/package/luacrypto/Config.in
+++ b/package/luacrypto/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LUACRYPTO
 	bool "luacrypto"
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	help
 	  LuaCrypto provides a Lua frontend to the OpenSSL cryptographic
 	  library.
diff --git a/package/luacrypto/luacrypto.mk b/package/luacrypto/luacrypto.mk
index b6dbb9999..2b46f6644 100644
--- a/package/luacrypto/luacrypto.mk
+++ b/package/luacrypto/luacrypto.mk
@@ -7,6 +7,6 @@
 LUACRYPTO_VERSION = 0.3.2-1
 LUACRYPTO_LICENSE = MIT
 LUACRYPTO_LICENSE_FILES = $(LUACRYPTO_SUBDIR)/COPYING
-LUACRYPTO_DEPENDENCIES = openssl
+LUACRYPTO_DEPENDENCIES = libssl
 
 $(eval $(luarocks-package))
diff --git a/package/luaossl/Config.in b/package/luaossl/Config.in
index d8763e76a..07e8cd962 100644
--- a/package/luaossl/Config.in
+++ b/package/luaossl/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LUAOSSL
 	bool "luaossl"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	help
 	  luaossl is a comprehensive binding to OpenSSL for Lua 5.1,
 	  5.2, and later.
diff --git a/package/luaossl/luaossl.mk b/package/luaossl/luaossl.mk
index 5bb3e8260..ca993ab30 100644
--- a/package/luaossl/luaossl.mk
+++ b/package/luaossl/luaossl.mk
@@ -9,6 +9,6 @@ LUAOSSL_VERSION = $(LUAOSSL_VERSION_UPSTREAM)-0
 LUAOSSL_SUBDIR = luaossl-rel-$(LUAOSSL_VERSION_UPSTREAM)
 LUAOSSL_LICENSE = MIT
 LUAOSSL_LICENSE_FILES = $(LUAOSSL_SUBDIR)/LICENSE
-LUAOSSL_DEPENDENCIES = openssl
+LUAOSSL_DEPENDENCIES = libssl
 
 $(eval $(luarocks-package))
diff --git a/package/luasec/Config.in b/package/luasec/Config.in
index 9391cd9d3..b340ef6de 100644
--- a/package/luasec/Config.in
+++ b/package/luasec/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LUASEC
 	bool "luasec"
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_LUASOCKET
 	help
 	  LuaSec is a binding for OpenSSL library to provide TLS/SSL
diff --git a/package/luasec/luasec.mk b/package/luasec/luasec.mk
index b059e1c6e..1f32b6268 100644
--- a/package/luasec/luasec.mk
+++ b/package/luasec/luasec.mk
@@ -8,6 +8,6 @@ LUASEC_VERSION = 0.5-2
 LUASEC_SUBDIR = luasec
 LUASEC_LICENSE = MIT
 LUASEC_LICENSE_FILES = $(LUASEC_SUBDIR)/LICENSE
-LUASEC_DEPENDENCIES = openssl
+LUASEC_DEPENDENCIES = libssl
 
 $(eval $(luarocks-package))
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index db538fd0f..4a3648326 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -16,7 +16,7 @@ MARIADB_PROVIDES = mysql
 MARIADB_DEPENDENCIES = \
 	host-mariadb \
 	ncurses \
-	openssl \
+	libssl \
 	zlib \
 	libaio \
 	libxml2 \
diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
index 54c904e51..cc9aa422e 100644
--- a/package/mongodb/mongodb.mk
+++ b/package/mongodb/mongodb.mk
@@ -41,8 +41,8 @@ else
 MONGODB_SCONS_OPTS += --js-engine=none --allocator=system
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-MONGODB_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
+MONGODB_DEPENDENCIES += libssl
 MONGODB_SCONS_OPTS += --ssl=SSL
 endif
 
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 36fd8f899..a0a548fba 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -12,8 +12,8 @@ MONGOOSE_INSTALL_STAGING = YES
 
 MONGOOSE_CFLAGS = $(TARGET_CFLAGS) $(TARGET_LDFLAGS) -DMONGOOSE_NO_DL
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-MONGOOSE_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
+MONGOOSE_DEPENDENCIES += libssl
 # directly linked
 MONGOOSE_CFLAGS += -DNS_ENABLE_SSL -lssl -lcrypto -lz
 endif
diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index 32cef1e9c..f2586e334 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -20,9 +20,9 @@ MONIT_CONF_OPTS += \
 	--without-pam \
 	--with-largefiles
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
 MONIT_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr
-MONIT_DEPENDENCIES += openssl
+MONIT_DEPENDENCIES += libssl
 else
 MONIT_CONF_OPTS += --without-ssl
 endif
diff --git a/package/mosh/Config.in b/package/mosh/Config.in
index da8a305a0..9ca1f7901 100644
--- a/package/mosh/Config.in
+++ b/package/mosh/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_MOSH
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_PROTOBUF
 	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_NETTLE if !BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_NETTLE if !BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_ZLIB
 	# runtime dependency
 	select BR2_PACKAGE_OPENSSH if !BR2_PACKAGE_DROPBEAR_CLIENT
diff --git a/package/mosh/mosh.mk b/package/mosh/mosh.mk
index 06502f6e0..216697443 100644
--- a/package/mosh/mosh.mk
+++ b/package/mosh/mosh.mk
@@ -10,9 +10,9 @@ MOSH_DEPENDENCIES = zlib ncurses protobuf host-pkgconf
 MOSH_LICENSE = GPL-3.0+ with exception
 MOSH_LICENSE_FILES = COPYING COPYING.iOS
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
 MOSH_CONF_OPTS += --with-crypto-library=openssl
-MOSH_DEPENDENCIES += openssl
+MOSH_DEPENDENCIES += libssl
 else
 MOSH_CONF_OPTS += --with-crypto-library=nettle
 MOSH_DEPENDENCIES += nettle
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index c763f48ab..29e252161 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -30,8 +30,8 @@ else
 MOSQUITTO_MAKE_OPTS += WITH_THREADING=no
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-MOSQUITTO_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
+MOSQUITTO_DEPENDENCIES += libssl
 MOSQUITTO_MAKE_OPTS += WITH_TLS=yes
 else
 MOSQUITTO_MAKE_OPTS += WITH_TLS=no
diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index 1821d39ed..6497bd4a3 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -22,9 +22,9 @@ else
 MSMTP_CONF_OPTS += --without-libsecret
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
 MSMTP_CONF_OPTS += --with-ssl=openssl
-MSMTP_DEPENDENCIES += openssl
+MSMTP_DEPENDENCIES += libssl
 ifeq ($(BR2_STATIC_LIBS),y)
 # openssl uses zlib, so we need to explicitly link with it when static
 MSMTP_CONF_ENV += LIBS=-lz
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index abd40e5dd..24a88c85b 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -37,8 +37,8 @@ endif
 
 # SSL support is only used by imap or pop3 module
 ifneq ($(BR2_PACKAGET_MUTT_IMAP)$(BR2_PACKAGE_MUTT_POP3),)
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-MUTT_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
+MUTT_DEPENDENCIES += libssl
 MUTT_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr
 else
 MUTT_CONF_OPTS += --without-ssl
diff --git a/package/mysql/Config.in b/package/mysql/Config.in
index 69ad58654..882342e99 100644
--- a/package/mysql/Config.in
+++ b/package/mysql/Config.in
@@ -20,7 +20,7 @@ config BR2_PACKAGE_MARIADB
 	select BR2_PACKAGE_LIBAIO
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_HAS_MYSQL
 	help
diff --git a/package/neon/Config.in b/package/neon/Config.in
index 983134339..8bffea643 100644
--- a/package/neon/Config.in
+++ b/package/neon/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_NEON_ZLIB
 
 config BR2_PACKAGE_NEON_SSL
 	bool "SSL support"
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	help
 	  build with SSL support
 
diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index 1b8eb368c..b10fd8092 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -22,7 +22,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_NEON_SSL),y)
 NEON_CONF_OPTS += --with-ssl
-NEON_DEPENDENCIES += openssl
+NEON_DEPENDENCIES += libssl
 else
 NEON_CONF_OPTS += --without-ssl
 endif
diff --git a/package/netatalk/Config.in b/package/netatalk/Config.in
index ce1731830..d6e96c0e0 100644
--- a/package/netatalk/Config.in
+++ b/package/netatalk/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_NETATALK
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_BERKELEYDB
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_LIBEVENT
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBGPG_ERROR
diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index 8e661a04a..5742eafd0 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -10,7 +10,7 @@ NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.bz2
 # For 0001-Fix-setting-of-LD_LIBRARY_FLAGS-shlibpath_var.patch
 NETATALK_AUTORECONF = YES
 NETATALK_CONFIG_SCRIPTS = netatalk-config
-NETATALK_DEPENDENCIES = host-pkgconf openssl berkeleydb libgcrypt libgpg-error \
+NETATALK_DEPENDENCIES = host-pkgconf libssl berkeleydb libgcrypt libgpg-error \
 	libevent
 NETATALK_LICENSE = GPL-2.0+, LGPL-3.0+, MIT-like
 NETATALK_LICENSE_FILES = COPYING COPYRIGHT
diff --git a/package/netsnmp/Config.in b/package/netsnmp/Config.in
index 57cc6b93f..3e7dce9c4 100644
--- a/package/netsnmp/Config.in
+++ b/package/netsnmp/Config.in
@@ -52,7 +52,7 @@ config BR2_PACKAGE_NETSNMP_ENABLE_DEBUGGING
 
 config BR2_PACKAGE_NETSNMP_OPENSSL_INTERNAL
 	bool "Enable minimal internal OpenSSL code"
-	depends on !BR2_PACKAGE_OPENSSL
+	depends on !BR2_PACKAGE_LIBSSL
 	help
 	  Enable a minimal internal copy of OpenSSL usable for USM
 	  security. It will not enable the usage of SNMP over (D)TLS.
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index abcf63d56..c394b7ead 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -54,8 +54,8 @@ NETSNMP_CONF_OPTS += --without-nl
 endif
 
 # OpenSSL
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-NETSNMP_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
+NETSNMP_DEPENDENCIES += libssl
 NETSNMP_CONF_OPTS += \
 	--with-openssl=$(STAGING_DIR)/usr/include/openssl \
 	--with-security-modules="tsm,usm" \
diff --git a/package/nginx-upload/Config.in b/package/nginx-upload/Config.in
index 6bc1c3dbd..c7d1207b5 100644
--- a/package/nginx-upload/Config.in
+++ b/package/nginx-upload/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_NGINX_UPLOAD
 	bool "nginx-upload"
 	depends on BR2_PACKAGE_NGINX_HTTP
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	help
 	  A module for nginx web server for handling file uploads
 	  using multipart/form-data encoding (RFC 1867).
diff --git a/package/nginx-upload/nginx-upload.mk b/package/nginx-upload/nginx-upload.mk
index 738542571..62085df1e 100644
--- a/package/nginx-upload/nginx-upload.mk
+++ b/package/nginx-upload/nginx-upload.mk
@@ -8,6 +8,6 @@ NGINX_UPLOAD_VERSION = 70bee48f1811eecd255ed094ce9f0fb560c390c3
 NGINX_UPLOAD_SITE = $(call github,vkholodkov,nginx-upload-module,$(NGINX_UPLOAD_VERSION))
 NGINX_UPLOAD_LICENSE = BSD-3-Clause
 NGINX_UPLOAD_LICENSE_FILES = LICENCE
-NGINX_UPLOAD_DEPENDENCIES = openssl
+NGINX_UPLOAD_DEPENDENCIES = libssl
 
 $(eval $(generic-package))
diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index 36fa69cd2..5cc63f4c9 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -34,13 +34,13 @@ if BR2_PACKAGE_NGINX_HTTP
 
 config BR2_PACKAGE_NGINX_HTTP_CACHE
 	bool "http cache support"
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 
 comment "http modules"
 
 config BR2_PACKAGE_NGINX_HTTP_SSL_MODULE
 	bool "ngx_http_ssl_module"
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	help
 	  Enable ngx_http_ssl_module
 
@@ -119,7 +119,7 @@ config BR2_PACKAGE_NGINX_HTTP_RANDOM_INDEX_MODULE
 
 config BR2_PACKAGE_NGINX_HTTP_SECURE_LINK_MODULE
 	bool "ngx_http_secure_link_module"
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	help
 	  Enable ngx_http_secure_link_module
 
@@ -288,7 +288,7 @@ if BR2_PACKAGE_NGINX_MAIL
 
 config BR2_PACKAGE_NGINX_MAIL_SSL_MODULE
 	bool "ngx_mail_ssl_module"
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	help
 	  Enable ngx_mail_ssl_module
 
@@ -319,7 +319,7 @@ if BR2_PACKAGE_NGINX_STREAM
 
 config BR2_PACKAGE_NGINX_STREAM_SSL_MODULE
 	bool "ngx_stream_ssl_module"
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	help
 	  Enable ngx_stream_ssl_module
 
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index ceb80229d..2389cdd45 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -110,7 +110,7 @@ endif
 # http server modules
 ifeq ($(BR2_PACKAGE_NGINX_HTTP),y)
 ifeq ($(BR2_PACKAGE_NGINX_HTTP_CACHE),y)
-NGINX_DEPENDENCIES += openssl
+NGINX_DEPENDENCIES += libssl
 else
 NGINX_CONF_OPTS += --without-http-cache
 endif
@@ -121,7 +121,7 @@ NGINX_CONF_OPTS += --with-http_v2_module
 endif
 
 ifeq ($(BR2_PACKAGE_NGINX_HTTP_SSL_MODULE),y)
-NGINX_DEPENDENCIES += openssl
+NGINX_DEPENDENCIES += libssl
 NGINX_CONF_OPTS += --with-http_ssl_module
 endif
 
@@ -146,7 +146,7 @@ NGINX_CONF_OPTS += --with-http_gzip_static_module
 endif
 
 ifeq ($(BR2_PACKAGE_NGINX_HTTP_SECURE_LINK_MODULE),y)
-NGINX_DEPENDENCIES += openssl
+NGINX_DEPENDENCIES += libssl
 NGINX_CONF_OPTS += --with-http_secure_link_module
 endif
 
@@ -205,7 +205,7 @@ ifeq ($(BR2_PACKAGE_NGINX_MAIL),y)
 NGINX_CONF_OPTS += --with-mail
 
 ifeq ($(BR2_PACKAGE_NGINX_MAIL_SSL_MODULE),y)
-NGINX_DEPENDENCIES += openssl
+NGINX_DEPENDENCIES += libssl
 NGINX_CONF_OPTS += --with-mail_ssl_module
 endif
 
@@ -221,7 +221,7 @@ ifeq ($(BR2_PACKAGE_NGINX_STREAM),y)
 NGINX_CONF_OPTS += --with-stream
 
 ifeq ($(BR2_PACKAGE_NGINX_STREAM_SSL_MODULE),y)
-NGINX_DEPENDENCIES += openssl
+NGINX_DEPENDENCIES += libssl
 NGINX_CONF_OPTS += --with-stream_ssl_module
 endif
 
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index 37720e2ca..5d39a2bcf 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -27,9 +27,9 @@ define NMAP_WRAPPER_EXEC
 endef
 NMAP_POST_PATCH_HOOKS += NMAP_WRAPPER_EXEC
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
 NMAP_CONF_OPTS += --with-openssl="$(STAGING_DIR)/usr"
-NMAP_DEPENDENCIES += host-pkgconf openssl
+NMAP_DEPENDENCIES += host-pkgconf libssl
 NMAP_LIBS_FOR_STATIC_LINK += `$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 else
 NMAP_CONF_OPTS += --without-openssl
diff --git a/package/ntp/Config.in b/package/ntp/Config.in
index 1af02dbc0..5dae08564 100644
--- a/package/ntp/Config.in
+++ b/package/ntp/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_NTP
 	bool "ntp"
 	select BR2_PACKAGE_LIBEVENT
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	help
 	  Network Time Protocol suite/programs.
 	  Provides things like ntpd, ntpdate, ntpq, etc...
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index c70d6e635..391d99de2 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -7,7 +7,7 @@
 NTP_VERSION_MAJOR = 4.2
 NTP_VERSION = $(NTP_VERSION_MAJOR).8p10
 NTP_SITE = https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-$(NTP_VERSION_MAJOR)
-NTP_DEPENDENCIES = host-pkgconf libevent openssl $(if $(BR2_PACKAGE_BUSYBOX),busybox)
+NTP_DEPENDENCIES = host-pkgconf libevent libssl $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 NTP_LICENSE = NTP
 NTP_LICENSE_FILES = COPYRIGHT
 NTP_CONF_ENV = ac_cv_lib_md5_MD5Init=no
diff --git a/package/nut/nut.mk b/package/nut/nut.mk
index 332ccf907..8f9a18c2c 100644
--- a/package/nut/nut.mk
+++ b/package/nut/nut.mk
@@ -82,8 +82,8 @@ else
 NUT_CONF_OPTS += --without-snmp
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-NUT_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
+NUT_DEPENDENCIES += libssl
 NUT_CONF_OPTS += --with-ssl
 else
 NUT_CONF_OPTS += --without-ssl
diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
index 557e5d161..af095de6f 100644
--- a/package/omniorb/omniorb.mk
+++ b/package/omniorb/omniorb.mk
@@ -27,9 +27,9 @@ HOST_OMNIORB_CONF_OPTS = ac_cv_path_PYTHON=$(HOST_DIR)/bin/python2
 OMNIORB_CONF_OPTS += --disable-longdouble
 HOST_OMNIORB_CONF_OPTS += --disable-longdouble
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
 OMNIORB_CONF_OPTS += --with-openssl
-OMNIORB_DEPENDENCIES += openssl
+OMNIORB_DEPENDENCIES += libssl
 else
 OMNIORB_CONF_OPTS += --without-openssl
 endif
diff --git a/package/openipmi/openipmi.mk b/package/openipmi/openipmi.mk
index 3f4f11113..b5beb7c4c 100644
--- a/package/openipmi/openipmi.mk
+++ b/package/openipmi/openipmi.mk
@@ -27,8 +27,8 @@ ifeq ($(BR2_PACKAGE_GDBM),y)
 OPENIPMI_DEPENDENCIES += gdbm
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-OPENIPMI_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
+OPENIPMI_DEPENDENCIES += libssl
 OPENIPMI_CONF_OPTS += --with-openssl=yes
 else
 OPENIPMI_CONF_OPTS += --with-openssl=no
diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
index 90ff1123b..f86ecb79e 100644
--- a/package/openldap/openldap.mk
+++ b/package/openldap/openldap.mk
@@ -12,9 +12,9 @@ OPENLDAP_LICENSE_FILES = LICENSE
 OPENLDAP_INSTALL_STAGING = YES
 OPENLDAP_DEPENDENCIES = host-pkgconf
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
 OPENLDAP_TLS = openssl
-OPENLDAP_DEPENDENCIES += openssl
+OPENLDAP_DEPENDENCIES += libssl
 else ifeq ($(BR2_PACKAGE_GNUTLS),y)
 OPENLDAP_TLS = gnutls
 OPENLDAP_DEPENDENCIES += gnutls
@@ -28,9 +28,9 @@ else
 OPENLDAP_TLS = no
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
 OPENLDAP_MP = bignum
-OPENLDAP_DEPENDENCIES += openssl
+OPENLDAP_DEPENDENCIES += libssl
 OPENLDAP_CONF_ENV = LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libssl libcrypto`"
 else ifeq ($(BR2_PACKAGE_GMP),y)
 OPENLDAP_MP = gmp
diff --git a/package/openssh/Config.in b/package/openssh/Config.in
index 75911402a..a21ea5f73 100644
--- a/package/openssh/Config.in
+++ b/package/openssh/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_OPENSSH
 	bool "openssh"
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_ZLIB
 	help
 	  A free version of the SSH protocol suite of network connectivity
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 38a32bf54..ec127d491 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -30,7 +30,7 @@ ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
 OPENSSH_CONF_OPTS += --without-pie
 endif
 
-OPENSSH_DEPENDENCIES = zlib openssl
+OPENSSH_DEPENDENCIES = zlib libssl
 
 ifeq ($(BR2_PACKAGE_CRYPTODEV_LINUX),y)
 OPENSSH_DEPENDENCIES += cryptodev-linux
diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
index d9628edd9..157d382a3 100644
--- a/package/openswan/openswan.mk
+++ b/package/openswan/openswan.mk
@@ -20,8 +20,8 @@ OPENSWAN_DEPENDENCIES += libcurl
 OPENSWAN_MAKE_OPTS += USE_LIBCURL=true
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-OPENSWAN_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
+OPENSWAN_DEPENDENCIES += libssl
 OPENSWAN_MAKE_OPTS += HAVE_OPENSSL=true
 ifeq ($(BR2_PACKAGE_OCF_LINUX),y)
 OPENSWAN_MAKE_OPTS += HAVE_OCF=true
diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index cc71324ff..6c4860ff2 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -25,9 +25,9 @@ ifeq ($(BR2_PACKAGE_LIBFUSE),y)
 OPENVMTOOLS_DEPENDENCIES += libfuse
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
 OPENVMTOOLS_CONF_OPTS += --with-ssl
-OPENVMTOOLS_DEPENDENCIES += openssl
+OPENVMTOOLS_DEPENDENCIES += libssl
 else
 OPENVMTOOLS_CONF_OPTS += --without-ssl
 endif
diff --git a/package/openvpn/Config.in b/package/openvpn/Config.in
index 0a1675573..304986123 100644
--- a/package/openvpn/Config.in
+++ b/package/openvpn/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_OPENVPN
 	bool "openvpn"
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	help
 	  OpenVPN is a full-featured SSL VPN solution which can
 	  accomodate a wide range of configurations, including road
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 7cc572e4e..bc849590c 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -7,7 +7,7 @@
 OPENVPN_VERSION = 2.4.3
 OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
-OPENVPN_DEPENDENCIES = host-pkgconf openssl
+OPENVPN_DEPENDENCIES = host-pkgconf libssl
 OPENVPN_LICENSE = GPL-2.0
 OPENVPN_LICENSE_FILES = COPYRIGHT.GPL
 OPENVPN_CONF_OPTS = \
diff --git a/package/opusfile/opusfile.mk b/package/opusfile/opusfile.mk
index 846eedd22..3391d0623 100644
--- a/package/opusfile/opusfile.mk
+++ b/package/opusfile/opusfile.mk
@@ -11,8 +11,8 @@ OPUSFILE_LICENSE = BSD-3-Clause
 OPUSFILE_LICENSE_FILES = COPYING
 OPUSFILE_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-OPUSFILE_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
+OPUSFILE_DEPENDENCIES += libssl
 else
 OPUSFILE_CONF_OPTS += --disable-http
 endif
diff --git a/package/oracle-mysql/oracle-mysql.mk b/package/oracle-mysql/oracle-mysql.mk
index 7da5c547d..10c64f2bd 100644
--- a/package/oracle-mysql/oracle-mysql.mk
+++ b/package/oracle-mysql/oracle-mysql.mk
@@ -61,8 +61,8 @@ define HOST_ORACLE_MYSQL_INSTALL_CMDS
 	$(INSTALL) -m 0755  $(@D)/sql/gen_lex_hash $(HOST_DIR)/bin/
 endef
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-ORACLE_MYSQL_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
+ORACLE_MYSQL_DEPENDENCIES += libssl
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
diff --git a/package/paho-mqtt-c/paho-mqtt-c.mk b/package/paho-mqtt-c/paho-mqtt-c.mk
index 22ef2effa..8bab7fd47 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.mk
+++ b/package/paho-mqtt-c/paho-mqtt-c.mk
@@ -10,8 +10,8 @@ PAHO_MQTT_C_LICENSE = EPL-1.0 or BSD-3-Clause
 PAHO_MQTT_C_LICENSE_FILES = epl-v10 edl-v10
 PAHO_MQTT_C_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-PAHO_MQTT_C_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
+PAHO_MQTT_C_DEPENDENCIES += libssl
 PAHO_MQTT_C_CONF_OPTS += -DPAHO_WITH_SSL=TRUE
 else
 PAHO_MQTT_C_CONF_OPTS += -DPAHO_WITH_SSL=FALSE
diff --git a/package/perl-crypt-openssl-random/Config.in b/package/perl-crypt-openssl-random/Config.in
index 2ceb78dfd..c26449f61 100644
--- a/package/perl-crypt-openssl-random/Config.in
+++ b/package/perl-crypt-openssl-random/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PERL_CRYPT_OPENSSL_RANDOM
 	bool "perl-crypt-openssl-random"
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	help
 	  OpenSSL/LibreSSL pseudo-random number generator access
 
diff --git a/package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk b/package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk
index de029e9af..f575d0de4 100644
--- a/package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk
+++ b/package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk
@@ -7,7 +7,7 @@
 PERL_CRYPT_OPENSSL_RANDOM_VERSION = 0.11
 PERL_CRYPT_OPENSSL_RANDOM_SOURCE = Crypt-OpenSSL-Random-$(PERL_CRYPT_OPENSSL_RANDOM_VERSION).tar.gz
 PERL_CRYPT_OPENSSL_RANDOM_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RURBAN
-PERL_CRYPT_OPENSSL_RANDOM_DEPENDENCIES = openssl
+PERL_CRYPT_OPENSSL_RANDOM_DEPENDENCIES = libssl
 PERL_CRYPT_OPENSSL_RANDOM_LICENSE = Artistic or GPL-1.0+
 PERL_CRYPT_OPENSSL_RANDOM_LICENSE_FILES = LICENSE
 
diff --git a/package/perl-net-ssleay/Config.in b/package/perl-net-ssleay/Config.in
index 80178e0b9..a2bc63018 100644
--- a/package/perl-net-ssleay/Config.in
+++ b/package/perl-net-ssleay/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PERL_NET_SSLEAY
 	bool "perl-net-ssleay"
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	help
 	  Perl extension for using OpenSSL
 
diff --git a/package/perl-net-ssleay/perl-net-ssleay.mk b/package/perl-net-ssleay/perl-net-ssleay.mk
index 03a039e06..575ab7f38 100644
--- a/package/perl-net-ssleay/perl-net-ssleay.mk
+++ b/package/perl-net-ssleay/perl-net-ssleay.mk
@@ -7,7 +7,7 @@
 PERL_NET_SSLEAY_VERSION = 1.72
 PERL_NET_SSLEAY_SOURCE = Net-SSLeay-$(PERL_NET_SSLEAY_VERSION).tar.gz
 PERL_NET_SSLEAY_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIKEM
-PERL_NET_SSLEAY_DEPENDENCIES = openssl
+PERL_NET_SSLEAY_DEPENDENCIES = libssl
 PERL_NET_SSLEAY_LICENSE = OpenSSL
 PERL_NET_SSLEAY_LICENSE_FILES = LICENSE
 
diff --git a/package/php/php.mk b/package/php/php.mk
index b1bd97ca9..8c3afd783 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -129,7 +129,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_OPENSSL),y)
 PHP_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
-PHP_DEPENDENCIES += openssl
+PHP_DEPENDENCIES += libssl
 # openssl needs zlib, but the configure script forgets to link against
 # it causing detection failures with static linking
 PHP_STATIC_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs openssl`
diff --git a/package/poco/Config.in b/package/poco/Config.in
index b3b247f90..677dc54d1 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -30,14 +30,14 @@ config BR2_PACKAGE_POCO_NET
 
 config BR2_PACKAGE_POCO_CRYPTO
 	bool "crypto"
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 
 config BR2_PACKAGE_POCO_NETSSL_OPENSSL
 	bool "netssl_openssl"
 	select BR2_PACKAGE_POCO_NET
 	select BR2_PACKAGE_POCO_CRYPTO
 	select BR2_PACKAGE_POCO_UTIL
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 
 config BR2_PACKAGE_POCO_ZIP
 	bool "zip"
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 62b41cbea..1af5076b9 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -53,8 +53,8 @@ POSTGRESQL_DEPENDENCIES += host-zic
 POSTGRESQL_CONF_ENV += ZIC="$(ZIC)"
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-POSTGRESQL_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
+POSTGRESQL_DEPENDENCIES += libssl
 POSTGRESQL_CONF_OPTS += --with-openssl
 endif
 
diff --git a/package/pound/Config.in b/package/pound/Config.in
index 91c29ea7a..c22e71fd7 100644
--- a/package/pound/Config.in
+++ b/package/pound/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_POUND
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	help
 	  The Pound program is a reverse proxy, load balancer and HTTPS
 	  front-end for Web server(s). Pound was developed to enable
diff --git a/package/pound/pound.mk b/package/pound/pound.mk
index 6f7cc848f..9bf06a5b1 100644
--- a/package/pound/pound.mk
+++ b/package/pound/pound.mk
@@ -9,7 +9,7 @@ POUND_SITE = http://www.apsis.ch/pound
 POUND_SOURCE = Pound-$(POUND_VERSION).tgz
 POUND_LICENSE = GPL-3.0+
 POUND_LICENSE_FILES = GPL.txt
-POUND_DEPENDENCIES = openssl
+POUND_DEPENDENCIES = libssl
 
 # Force owner/group to us, otherwise it will try proxy:proxy by
 # default.
diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index 0bb5f3cd4..08af34186 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -31,9 +31,9 @@ ifeq ($(BR2_PACKAGE_LIBSODIUM),y)
 PURE_FTPD_DEPENDENCIES += libsodium
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
 PURE_FTPD_CONF_OPTS += --with-tls
-PURE_FTPD_DEPENDENCIES += openssl
+PURE_FTPD_DEPENDENCIES += libssl
 ifeq ($(BR2_STATIC_LIBS),y)
 PURE_FTPD_CONF_ENV += LIBS='-lssl -lcrypto -lz'
 endif
diff --git a/package/python/Config.in b/package/python/Config.in
index 054ccd2aa..07e4bb0df 100644
--- a/package/python/Config.in
+++ b/package/python/Config.in
@@ -75,7 +75,7 @@ config BR2_PACKAGE_PYTHON_READLINE
 
 config BR2_PACKAGE_PYTHON_SSL
 	bool "ssl"
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	help
 	  _ssl module for Python (required for https in urllib etc).
 
@@ -123,7 +123,7 @@ config BR2_PACKAGE_PYTHON_ZLIB
 
 config BR2_PACKAGE_PYTHON_HASHLIB
 	bool "hashlib module"
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	help
 	  hashlib support in Python
 
diff --git a/package/python/python.mk b/package/python/python.mk
index cf1ddfb57..a9d741eae 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -92,7 +92,7 @@ PYTHON_CONF_OPTS += --disable-sqlite3
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON_SSL),y)
-PYTHON_DEPENDENCIES += openssl
+PYTHON_DEPENDENCIES += libssl
 else
 PYTHON_CONF_OPTS += --disable-ssl
 endif
@@ -126,7 +126,7 @@ PYTHON_CONF_OPTS += --disable-zlib
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON_HASHLIB),y)
-PYTHON_DEPENDENCIES += openssl
+PYTHON_DEPENDENCIES += libssl
 else
 PYTHON_CONF_OPTS += --disable-hashlib
 endif
diff --git a/package/python3/Config.in b/package/python3/Config.in
index 35f57e65c..cd958f487 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -76,7 +76,7 @@ config BR2_PACKAGE_PYTHON3_READLINE
 
 config BR2_PACKAGE_PYTHON3_SSL
 	bool "ssl"
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	help
 	  _ssl module for Python3 (required for https in urllib etc).
 
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 80905ddbf..8322d2ce8 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -91,7 +91,7 @@ PYTHON3_CONF_OPTS += --disable-sqlite3
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_SSL),y)
-PYTHON3_DEPENDENCIES += openssl
+PYTHON3_DEPENDENCIES += libssl
 else
 PYTHON3_CONF_OPTS += --disable-openssl
 endif
diff --git a/package/qt-webkit-kiosk/Config.in b/package/qt-webkit-kiosk/Config.in
index 71b4f8346..998577e8c 100644
--- a/package/qt-webkit-kiosk/Config.in
+++ b/package/qt-webkit-kiosk/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_QT_WEBKIT_KIOSK
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # qt5webkit -> icu
 	depends on !BR2_BINFMT_FLAT # qt5webkit -> icu
 	depends on !BR2_MIPS_SOFT_FLOAT # qt5webkit
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_WIDGETS
 	select BR2_PACKAGE_QT5WEBKIT
diff --git a/package/qt/Config.in b/package/qt/Config.in
index 7710b09d2..959a968d1 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -483,7 +483,7 @@ config BR2_PACKAGE_QT_STL
 config BR2_PACKAGE_QT_OPENSSL
 	bool "Enable OpenSSL support"
 	depends on BR2_PACKAGE_QT_NETWORK
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	help
 	  Enable support for the OpenSSL encryption library. If you use
 	  QSslSocket say y here, otherwise, say no to save space on the
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 1dcb05d6a..6c2105769 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -324,7 +324,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_QT_OPENSSL),y)
 QT_CONFIGURE_OPTS += -openssl
-QT_DEPENDENCIES += openssl
+QT_DEPENDENCIES += libssl
 else
 QT_CONFIGURE_OPTS += -no-openssl
 endif
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index bbbdd4120..daeebff7b 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -148,8 +148,8 @@ else
 QT5BASE_CONFIGURE_OPTS += -no-eglfs
 endif
 
-QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_OPENSSL),-openssl,-no-openssl)
-QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_OPENSSL),openssl)
+QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_LIBSSL),-openssl,-no-openssl)
+QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_LIBSSL),libssl)
 
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_FONTCONFIG),-fontconfig,-no-fontconfig)
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_FONTCONFIG),fontconfig)
diff --git a/package/qt5/qt5enginio/Config.in b/package/qt5/qt5enginio/Config.in
index 102058e7c..13ae5358f 100644
--- a/package/qt5/qt5enginio/Config.in
+++ b/package/qt5/qt5enginio/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_QT5ENGINIO
 	bool "qt5enginio"
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_NETWORK
diff --git a/package/qt5/qt5enginio/qt5enginio.mk b/package/qt5/qt5enginio/qt5enginio.mk
index 5590d7cf4..dcd61ff40 100644
--- a/package/qt5/qt5enginio/qt5enginio.mk
+++ b/package/qt5/qt5enginio/qt5enginio.mk
@@ -9,7 +9,7 @@
 QT5ENGINIO_VERSION = 1.6.2
 QT5ENGINIO_SITE = $(QT5_SITE)
 QT5ENGINIO_SOURCE = qtenginio-opensource-src-$(QT5ENGINIO_VERSION).tar.xz
-QT5ENGINIO_DEPENDENCIES = openssl qt5base
+QT5ENGINIO_DEPENDENCIES = libssl qt5base
 QT5ENGINIO_INSTALL_STAGING = YES
 
 QT5ENGINIO_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
diff --git a/package/rabbitmq-c/rabbitmq-c.mk b/package/rabbitmq-c/rabbitmq-c.mk
index eef09ec0b..d8c80be17 100644
--- a/package/rabbitmq-c/rabbitmq-c.mk
+++ b/package/rabbitmq-c/rabbitmq-c.mk
@@ -24,9 +24,9 @@ endif
 # CMake OpenSSL detection is buggy, and doesn't properly use
 # pkg-config, so it fails when statically linking. See
 # https://gitlab.kitware.com/cmake/cmake/issues/16885.
-ifeq ($(BR2_PACKAGE_OPENSSL):$(BR2_STATIC_LIBS),y:)
+ifeq ($(BR2_PACKAGE_LIBSSL):$(BR2_STATIC_LIBS),y:)
 RABBITMQ_C_CONF_OPTS += -DENABLE_SSL_SUPPORT=ON
-RABBITMQ_C_DEPENDENCIES += openssl
+RABBITMQ_C_DEPENDENCIES += libssl
 else
 RABBITMQ_C_CONF_OPTS += -DENABLE_SSL_SUPPORT=OFF
 endif
diff --git a/package/rabbitmq-server/Config.in b/package/rabbitmq-server/Config.in
index 6a323aff9..f3572d7db 100644
--- a/package/rabbitmq-server/Config.in
+++ b/package/rabbitmq-server/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_RABBITMQ_SERVER
 	bool "rabbitmq-server"
 	depends on BR2_PACKAGE_ERLANG
 	select BR2_PACKAGE_LIBXSLT
-	select BR2_PACKAGE_OPENSSL # Required to build Erlang's crypto and ssl
+	select BR2_PACKAGE_LIBSSL # Required to build Erlang's crypto and ssl
 	                           # applications
 	help
 	  High-performance AMQP-compliant message broker written in Erlang.
diff --git a/package/rdesktop/Config.in b/package/rdesktop/Config.in
index 0335bee2a..aff0e0c6a 100644
--- a/package/rdesktop/Config.in
+++ b/package/rdesktop/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_RDESKTOP
 	bool "rdesktop"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXT
 	help
diff --git a/package/rdesktop/rdesktop.mk b/package/rdesktop/rdesktop.mk
index da8a80ef9..0da9ee266 100644
--- a/package/rdesktop/rdesktop.mk
+++ b/package/rdesktop/rdesktop.mk
@@ -6,7 +6,7 @@
 
 RDESKTOP_VERSION = 1.8.3
 RDESKTOP_SITE = http://downloads.sourceforge.net/project/rdesktop/rdesktop/$(RDESKTOP_VERSION)
-RDESKTOP_DEPENDENCIES = host-pkgconf openssl xlib_libX11 xlib_libXt \
+RDESKTOP_DEPENDENCIES = host-pkgconf libssl xlib_libX11 xlib_libXt \
 	$(if $(BR2_PACKAGE_ALSA_LIB_PCM),alsa-lib) \
 	$(if $(BR2_PACKAGE_LIBAO),libao) \
 	$(if $(BR2_PACKAGE_LIBSAMPLERATE),libsamplerate)
diff --git a/package/rhash/rhash.mk b/package/rhash/rhash.mk
index 53f49d8d3..1efe679da 100644
--- a/package/rhash/rhash.mk
+++ b/package/rhash/rhash.mk
@@ -14,8 +14,8 @@ RHASH_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 RHASH_ADDLDFLAGS = $(TARGET_NLS_LIBS)
 RHASH_ADDCFLAGS = $(if $(BR2_SYSTEM_ENABLE_NLS),-DUSE_GETTEXT)
 
-ifeq ($(BR2_PACKAGE_OPENSSL)x$(BR2_STATIC_LIBS),yx)
-RHASH_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBSSL)x$(BR2_STATIC_LIBS),yx)
+RHASH_DEPENDENCIES += libssl
 RHASH_ADDCFLAGS += -DOPENSSL_RUNTIME -rdynamic
 RHASH_ADDLDFLAGS += -ldl
 endif
diff --git a/package/rtmpdump/rtmpdump.mk b/package/rtmpdump/rtmpdump.mk
index f5d430ce3..4ff5c4545 100644
--- a/package/rtmpdump/rtmpdump.mk
+++ b/package/rtmpdump/rtmpdump.mk
@@ -16,8 +16,8 @@ RTMPDUMP_DEPENDENCIES = zlib
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 RTMPDUMP_DEPENDENCIES += gnutls
 RTMPDUMP_CRYPTO = GNUTLS
-else ifeq ($(BR2_PACKAGE_OPENSSL),y)
-RTMPDUMP_DEPENDENCIES += openssl
+else ifeq ($(BR2_PACKAGE_LIBSSL),y)
+RTMPDUMP_DEPENDENCIES += libssl
 RTMPDUMP_CRYPTO = OPENSSL
 else
 # no crypto
diff --git a/package/rtorrent/Config.in b/package/rtorrent/Config.in
index 190e50fe2..4fbaa595e 100644
--- a/package/rtorrent/Config.in
+++ b/package/rtorrent/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_RTORRENT
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBTORRENT
 	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	help
 	  BitTorrent Client using libtorrent
 
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 330281189..5f72595c3 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -64,8 +64,8 @@ endif
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 RUBY_DEPENDENCIES += ncurses
 endif
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-RUBY_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
+RUBY_DEPENDENCIES += libssl
 endif
 ifeq ($(BR2_PACKAGE_READLINE),y)
 RUBY_DEPENDENCIES += readline
diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index cf7bcbcb1..cd4af7708 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -22,8 +22,8 @@ SCONESERVER_CONF_OPTS += \
 	--with-xml2-config="$(STAGING_DIR)/usr/bin/xml2-config"
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-SCONESERVER_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
+SCONESERVER_DEPENDENCIES += libssl
 SCONESERVER_CONF_OPTS += --with-ssl
 ifeq ($(BR2_STATIC_LIBS),y)
 SCONESERVER_CONF_ENV += SSL_LIBADD=-lz
diff --git a/package/scrypt/Config.in b/package/scrypt/Config.in
index e6d1ac1a6..77e4b4990 100644
--- a/package/scrypt/Config.in
+++ b/package/scrypt/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_SCRYPT
 	bool "scrypt"
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	help
 	  A password-based key derivation function specifically
 	  designed to make it costly to perform large-scale custom
diff --git a/package/scrypt/scrypt.mk b/package/scrypt/scrypt.mk
index ae5a64e71..caeaaa69f 100644
--- a/package/scrypt/scrypt.mk
+++ b/package/scrypt/scrypt.mk
@@ -9,7 +9,7 @@ SCRYPT_SOURCE = scrypt-$(SCRYPT_VERSION).tgz
 SCRYPT_SITE = http://www.tarsnap.com/scrypt
 SCRYPT_LICENSE = BSD-2-Clause
 SCRYPT_LICENSE_FILES = main.c
-SCRYPT_DEPENDENCIES = openssl
+SCRYPT_DEPENDENCIES = libssl
 SCRYPT_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
diff --git a/package/shairport-sync/Config.in b/package/shairport-sync/Config.in
index c2a556540..aecfdfd89 100644
--- a/package/shairport-sync/Config.in
+++ b/package/shairport-sync/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_SHAIRPORT_SYNC
 	select BR2_PACKAGE_ALSA_LIB_MIXER
 	select BR2_PACKAGE_LIBCONFIG
 	select BR2_PACKAGE_LIBDAEMON
-	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_MBEDTLS
+	select BR2_PACKAGE_LIBSSL if !BR2_PACKAGE_MBEDTLS
 	select BR2_PACKAGE_POPT
 	help
 	  Shairport Sync emulates an AirPort Express for the purpose of
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 208a9b3b1..3a7a96a13 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -31,9 +31,9 @@ else
 SHAIRPORT_SYNC_CONF_OPTS += --with-tinysvcmdns
 endif
 
-# OpenSSL or mbedTLS
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-SHAIRPORT_SYNC_DEPENDENCIES += openssl
+# LIBSSL or mbedTLS
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
+SHAIRPORT_SYNC_DEPENDENCIES += libssl
 SHAIRPORT_SYNC_CONF_OPTS += --with-ssl=openssl
 else
 SHAIRPORT_SYNC_DEPENDENCIES += mbedtls
diff --git a/package/shellinabox/Config.in b/package/shellinabox/Config.in
index 63a298dca..811eed3b7 100644
--- a/package/shellinabox/Config.in
+++ b/package/shellinabox/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_SHELLINABOX
 	bool "shellinabox"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # dlfcn.h
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_ZLIB
 	help
 	  Shell In A Box implements a web server that can export
diff --git a/package/shellinabox/shellinabox.mk b/package/shellinabox/shellinabox.mk
index 1db62e609..cdde30d1e 100644
--- a/package/shellinabox/shellinabox.mk
+++ b/package/shellinabox/shellinabox.mk
@@ -15,7 +15,7 @@ SHELLINABOX_AUTORECONF = YES
 # The OpenSSL support is supposed to be optional, but in practice,
 # with OpenSSL disabled, it fails to build. See
 # https://github.com/shellinabox/shellinabox/issues/385.
-SHELLINABOX_DEPENDENCIES = zlib openssl
+SHELLINABOX_DEPENDENCIES = zlib libssl
 SHELLINABOX_CONF_OPTS = \
 	--disable-runtime-loading \
 	--enable-ssl
diff --git a/package/sngrep/sngrep.mk b/package/sngrep/sngrep.mk
index 67ef882e2..87b3912a7 100644
--- a/package/sngrep/sngrep.mk
+++ b/package/sngrep/sngrep.mk
@@ -17,8 +17,8 @@ SNGREP_CONF_ENV += \
 SNGREP_CONF_OPTS += --disable-unicode
 
 # openssl and gnutls can't be enabled at the same time.
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-SNGREP_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
+SNGREP_DEPENDENCIES += libssl
 SNGREP_CONF_OPTS += --with-openssl --without-gnutls
 # gnutls support also requires libgcrypt
 else ifeq ($(BR2_PACKAGE_GNUTLS)$(BR2_PACKAGE_LIBGCRYPT),yy)
diff --git a/package/snmppp/Config.in b/package/snmppp/Config.in
index 8d284673b..b772fb4f6 100644
--- a/package/snmppp/Config.in
+++ b/package/snmppp/Config.in
@@ -21,7 +21,7 @@ config BR2_PACKAGE_SNMPPP_LOGGING
 config BR2_PACKAGE_SNMPPP_SNMPV3
 	bool "enable SNMPv3"
 	default y
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	help
 	  Enable optional support for SNMP++. This selects OpenSSL.
 
diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
index 67410d9e4..d18e19ed0 100644
--- a/package/snmppp/snmppp.mk
+++ b/package/snmppp/snmppp.mk
@@ -15,7 +15,7 @@ SNMPPP_LICENSE_FILES = src/v3.cpp
 
 ifeq ($(BR2_PACKAGE_SNMPPP_SNMPV3),y)
 SNMPPP_CONF_OPTS += --enable-snmpv3
-SNMPPP_DEPENDENCIES += openssl
+SNMPPP_DEPENDENCIES += libssl
 else
 SNMPPP_CONF_OPTS += --disable-snmpv3
 endif
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index 97f6c5b14..332a6ae4e 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -31,8 +31,8 @@ endif
 
 SOCAT_DEPENDENCIES = host-autoconf
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-SOCAT_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
+SOCAT_DEPENDENCIES += libssl
 else
 SOCAT_CONF_OPTS += --disable-openssl
 endif
diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
index 831b9ea54..bb0db0a33 100644
--- a/package/sofia-sip/sofia-sip.mk
+++ b/package/sofia-sip/sofia-sip.mk
@@ -19,9 +19,9 @@ else
 SOFIA_SIP_CONF_OPTS += --without-glib
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
 SOFIA_SIP_CONF_OPTS += --with-openssl
-SOFIA_SIP_DEPENDENCIES += openssl
+SOFIA_SIP_DEPENDENCIES += libssl
 else
 SOFIA_SIP_CONF_OPTS += --without-openssl
 endif
diff --git a/package/softether/Config.in b/package/softether/Config.in
index 55e542677..864fdbdb7 100644
--- a/package/softether/Config.in
+++ b/package/softether/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_SOFTETHER
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_READLINE
 	help
 	  The SoftEther Server is a fully integrated implementation of the SSTP,
diff --git a/package/softether/softether.mk b/package/softether/softether.mk
index fd416fd47..33d20c40b 100644
--- a/package/softether/softether.mk
+++ b/package/softether/softether.mk
@@ -8,7 +8,7 @@ SOFTETHER_VERSION = 1e17c9bcfd7e7b31756aa5389bcbff76c2c9c88a
 SOFTETHER_SITE = $(call github,SoftEtherVPN,SoftEtherVPN,$(SOFTETHER_VERSION))
 SOFTETHER_LICENSE = GPL-2.0
 SOFTETHER_LICENSE_FILES = LICENSE
-SOFTETHER_DEPENDENCIES = host-softether openssl readline
+SOFTETHER_DEPENDENCIES = host-softether libssl readline
 SOFTETHER_AUTORECONF = YES
 
 ifeq ($(BR2_ENABLE_LOCALE),)
@@ -26,7 +26,7 @@ SOFTETHER_CONF_OPTS = \
 	--with-zlib="$(STAGING_DIR)/usr"
 
 # host-libiconv does not exist, therefore we need this extra line
-HOST_SOFTETHER_DEPENDENCIES = host-pkgconf host-openssl host-readline
+HOST_SOFTETHER_DEPENDENCIES = host-pkgconf host-libssl host-readline
 
 # target build creates the file hamcore.se2 which needs the host variant of
 # hamcorebuilder, for details see http://www.vpnusers.com/viewtopic.php?p=5426
diff --git a/package/spice/Config.in b/package/spice/Config.in
index 2241b55b3..3973a7b39 100644
--- a/package/spice/Config.in
+++ b/package/spice/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_SPICE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_SPICE_PROTOCOL
 	help
diff --git a/package/spice/spice.mk b/package/spice/spice.mk
index 7b09f39fe..f90d04e44 100644
--- a/package/spice/spice.mk
+++ b/package/spice/spice.mk
@@ -13,7 +13,7 @@ SPICE_INSTALL_STAGING = YES
 SPICE_DEPENDENCIES = \
 	jpeg \
 	libglib2 \
-	openssl \
+	libssl \
 	pixman \
 	spice-protocol
 
diff --git a/package/sqlcipher/Config.in b/package/sqlcipher/Config.in
index 98b2f8955..6a9152a1a 100644
--- a/package/sqlcipher/Config.in
+++ b/package/sqlcipher/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_SQLCIPHER
 	bool "sqlcipher"
 	depends on !BR2_PACKAGE_SQLITE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	help
 	  SQLCipher is an SQLite extension that provides 256 bits AES
 	  encryption of database files. Note that it is a fork of SQLite
diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index db94d06c5..9b3686c07 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -6,7 +6,7 @@
 
 SQLCIPHER_VERSION = v3.2.0
 SQLCIPHER_SITE = $(call github,sqlcipher,sqlcipher,$(SQLCIPHER_VERSION))
-SQLCIPHER_DEPENDENCIES = openssl host-tcl
+SQLCIPHER_DEPENDENCIES = libssl host-tcl
 SQLCIPHER_INSTALL_STAGING = YES
 
 SQLCIPHER_CONF_ENV = \
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index bcb3744de..1e2aa9d97 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -50,9 +50,9 @@ else
 SQUID_CONF_ENV += squid_cv_gnu_atomics=no
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
 SQUID_CONF_OPTS += --with-openssl
-SQUID_DEPENDENCIES += openssl
+SQUID_DEPENDENCIES += libssl
 else
 SQUID_CONF_OPTS += --without-openssl
 endif
diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 5119706f5..9db78fda0 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -31,7 +31,7 @@ choice
 
 config BR2_PACKAGE_STRONGSWAN_OPENSSL
 	bool "OpenSSL"
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 
 config BR2_PACKAGE_STRONGSWAN_GCRYPT
 	bool "libgcrypt"
diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
index dbc69f1fe..5607724b6 100644
--- a/package/swupdate/Config.in
+++ b/package/swupdate/Config.in
@@ -25,7 +25,7 @@ config BR2_PACKAGE_SWUPDATE
 	    Note that for LuaJIT support, you need to set
 	    CONFIG_LUAVERSION="jit-5.1".
 	  * Select BR2_LIBCURL if you want to use the download feature.
-	  * Select BR2_PACKAGE_OPENSSL is you want to add encryption support.
+	  * Select BR2_PACKAGE_LIBSSL is you want to add encryption support.
 	  * Select BR2_PACKAGE_MTD if you want to use swupdate with UBI
 	    partitions.
 	  * Select BR2_PACKAGE_ZLIB if you want to deal with gzip compressed
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index ee92adddf..5b2b2750b 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -55,8 +55,8 @@ SWUPDATE_MAKE_ENV += HAVE_LIBMTD=n
 SWUPDATE_MAKE_ENV += HAVE_LIBUBI=n
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-SWUPDATE_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
+SWUPDATE_DEPENDENCIES += libssl
 SWUPDATE_MAKE_ENV += HAVE_LIBSSL=y
 SWUPDATE_MAKE_ENV += HAVE_LIBCRYPTO=y
 else
diff --git a/package/sylpheed/sylpheed.mk b/package/sylpheed/sylpheed.mk
index 14107f0a6..4ec64dad7 100644
--- a/package/sylpheed/sylpheed.mk
+++ b/package/sylpheed/sylpheed.mk
@@ -23,8 +23,8 @@ endef
 
 SYLPHEED_PRE_CONFIGURE_HOOKS += SYLPHEED_PRECONFIGURE
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-SYLPHEED_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
+SYLPHEED_DEPENDENCIES += libssl
 SYLPHEED_CONF_OPTS += --enable-ssl
 else
 SYLPHEED_CONF_OPTS += --disable-ssl
diff --git a/package/synergy/Config.in b/package/synergy/Config.in
index 3bb8b8e98..917fb1af3 100644
--- a/package/synergy/Config.in
+++ b/package/synergy/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_SYNERGY
 	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBCURL
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXTST
 	help
diff --git a/package/synergy/synergy.mk b/package/synergy/synergy.mk
index 76a4004f0..3a066c7fa 100644
--- a/package/synergy/synergy.mk
+++ b/package/synergy/synergy.mk
@@ -8,7 +8,7 @@ SYNERGY_VERSION = v1.8.8-stable
 SYNERGY_SITE = $(call github,symless,synergy,$(SYNERGY_VERSION))
 SYNERGY_LICENSE = GPL-2.0
 SYNERGY_LICENSE_FILES = LICENSE
-SYNERGY_DEPENDENCIES = libcurl openssl xlib_libX11 xlib_libXtst
+SYNERGY_DEPENDENCIES = libcurl libssl xlib_libX11 xlib_libXtst
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXEXT),y)
 SYNERGY_DEPENDENCIES += xlib_libXext
diff --git a/package/syslog-ng/Config.in b/package/syslog-ng/Config.in
index fbc236221..a11b59f47 100644
--- a/package/syslog-ng/Config.in
+++ b/package/syslog-ng/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_SYSLOG_NG
 	select BR2_PACKAGE_EVENTLOG
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_PCRE
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	help
 	  syslog-ng is an enhanced log daemon, supporting a wide range
 	  of input and output methods: syslog, unstructured text,
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 325fac584..06ee610d3 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -9,7 +9,7 @@ SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-n
 SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING
 SYSLOG_NG_DEPENDENCIES = host-bison host-flex host-pkgconf \
-	eventlog libglib2 openssl pcre
+	eventlog libglib2 libssl pcre
 # rabbit-mq needs -lrt
 SYSLOG_NG_CONF_ENV = LIBS=-lrt
 SYSLOG_NG_CONF_OPTS = --disable-manpages --localstatedir=/var/run \
diff --git a/package/thrift/Config.in b/package/thrift/Config.in
index 0ee3f000d..facf8cd8a 100644
--- a/package/thrift/Config.in
+++ b/package/thrift/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_THRIFT
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_LIBEVENT
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_ZLIB
 	help
 	  The Apache Thrift software framework, for scalable cross-language
diff --git a/package/tinc/Config.in b/package/tinc/Config.in
index 837f556b3..6372d4818 100644
--- a/package/tinc/Config.in
+++ b/package/tinc/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_TINC
 	depends on !BR2_STATIC_LIBS # tinc requires libdl for OpenSSL
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LZO
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_ZLIB
 	help
 	  tinc is a Virtual Private Network (VPN) daemon that uses
diff --git a/package/tinc/tinc.mk b/package/tinc/tinc.mk
index f537d4642..7f8547ba1 100644
--- a/package/tinc/tinc.mk
+++ b/package/tinc/tinc.mk
@@ -6,7 +6,7 @@
 
 TINC_VERSION = 1.0.30
 TINC_SITE = http://www.tinc-vpn.org/packages
-TINC_DEPENDENCIES = lzo openssl zlib
+TINC_DEPENDENCIES = lzo libssl zlib
 TINC_LICENSE = GPL-2.0+ with OpenSSL exception
 TINC_LICENSE_FILES = COPYING COPYING.README
 TINC_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=c99"
diff --git a/package/tn5250/tn5250.mk b/package/tn5250/tn5250.mk
index 4c457a5d9..3f45da0b5 100644
--- a/package/tn5250/tn5250.mk
+++ b/package/tn5250/tn5250.mk
@@ -11,10 +11,10 @@ TN5250_DEPENDENCIES = ncurses
 TN5250_LICENSE = LGPL-2.1+
 TN5250_LICENSE_FILES = COPYING
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
 TN5250_CONF_OPTS += --with-ssl-dir=$(STAGING_DIR)/usr
 TN5250_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs openssl`"
-TN5250_DEPENDENCIES += openssl host-pkgconf
+TN5250_DEPENDENCIES += libssl host-pkgconf
 else
 TN5250_CONF_OPTS += --without-ssl
 endif
diff --git a/package/tor/Config.in b/package/tor/Config.in
index 52009267e..ba1c8d675 100644
--- a/package/tor/Config.in
+++ b/package/tor/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_TOR
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_LIBEVENT
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_ZLIB
 	help
 	  Tor is free software and an open network that helps you
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 0fa17e664..cbe5ecfd3 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -8,7 +8,7 @@ TOR_VERSION = 0.3.0.9
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-TOR_DEPENDENCIES = libevent openssl zlib
+TOR_DEPENDENCIES = libevent libssl zlib
 TOR_AUTORECONF = YES
 
 TOR_CONF_OPTS = \
diff --git a/package/tpm-tools/Config.in b/package/tpm-tools/Config.in
index e11568728..4d7947dbc 100644
--- a/package/tpm-tools/Config.in
+++ b/package/tpm-tools/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_TPM_TOOLS
 	depends on !BR2_STATIC_LIBS # trousers
 	depends on !BR2_arc # trousers
 	select BR2_PACKAGE_TROUSERS
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	help
 	  Tools to manage and diagnose a TPM
 
diff --git a/package/tpm-tools/tpm-tools.mk b/package/tpm-tools/tpm-tools.mk
index 4dbf50a29..3542c92b7 100644
--- a/package/tpm-tools/tpm-tools.mk
+++ b/package/tpm-tools/tpm-tools.mk
@@ -9,7 +9,7 @@ TPM_TOOLS_SITE = http://downloads.sourceforge.net/project/trousers/tpm-tools/$(T
 TPM_TOOLS_STRIP_COMPONENTS = 2
 TPM_TOOLS_LICENSE = Common Public License Version 1.0
 TPM_TOOLS_LICENSE_FILES = LICENSE
-TPM_TOOLS_DEPENDENCIES = trousers openssl $(TARGET_NLS_DEPENDENCIES)
+TPM_TOOLS_DEPENDENCIES = trousers libssl $(TARGET_NLS_DEPENDENCIES)
 # configure.in and lib/Makefile.am is patched
 TPM_TOOLS_AUTORECONF = YES
 TPM_TOOLS_GETTEXTIZE = YES
diff --git a/package/transmission/Config.in b/package/transmission/Config.in
index b47c36fdd..6edcaf400 100644
--- a/package/transmission/Config.in
+++ b/package/transmission/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_TRANSMISSION
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBEVENT
 	help
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index f8abb2b8b..10adfdc5f 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -12,7 +12,7 @@ TRANSMISSION_DEPENDENCIES = \
 	host-intltool \
 	libcurl \
 	libevent \
-	openssl \
+	libssl \
 	zlib
 TRANSMISSION_AUTORECONF = YES
 TRANSMISSION_CONF_OPTS = \
diff --git a/package/trousers/Config.in b/package/trousers/Config.in
index eb791d173..eea4d678b 100644
--- a/package/trousers/Config.in
+++ b/package/trousers/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_TROUSERS
 	depends on !BR2_STATIC_LIBS
 	# ARC toolchain issue
 	depends on !BR2_arc
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  The open-source TCG Software Stack (TSS).
diff --git a/package/trousers/trousers.mk b/package/trousers/trousers.mk
index e49c2ac14..a95cb3667 100644
--- a/package/trousers/trousers.mk
+++ b/package/trousers/trousers.mk
@@ -11,7 +11,7 @@ TROUSERS_LICENSE_FILES = LICENSE
 TROUSERS_INSTALL_STAGING = YES
 # Need autoreconf because of a patch touching configure.in and Makefile.am
 TROUSERS_AUTORECONF = YES
-TROUSERS_DEPENDENCIES = host-pkgconf openssl
+TROUSERS_DEPENDENCIES = host-pkgconf libssl
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 TROUSERS_DEPENDENCIES += libiconv
diff --git a/package/turbolua/turbolua.mk b/package/turbolua/turbolua.mk
index 49877fab6..6c9f5a110 100644
--- a/package/turbolua/turbolua.mk
+++ b/package/turbolua/turbolua.mk
@@ -14,9 +14,9 @@ TURBOLUA_MAKE_OPTS = \
 	$(TARGET_CONFIGURE_OPTS) \
 	LUAJIT_VERSION="$(LUAJIT_VERSION)"
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
 TURBOLUA_MAKE_OPTS += SSL=openssl
-TURBOLUA_DEPENDENCIES += openssl
+TURBOLUA_DEPENDENCIES += libssl
 else
 TURBOLUA_MAKE_OPTS += SSL=none
 endif
diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index fc39d6f48..5b14fecfb 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_TVHEADEND
 	select BR2_PACKAGE_LIBVPX if BR2_PACKAGE_FFMPEG && !BR2_bfin # libvpx
 	select BR2_PACKAGE_X264 if BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	help
 	  Tvheadend is a TV streaming server for Linux supporting DVB-S,
 	  DVB-S2, DVB-C, DVB-T, ATSC, IPTV, and Analog video (V4L) as
diff --git a/package/uboot-tools/Config.in b/package/uboot-tools/Config.in
index f55614bac..33b52d3ad 100644
--- a/package/uboot-tools/Config.in
+++ b/package/uboot-tools/Config.in
@@ -28,7 +28,7 @@ if BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT
 
 config BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT
 	bool "FIT signature verification support"
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	help
 	  Enables support for FIT Signature Verification.
 
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 4f39f4ad2..f5c32e30c 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -28,7 +28,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),y)
 UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT_SIGNATURE=y
-UBOOT_TOOLS_DEPENDENCIES += openssl host-pkgconf
+UBOOT_TOOLS_DEPENDENCIES += libssl host-pkgconf
 endif
 
 define UBOOT_TOOLS_BUILD_CMDS
@@ -91,7 +91,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),y)
 HOST_UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT_SIGNATURE=y
-HOST_UBOOT_TOOLS_DEPENDENCIES += host-openssl
+HOST_UBOOT_TOOLS_DEPENDENCIES += host-libssl
 endif
 
 define HOST_UBOOT_TOOLS_BUILD_CMDS
diff --git a/package/ustream-ssl/Config.in b/package/ustream-ssl/Config.in
index 540e43689..64cf1d319 100644
--- a/package/ustream-ssl/Config.in
+++ b/package/ustream-ssl/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_USTREAM_SSL
 	bool "ustream-ssl"
 	depends on !BR2_STATIC_LIBS #libubox
 	select BR2_PACKAGE_LIBUBOX
-	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_MBEDTLS
+	select BR2_PACKAGE_LIBSSL if !BR2_PACKAGE_MBEDTLS
 	help
 	  ustream SSL wrapper
 
diff --git a/package/ustream-ssl/ustream-ssl.mk b/package/ustream-ssl/ustream-ssl.mk
index 9b1078829..e6272b0d0 100644
--- a/package/ustream-ssl/ustream-ssl.mk
+++ b/package/ustream-ssl/ustream-ssl.mk
@@ -15,7 +15,7 @@ ifeq ($(BR2_PACKAGE_MBEDTLS),y)
 USTREAM_SSL_DEPENDENCIES += mbedtls
 USTREAM_SSL_CONF_OPTS += -DMBEDTLS=ON
 else
-USTREAM_SSL_DEPENDENCIES += openssl
+USTREAM_SSL_DEPENDENCIES += libssl
 endif
 
 $(eval $(cmake-package))
diff --git a/package/vboot-utils/vboot-utils.mk b/package/vboot-utils/vboot-utils.mk
index a6a67ad31..3ece38595 100644
--- a/package/vboot-utils/vboot-utils.mk
+++ b/package/vboot-utils/vboot-utils.mk
@@ -10,7 +10,7 @@ VBOOT_UTILS_SITE_METHOD = git
 VBOOT_UTILS_LICENSE = BSD-3-Clause
 VBOOT_UTILS_LICENSE_FILES = LICENSE
 
-HOST_VBOOT_UTILS_DEPENDENCIES = host-openssl host-util-linux host-pkgconf
+HOST_VBOOT_UTILS_DEPENDENCIES = host-libssl host-util-linux host-pkgconf
 
 # vboot_reference contains code that goes into bootloaders,
 # utilities intended for the target system, and a bunch of scripts
diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index 2f86d91ba..bb7cb8198 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -22,8 +22,8 @@ ifeq ($(BR2_PACKAGE_VSFTPD_UTMPX),)
 VSFTPD_POST_CONFIGURE_HOOKS += VSFTPD_DISABLE_UTMPX
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-VSFTPD_DEPENDENCIES += openssl host-pkgconf
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
+VSFTPD_DEPENDENCIES += libssl host-pkgconf
 VSFTPD_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs libssl libcrypto`
 VSFTPD_POST_CONFIGURE_HOOKS += VSFTPD_ENABLE_SSL
 endif
diff --git a/package/vtun/Config.in b/package/vtun/Config.in
index bb8919c3d..319518cae 100644
--- a/package/vtun/Config.in
+++ b/package/vtun/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_VTUN
 	bool "vtun"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LZO
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_ZLIB
 	help
 	  Tool for easily creating Virtual Tunnels over TCP/IP networks
diff --git a/package/vtun/vtun.mk b/package/vtun/vtun.mk
index 9c46559fb..b1d65c24b 100644
--- a/package/vtun/vtun.mk
+++ b/package/vtun/vtun.mk
@@ -8,7 +8,7 @@ VTUN_VERSION = 3.0.3
 VTUN_SITE = http://downloads.sourceforge.net/project/vtun/vtun/$(VTUN_VERSION)
 VTUN_LICENSE = GPL-2.0+ with OpenSSL exception
 VTUN_LICENSE_FILES = README.OpenSSL
-VTUN_DEPENDENCIES = host-bison host-flex zlib lzo openssl
+VTUN_DEPENDENCIES = host-bison host-flex zlib lzo libssl
 VTUN_AUTORECONF = YES
 
 VTUN_CONF_OPTS = \
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 4cb48dce6..b20a040a4 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -19,9 +19,9 @@ endif
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 WGET_CONF_OPTS += --with-ssl=gnutls
 WGET_DEPENDENCIES += gnutls
-else ifeq ($(BR2_PACKAGE_OPENSSL),y)
+else ifeq ($(BR2_PACKAGE_LIBSSL),y)
 WGET_CONF_OPTS += --with-ssl=openssl
-WGET_DEPENDENCIES += openssl
+WGET_DEPENDENCIES += libssl
 else
 WGET_CONF_OPTS += --without-ssl
 endif
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 2e8b82ceb..0db8c2228 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -88,9 +88,9 @@ ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WPS),y)
 WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_WPS
 endif
 
-# Try to use openssl if it's already available
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-WPA_SUPPLICANT_DEPENDENCIES += openssl
+# Try to use libssl if it's already available
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
+WPA_SUPPLICANT_DEPENDENCIES += libssl
 WPA_SUPPLICANT_LIBS += $(if $(BR2_STATIC_LIBS),-lcrypto -lz)
 WPA_SUPPLICANT_CONFIG_EDITS += 's/\#\(CONFIG_TLS=openssl\)/\1/'
 else
diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 5971e13f5..a05156d1d 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 	# We need a SHA1 implementation. If either openssl or
 	# libgcrypt are already part of the build, we'll use one of
 	# them, otherwise, use the small libsha1 library.
-	select BR2_PACKAGE_LIBSHA1 if (!BR2_PACKAGE_OPENSSL && !BR2_PACKAGE_LIBGCRYPT)
+	select BR2_PACKAGE_LIBSHA1 if (!BR2_PACKAGE_LIBSSL && !BR2_PACKAGE_LIBGCRYPT)
 	select BR2_PACKAGE_MCOOKIE
 	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_XFONT_FONT_ALIAS if !BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 12c3ed06c..38c9e1370 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -247,9 +247,9 @@ ifneq ($(BR2_PACKAGE_XLIB_LIBDMX),y)
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-dmx
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
 XSERVER_XORG_SERVER_CONF_OPTS += --with-sha1=libcrypto
-XSERVER_XORG_SERVER_DEPENDENCIES += openssl
+XSERVER_XORG_SERVER_DEPENDENCIES += libssl
 else ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 XSERVER_XORG_SERVER_CONF_OPTS += --with-sha1=libgcrypt
 XSERVER_XORG_SERVER_DEPENDENCIES += libgcrypt
diff --git a/package/x11vnc/x11vnc.mk b/package/x11vnc/x11vnc.mk
index f1f4da21b..d747e5bb1 100644
--- a/package/x11vnc/x11vnc.mk
+++ b/package/x11vnc/x11vnc.mk
@@ -28,8 +28,8 @@ else
 X11VNC_CONF_OPTS += --without-jpeg
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-X11VNC_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
+X11VNC_DEPENDENCIES += libssl
 else
 X11VNC_CONF_OPTS += --without-ssl --without-crypto
 endif
diff --git a/package/xen/Config.in b/package/xen/Config.in
index b5dcbf259..501721baf 100644
--- a/package/xen/Config.in
+++ b/package/xen/Config.in
@@ -27,7 +27,7 @@ config BR2_PACKAGE_XEN_TOOLS
 	select BR2_PACKAGE_LIBAIO
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 90e73853d..ad2567aa9 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -37,7 +37,7 @@ XEN_CONF_OPTS += --disable-xen
 endif
 
 ifeq ($(BR2_PACKAGE_XEN_TOOLS),y)
-XEN_DEPENDENCIES += dtc libaio libglib2 ncurses openssl pixman util-linux yajl
+XEN_DEPENDENCIES += dtc libaio libglib2 ncurses libssl pixman util-linux yajl
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
 XEN_DEPENDENCIES += argp-standalone
 endif
diff --git a/package/xl2tp/Config.in b/package/xl2tp/Config.in
index f0b1e834a..4650d0955 100644
--- a/package/xl2tp/Config.in
+++ b/package/xl2tp/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_XL2TP
 	bool "xl2tp"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBPCAP
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSL
 	help
 	  Layer 2 Tunnelling Protocol (RFC2661).
 
diff --git a/package/xl2tp/xl2tp.mk b/package/xl2tp/xl2tp.mk
index 7f4ffd410..3b31df319 100644
--- a/package/xl2tp/xl2tp.mk
+++ b/package/xl2tp/xl2tp.mk
@@ -6,7 +6,7 @@
 
 XL2TP_VERSION = v1.3.8
 XL2TP_SITE = $(call github,xelerance,xl2tpd,$(XL2TP_VERSION))
-XL2TP_DEPENDENCIES = libpcap openssl
+XL2TP_DEPENDENCIES = libpcap libssl
 XL2TP_LICENSE = GPL-2.0
 XL2TP_LICENSE_FILES = LICENSE
 
diff --git a/package/znc/znc.mk b/package/znc/znc.mk
index 5783200ef..27a7a8867 100644
--- a/package/znc/znc.mk
+++ b/package/znc/znc.mk
@@ -18,8 +18,8 @@ else
 ZNC_CONF_OPTS += --disable-charset
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-ZNC_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBSSL),y)
+ZNC_DEPENDENCIES += libssl
 ZNC_CONF_OPTS += --enable-openssl
 else
 ZNC_CONF_OPTS += --disable-openssl
-- 
2.13.3
