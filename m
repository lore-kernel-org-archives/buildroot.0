From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:54:01 -0000
Subject: [Buildroot] [git commit branch/next] imagemagick: use alternate
	download location
Message-ID: <20120802195245.1F88B8C999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d044199e74d6dae0285f4739adc76c1b10c0b9b8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The official ImageMagick site only keeps the latest versions. Even in
the legacy/ directory, they only keep the last version of each
'branch'. Therefore, to avoid problems, we use an alternate download
site.

Fixes
http://autobuild.buildroot.org/results/2269aa42a0a21730ff0ec28af89cd4973ec28751/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/imagemagick/imagemagick.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

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
 
