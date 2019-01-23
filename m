From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Jan 2019 16:06:37 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] wireshark: fix static
 build
Message-ID: <20190123151352.A7F6A849D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0af2651146bf87ba5476eaaa8df39d1b40c73469
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Don't give a path in --with-pcap option otherwise PCAP_CONFIG won't be
used (see AC_WIRESHARK_PCAP_CHECK in acinclude.m4) to retrieve pcap
static dependencies such as -lnl-3 and as a result pcap detection will
fail

Fixes:
 - http://autobuild.buildroot.org/results/084354a33825cf4e723e0a9f1e9656ad2a212a15

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit fecf82a1668c5cfbe6ebec985ce60a5526bcf35c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 468229df3f..f67368ae43 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -24,7 +24,7 @@ WIRESHARK_CONF_OPTS = \
 	--without-nghttp2 \
 	--without-snappy \
 	--with-libsmi=no \
-	--with-pcap=$(STAGING_DIR)/usr
+	--with-pcap=yes
 
 # wireshark GUI options
 ifeq ($(BR2_PACKAGE_LIBGTK3),y)
