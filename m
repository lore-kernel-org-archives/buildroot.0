From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Mar 2013 20:29:41 +0100
Subject: [Buildroot] [PATCH v4 08/21] qt5base: install bundled fonts to
	target
In-Reply-To: <1363721394-14973-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1363721394-14973-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1363721394-14973-9-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Floris Bos <bos@je-eigen-domein.nl>

If not using font-config, Qt 5 offers a set of standard fonts to
use instead. Install these to target.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5base/qt5base.mk |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 3b4c007..83ce999 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -172,9 +172,17 @@ define QT5BASE_INSTALL_TARGET_PLUGINS
 	fi
 endef
 
+define QT5BASE_INSTALL_TARGET_FONTS
+	if [ -d $(STAGING_DIR)/usr/lib/fonts/ ] ; then \
+		mkdir -p $(TARGET_DIR)/usr/lib/fonts ; \
+		cp -dpfr $(STAGING_DIR)/usr/lib/fonts/* $(TARGET_DIR)/usr/lib/fonts ; \
+	fi
+endef
+
 define QT5BASE_INSTALL_TARGET_CMDS
 	$(QT5BASE_INSTALL_TARGET_LIBS)
 	$(QT5BASE_INSTALL_TARGET_PLUGINS)
+	$(QT5BASE_INSTALL_TARGET_FONTS)
 endef
 
 $(eval $(generic-package))
-- 
1.7.9.5
