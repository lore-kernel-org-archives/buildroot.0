From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 15 Sep 2020 21:05:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/ecryptfs-utils: fix build failure
 without pod2man
Message-ID: <20200915190556.605608-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set ac_cv_path_POD2MAN to true to avoid the following build failure:

checking for pod2man... no
configure: error: I couldn't find pod2man; make sure it's installed and in your path

Fixes:
 - http://autobuild.buildroot.org/results/7a3a182aa91a07a720a02f854c59f952930708e1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ecryptfs-utils/ecryptfs-utils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
index 326ff4f2dd..3a3253a366 100644
--- a/package/ecryptfs-utils/ecryptfs-utils.mk
+++ b/package/ecryptfs-utils/ecryptfs-utils.mk
@@ -15,6 +15,7 @@ ECRYPTFS_UTILS_CONF_OPTS = --disable-pywrap
 
 #Needed for build system to find pk11func.h and libnss3.so
 ECRYPTFS_UTILS_CONF_ENV = \
+	ac_cv_path_POD2MAN=true \
 	NSS_CFLAGS="-I$(STAGING_DIR)/usr/include/nss -I$(STAGING_DIR)/usr/include/nspr" \
 	NSS_LIBS="-lnss3"
 
-- 
2.28.0
