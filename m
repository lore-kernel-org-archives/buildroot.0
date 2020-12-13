From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Dec 2020 22:47:10 +0100
Subject: [Buildroot] [git commit] package/mongoose: add mbedtls support
Message-ID: <20201213213211.1E0F087647@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe347897b81c546f82787fdc029bbc88c3731bad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mbedtls is supported since version 6.7 and
https://github.com/cesanta/mongoose/commit/65e01dbabc1f458af5ad8984f6eb5cb01ebae284

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mongoose/mongoose.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 87f56d7894..5faeafb374 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -16,7 +16,14 @@ MONGOOSE_CFLAGS = $(TARGET_CFLAGS)
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MONGOOSE_DEPENDENCIES += openssl
-MONGOOSE_CFLAGS += -DMG_ENABLE_SSL
+MONGOOSE_CFLAGS += \
+	-DMG_ENABLE_SSL \
+	-DMG_SSL_IF=MG_SSL_IF_OPENSSL
+else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+MONGOOSE_DEPENDENCIES += mbedtls
+MONGOOSE_CFLAGS += \
+	-DMG_ENABLE_SSL \
+	-DMG_SSL_IF=MG_SSL_IF_MBEDTLS
 endif
 
 define MONGOOSE_BUILD_CMDS
