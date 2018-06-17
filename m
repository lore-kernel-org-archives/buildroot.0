From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 16:49:21 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] jpeg-turbo: add license
 details
Message-ID: <20180617150241.39EAE81213@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e4e64a171475266d55bee93e77f570e5983cd3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

- jpeg-turbo is covered by 3 licenses: IJG (libjpeg),
  BSD-3-Clause (TurboJPEG) and Zlib (SIMD)
- Add README.ijg
- Add hash for license files

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ca668476b3aa0ce42e7ffb79f484c5eadbcc99d2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jpeg-turbo/jpeg-turbo.hash | 2 ++
 package/jpeg-turbo/jpeg-turbo.mk   | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.hash b/package/jpeg-turbo/jpeg-turbo.hash
index 320bbb2a94..11b323b8bf 100644
--- a/package/jpeg-turbo/jpeg-turbo.hash
+++ b/package/jpeg-turbo/jpeg-turbo.hash
@@ -3,3 +3,5 @@ sha1 e788f6defa58b4393a5e1685c018f3b962971457  libjpeg-turbo-1.5.2.tar.gz
 md5 6b4923e297a7eaa255f08511017a8818  libjpeg-turbo-1.5.2.tar.gz
 # Locally computed
 sha256 9098943b270388727ae61de82adec73cf9f0dbb240b3bc8b172595ebf405b528  libjpeg-turbo-1.5.2.tar.gz
+sha256 5c08657eda60b7946a913ee22ac73603335a468a6aa95204506a1586a8d677ee  LICENSE.md
+sha256 53a3e3c299e08856964f4c5986e242c3695837b73c64625092f70c774e8af5d2  README.ijg
diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index bb1278f8b2..d52ab916e0 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -7,8 +7,8 @@
 JPEG_TURBO_VERSION = 1.5.2
 JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
 JPEG_TURBO_SITE = https://downloads.sourceforge.net/project/libjpeg-turbo/$(JPEG_TURBO_VERSION)
-JPEG_TURBO_LICENSE = jpeg-license (BSD-3-Clause-like)
-JPEG_TURBO_LICENSE_FILES = LICENSE.md
+JPEG_TURBO_LICENSE = IJG (libjpeg), BSD-3-Clause (TurboJPEG), Zlib (SIMD)
+JPEG_TURBO_LICENSE_FILES = LICENSE.md README.ijg
 JPEG_TURBO_INSTALL_STAGING = YES
 JPEG_TURBO_PROVIDES = jpeg
 JPEG_TURBO_DEPENDENCIES = host-pkgconf
