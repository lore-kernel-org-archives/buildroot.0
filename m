From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Feb 2017 16:25:48 +0100
Subject: [Buildroot] [git commit branch/next] ffmpeg: remove example source
	code from target
Message-ID: <20170217153631.8C3998223D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=194cb3f32087736581b02813dcb549a83c90910e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

There does not appear to be a way to configure the example code
installation, so this mod gets rid of it with a post-install hook.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 4447b72..449cca2 100644
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
