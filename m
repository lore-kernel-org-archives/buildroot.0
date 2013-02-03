From: Baruch Siach <baruch@tkos.co.il>
Date: Sun,  3 Feb 2013 08:04:15 +0200
Subject: [Buildroot] [PATCH 1/2] libpcap: fixup pcap-config
Message-ID: <f903151303143f85e1e9c69b1f20400af878be97.1359870806.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---

This patch depends on Stefan's LIBFOO_CONFIG_FIXUP patch. pcap-config still
insists on adding the build machine RPATH to its --libs output. Sould I add a
libcap specific fixup for this?

 package/libpcap/libpcap.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 7e68f51..5be61bf 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -24,6 +24,7 @@ LIBPCAP_DEPENDENCIES = zlib
 LIBPCAP_CONF_ENV = ac_cv_linux_vers=2 \
 		ac_cv_header_linux_wireless_h=yes # configure misdetects this
 LIBPCAP_CONF_OPT = --disable-yydebug --with-pcap=linux
+LIBPCAP_CONFIG_FIXUP = pcap-config
 
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 LIBPCAP_CONF_OPT += --enable-canusb
-- 
1.7.10.4
