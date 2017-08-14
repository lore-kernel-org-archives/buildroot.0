From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 14 Aug 2017 08:35:48 +0200
Subject: [Buildroot] [PATCH] package/sysdig: fix incorrect module name
Message-ID: <1502692548-20503-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Latest version of sysdig introduced a variable for the kernel module
name. This patch updates that variable into Makefile.in.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/sysdig/sysdig.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
index 2d5ad23..ecafb9d 100644
--- a/package/sysdig/sysdig.mk
+++ b/package/sysdig/sysdig.mk
@@ -24,6 +24,7 @@ SYSDIG_SUPPORTS_IN_SOURCE_BUILD = NO
 define SYSDIG_MODULE_GEN_MAKEFILE
 	$(INSTALL) -m 0644 $(@D)/driver/Makefile.in $(@D)/driver/Makefile
 	$(SED) 's/@KBUILD_FLAGS@//;' $(@D)/driver/Makefile
+	$(SED) 's/@PROBE_NAME@/sysdig-probe/;' $(@D)/driver/Makefile
 endef
 SYSDIG_POST_PATCH_HOOKS += SYSDIG_MODULE_GEN_MAKEFILE
 
-- 
2.7.4
