From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Oct 2020 21:48:07 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/qt5/qt5base:
 allow to use imx-gpu-viv as GBM provider
Message-ID: <20201002204714.90215861C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=11ab49f43e0c9e83bab5d23c90acbb71795ace96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

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
index ec56287ed0..689b28a986 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -80,6 +80,9 @@ QT5BASE_DEPENDENCIES += gcnano-binaries
 else ifeq ($(BR2_PACKAGE_TI_SGX_LIBGBM),y)
 QT5BASE_CONFIGURE_OPTS += -gbm
 QT5BASE_DEPENDENCIES += ti-sgx-libgbm
+else ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)
+QT5BASE_CONFIGURE_OPTS += -gbm
+QT5BASE_DEPENDENCIES += imx-gpu-viv
 else
 QT5BASE_CONFIGURE_OPTS += -no-gbm
 endif
