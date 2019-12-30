From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Dec 2019 14:46:41 +0100
Subject: [Buildroot] [git commit] package/qt5/qt5base: support ti-sgx-libgbm
Message-ID: <20191230133719.450F38E822@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0e357a30931a8bf1d279bef68f914f60192d2c6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qt5 configure options: add ti-sgx-libgbm as GBM backend

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5base/qt5base.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 1a152be94b..774c771bc9 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -81,6 +81,9 @@ QT5BASE_DEPENDENCIES += mesa3d
 else ifeq ($(BR2_PACKAGE_GCNANO_BINARIES),y)
 QT5BASE_CONFIGURE_OPTS += -gbm
 QT5BASE_DEPENDENCIES += gcnano-binaries
+else ifeq ($(BR2_PACKAGE_TI_SGX_LIBGBM),y)
+QT5BASE_CONFIGURE_OPTS += -gbm
+QT5BASE_DEPENDENCIES += ti-sgx-libgbm
 else
 QT5BASE_CONFIGURE_OPTS += -no-gbm
 endif
