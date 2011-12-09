From: Lukasz Pulka <lukasz@oxnet.pl>
Date: Fri,  9 Dec 2011 19:53:55 +0100
Subject: [Buildroot] [PATCH] ffmpeg: add TARGET_CFLAGS to configure
Message-ID: <1323456835-16869-1-git-send-email-lukasz@oxnet.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Without setting extra-cflags some optimzations are not enabled by configure (e.g. NEON), even if --enable-neon is used.

Signed-off-by: Lukasz Pulka <lukasz@oxnet.pl>
---
 package/multimedia/ffmpeg/ffmpeg.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/ffmpeg/ffmpeg.mk b/package/multimedia/ffmpeg/ffmpeg.mk
index ca41892..2517a62 100644
--- a/package/multimedia/ffmpeg/ffmpeg.mk
+++ b/package/multimedia/ffmpeg/ffmpeg.mk
@@ -166,7 +166,7 @@ define FFMPEG_CONFIGURE_CMDS
 		--host-cc="$(HOSTCC)" \
 		--arch=$(BR2_ARCH) \
 		--target-os=linux \
-		--extra-cflags=-fPIC \
+		--extra-cflags='-fPIC $(TARGET_CFLAGS)' \
 		$(SHARED_STATIC_LIBS_OPTS) \
 		$(FFMPEG_CONF_OPT) \
 	)
-- 
1.7.2.5
