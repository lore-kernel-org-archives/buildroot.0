From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 30 Aug 2020 13:58:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/imagemagick: security bump to
 version 7.0.10-28
Message-ID: <20200830115813.303999-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Fix CVE-2019-17547: In ImageMagick before 7.0.8-62, TraceBezier in
  MagickCore/draw.c has a use-after-free.
- Fix CVE-2019-18853: ImageMagick before 7.0.9-0 allows remote attackers
  to cause a denial of service because XML_PARSE_HUGE is not properly
  restricted in coders/svg.c, related to SVG and libxml2.
- Update hash of LICENSE file (update in year with
  https://github.com/ImageMagick/ImageMagick/commit/f775a5cf27a95c42bb6d19b50f4869db265fdaa9)
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/imagemagick/imagemagick.hash | 4 ++--
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index f95fa275d1..080c77cfea 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 238ee17196fcb80bb58485910aaefc12d48f99e4043c2a28f06ff9588161c4e3  7.0.8-59.tar.gz
-sha256 5b47db932754743460eba7a226aea85b63e3408d3c7affb4d0117f70c9594ded  LICENSE
+sha256  9f2b8b131222354b196c640fca4e53eb0bbf62246621b9d467f223366272d7a7  7.0.10-28.tar.gz
+sha256  e2d364de83dd9e7c866bd99ee7dac2fe92071fb70e9b187293353fb285cf09ac  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 5ef04973a6..3a41981bc0 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.8-59
+IMAGEMAGICK_VERSION = 7.0.10-28
 IMAGEMAGICK_SOURCE = $(IMAGEMAGICK_VERSION).tar.gz
 IMAGEMAGICK_SITE = https://github.com/ImageMagick/ImageMagick/archive
 IMAGEMAGICK_LICENSE = Apache-2.0
-- 
2.28.0
