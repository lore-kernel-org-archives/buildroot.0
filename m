From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Feb 2013 23:53:08 +0100
Subject: [Buildroot] [git commit] libpcap: fixup pcap-config
Message-ID: <20130204225531.D41A69A949@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d4d9ece91e80dad662efbb0c7342ff14096e711b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libpcap/libpcap.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
