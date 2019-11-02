From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sat,  2 Nov 2019 09:30:03 -0300
Subject: [Buildroot] [PATCH] package/dtc: do not install headers for the
 target version
Message-ID: <20191102123003.8394-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

They are not required on the target and installing them is just a waste
of time.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/dtc/dtc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index 35ac0b332b..1e5ab992a6 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -37,7 +37,7 @@ endef
 ifeq ($(BR2_PACKAGE_DTC_PROGRAMS),y)
 
 DTC_LICENSE += , GPL-2.0+ (programs)
-DTC_INSTALL_GOAL = install
+DTC_INSTALL_GOAL = install-bin install-lib
 ifeq ($(BR2_PACKAGE_BASH),)
 DTC_POST_INSTALL_TARGET_HOOKS += DTC_POST_INSTALL_TARGET_RM_DTDIFF
 endif
-- 
2.18.1
