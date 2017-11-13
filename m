From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 13 Nov 2017 19:41:55 +0100
Subject: [Buildroot] [PATCH v3 2/2] qt5base: add sunxi-mali-mainline eglfs
 backend
In-Reply-To: <1510598515-29485-1-git-send-email-giulio.benetti@micronovasrl.com>
References: <1510598515-29485-1-git-send-email-giulio.benetti@micronovasrl.com>
Message-ID: <1510598515-29485-2-git-send-email-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qt5base: add support for sunxi-mali-mainline eglfs backend

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/qt5/qt5base/qt5base.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index ef99131..6ea42ec 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -245,6 +245,8 @@ ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)
 QT5BASE_EGLFS_DEVICE = eglfs_viv
 else ifeq ($(BR2_PACKAGE_SUNXI_MALI),y)
 QT5BASE_EGLFS_DEVICE = eglfs_mali
+else ifeq ($(BR2_PACKAGE_SUNXI_MALI_MAINLINE),y)
+QT5BASE_EGLFS_DEVICE = eglfs_mali
 endif
 endif
 
-- 
2.7.4
