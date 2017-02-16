From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 15 Feb 2017 22:13:29 -0500
Subject: [Buildroot] [PATCH 1/1] ffmpeg: remove example source code from
	target
Message-ID: <1487214809-2929-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There does not appear to be a way to configure the example code
installation, so this mod gets rid of it with a post-install hook.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/ffmpeg/ffmpeg.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 6540d41..45bda35 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -496,4 +496,9 @@ define FFMPEG_CONFIGURE_CMDS
 	)
 endef
 
+define FFMPEG_REMOVE_EXAMPLE_SRC_FILES
+	rm -rf $(TARGET_DIR)/usr/share/ffmpeg/examples
+endef
+FFMPEG_POST_INSTALL_TARGET_HOOKS += FFMPEG_REMOVE_EXAMPLE_SRC_FILES
+
 $(eval $(autotools-package))
-- 
2.7.4
