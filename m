From: Louis-Paul Cordier <lpdev@cordier.org>
Date: Thu, 31 Jan 2019 13:15:25 +0100
Subject: [Buildroot] [PATCH v2 5/6] ffmpeg: enable Intel QuickSync support.
In-Reply-To: <20190131121526.11816-1-lpdev@cordier.org>
References: <20190131121526.11816-1-lpdev@cordier.org>
Message-ID: <20190131121526.11816-6-lpdev@cordier.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Louis-Paul Cordier <lpdev@cordier.org>
---
v2:
- Fix typo.

 package/ffmpeg/ffmpeg.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index c42fa54cd1..673c79b4e9 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -309,6 +309,13 @@ else
 FFMPEG_CONF_OPTS += --disable-libbluray
 endif
 
+ifeq ($(BR2_PACKAGE_INTEL_MEDIASDK),y)
+FFMPEG_CONF_OPTS += --enable-libmfx
+FFMPEG_DEPENDENCIES += intel-mediasdk
+else
+FFMPEG_CONF_OPTS += --disable-libmfx
+endif
+
 ifeq ($(BR2_PACKAGE_RTMPDUMP),y)
 FFMPEG_CONF_OPTS += --enable-librtmp
 FFMPEG_DEPENDENCIES += rtmpdump
-- 
2.20.1
