From: Patrick Gerber <kpa_info@yahoo.fr>
Date: Wed, 13 Feb 2013 10:20:34 +0100
Subject: [Buildroot] [PATCH v3 2/5] Add python3 config directory simlink
In-Reply-To: <1360747237-30048-1-git-send-email-kpa_info@yahoo.fr>
References: <1360747237-30048-1-git-send-email-kpa_info@yahoo.fr>
Message-ID: <1360747237-30048-3-git-send-email-kpa_info@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a simlink to alias the python3.3/config-3.3m directory to python3.3/config
in the staging directory

Signed-off-by: Patrick Gerber <kpa_info@yahoo.fr>
---
 package/python3/python3.mk |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 7551a7b..8af4d50 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -160,6 +160,12 @@ ifneq ($(BR2_PACKAGE_PYTHON),y)
 PYTHON3_POST_INSTALL_TARGET_HOOKS += PYTHON3_INSTALL_SYMLINK
 endif
 
+define HOST_PYTHON3_INSTALL_SYMLINK
+	ln -fs config-3.3m $(HOST_DIR)/usr/lib/python3.3/config
+endef
+
+HOST_PYTHON3_POST_INSTALL_HOOKS += HOST_PYTHON3_INSTALL_SYMLINK
+
 ifeq ($(BR2_PACKAGE_PYTHON3_PY_ONLY),y)
 define PYTHON3_REMOVE_MODULES_FILES
 	for i in `find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) \
-- 
1.7.9.5
