From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 Jun 2014 10:21:36 -0300
Subject: [Buildroot] [PATCH 2/3] libpcap: make dbus support deterministic
In-Reply-To: <1403097697-15782-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403097697-15782-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403097697-15782-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libpcap/libpcap.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 3681d4c..10b6cea 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -20,6 +20,13 @@ LIBPCAP_CFLAGS = $(TARGET_CFLAGS)
 LIBPCAP_CONF_OPT = --disable-yydebug --with-pcap=linux
 LIBPCAP_CONFIG_SCRIPTS = pcap-config
 
+ifeq ($(BR2_PACKAGE_DBUS),y)
+LIBPCAP_CONF_OPT += --enable-dbus
+LIBPCAP_DEPENDENCIES += dbus
+else
+LIBPCAP_CONF_OPT += --disable-dbus
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 LIBPCAP_CONF_OPT += --enable-canusb
 LIBPCAP_DEPENDENCIES += libusb
-- 
1.8.5.5
