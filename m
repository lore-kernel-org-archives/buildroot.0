From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 21 Jun 2011 13:48:16 +0200
Subject: [Buildroot] [git commit] ffmpeg: fix build of shared libraries
Message-ID: <20110621114917.7301B88D78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=97a429667eb6b09f027099b850003703a47ccff5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

009d8fceab4 and 0a5e5534cbf8 moved the --enable-static configure flag
from package files to the default _CONFIGURE_CMDS in
package/Makefile.autotools.in.
This broke Autotools packages that override _CONFIGURE_CMDS.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/ffmpeg/ffmpeg.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/ffmpeg/ffmpeg.mk b/package/multimedia/ffmpeg/ffmpeg.mk
index babb16a..b50503b 100644
--- a/package/multimedia/ffmpeg/ffmpeg.mk
+++ b/package/multimedia/ffmpeg/ffmpeg.mk
@@ -167,6 +167,7 @@ define FFMPEG_CONFIGURE_CMDS
 		--arch=$(BR2_ARCH) \
 		--target-os=linux \
 		--extra-cflags=-fPIC \
+		$(SHARED_STATIC_LIBS_OPTS) \
 		$(FFMPEG_CONF_OPT) \
 	)
 endef
-- 
1.7.3.4
