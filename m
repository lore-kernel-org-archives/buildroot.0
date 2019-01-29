From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 29 Jan 2019 23:33:54 +0100
Subject: [Buildroot] [PATCH 1/2] libpcap: remove unrecognized canusb option
Message-ID: <20190129223355.30600-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

canusb has been removed since version 1.8.1 and
https://github.com/the-tcpdump-group/libpcap/commit/93ca5ff7030aaf1219e1de05ec89a68384bfc50b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libpcap/libpcap.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index c4c5f31465..daa369f66c 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -38,13 +38,6 @@ else
 LIBPCAP_CONF_OPTS += --disable-dbus
 endif
 
-ifeq ($(BR2_PACKAGE_LIBUSB),y)
-LIBPCAP_CONF_OPTS += --enable-canusb
-LIBPCAP_DEPENDENCIES += libusb
-else
-LIBPCAP_CONF_OPTS += --disable-canusb
-endif
-
 ifeq ($(BR2_PACKAGE_LIBNL),y)
 LIBPCAP_DEPENDENCIES += libnl
 LIBPCAP_CFLAGS += "-I$(STAGING_DIR)/usr/include/libnl3"
-- 
2.14.1
