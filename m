From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  8 Nov 2018 21:30:44 +0100
Subject: [Buildroot] [PATCH 1/1] wireshark: disable guides
Message-ID: <20181108203044.32715-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--disable-guides has been added since version 2.5.0:
https://github.com/wireshark/wireshark/commit/aa04d2355effb1cf611831b0a260cf1aff199b9a

Fixes:
 - http://autobuild.buildroot.org/results/5ae6d46573942713687f4e659b3eaf0b768ebc71

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wireshark/wireshark.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 2e41c3d652..6be0016af7 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -15,6 +15,7 @@ WIRESHARK_CONF_ENV = \
 	PCAP_CONFIG=$(STAGING_DIR)/usr/bin/pcap-config
 
 WIRESHARK_CONF_OPTS = \
+	--disable-guides \
 	--enable-static=no \
 	--with-libsmi=no \
 	--with-pcap=$(STAGING_DIR)/usr
-- 
2.17.1
