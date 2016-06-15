From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jun 2016 09:34:22 -0300
Subject: [Buildroot] [PATCH 2/3] imagemagick: add explicit pango support
In-Reply-To: <1465994063-17292-1-git-send-email-gustavo@zacarias.com.ar>
References: <1465994063-17292-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1465994063-17292-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
2.7.3
