From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Sep 2019 22:20:21 +0200
Subject: [Buildroot] [git commit] package/janus-gateway: enable parallel
 build
Message-ID: <20190927201506.840838F839@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=66b7f142067703d334c39bcade7d661da6f43e06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Parallel build is fixed since version 0.4.4 and
https://github.com/meetecho/janus-gateway/commit/1685a78e2cd7642f6246466c2e0d4e670fe6360b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/janus-gateway/janus-gateway.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 09cf9e5613..b0c01f3173 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -117,7 +117,4 @@ else
 JANUS_GATEWAY_CONF_OPTS += --disable-websockets
 endif
 
-# Parallel build broken
-JANUS_GATEWAY_MAKE = $(MAKE1)
-
 $(eval $(autotools-package))
