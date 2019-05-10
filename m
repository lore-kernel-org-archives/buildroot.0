From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 May 2019 11:51:01 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/kf5-kcoreaddons:
 fix build with atomic
Message-ID: <20190510094833.E8AD581352@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c90b9d60c6668e2f0a67e059cdbd1779402eb686
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
 - http://autobuild.buildroot.org/results/d17c2fb420e395b995b2c2eef387f0c66e89c96c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2b8a3cf5ad27cbcef56398eab6ab7241943b48a0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
