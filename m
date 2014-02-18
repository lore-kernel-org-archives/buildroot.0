From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Feb 2014 21:39:56 +0100
Subject: [Buildroot] [PATCH v2 03/20] python3: removal of *.py/*.pyc is now
	done globally
In-Reply-To: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1392756013-27757-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python3/python3.mk | 21 ---------------------
 1 file changed, 21 deletions(-)

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
-- 
1.8.3.2
