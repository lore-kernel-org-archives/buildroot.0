From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed, 28 Nov 2018 17:12:39 +0100
Subject: [Buildroot] [PATCH 09/11] libvips: reference explicitly fftw double
In-Reply-To: <1543421561-37355-8-git-send-email-gwenj@trabucayre.com>
References: <1543421561-37355-1-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-2-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-3-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-4-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-5-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-6-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-7-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-8-git-send-email-gwenj@trabucayre.com>
Message-ID: <1543421561-37355-9-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/libvips/libvips.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
index 8078e046d1..ac566f85b7 100644
--- a/package/libvips/libvips.mk
+++ b/package/libvips/libvips.mk
@@ -68,9 +68,9 @@ else
 LIBVIPS_CONF_OPTS += --without-tiff
 endif
 
-ifeq ($(BR2_PACKAGE_FFTW),y)
+ifeq ($(BR2_PACKAGE_FFTW_PRECISION_DOUBLE),y)
 LIBVIPS_CONF_OPTS += --with-fftw
-LIBVIPS_DEPENDENCIES += fftw
+LIBVIPS_DEPENDENCIES += fftw-double
 else
 LIBVIPS_CONF_OPTS += --without-fftw
 endif
-- 
2.19.2
