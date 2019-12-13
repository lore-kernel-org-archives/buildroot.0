From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 13 Dec 2019 23:23:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/webrtc-audio-processing: needs
 host-pkgconf
Message-ID: <20191213222346.126207-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

configure fails if the pkgconfig.m4 macros are not available during
this package autoreconf:

./configure: line 11829: syntax error near unexpected token `GNUSTL,'
./configure: line 11829: `  PKG_CHECK_MODULES(GNUSTL, gnustl)'

Fixes:
 - http://autobuild.buildroot.org/results/9cbdfb76ea38864fce1acca88714c48c41c77255

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/webrtc-audio-processing/webrtc-audio-processing.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/webrtc-audio-processing/webrtc-audio-processing.mk b/package/webrtc-audio-processing/webrtc-audio-processing.mk
index 7edeaf961f..ff84a802d1 100644
--- a/package/webrtc-audio-processing/webrtc-audio-processing.mk
+++ b/package/webrtc-audio-processing/webrtc-audio-processing.mk
@@ -10,6 +10,7 @@ WEBRTC_AUDIO_PROCESSING_SITE = http://freedesktop.org/software/pulseaudio/webrtc
 WEBRTC_AUDIO_PROCESSING_INSTALL_STAGING = YES
 WEBRTC_AUDIO_PROCESSING_LICENSE = BSD-3-Clause
 WEBRTC_AUDIO_PROCESSING_LICENSE_FILES = COPYING
+WEBRTC_AUDIO_PROCESSING_DEPENDENCIES = host-pkgconf
 # 0001-Proper-detection-of-cxxabi.h-and-execinfo.h.patch
 WEBRTC_AUDIO_PROCESSING_AUTORECONF = YES
 
-- 
2.24.0
