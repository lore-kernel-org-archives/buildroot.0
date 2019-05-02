From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  2 May 2019 18:45:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/kf5-kcoreaddons: fix build with
 atomic
Message-ID: <20190502164508.17162-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/d17c2fb420e395b995b2c2eef387f0c66e89c96c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk b/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk
index 6cf7a3d107..ea6aac4ec6 100644
--- a/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk
+++ b/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk
@@ -13,4 +13,11 @@ KF5_KCOREADDONS_LICENSE_FILES = COPYING.LIB
 KF5_KCOREADDONS_DEPENDENCIES = kf5-extra-cmake-modules qt5tools
 KF5_KCOREADDONS_INSTALL_STAGING = YES
 
+KF5_KCOREADDONS_CXXFLAGS = $(TARGET_CXXFLAGS)
+KF5_KCOREADDONS_CONF_OPTS = -DCMAKE_CXX_FLAGS="$(KF5_KCOREADDONS_CXXFLAGS)"
+
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+KF5_KCOREADDONS_CXXFLAGS += -latomic
+endif
+
 $(eval $(cmake-package))
-- 
2.20.1
