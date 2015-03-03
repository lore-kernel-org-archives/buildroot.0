From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  3 Mar 2015 10:17:08 +0100
Subject: [Buildroot] [RFC v3 03/30] iproute2: use the TARGET_LDFLAGS variable
In-Reply-To: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1425374255-6827-4-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is in order to support the per-package staging directory.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/iproute2/iproute2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 0838463..5f144cd 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -59,7 +59,7 @@ endef
 
 define IPROUTE2_BUILD_CMDS
 	$(SED) 's/$$(CCOPTS)//' $(@D)/netem/Makefile
-	$(TARGET_MAKE_ENV) $(MAKE) \
+	$(TARGET_MAKE_ENV) LDFLAGS="$(TARGET_LDFLAGS)" $(MAKE) \
 		DBM_INCLUDE="$(STAGING_DIR)/usr/include" \
 		CCOPTS="$(TARGET_CFLAGS) -D_GNU_SOURCE" -C $(@D)
 endef
-- 
2.3.1
