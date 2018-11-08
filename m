From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 8 Nov 2018 22:16:05 +0100
Subject: [Buildroot] [git commit] wireshark: disable build of user guide
Message-ID: <20181108212411.7781C81D35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=92c32d389026222c6296094ec00e2cc03b1fab9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--disable-guides has been added since version 2.5.0:
https://github.com/wireshark/wireshark/commit/aa04d2355effb1cf611831b0a260cf1aff199b9a

Fixes:
 - http://autobuild.buildroot.org/results/5ae6d46573942713687f4e659b3eaf0b768ebc71

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
