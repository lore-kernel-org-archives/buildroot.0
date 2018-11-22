From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 22 Nov 2018 20:04:55 +0100
Subject: [Buildroot] [PATCH 1/2] libsoxr: add optional ffmpeg dependency
Message-ID: <20181122190456.17764-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

avutil is used if (WITH_AVFFT OR (CMAKE_SYSTEM_PROCESSOR MATCHES "^arm"
AND SIMD32_FOUND AND WITH_CR32))

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.14.1
