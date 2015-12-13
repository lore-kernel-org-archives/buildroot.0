From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 13 Dec 2015 10:16:24 +0100
Subject: [Buildroot] [PATCH 1/2] package/wireshark: Fix libpcap detection
Message-ID: <1449998185-15082-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To reproduce the build error I had to install libpcap0.8-dev on my host
system, then wireshark configure picks up

checking for pcap-config... /usr/bin/pcap-config

and fails.

Fixes
http://autobuild.buildroot.net/results/7e3/7e363d18866057df0db3d0d95fa8d9116728f6ce//
and many others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/wireshark/wireshark.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 534131b..2b06699 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -24,6 +24,7 @@ WIRESHARK_CONF_OPTS = \
 	--enable-static=no \
 	--with-libsmi=no \
 	--with-lua=no \
+	--with-pcap=$(STAGING_DIR)/usr \
 	--includedir=$(STAGING_DIR)/usr/include
 
 # wireshark GUI options
-- 
2.6.2
