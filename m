From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 20 Nov 2015 15:47:20 -0300
Subject: [Buildroot] [PATCH 2/2] libnss: bump to version 3.21
In-Reply-To: <1448045240-23847-1-git-send-email-gustavo@zacarias.com.ar>
References: <1448045240-23847-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1448045240-23847-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable gtests since they require C++ support.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 68f50ea..4fa5897 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,2 +1,2 @@
-# From https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_20_1_RTM/src/SHA256SUMS
-sha256	ad3c8f11dfd9570c2d04a6140d5ef7c2bdd0fe30d6c9e5548721a4251a5e8c97	nss-3.20.1.tar.gz
+# From https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_21_RTM/src/SHA256SUMS
+sha256	3f7a5b027d7cdd5c0e4ff7544da33fdc6f56c2f8c27fff02938fd4a6fbe87239	nss-3.21.tar.gz
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index a15fab2..10879e2 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.20.1
+LIBNSS_VERSION = 3.21
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
@@ -19,6 +19,7 @@ LIBNSS_BUILD_VARS = \
 	NSPR_LIB_DIR=$(STAGING_DIR)/usr/lib \
 	BUILD_OPT=1 \
 	NS_USE_GCC=1 \
+	NSS_DISABLE_GTESTS=1 \
 	NSS_USE_SYSTEM_SQLITE=1 \
 	NSS_ENABLE_ECC=1 \
 	NATIVE_CC="$(HOSTCC)" \
-- 
2.4.10
