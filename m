From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 23 Oct 2019 12:23:29 +0200
Subject: [Buildroot] [PATCH 3/4] package/libnss: remove useless
 NSS_ENABLE_ECC variable
In-Reply-To: <20191023102330.20842-1-giulio.benetti@benettiengineering.com>
References: <20191023102330.20842-1-giulio.benetti@benettiengineering.com>
Message-ID: <20191023102330.20842-3-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

NSS_ENABLE_ECC is not supported anymore, then remove it from our
libnss.mk file.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 472936db89..ca1cde4c1c 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -50,7 +50,6 @@ LIBNSS_BUILD_VARS = \
 	NS_USE_GCC=1 \
 	NSS_DISABLE_GTESTS=1 \
 	NSS_USE_SYSTEM_SQLITE=1 \
-	NSS_ENABLE_ECC=1 \
 	NATIVE_CC="$(HOSTCC)" \
 	OS_ARCH="Linux" \
 	OS_RELEASE="2.6" \
@@ -121,7 +120,6 @@ HOST_LIBNSS_BUILD_VARS = \
 	NSS_USE_SYSTEM_SQLITE=1 \
 	SQLITE_INCLUDE_DIR=$(HOST_DIR)/include \
 	ZLIB_INCLUDE_DIR=$(HOST_DIR)/include \
-	NSS_ENABLE_ECC=1 \
 	NSS_ENABLE_WERROR=0
 
 HOST_LIBNSS_DEPENDENCIES = host-libnspr host-sqlite host-zlib
-- 
2.20.1
