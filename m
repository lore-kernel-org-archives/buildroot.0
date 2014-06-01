From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  1 Jun 2014 11:24:30 +0200
Subject: [Buildroot] [PATCH v4 08/11] openpowerlink: do not override
	CMAKE_BUILD_TYPE
In-Reply-To: <1401614673-3703-1-git-send-email-s.martin49@gmail.com>
References: <1401614673-3703-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1401614673-3703-9-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This flag is already correctly set by the cmake-package infrastructure.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v3 -> v4:
- rebase

changes v2 -> v3:
- new patch
---
 package/openpowerlink/openpowerlink.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/openpowerlink/openpowerlink.mk b/package/openpowerlink/openpowerlink.mk
index 152f014..a888eb3 100644
--- a/package/openpowerlink/openpowerlink.mk
+++ b/package/openpowerlink/openpowerlink.mk
@@ -25,12 +25,6 @@ OPENPOWERLINK_CONF_OPT = -DCMAKE_SYSTEM_PROCESSOR=$(OPENPOWERLINK_ARCH)
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
