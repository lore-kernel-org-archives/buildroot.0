From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 23 Oct 2019 12:23:30 +0200
Subject: [Buildroot] [PATCH 4/4] package/libnss: remove NSS_ENABLE_WERROR=0
In-Reply-To: <20191023102330.20842-1-giulio.benetti@benettiengineering.com>
References: <20191023102330.20842-1-giulio.benetti@benettiengineering.com>
Message-ID: <20191023102330.20842-4-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All warnings have been fixed now, so let's remove NSS_ENABLE_WERROR and
leave any warning to show up.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index ca1cde4c1c..e1df7bbf33 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -53,8 +53,7 @@ LIBNSS_BUILD_VARS = \
 	NATIVE_CC="$(HOSTCC)" \
 	OS_ARCH="Linux" \
 	OS_RELEASE="2.6" \
-	OS_TEST="$(LIBNSS_ARCH)" \
-	NSS_ENABLE_WERROR=0
+	OS_TEST="$(LIBNSS_ARCH)"
 
 # #pragma usage needs gcc >= 4.8
 # See https://bugzilla.mozilla.org/show_bug.cgi?id=1226179
@@ -119,8 +118,7 @@ HOST_LIBNSS_BUILD_VARS = \
 	NSS_DISABLE_GTESTS=1 \
 	NSS_USE_SYSTEM_SQLITE=1 \
 	SQLITE_INCLUDE_DIR=$(HOST_DIR)/include \
-	ZLIB_INCLUDE_DIR=$(HOST_DIR)/include \
-	NSS_ENABLE_WERROR=0
+	ZLIB_INCLUDE_DIR=$(HOST_DIR)/include
 
 HOST_LIBNSS_DEPENDENCIES = host-libnspr host-sqlite host-zlib
 
-- 
2.20.1
