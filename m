From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 15:25:17 +0200
Subject: [Buildroot] [git commit branch/next] qt5/qtwebsocket: remove GPLv2
	license
Message-ID: <20150808105641.97F867FFCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=16d7f4af71ec18f5d28c4c13ebed3a41a7c131f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This module loose his GPLv2 licensing option. Remains the LGPLv2.1 with
exception and LGPLv3 as the possible open-source licenses.

Fixes:
http://autobuild.buildroot.net/results/6c80ba0669a7fc8cc60baaa849044fd65a78ce87/
Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5websockets/qt5websockets.mk |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
index 2b257e1..1d7c1f1 100644
--- a/package/qt5/qt5websockets/qt5websockets.mk
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -11,10 +11,8 @@ QT5WEBSOCKETS_DEPENDENCIES = qt5base
 QT5WEBSOCKETS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5WEBSOCKETS_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
-# Source files contain references to LGPL_EXCEPTION.txt but it is not included
-# in the archive.
-QT5WEBSOCKETS_LICENSE_FILES = LICENSE.LGPLv21 LICENSE.LGPLv3 LICENSE.GPLv2
+QT5WEBSOCKETS_LICENSE = LGPLv2.1 with exception or LGPLv3
+QT5WEBSOCKETS_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3
 else
 QT5WEBSOCKETS_LICENSE = Commercial license
 QT5WEBSOCKETS_REDISTRIBUTE = NO
