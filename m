From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Nov 2015 09:30:37 +0100
Subject: [Buildroot] [git commit branch/next] libnss: bump to version 3.21
Message-ID: <20151121083050.EE515817DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c0e48bb721363a78a12ace3785ffb4dc3c9e6f93
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Disable gtests since they require C++ support.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libnss/libnss.hash |    4 ++--
 package/libnss/libnss.mk   |    3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 9e24786..4fa5897 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,2 +1,2 @@
-# From https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_20_RTM/src/SHA256SUMS
-sha256	5e38d4b9837ca338af966b97fc91c07f67ad647fb38dc4af3cfd0d84e477d15c	nss-3.20.tar.gz
+# From https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_21_RTM/src/SHA256SUMS
+sha256	3f7a5b027d7cdd5c0e4ff7544da33fdc6f56c2f8c27fff02938fd4a6fbe87239	nss-3.21.tar.gz
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index f283bb3..10879e2 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.20
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
