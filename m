From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Feb 2021 20:32:51 +0100
Subject: [Buildroot] [git commit] package/mongoose: fix activation of
 openssl/mbedtls
Message-ID: <20210216192158.11D9384822@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2707dd43ec537e9d15c69191fb4bc86474900ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

MG_ENABLE_SSL and MG_SSL_IF have been dropped since version 7.0 and
https://github.com/cesanta/mongoose/commit/f2fba1d2004c5ddf2fc0a7ca8dc75b5f78feed85

So use the new MG_ENABLE_OPENSSL and MG_ENABLE_MBEDTLS variables

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongoose/mongoose.mk | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index ae20965be4..996cbff757 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -16,14 +16,10 @@ MONGOOSE_CFLAGS = $(TARGET_CFLAGS)
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MONGOOSE_DEPENDENCIES += openssl
-MONGOOSE_CFLAGS += \
-	-DMG_ENABLE_SSL \
-	-DMG_SSL_IF=MG_SSL_IF_OPENSSL
+MONGOOSE_CFLAGS += -DMG_ENABLE_OPENSSL=1
 else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
 MONGOOSE_DEPENDENCIES += mbedtls
-MONGOOSE_CFLAGS += \
-	-DMG_ENABLE_SSL \
-	-DMG_SSL_IF=MG_SSL_IF_MBEDTLS
+MONGOOSE_CFLAGS += -DMG_ENABLE_MBEDTLS=1
 endif
 
 define MONGOOSE_BUILD_CMDS
