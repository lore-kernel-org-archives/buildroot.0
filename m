From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 21:28:13 +0200
Subject: [Buildroot] [git commit] ffmpeg: supports only the real OpenSSL,
	not LibreSSL
Message-ID: <20171021192125.82B8381110@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=803c49891fc10659aea8e612bc85fae4a09a0269
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ffmpeg will not build with LibreSSL without patches, so let's support
only OpenSSL.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/ffmpeg.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 801615c..1e758d3 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -208,13 +208,13 @@ FFMPEG_CONF_OPTS += --enable-gnutls --disable-openssl
 FFMPEG_DEPENDENCIES += gnutls
 else
 FFMPEG_CONF_OPTS += --disable-gnutls
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 # openssl isn't license compatible with GPL
 ifeq ($(BR2_PACKAGE_FFMPEG_GPL)x$(BR2_PACKAGE_FFMPEG_NONFREE),yx)
 FFMPEG_CONF_OPTS += --disable-openssl
 else
 FFMPEG_CONF_OPTS += --enable-openssl
-FFMPEG_DEPENDENCIES += openssl
+FFMPEG_DEPENDENCIES += libopenssl
 endif
 else
 FFMPEG_CONF_OPTS += --disable-openssl
