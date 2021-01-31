From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 21:26:40 +0100
Subject: [Buildroot] [git commit] package/leptonica: add libwebp{demux,
 mux} optional dependency
Message-ID: <20210131200647.4A9A681537@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fdb1127cd8bb5231703a94fa8ecce5aaa2ddf882
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

leptonica optionally depends on webp/demux.h and webp/mux.h since
version 1.79.0:
https://github.com/DanBloomberg/leptonica/commit/a7c5bcdf04062aad3655642bdb853561a1c49733
https://github.com/DanBloomberg/leptonica/commit/0ce4b9cc0845b198583d51f0a0df277de8f8c5fa

Fixes:
 - http://autobuild.buildroot.org/results/1f8531e1651e82a1e93707ccb205d0e7a3cae1a3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/leptonica/leptonica.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/leptonica/leptonica.mk b/package/leptonica/leptonica.mk
index 06eda6acca..2fe55023cc 100644
--- a/package/leptonica/leptonica.mk
+++ b/package/leptonica/leptonica.mk
@@ -51,8 +51,15 @@ endif
 ifeq ($(BR2_PACKAGE_WEBP),y)
 LEPTONICA_DEPENDENCIES += webp
 LEPTONICA_CONF_OPTS += --with-libwebp
+ifeq ($(BR2_PACKAGE_WEBP_DEMUX)$(BR2_PACKAGE_WEBP_MUX),yy)
+LEPTONICA_CONF_OPTS += --with-libwebpmux
 else
-LEPTONICA_CONF_OPTS += --without-libwebp
+LEPTONICA_CONF_OPTS += --without-libwebpmux
+endif
+else
+LEPTONICA_CONF_OPTS += \
+	--without-libwebp \
+	--without-libwebpmux
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
