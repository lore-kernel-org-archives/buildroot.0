From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 17 Mar 2016 14:29:30 +0100
Subject: [Buildroot] [git commit] libpjsip: really disable gsm
Message-ID: <20160317133014.252E97FF9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43895e97ad04fda279df15db09f75da18aafc8cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--disable-gsm does not exist, the option is called --disable-gsm-codec.

Fixes:
  http://autobuild.buildroot.org/results/f8c/f8c41f35ab56fac86f2877b09a60924256f57028/

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpjsip/libpjsip.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 49abd74..56d6f2b 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -18,7 +18,7 @@ LIBPJSIP_CONF_ENV = \
 
 LIBPJSIP_CONF_OPTS = \
 	--disable-sound \
-	--disable-gsm \
+	--disable-gsm-codec \
 	--disable-speex-codec \
 	--disable-speex-aec \
 	--disable-resample \
