From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Nov 2018 18:33:50 +0100
Subject: [Buildroot] [git commit] package/libsoxr: add optional ffmpeg
 dependency
Message-ID: <20181124204013.EBBB1881A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ad4322dd66570031819a9f59fd3176e60e2512e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

avutil is used if (WITH_AVFFT OR (CMAKE_SYSTEM_PROCESSOR MATCHES "^arm"
AND SIMD32_FOUND AND WITH_CR32))

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libsoxr/libsoxr.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libsoxr/libsoxr.mk b/package/libsoxr/libsoxr.mk
index 5291f9474b..b34962c4ad 100644
--- a/package/libsoxr/libsoxr.mk
+++ b/package/libsoxr/libsoxr.mk
@@ -18,4 +18,8 @@ else
 LIBSOXR_CONF_OPTS += -DHAVE_WORDS_BIGENDIAN=0
 endif
 
+ifeq ($(BR2_PACKAGE_FFMPEG),y)
+LIBSOXR_DEPENDENCIES += ffmpeg
+endif
+
 $(eval $(cmake-package))
