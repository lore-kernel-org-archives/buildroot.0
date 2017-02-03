From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 3 Feb 2017 14:25:04 +0100
Subject: [Buildroot] [git commit branch/2016.11.x] imagemagick: security
	bump to version 7.0.4-6
Message-ID: <20170203132519.236668195D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc7fd80cc9e5aadb71cf9354d435236e0a6c771e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2016.11.x

Fixes an use of uninitialized data issue in MAT image format that may have
security impact:

https://github.com/ImageMagick/ImageMagick/issues/362

[Peter: extend commit message, mention (potential) security impact]
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

(cherry picked from commit e5f505efac725b7e12b22f1341ce0523df73a79f)
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 3f5bfb1..90e1db5 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From http://www.imagemagick.org/download/releases/digest.rdf
-sha256 69178335a906202928571e25b1670a4bb066500b9693c7ba554583e8d700fcf5  ImageMagick-7.0.4-5.tar.xz
+sha256 1ee004740b7ab47fff3c92ae4a89dcbd0181c4d5f31fcb7e3697412ea384a0da  ImageMagick-7.0.4-6.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 64c6a35..a917297 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.4-5
+IMAGEMAGICK_VERSION = 7.0.4-6
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
