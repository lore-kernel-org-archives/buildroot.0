From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Nov 2018 21:26:23 +0100
Subject: [Buildroot] [git commit] wireshark: fix static build
Message-ID: <20181111202637.95E738256D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fecf82a1668c5cfbe6ebec985ce60a5526bcf35c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't give a path in --with-pcap option otherwise PCAP_CONFIG won't be
used (see AC_WIRESHARK_PCAP_CHECK in acinclude.m4) to retrieve pcap
static dependencies such as -lnl-3 and as a result pcap detection will
fail

Fixes:
 - http://autobuild.buildroot.org/results/084354a33825cf4e723e0a9f1e9656ad2a212a15

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 6be0016af7..7c7dc784fe 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -18,7 +18,7 @@ WIRESHARK_CONF_OPTS = \
 	--disable-guides \
 	--enable-static=no \
 	--with-libsmi=no \
-	--with-pcap=$(STAGING_DIR)/usr
+	--with-pcap=yes
 
 # wireshark GUI options
 ifeq ($(BR2_PACKAGE_LIBGTK3),y)
