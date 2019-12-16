From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 16 Dec 2019 17:14:15 +0100
Subject: [Buildroot] [PATCH] package/libnss: remove check against
 GCC_AT_LEAST_4_8
Message-ID: <20191216161415.25869-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

NSS_ENABLE_WERROR=0 is already added by default to LIBNSS_BUILD_VARS
previously, so let's remove this check and set.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
This patch must be applied after this series:
https://patchwork.ozlabs.org/project/buildroot/list/?series=148093
---
 package/libnss/libnss.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index ae49dbe1b2..9349276a90 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -56,12 +56,6 @@ LIBNSS_BUILD_VARS = \
 	OS_TEST="$(LIBNSS_ARCH)" \
 	NSS_ENABLE_WERROR=0
 
-# #pragma usage needs gcc >= 4.8
-# See https://bugzilla.mozilla.org/show_bug.cgi?id=1226179
-ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_8),)
-LIBNSS_BUILD_VARS += NSS_ENABLE_WERROR=0
-endif
-
 ifeq ($(BR2_ARCH_IS_64),y)
 # MIPS64 n32 is treated as a 32-bit architecture by libnss.
 # See: https://bugzilla.mozilla.org/show_bug.cgi?id=1010730
-- 
2.20.1
