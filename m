From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2021 11:23:02 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/lcms2: disable
 tiff
Message-ID: <20210217100227.E934A85FF1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=db859a4fef218fd27457be3cc2e050dd8249ff46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

tiff is only used by tificc sample and upstream rejected the patch to
fix the static build failure because "adding pkg-config dependency for a
sample is an overkill": https://github.com/mm2/Little-CMS/pull/244

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d4da2e2083a2d56bc7d7d41a4c8baf2b2fb8fd26)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lcms2/lcms2.mk | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index d42c8c9a1f..1e73f6ba82 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -9,6 +9,8 @@ LCMS2_SITE = http://downloads.sourceforge.net/project/lcms/lcms/$(LCMS2_VERSION)
 LCMS2_LICENSE = MIT
 LCMS2_LICENSE_FILES = COPYING
 LCMS2_INSTALL_STAGING = YES
+# tiff is only used by tificc sample
+LCMS2_CONF_OPTS = --without-tiff
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
 LCMS2_CONF_OPTS += --with-jpeg
@@ -17,13 +19,6 @@ else
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
