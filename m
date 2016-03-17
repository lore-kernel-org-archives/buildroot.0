From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 17 Mar 2016 13:51:11 +0100
Subject: [Buildroot] [PATCH 1/2] libpjsip: really disable gsm
Message-ID: <1458219072-4113-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--disable-gsm does not exist, the option is called --disable-gsm-codec.

Fixes:
  http://autobuild.buildroot.org/results/f8c/f8c41f35ab56fac86f2877b09a60924256f57028/

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
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
-- 
1.9.1
