From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 16 Apr 2021 01:27:39 -0600
Subject: [Buildroot] [PATCH 1/1] package/libdrm: fix -Dman-pages=false syntax
Message-ID: <20210416072740.574979-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current -Dmanpages=false syntax is invalid.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/libdrm/libdrm.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 98e1ac079d..f5b205bb00 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -17,7 +17,7 @@ LIBDRM_DEPENDENCIES = \
 
 LIBDRM_CONF_OPTS = \
 	-Dcairo-tests=false \
-	-Dmanpages=false
+	-Dman-pages=false
 
 ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
 LIBDRM_DEPENDENCIES += libatomic_ops
-- 
2.25.1
