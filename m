From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu,  7 Feb 2013 22:02:35 +0100
Subject: [Buildroot] [PATCH v2 3/4] qt: define license
In-Reply-To: <1360270956-8896-1-git-send-email-luca@lucaceresoli.net>
References: <1360270956-8896-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1360270956-8896-3-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
Changed since v1:
 - automagically add commercial license (Thomas/Arnout suggestion).

 package/qt/qt.mk |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index ee1a88b..2838070 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -17,6 +17,12 @@ QT_SITE    = http://releases.qt-project.org/qt4/source
 QT_DEPENDENCIES = host-pkgconf
 QT_INSTALL_STAGING = YES
 
+QT_LICENSE = LGPLv2.1 with exceptions or GPLv3
+ifneq ($(BR2_PACKAGE_QT_LICENSE_APPROVED),y)
+QT_LICENSE += or Digia Qt Commercial license
+endif
+QT_LICENSE_FILES = LICENSE.LGPL LGPL_EXCEPTION.txt LICENSE.GPL3
+
 ifeq ($(BR2_PACKAGE_QT_LICENSE_APPROVED),y)
 QT_CONFIGURE_OPTS += -opensource -confirm-license
 endif
-- 
1.7.10.4
