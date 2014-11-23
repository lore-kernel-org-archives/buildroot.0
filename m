From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 23 Nov 2014 16:46:46 +0200
Subject: [Buildroot] [PATCH] czmq: fix static build
Message-ID: <2ae14883aaaf95d9b8115ae50a2f17136c8315d1.1416754006.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libstdc++ may also need -lm.

Fixes:
http://autobuild.buildroot.net/results/aab/aab80285c54641fd7c217cdd45c4593e5c3a66c5/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/czmq/czmq.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/czmq/czmq.mk b/package/czmq/czmq.mk
index 9a127265e398..25f67d521237 100644
--- a/package/czmq/czmq.mk
+++ b/package/czmq/czmq.mk
@@ -19,7 +19,7 @@ CZMQ_LICENSE_FILES = LICENSE
 CZMQ_CONF_ENV = ac_cv_prog_czmq_have_asciidoc=no
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
-CZMQ_CONF_OPTS += LIBS=-lstdc++
+CZMQ_CONF_OPTS += LIBS="-lstdc++ -lm"
 endif
 
 define CZMQ_CREATE_CONFIG_DIR
-- 
2.1.3
