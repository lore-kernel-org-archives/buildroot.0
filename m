From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 2 Feb 2019 22:54:43 +0100
Subject: [Buildroot] [git commit] libpcap: remove unrecognized canusb option
Message-ID: <20190202215542.1D8E481497@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9a36851f70f53e554ace56f7b9b9acafecd33977
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

canusb has been removed since version 1.8.1 and
https://github.com/the-tcpdump-group/libpcap/commit/93ca5ff7030aaf1219e1de05ec89a68384bfc50b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
