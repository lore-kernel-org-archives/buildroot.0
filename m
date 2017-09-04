From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Sep 2017 23:07:17 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] ffmpeg: security bump to
	version 3.2.7
Message-ID: <20170904211131.8D16181E41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ca9ecd20600d79ace1f777cfdef90dc18f0ebda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes the following security issues (https://ffmpeg.org/security.html):

3.2.4:

CVE-2017-5024 - FFmpeg in Google Chrome prior to 56.0.2924.76 for Linux,
Windows and Mac, failed to perform proper bounds checking, which allowed a
remote attacker to potentially exploit heap corruption via a crafted video
file.

CVE-2017-5025 - FFmpeg in Google Chrome prior to 56.0.2924.76 for Linux,
Windows and Mac, failed to perform proper bounds checking, which allowed a
remote attacker to potentially exploit heap corruption via a crafted video
file.

3.2.5:

CVE-2017-9991 - Heap-based buffer overflow in the xwd_decode_frame function
in libavcodec/xwddec.c in FFmpeg before 2.8.12, 3.0.x before 3.0.8, 3.1.x
before 3.1.8, 3.2.x before 3.2.5, and 3.3.x before 3.3.1 allows remote
attackers to cause a denial of service (application crash) or possibly have
unspecified other impact via a crafted file.

CVE-2017-9992 - Heap-based buffer overflow in the decode_dds1 function in
libavcodec/dfa.c in FFmpeg before 2.8.12, 3.0.x before 3.0.8, 3.1.x before
3.1.8, 3.2.x before 3.2.5, and 3.3.x before 3.3.1 allows remote attackers to
cause a denial of service (application crash) or possibly have unspecified
other impact via a crafted file.

CVE-2017-9994 - libavcodec/webp.c in FFmpeg before 2.8.12, 3.0.x before
3.0.8, 3.1.x before 3.1.8, 3.2.x before 3.2.5, and 3.3.x before 3.3.1 does
not ensure that pix_fmt is set, which allows remote attackers to cause a
denial of service (heap-based buffer overflow and application crash) or
possibly have unspecified other impact via a crafted file, related to the
vp8_decode_mb_row_no_filter and pred8x8_128_dc_8_c functions.

CVE-2017-9996 - The cdxl_decode_frame function in libavcodec/cdxl.c in
FFmpeg 2.8.x before 2.8.12, 3.0.x before 3.0.8, 3.1.x before 3.1.8, 3.2.x
before 3.2.5, and 3.3.x before 3.3.1 does not exclude the CHUNKY format,
which allows remote attackers to cause a denial of service (heap-based
buffer overflow and application crash) or possibly have unspecified other
impact via a crafted file.

3.2.6:

CVE-2017-9608 - NULL pointer exception.

CVE-2017-9993 - FFmpeg before 2.8.12, 3.0.x and 3.1.x before 3.1.9, 3.2.x
before 3.2.6, and 3.3.x before 3.3.2 does not properly restrict HTTP Live
Streaming filename extensions and demuxer names, which allows attackers to
read arbitrary files via crafted playlist data.

3.2.7:

CVE-2017-11399 - Integer overflow in the ape_decode_frame function in
libavcodec/apedec.c in FFmpeg through 3.3.2 allows remote attackers to cause
a denial of service (out-of-array access and application crash) or possibly
have unspecified other impact via a crafted APE file.

CVE-2017-11665 - The ff_amf_get_field_value function in
libavformat/rtmppkt.c in FFmpeg 3.3.2 allows remote RTMP servers to cause a
denial of service (Segmentation Violation and application crash) via a
crafted stream.

CVE-2017-11719 - The dnxhd_decode_header function in libavcodec/dnxhddec.c
in FFmpeg through 3.3.2 allows remote attackers to cause a denial of service
(out-of-array access) or possibly have unspecified other impact via a
crafted DNxHD file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg.hash | 2 +-
 package/ffmpeg/ffmpeg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index 6adf7e4..f4470f9 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 54ce502aca10b7e6059f19220ea2f68fa0c9c4c4d255ae13e615f08f0c94dcc5  ffmpeg-3.2.3.tar.xz
+sha256 28e75fc32485a88035a7ebf0a956a1e5c7e93b440dd4bbd6bc30c7268cf34fe9  ffmpeg-3.2.7.tar.xz
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 9c30e8f..00db404 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 3.2.3
+FFMPEG_VERSION = 3.2.7
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
