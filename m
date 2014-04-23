From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 24 Apr 2014 00:48:30 +0200
Subject: [Buildroot] [PATCH 11/14] openpowerlink: do not override
	CMAKE_BUILD_TYPE
In-Reply-To: <1398293313-17580-1-git-send-email-s.martin49@gmail.com>
References: <1398293313-17580-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1398293313-17580-12-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This flag is already correctly set by the cmake-package infrastructure.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1 -> v2:
- new patch
---
 package/openpowerlink/openpowerlink.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/openpowerlink/openpowerlink.mk b/package/openpowerlink/openpowerlink.mk
index 37a06e5..db3ac74 100644
--- a/package/openpowerlink/openpowerlink.mk
+++ b/package/openpowerlink/openpowerlink.mk
@@ -26,12 +26,6 @@ OPENPOWERLINK_CONF_OPT = -DCMAKE_SYSTEM_PROCESSOR=$(OPENPOWERLINK_ARCH)
 # so force static lib to build libpowerlink.a
 OPENPOWERLINK_CONF_OPT += -DBUILD_SHARED_LIBS=OFF
 
-ifeq ($(BR2_ENABLE_DEBUG),y)
-OPENPOWERLINK_CONF_OPT += -DCMAKE_BUILD_TYPE=Debug
-else
-OPENPOWERLINK_CONF_OPT += -DCMAKE_BUILD_TYPE=Release
-endif
-
 OPENPOWERLINK_CONF_OPT += -DCFG_DEBUG_LVL=$(call qstrip,$(BR2_PACKAGE_OPENPOWERLINK_DEBUG_LEVEL))
 
 ifeq ($(BR2_PACKAGE_OPENPOWERLINK_LIBPCAP),y)
-- 
1.9.2
