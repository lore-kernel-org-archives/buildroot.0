From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri,  6 Mar 2020 08:14:38 +0100
Subject: [Buildroot] [PATCH 5/7] package/qt5: make it possible to use
 rockchip-mali-bifrost as GBM provider
In-Reply-To: <20200306071440.30433-1-miquel.raynal@bootlin.com>
References: <20200306071440.30433-1-miquel.raynal@bootlin.com>
Message-ID: <20200306071440.30433-6-miquel.raynal@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 package/qt5/qt5base/qt5base.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 72d18b87da..8803a4821e 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -84,6 +84,9 @@ QT5BASE_DEPENDENCIES += gcnano-binaries
 else ifeq ($(BR2_PACKAGE_TI_SGX_LIBGBM),y)
 QT5BASE_CONFIGURE_OPTS += -gbm
 QT5BASE_DEPENDENCIES += ti-sgx-libgbm
+else ifeq ($(BR2_PACKAGE_ROCKCHIP_MALI_BIFROST),y)
+QT5BASE_CONFIGURE_OPTS += -gbm
+QT5BASE_DEPENDENCIES += rockchip-mali-bifrost
 else
 QT5BASE_CONFIGURE_OPTS += -no-gbm
 endif
-- 
2.20.1
