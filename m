From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 20 Jun 2011 17:59:54 +0200
Subject: [Buildroot] [PATCH 1/2] ffmpeg: fix build of shared libraries
In-Reply-To: <1308585595-3948-1-git-send-email-luca@lucaceresoli.net>
References: <1308585595-3948-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1308585595-3948-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

009d8fceab4 and 0a5e5534cbf8 moved the --enable-static configure flag
from package files to the default _CONFIGURE_CMDS in
package/Makefile.autotools.in.
This broke Autotools packages that override _CONFIGURE_CMDS.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
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
1.7.4.1
