From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Oct 2019 10:43:12 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/libnss: remove
 useless NSS_ENABLE_ECC variable
Message-ID: <20191030102014.9286C8DF43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=906a068a10c3c7ea950936c7cd4f4277cf2472a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

NSS_ENABLE_ECC is not supported anymore, then remove it from our
libnss.mk file.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 8223904643227f94bcabc533b85e4abb5ef8c078)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
