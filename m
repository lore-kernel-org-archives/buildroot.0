From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Dec 2019 23:12:28 +0100
Subject: [Buildroot] [git commit] package/libnss: remove check against
 GCC_AT_LEAST_4_8
Message-ID: <20191225220323.A65728E54C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a8a935464c7f126c71d098d55d70c70a7fd75d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

NSS_ENABLE_WERROR=0 is already added by default to LIBNSS_BUILD_VARS
previously, so let's remove this check and set.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
