From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Sep 2017 16:21:29 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/imagemagick:
	change download url to github
Message-ID: <20170921145320.005DC810E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aaeae2707270245b284edc8587114d41430cb3bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Upstream quickly removes old versions from
http://www.imagemagick.org/download/releases

For our LTS versions we should switch to a stable upstream repo which
provides all released versions.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 02edd7cd806bf9cac0633611084e3d980f1c701e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.hash | 4 ++--
 package/imagemagick/imagemagick.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 173dd41..3e2749d 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
-# From http://www.imagemagick.org/download/releases/digest.rdf
-sha256 0058fcde533986334458a5c99600b1b9633182dd9562cbad4ba618c5ccf2a28f  ImageMagick-7.0.5-10.tar.xz
+# Locally computed
+sha256 bd965d36a65cbcd420ec79a509a5ce0ecdfef036770cdc87fcd5374b9ed15ea7  7.0.5-10.tar.gz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 7aade62..23552d7 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 IMAGEMAGICK_VERSION = 7.0.5-10
-IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
-IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
+IMAGEMAGICK_SOURCE = $(IMAGEMAGICK_VERSION).tar.gz
+IMAGEMAGICK_SITE = https://github.com/ImageMagick/ImageMagick/archive
 IMAGEMAGICK_LICENSE = Apache-2.0
 IMAGEMAGICK_LICENSE_FILES = LICENSE
 
