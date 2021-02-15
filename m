From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 15 Feb 2021 18:28:48 +0100
Subject: [Buildroot] [PATCH 2/2] package/lcms2: disable tiff
In-Reply-To: <20210215172848.1084947-1-fontaine.fabrice@gmail.com>
References: <20210215172848.1084947-1-fontaine.fabrice@gmail.com>
Message-ID: <20210215172848.1084947-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tiff is only used by tificc sample and upstream rejected the patch to
fix the static build failure because "adding pkg-config dependency for a
sample is an overkill": https://github.com/mm2/Little-CMS/pull/244

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lcms2/lcms2.mk | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index 862fdd5896..44b9965a80 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -11,6 +11,8 @@ LCMS2_LICENSE_FILES = COPYING
 LCMS2_CPE_ID_VENDOR = littlecms
 LCMS2_CPE_ID_PRODUCT = little_cms
 LCMS2_INSTALL_STAGING = YES
+# tiff is only used by tificc sample
+LCMS2_CONF_OPTS = --without-tiff
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
 LCMS2_CONF_OPTS += --with-jpeg
@@ -19,13 +21,6 @@ else
 LCMS2_CONF_OPTS += --without-jpeg
 endif
 
-ifeq ($(BR2_PACKAGE_TIFF),y)
-LCMS2_CONF_OPTS += --with-tiff
-LCMS2_DEPENDENCIES += tiff
-else
-LCMS2_CONF_OPTS += --without-tiff
-endif
-
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 LCMS2_CONF_OPTS += --with-zlib
 LCMS2_DEPENDENCIES += zlib
-- 
2.30.0
