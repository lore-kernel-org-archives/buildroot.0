From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2017 23:25:23 +1300
Subject: [Buildroot] [git commit] qt5base: add examples license information
Message-ID: <20170128102924.C242E81EBD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=abd35cad939250cc7e7a0657233e9debf9441efc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5base/qt5base.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 45ba4e6..bbbaf0f 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -47,6 +47,10 @@ ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 QT5BASE_CONFIGURE_OPTS += -opensource -confirm-license
 QT5BASE_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5BASE_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
+QT5BASE_LICENSE := $(QT5BASE_LICENSE), BSD-3c (examples)
+QT5BASE_LICENSE_FILES += header.BSD
+endif
 else
 QT5BASE_LICENSE = Commercial license
 QT5BASE_REDISTRIBUTE = NO
