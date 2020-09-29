From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 29 Sep 2020 10:20:17 +0200
Subject: [Buildroot] [PATCH] package/qt5: allow to use imx-gpu-viv as GBM
 provider
Message-ID: <20200929082017.19485-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed in order to use eglfs_kms platform backend.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/qt5/qt5base/qt5base.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 359a380075..1232a03778 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -79,6 +79,9 @@ QT5BASE_DEPENDENCIES += gcnano-binaries
 else ifeq ($(BR2_PACKAGE_TI_SGX_LIBGBM),y)
 QT5BASE_CONFIGURE_OPTS += -gbm
 QT5BASE_DEPENDENCIES += ti-sgx-libgbm
+else ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)
+QT5BASE_CONFIGURE_OPTS += -gbm
+QT5BASE_DEPENDENCIES += imx-gpu-viv
 else
 QT5BASE_CONFIGURE_OPTS += -no-gbm
 endif
-- 
2.28.0
