From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2021 00:38:57 +0100
Subject: [Buildroot] [git commit] package/imagemagick: add optional zstd
 support
Message-ID: <20210226231840.C330A7F901@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d6667f31416295e53de67482eed81b988d4c7e99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 48892fd449..5b4ba63c85 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -110,6 +110,13 @@ else
 IMAGEMAGICK_CONF_OPTS += --without-zip
 endif
 
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+IMAGEMAGICK_CONF_OPTS += --with-zstd
+IMAGEMAGICK_DEPENDENCIES += zstd
+else
+IMAGEMAGICK_CONF_OPTS += --without-zstd
+endif
+
 ifeq ($(BR2_PACKAGE_PANGO),y)
 IMAGEMAGICK_CONF_OPTS += --with-pango
 IMAGEMAGICK_DEPENDENCIES += pango
@@ -178,6 +185,7 @@ HOST_IMAGEMAGICK_CONF_OPTS = \
 	--without-wmf \
 	--without-x \
 	--without-zip \
+	--without-zstd \
 	--without-bzlib \
 	--without-fftw \
 	--without-lcms \
