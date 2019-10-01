From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue,  1 Oct 2019 11:08:32 +0200
Subject: [Buildroot] [PATCH] package/kf5-kcoreaddons: make passing CXXFLAGS
 to cmake clearer
Message-ID: <20191001090832.43400-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Better to keep final assignment to *_CONF_OPTS after all assignements to
KF5_KCOREADDONS_CXXFLAGS have been done. So move _CONF_OPTS assignment
after -latomic assignment.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk b/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk
index ea6aac4ec6..164bad1225 100644
--- a/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk
+++ b/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk
@@ -14,10 +14,11 @@ KF5_KCOREADDONS_DEPENDENCIES = kf5-extra-cmake-modules qt5tools
 KF5_KCOREADDONS_INSTALL_STAGING = YES
 
 KF5_KCOREADDONS_CXXFLAGS = $(TARGET_CXXFLAGS)
-KF5_KCOREADDONS_CONF_OPTS = -DCMAKE_CXX_FLAGS="$(KF5_KCOREADDONS_CXXFLAGS)"
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 KF5_KCOREADDONS_CXXFLAGS += -latomic
 endif
 
+KF5_KCOREADDONS_CONF_OPTS = -DCMAKE_CXX_FLAGS="$(KF5_KCOREADDONS_CXXFLAGS)"
+
 $(eval $(cmake-package))
-- 
2.20.1
