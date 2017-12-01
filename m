From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 22:58:13 +0100
Subject: [Buildroot] [git commit] qt5webkit: fix typo in the
 <pkg>_DEPENDENCIES declaration
Message-ID: <20171201215250.0235A7FA69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=99809a0ae8a8fc6e9034a577bac158cc89e8ac44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit fixes a typo introduced in commit
43e1d099b4fca37ce7cbbf3dd41fe4330610b723 ("Revert
"package/qt5webkit-examples: remove obsolete package""), which caused
qt5declarative to not be added as a dependency for the correct
package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5webkit-examples/qt5webkit-examples.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5webkit-examples/qt5webkit-examples.mk b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
index 59e9248..f81e994 100644
--- a/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
+++ b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
@@ -39,7 +39,7 @@ define QT5WEBKIT_EXAMPLES_INSTALL_STAGING_CMDS
 endef
 
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
-QT5WEBKIT_DEPENDENCIES += qt5declarative
+QT5WEBKIT_EXAMPLES_DEPENDENCIES += qt5declarative
 define QT5WEBKIT_EXAMPLES_INSTALL_QML
 	cp -dpfr $(@D)/examples/webkitqml $(TARGET_DIR)/usr/lib/qt/examples
 endef
