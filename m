From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Oct 2020 21:48:28 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/qt5/qt5base:
 allow to use imx-gpu-viv as GBM provider
Message-ID: <20201002204734.CFA9D8E1E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=985512051e8851c4c16c68f6c68daad5d228e792
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Needed in order to use eglfs_kms platform backend.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 82fb51d3b51685ebf2b7c5f3a1b1d749231e12a9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5base/qt5base.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 774c771bc9..f8f50530bc 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -84,6 +84,9 @@ QT5BASE_DEPENDENCIES += gcnano-binaries
 else ifeq ($(BR2_PACKAGE_TI_SGX_LIBGBM),y)
 QT5BASE_CONFIGURE_OPTS += -gbm
 QT5BASE_DEPENDENCIES += ti-sgx-libgbm
+else ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)
+QT5BASE_CONFIGURE_OPTS += -gbm
+QT5BASE_DEPENDENCIES += imx-gpu-viv
 else
 QT5BASE_CONFIGURE_OPTS += -no-gbm
 endif
