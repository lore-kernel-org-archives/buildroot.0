From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Apr 2015 21:52:41 +0200
Subject: [Buildroot] [git commit] qt5: fix license information for
	qt5multimedia and qt5xmlpatterns
Message-ID: <20150410195249.72DB18194C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bed46beb07bdc7a69dba26734079032d43c90cca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While most of the Qt5 components indeed seem to be under LGPLv2.1 with
exception, or LGPLv3 or GPLv2, the qt5multimedia and qt5xmlpatterns
components only carry the LGPLv2.1 and LGPLv3 license files, and not
the GPLv2 license file. So one can safely assume that the GPLv2 option
is not available for those components, and this commit adjusts the
<pkg>_LICENSE and <pkg>_LICENSE_FILES variables accordingly.

Fixes:

  http://autobuild.buildroot.org/results/c62/c62eef5e5b8add138cdab34e64103d974d0a510b/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/qt5/qt5multimedia/qt5multimedia.mk   |    4 ++--
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 0c8d2ec..763fc28 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -11,8 +11,8 @@ QT5MULTIMEDIA_DEPENDENCIES = qt5base
 QT5MULTIMEDIA_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5MULTIMEDIA_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
-QT5MULTIMEDIA_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.GPLv2
+QT5MULTIMEDIA_LICENSE = LGPLv2.1 with exception or LGPLv3
+QT5MULTIMEDIA_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3
 else
 QT5MULTIMEDIA_LICENSE = Commercial license
 QT5MULTIMEDIA_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index b69cac7..136da9f 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -11,8 +11,8 @@ QT5XMLPATTERNS_DEPENDENCIES = qt5base
 QT5XMLPATTERNS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5XMLPATTERNS_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
-QT5XMLPATTERNS_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.GPLv2
+QT5XMLPATTERNS_LICENSE = LGPLv2.1 with exception or LGPLv3
+QT5XMLPATTERNS_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3
 else
 QT5XMLPATTERNS_LICENSE = Commercial license
 QT5XMLPATTERNS_REDISTRIBUTE = NO
