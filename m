From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  2 Apr 2018 13:58:26 +0200
Subject: [Buildroot] [PATCH 1/4] package/ffmpeg: add support for libressl
Message-ID: <20180402115829.16778-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ffmpeg builds fine with current libressl 2.7.2.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/ffmpeg.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 71d642cf4c..432e4cda09 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -214,13 +214,13 @@ FFMPEG_CONF_OPTS += --enable-gnutls --disable-openssl
 FFMPEG_DEPENDENCIES += gnutls
 else
 FFMPEG_CONF_OPTS += --disable-gnutls
-ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
 # openssl isn't license compatible with GPL
 ifeq ($(BR2_PACKAGE_FFMPEG_GPL)x$(BR2_PACKAGE_FFMPEG_NONFREE),yx)
 FFMPEG_CONF_OPTS += --disable-openssl
 else
 FFMPEG_CONF_OPTS += --enable-openssl
-FFMPEG_DEPENDENCIES += libopenssl
+FFMPEG_DEPENDENCIES += openssl
 endif
 else
 FFMPEG_CONF_OPTS += --disable-openssl
-- 
2.14.2
