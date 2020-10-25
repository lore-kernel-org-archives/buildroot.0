From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 25 Oct 2020 17:12:45 +0100
Subject: [Buildroot] [PATCH v3,1/2] package/libpcap: add host variant
Message-ID: <20201025161246.1622486-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-libpcap is needed to build host-zeek

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libpcap/libpcap.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 881a109a0a..93d5587466 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -10,6 +10,7 @@ LIBPCAP_LICENSE = BSD-3-Clause
 LIBPCAP_LICENSE_FILES = LICENSE
 LIBPCAP_INSTALL_STAGING = YES
 LIBPCAP_DEPENDENCIES = host-flex host-bison
+HOST_LIBPCAP_DEPENDENCIES = host-flex host-bison
 
 LIBPCAP_CONF_ENV = \
 	ac_cv_header_linux_wireless_h=yes \
@@ -18,6 +19,13 @@ LIBPCAP_CFLAGS = $(TARGET_CFLAGS)
 LIBPCAP_CONF_OPTS = --disable-yydebug --with-pcap=linux --without-dag
 # Disable dbus to break recursive dependencies
 LIBPCAP_CONF_OPTS += --disable-dbus
+HOST_LIBPCAP_CONF_OPTS = \
+	--disable-bluetooth \
+	--disable-dbus \
+	--disable-yydebug \
+	--with-pcap=linux \
+	--without-dag \
+	--without-libnl
 LIBPCAP_CONFIG_SCRIPTS = pcap-config
 
 # Omit -rpath from pcap-config output
@@ -46,3 +54,4 @@ LIBPCAP_CFLAGS += -fPIC
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.28.0
