From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jun 2014 23:56:45 +0200
Subject: [Buildroot] [git commit] libpcap: make dbus support deterministic
Message-ID: <20140618220023.4E35F9D018@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7de73ca3a2144bf978647c34ca39ba1ff2e57510
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpcap/libpcap.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

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
