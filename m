From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 27 Oct 2016 08:04:04 +0300
Subject: [Buildroot] [PATCH] ngrep: don't use pcap_restart
Message-ID: <5f74bf29ba9fee73b424ab03aaf6cc0bacdd3bef.1477544644.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libpcap since version 1.8.1 does not export the pcap_restart symbol. Disable
use of this symbol.

Fixes:
http://autobuild.buildroot.net/results/647/647061a6fe8cffe3b083c911a986fa7683cdb8f6/
http://autobuild.buildroot.net/results/d90/d90e4d7c62e5b860f1f0ffb5e4dc545928f91734/
http://autobuild.buildroot.net/results/560/56076caede5c7bfc8a57da3a9dc47d0d22309e79/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/ngrep/ngrep.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/ngrep/ngrep.mk b/package/ngrep/ngrep.mk
index c4ad528292d7..8daaf2d8ace2 100644
--- a/package/ngrep/ngrep.mk
+++ b/package/ngrep/ngrep.mk
@@ -21,7 +21,8 @@ NGREP_CONF_OPTS =  \
 	--with-pcap-includes=$(STAGING_DIR)/usr/include/pcap \
 	--enable-pcre \
 	--with-pcre=$(STAGING_DIR)/usr \
-	--disable-dropprivs
+	--disable-dropprivs \
+	--disable-pcap-restart
 
 NGREP_DEPENDENCIES = libpcap pcre
 
-- 
2.9.3
