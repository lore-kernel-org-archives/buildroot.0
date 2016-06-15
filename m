From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jun 2016 09:34:23 -0300
Subject: [Buildroot] [PATCH 3/3] imagemagick: add explicit lzma (xz) support
In-Reply-To: <1465994063-17292-1-git-send-email-gustavo@zacarias.com.ar>
References: <1465994063-17292-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1465994063-17292-3-git-send-email-gustavo@zacarias.com.ar>
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
index 641eafb..5ec9174 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -106,6 +106,13 @@ else
 IMAGEMAGICK_CONF_OPTS += --without-tiff
 endif
 
+ifeq ($(BR2_PACKAGE_XZ),y)
+IMAGEMAGICK_CONF_OPTS += --with-lzma
+IMAGEMAGICK_DEPENDENCIES += xz
+else
+IMAGEMAGICK_CONF_OPTS += --without-lzma
+endif
+
 ifeq ($(BR2_PACKAGE_FFTW),y)
 # configure script misdetects these leading to build errors
 IMAGEMAGICK_CONF_ENV += ac_cv_func_creal=yes ac_cv_func_cimag=yes
-- 
2.7.3
