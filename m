From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Dec 2015 21:28:57 +0100
Subject: [Buildroot] [git commit] qt5/qt5webchannel: add qwebchannel.js
	installation in /var/www
Message-ID: <20151223202905.99411826EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=77a08db6a1e2b63704fcd6e6949fe25de9a5f4e1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To use webchannel in an application qwebchannel.js is needed but this file was not
installed.

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5webchannel/qt5webchannel.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
index cfb6da9..bd4257f 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.mk
+++ b/package/qt5/qt5webchannel/qt5webchannel.mk
@@ -35,6 +35,11 @@ define QT5WEBCHANNEL_INSTALL_STAGING_CMDS
 	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
+define QT5WEBCHANNEL_INSTALL_TARGET_JAVASCRIPT
+        $(INSTALL) -m 0644 -D $(@D)/src/webchannel/qwebchannel.js \
+		$(TARGET_DIR)/var/www/qwebchannel.js
+endef
+
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
 define QT5WEBCHANNEL_INSTALL_TARGET_QMLS
 	cp -dpfr $(STAGING_DIR)/usr/qml/QtWebChannel $(TARGET_DIR)/usr/qml/
@@ -56,6 +61,7 @@ endif
 define QT5WEBCHANNEL_INSTALL_TARGET_CMDS
 	$(QT5WEBCHANNEL_INSTALL_TARGET_LIBS)
 	$(QT5WEBCHANNEL_INSTALL_TARGET_QMLS)
+	$(QT5WEBCHANNEL_INSTALL_TARGET_JAVASCRIPT)
 endef
 
 $(eval $(generic-package))
