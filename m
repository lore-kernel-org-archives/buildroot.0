From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 1 Jan 2011 11:49:01 +0100
Subject: [Buildroot] [git commit master 1/1] ffmpeg: fix build with ccache
Message-ID: <20110101113506.F21938F326@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e18087a6011b1c1d474630df97a82e9b50baedac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With ccache, HOSTCC contains a space, so ensure it's properly quoted.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/ffmpeg/ffmpeg.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/ffmpeg/ffmpeg.mk b/package/multimedia/ffmpeg/ffmpeg.mk
index f0ec930..60654de 100644
--- a/package/multimedia/ffmpeg/ffmpeg.mk
+++ b/package/multimedia/ffmpeg/ffmpeg.mk
@@ -136,7 +136,7 @@ define FFMPEG_CONFIGURE_CMDS
 		--enable-cross-compile	\
 		--cross-prefix=$(TARGET_CROSS) \
 		--sysroot=$(STAGING_DIR) \
-		--host-cc=$(HOSTCC) \
+		--host-cc="$(HOSTCC)" \
 		--arch=$(BR2_ARCH) \
 		--extra-cflags=-fPIC \
 		$(DISABLE_IPV6) \
-- 
1.7.2.2
