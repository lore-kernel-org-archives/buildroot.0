From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 22 Nov 2012 01:17:55 +0100
Subject: [Buildroot] [PATCH 05/33] imagemagick: explicitly disable c++
	support if no c++ compiler available
In-Reply-To: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1353543503-8952-6-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/imagemagick/imagemagick.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 61a379d..365a073 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -35,6 +35,12 @@ IMAGEMAGICK_CONF_OPT = --program-transform-name='s,,,' \
 
 IMAGEMAGICK_DEPENDENCIES = host-pkgconf
 
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+IMAGEMAGICK_CONF_OPT = --with-magick-plus-plus
+else
+IMAGEMAGICK_CONF_OPT = --without-magick-plus-plus
+endif
+
 ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
 IMAGEMAGICK_CONF_OPT += --with-fontconfig
 IMAGEMAGICK_DEPENDENCIES += fontconfig
-- 
1.8.0
