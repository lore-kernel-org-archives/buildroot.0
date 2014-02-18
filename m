From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Feb 2014 22:50:04 +0100
Subject: [Buildroot] [git commit branch/next] python3: removal of *.py/*.pyc
	is now done globally
Message-ID: <20140218220744.857E29CA01@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e424050cfcaa2d14e10746908778615434cd0a49
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/python3.mk |   21 ---------------------
 1 files changed, 0 insertions(+), 21 deletions(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index b5e9689..d49fe48 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -159,26 +159,5 @@ ifneq ($(BR2_PACKAGE_PYTHON),y)
 PYTHON3_POST_INSTALL_TARGET_HOOKS += PYTHON3_INSTALL_SYMLINK
 endif
 
-ifeq ($(BR2_PACKAGE_PYTHON3_PY_ONLY),y)
-define PYTHON3_REMOVE_MODULES_FILES
-	for i in `find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) \
-		 -name __pycache__` ; do \
-		rm -rf $$i ; \
-	done
-endef
-endif
-
-ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY),y)
-define PYTHON3_REMOVE_MODULES_FILES
-	for i in `find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) \
-		 -name *.py` ; do \
-		rm -f $$i ; \
-	done
-endef
-endif
-
-PYTHON3_POST_INSTALL_TARGET_HOOKS += PYTHON3_REMOVE_MODULES_FILES
-
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
