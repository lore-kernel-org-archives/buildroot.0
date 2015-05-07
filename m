From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  7 May 2015 10:20:12 +0300
Subject: [Buildroot] [PATCH] iproute2: fix static build
Message-ID: <084f90b46a37424d769beafa00a5faa685fcc5e0.1430983212.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/a10/a107ac3252ad48732069ec0de6ff8692b32c6a71/
http://autobuild.buildroot.net/results/e27/e2785a35bc6bc63d5da77e406e589889e7d39055/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/iproute2/iproute2.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 102a222da12f..9595165ec6a5 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -61,7 +61,8 @@ define IPROUTE2_BUILD_CMDS
 	$(SED) 's/$$(CCOPTS)//' $(@D)/netem/Makefile
 	$(TARGET_MAKE_ENV) $(MAKE) \
 		DBM_INCLUDE="$(STAGING_DIR)/usr/include" \
-		CCOPTS="$(TARGET_CFLAGS) -D_GNU_SOURCE" -C $(@D)
+		CCOPTS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
+		SHARED_LIBS="$(if $(BR2_STATIC_LIBS),n,y)" -C $(@D)
 endef
 
 define IPROUTE2_INSTALL_TARGET_CMDS
-- 
2.1.4
