From: Patrick Gerber <kpa_info@yahoo.fr>
Date: Tue, 12 Feb 2013 13:24:06 +0100
Subject: [Buildroot] [PATCH 2/5] When using python3 a symlink "python" is
	added in staging and point to python3. This is needed to call
	python setup for external package. A second simlink is added
	to alias the config-3.3m directory to config
In-Reply-To: <1360671849-7621-1-git-send-email-kpa_info@yahoo.fr>
References: <1360671849-7621-1-git-send-email-kpa_info@yahoo.fr>
Message-ID: <1360671849-7621-3-git-send-email-kpa_info@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Patrick Gerber <kpa_info@yahoo.fr>
---
 package/python3/python3.mk |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 7551a7b..5974824 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -160,6 +160,14 @@ ifneq ($(BR2_PACKAGE_PYTHON),y)
 PYTHON3_POST_INSTALL_TARGET_HOOKS += PYTHON3_INSTALL_SYMLINK
 endif
 
+define HOST_PYTHON3_INSTALL_SYMLINK
+	ln -fs python3 $(HOST_DIR)/usr/bin/python
+	ln -fs config-3.3m $(HOST_DIR)/usr/lib/python3.3/config
+endef
+
+HOST_PYTHON3_POST_INSTALL_HOOKS += HOST_PYTHON3_INSTALL_SYMLINK
+
+
 ifeq ($(BR2_PACKAGE_PYTHON3_PY_ONLY),y)
 define PYTHON3_REMOVE_MODULES_FILES
 	for i in `find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) \
-- 
1.7.10.4
