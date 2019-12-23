From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Dec 2019 23:14:01 +0100
Subject: [Buildroot] [git commit branch/2019.02.x]
 package/kf5/kf5-kcoreaddons: make passing CXXFLAGS to cmake clearer
Message-ID: <20191223220606.D8BEE8E0D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=351a17368d1b338419a8dc889af79559882fb7b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Better to keep final assignment to *_CONF_OPTS after all assignements to
KF5_KCOREADDONS_CXXFLAGS have been done. So move _CONF_OPTS assignment
after -latomic assignment.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6a55afa7b8f0cb095e276f5d041eac17c6260c40)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
