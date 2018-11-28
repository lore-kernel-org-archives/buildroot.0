From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed, 28 Nov 2018 17:12:38 +0100
Subject: [Buildroot] [PATCH 08/11] imagemagick: reference explicitly fftw
 double
In-Reply-To: <1543421561-37355-7-git-send-email-gwenj@trabucayre.com>
References: <1543421561-37355-1-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-2-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-3-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-4-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-5-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-6-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-7-git-send-email-gwenj@trabucayre.com>
Message-ID: <1543421561-37355-8-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/imagemagick/imagemagick.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 72482267ce..b766aa8432 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -113,11 +113,11 @@ else
 IMAGEMAGICK_CONF_OPTS += --without-lzma
 endif
 
-ifeq ($(BR2_PACKAGE_FFTW),y)
+ifeq ($(BR2_PACKAGE_FFTW_DOUBLE_PRECISION),y)
 # configure script misdetects these leading to build errors
 IMAGEMAGICK_CONF_ENV += ac_cv_func_creal=yes ac_cv_func_cimag=yes
 IMAGEMAGICK_CONF_OPTS += --with-fftw
-IMAGEMAGICK_DEPENDENCIES += fftw
+IMAGEMAGICK_DEPENDENCIES += fftw-double
 else
 IMAGEMAGICK_CONF_OPTS += --without-fftw
 endif
-- 
2.19.2
