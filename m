From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 11 Jun 2012 22:42:29 +0200
Subject: [Buildroot] [git commit] pciutils: simplify
Message-ID: <20120611205424.52CA496D5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=83f43bab374535fe39d93547fb03c52fa45ab0a8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No need for two seperate make invocations for installation.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pciutils/pciutils.mk |    8 ++------
 1 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 7de5fd7..d1c8db5 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -46,16 +46,12 @@ endef
 # Ditch install-lib if SHARED is an option in the future
 define PCIUTILS_INSTALL_TARGET_CMDS
 	$(MAKE) BUILDDIR=$(@D) -C $(@D) PREFIX=$(TARGET_DIR)/usr \
-		SHARED=$(PCIUTILS_SHARED) install
-	$(MAKE) BUILDDIR=$(@D) -C $(@D) PREFIX=$(TARGET_DIR)/usr \
-		SHARED=$(PCIUTILS_SHARED) install-lib
+		SHARED=$(PCIUTILS_SHARED) install install-lib
 endef
 
 define PCIUTILS_INSTALL_STAGING_CMDS
 	$(MAKE) BUILDDIR=$(@D) -C $(@D) PREFIX=$(STAGING_DIR)/usr \
-		SHARED=$(PCIUTILS_SHARED) install
-	$(MAKE) BUILDDIR=$(@D) -C $(@D) PREFIX=$(STAGING_DIR)/usr \
-		SHARED=$(PCIUTILS_SHARED) install-lib
+		SHARED=$(PCIUTILS_SHARED) install install-lib
 endef
 
 $(eval $(call GENTARGETS))
