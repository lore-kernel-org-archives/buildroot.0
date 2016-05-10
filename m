From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 May 2016 21:44:50 +0200
Subject: [Buildroot] [git commit] imagemagick: security bump to version
	6.9.4-1
Message-ID: <20160510194859.92BED81E9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=72b93bb6768654bc37e0dd9bc301a7ce5876962b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
Fix GetNextToken() off by one error.
Check for buffer overflow in magick/draw.c/DrawStrokePolygon().
Remove support for internal ephemeral coder.

These are all related to the recent ImageTragick bundle that were
partially fixed in 6.9.3-10 as well.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 135989f..9a2a3ee 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From http://www.imagemagick.org/download/releases/digest.rdf
-sha256 e33f021c879f31703f9e620f578ccf7d221a34941589da4bbe967b16a814336a ImageMagick-6.9.3-10.tar.xz
+sha256 2ea0fef839cd5d6f134502b7cf7ee0e57a3f230b19771515d4aa44354f4c6b3b ImageMagick-6.9.4-1.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 8ecf5d6..c952c2a 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 6.9.3-10
+IMAGEMAGICK_VERSION = 6.9.4-1
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
