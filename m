From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Apr 2019 22:13:36 +0200
Subject: [Buildroot] [git commit] package/ffmpeg: enable Intel QuickSync
 support
Message-ID: <20190416201301.4622C8ECA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8425169239b63c7b8d4f134acdb068f0edf04e1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Louis-Paul Cordier <lpdev@cordier.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ffmpeg/ffmpeg.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index eb237d3523..9a5a178a48 100644
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
