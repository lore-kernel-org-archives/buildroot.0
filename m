From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 2 May 2013 23:53:07 +0200
Subject: [Buildroot] [git commit] qt: define license
Message-ID: <20130502215429.C3A3299A15@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e98a621323b2c30804351f8999f0a6c5b4419cbe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/qt.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index bd3dd33..93d2ed0 100644
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
