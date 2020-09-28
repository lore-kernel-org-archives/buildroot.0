From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Sep 2020 23:01:58 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/ecryptfs-utils:
 fix build failure without pod2man
Message-ID: <20200928211157.7D3808E1D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b02393346f8a8a31139f2483d9535285b859e42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Set ac_cv_path_POD2MAN to true to avoid the following build failure:

checking for pod2man... no
configure: error: I couldn't find pod2man; make sure it's installed and in your path

Fixes:
 - http://autobuild.buildroot.org/results/7a3a182aa91a07a720a02f854c59f952930708e1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1030f295e629d749dfb731f5908f39114d5a8f36)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
