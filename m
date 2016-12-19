From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 19 Dec 2016 21:10:21 +0100
Subject: [Buildroot] [PATCH v1 1/6] qt5base: add examples license information
Message-ID: <20161219201026.13040-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5base/qt5base.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 23dba2a18..2e56775c9 100644
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
-- 
2.11.0
