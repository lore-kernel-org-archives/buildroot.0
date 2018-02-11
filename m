From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Sat, 10 Feb 2018 19:18:37 -0500
Subject: [Buildroot] [PATCH 1/1] qt5webengine: replace $(HOST_DIR)/usr/bin
 with $(HOST_DIR)/bin
Message-ID: <20180211001837.25986-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Apply effect of commit 0f9c0bf3d5 to Qt WebEngine.

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---

This package was not yet merged and it has escaped from the global
replace.

 package/qt5/qt5webengine/qt5webengine.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index c283b49c3f..43ffde4f85 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -39,7 +39,7 @@ endef
 QT5WEBENGINE_PRE_CONFIGURE_HOOKS += QT5WEBENGINE_PYTHON2_SYMLINK
 
 define QT5WEBENGINE_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBENGINE_ENV) $(HOST_DIR)/usr/bin/qmake $(QT5WEBENGINE_QMAKEFLAGS))
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBENGINE_ENV) $(HOST_DIR)/bin/qmake $(QT5WEBENGINE_QMAKEFLAGS))
 endef
 
 define QT5WEBENGINE_BUILD_CMDS
-- 
2.15.1
