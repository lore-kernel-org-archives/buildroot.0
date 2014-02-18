From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Feb 2014 21:40:00 +0100
Subject: [Buildroot] [PATCH v2 07/20] python3: use proper
	PYTHON3_VERSION_MAJOR instead of harcoding 3.3
In-Reply-To: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1392756013-27757-8-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some parts of python3.mk were hardcoding the 3.3 version as the major
version, which does not work for Python 3.4 and other future
versions. Instead, use the existing PYTHON3_VERSION_MAJOR.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python3/python3.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index d98ca38..477bdfb 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -127,7 +127,7 @@ PYTHON3_MAKE_ENV = \
 # trouble for cross compilation
 define PYTHON3_FIXUP_LIBDIR
 	$(SED) 's|^LIBDIR=.*|LIBDIR= $(STAGING_DIR)/usr/lib|' \
-	   $(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/config-3.3m/Makefile
+	   $(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/config-$(PYTHON3_VERSION_MAJOR)m/Makefile
 endef
 
 PYTHON3_POST_INSTALL_STAGING_HOOKS += PYTHON3_FIXUP_LIBDIR
@@ -141,7 +141,7 @@ define PYTHON3_REMOVE_USELESS_FILES
 	rm -f $(TARGET_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR)m-config
 	rm -f $(TARGET_DIR)/usr/bin/python3-config
 	rm -f $(TARGET_DIR)/usr/bin/smtpd.py.3
-	for i in `find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/config-3.3m/ \
+	for i in `find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/config-$(PYTHON3_VERSION_MAJOR)m/ \
 		-type f -not -name pyconfig.h -a -not -name Makefile` ; do \
 		rm -f $$i ; \
 	done
-- 
1.8.3.2
