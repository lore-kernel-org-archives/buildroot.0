From: Lothar Felten <lothar.felten@gmail.com>
Date: Tue, 15 Oct 2019 23:31:01 +0200
Subject: [Buildroot] [RFC PATCH 4/4] package/qt5/qt5base: support
 ti-sgx-libgbm
In-Reply-To: <20191015213101.27460-1-lothar.felten@gmail.com>
References: <20191015213101.27460-1-lothar.felten@gmail.com>
Message-ID: <20191015213101.27460-4-lothar.felten@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qt5 configure options: add ti-sgx-libgbm as GBM backend

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
---
 package/qt5/qt5base/qt5base.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index e4aa76908..0caa57000 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -74,10 +74,13 @@ else
 QT5BASE_CONFIGURE_OPTS += -no-kms
 endif
 
-# Uses libgbm from mesa3d
+# Uses libgbm from mesa3d or ti-sgx-libgbm
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
 QT5BASE_CONFIGURE_OPTS += -gbm
 QT5BASE_DEPENDENCIES += mesa3d
+else ifeq ($(BR2_PACKAGE_TI_SGX_LIBGBM),y)
+QT5BASE_CONFIGURE_OPTS += -gbm
+QT5BASE_DEPENDENCIES += ti-sgx-libgbm
 else
 QT5BASE_CONFIGURE_OPTS += -no-gbm
 endif
-- 
2.17.1
