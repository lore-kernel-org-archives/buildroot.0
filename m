From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri,  6 Mar 2020 08:14:40 +0100
Subject: [Buildroot] [PATCH 7/7] package/qt5: allows using
 rockchip-mali-bifrost as OpenGL/KMS provider
In-Reply-To: <20200306071440.30433-1-miquel.raynal@bootlin.com>
References: <20200306071440.30433-1-miquel.raynal@bootlin.com>
Message-ID: <20200306071440.30433-8-miquel.raynal@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Maxime Chevallier <maxime.chevallier@bootlin.com>

In order to be able to use OpenGL with QT5 with a Rockchip Mali
Bifrost GPU, a device integration provider has to be selected. We are
interested in the KMS integration that works well with Mali Bifrost,
make sure it gets build when using rockchip-mali-bifrost as OpenGL
provider.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 package/qt5/qt5base/qt5base.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index ad01c7c843..2053988778 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -318,6 +318,9 @@ QT5BASE_EGLFS_DEVICE = EGLFS_DEVICE_INTEGRATION = eglfs_viv
 else ifeq ($(BR2_PACKAGE_SUNXI_MALI_UTGARD),y)
 # use mali backend
 QT5BASE_EGLFS_DEVICE = EGLFS_DEVICE_INTEGRATION = eglfs_mali
+else ifeq ($(BR2_PACKAGE_ROCKCHIP_MALI_BIFROST),y)
+# use kms backend
+QT5BASE_EGLFS_DEVICE = EGLFS_DEVICE_INTEGRATION = eglfs_kms
 endif
 endif
 
-- 
2.20.1
