From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Apr 2019 13:17:09 +0200
Subject: [Buildroot] [git commit] package/imagemagick: security bump to
 version 7.0.8-42
Message-ID: <20190430111513.8E45E83D90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43ff6b974c6a5d07a705ebbdfdb7cd11ecff9c4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

- CVE-2019-9956: In ImageMagick 7.0.8-35 Q16, there is a stack-based buffer
  overflow in the function PopHexPixel of coders/ps.c, which allows an
  attacker to cause a denial of service or code execution via a crafted
  image file.

- CVE-2019-10650: In ImageMagick 7.0.8-36 Q16, there is a heap-based buffer
  over-read in the function WriteTIFFImage of coders/tiff.c, which allows an
  attacker to cause a denial of service or information disclosure via a
  crafted image file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 09bfb2a2e9..e89aa557c1 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 94866968a447f8f92a969bf5342d612d05a64c71fc75e63bb2d8ecf887dc7fa2  7.0.8-27.tar.gz
+sha256 2a1ca5f9c38e6596a5ee9fdbbaebba1d21b57618e892c72c8e4e63ced571af40  7.0.8-42.tar.gz
 sha256 5b47db932754743460eba7a226aea85b63e3408d3c7affb4d0117f70c9594ded  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 81e49eb62c..5ea79bed49 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.8-27
+IMAGEMAGICK_VERSION = 7.0.8-42
 IMAGEMAGICK_SOURCE = $(IMAGEMAGICK_VERSION).tar.gz
 IMAGEMAGICK_SITE = https://github.com/ImageMagick/ImageMagick/archive
 IMAGEMAGICK_LICENSE = Apache-2.0
