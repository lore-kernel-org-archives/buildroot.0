From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 19 Mar 2013 22:41:48 +0100
Subject: [Buildroot] [git commit] qt5base: install bundled fonts to target
Message-ID: <20130319214236.26AD59B1BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cdfa21b06041eb601e0bea79f2c8f50e9d637384
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If not using font-config, Qt 5 offers a set of standard fonts to
use instead. Install these to target.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt5/qt5base/qt5base.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

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
