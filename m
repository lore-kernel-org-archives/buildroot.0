From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2021 00:39:09 +0100
Subject: [Buildroot] [git commit] package/imagemagick: add optional libraw
 support
Message-ID: <20210226231840.CFAF386322@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f47cfade4b298350d056f6d9a7525b837e2ba23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 5b4ba63c85..30200e95b0 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -88,6 +88,13 @@ else
 IMAGEMAGICK_CONF_OPTS += --without-png
 endif
 
+ifeq ($(BR2_PACKAGE_LIBRAW),y)
+IMAGEMAGICK_CONF_OPTS += --with-raw
+IMAGEMAGICK_DEPENDENCIES += libraw
+else
+IMAGEMAGICK_CONF_OPTS += --without-raw
+endif
+
 ifeq ($(BR2_PACKAGE_LIBRSVG),y)
 IMAGEMAGICK_CONF_OPTS += --with-rsvg
 IMAGEMAGICK_DEPENDENCIES += librsvg
@@ -182,6 +189,7 @@ HOST_IMAGEMAGICK_CONF_OPTS = \
 	--without-openexr \
 	--without-perl \
 	--without-raqm \
+	--without-raw \
 	--without-wmf \
 	--without-x \
 	--without-zip \
