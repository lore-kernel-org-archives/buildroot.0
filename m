From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Oct 2016 10:41:53 +0200
Subject: [Buildroot] [git commit] ngrep: don't use pcap_restart
Message-ID: <20161027084254.331087FD45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d54d05bde4c474194330528a91c2d7554e6a37d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libpcap since version 1.8.1 does not export the pcap_restart symbol. Disable
use of this symbol.

Fixes:
http://autobuild.buildroot.net/results/647/647061a6fe8cffe3b083c911a986fa7683cdb8f6/
http://autobuild.buildroot.net/results/d90/d90e4d7c62e5b860f1f0ffb5e4dc545928f91734/
http://autobuild.buildroot.net/results/560/56076caede5c7bfc8a57da3a9dc47d0d22309e79/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ngrep/ngrep.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/ngrep/ngrep.mk b/package/ngrep/ngrep.mk
index c4ad528..8daaf2d 100644
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
 
