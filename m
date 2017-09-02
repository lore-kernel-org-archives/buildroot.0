From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 02 Sep 2017 13:13:51 -0000
Subject: [Buildroot] [git commit] package/sysdig: fix incorrect module name
Message-ID: <20170902130618.016DE818F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=204ed2e0b08a43ac69cbacf85bb1acaf0633cba5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Latest version of sysdig introduced a variable for the kernel module
name. This patch updates that variable into Makefile.in.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
