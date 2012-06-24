From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jun 2012 23:30:08 +0200
Subject: [Buildroot] [PATCH] imagemagick: use alternate download location
Message-ID: <1340573408-31114-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The official ImageMagick site only keeps the latest versions. Even in
the legacy/ directory, they only keep the last version of each
'branch'. Therefore, to avoid problems, we use an alternate download
site.

Fixes
http://autobuild.buildroot.org/results/2269aa42a0a21730ff0ec28af89cd4973ec28751/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/imagemagick/imagemagick.mk |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 32eb371..a8b69c7 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -7,7 +7,10 @@
 IMAGEMAGICK_MAJOR = 6.7.6
 IMAGEMAGICK_VERSION = $(IMAGEMAGICK_MAJOR)-9
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.bz2
-IMAGEMAGICK_SITE = ftp://ftp.imagemagick.org/pub/ImageMagick
+# The official ImageMagick site only keeps the latest versions
+# available, which is annoying. Use an alternate site that keeps all
+# older versions.
+IMAGEMAGICK_SITE = ftp://ftp.nluug.nl/pub/ImageMagick/
 IMAGEMAGICK_INSTALL_STAGING = YES
 IMAGEMAGICK_AUTORECONF = YES
 
-- 
1.7.9.5
