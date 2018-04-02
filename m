From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 18:29:46 +0200
Subject: [Buildroot] [git commit] package/ffmpeg: add support for libressl
Message-ID: <20180402162949.48EF181502@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=158eab173d776414a123cb9b5d569375bfc1a2fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ffmpeg builds fine with current libressl 2.7.2.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
