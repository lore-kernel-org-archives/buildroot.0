From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jun 2016 23:11:49 +0200
Subject: [Buildroot] [git commit] imagemagick: add explicit pango support
Message-ID: <20160615211204.7488480401@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fa23075573790794ce7087666b864d38b85d1859
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/imagemagick/imagemagick.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 065f33d..641eafb 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -92,6 +92,13 @@ else
 IMAGEMAGICK_CONF_OPTS += --without-xml
 endif
 
+ifeq ($(BR2_PACKAGE_PANGO),y)
+IMAGEMAGICK_CONF_OPTS += --with-pango
+IMAGEMAGICK_DEPENDENCIES += pango
+else
+IMAGEMAGICK_CONF_OPTS += --without-pango
+endif
+
 ifeq ($(BR2_PACKAGE_TIFF),y)
 IMAGEMAGICK_CONF_OPTS += --with-tiff
 IMAGEMAGICK_DEPENDENCIES += tiff
