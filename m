From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon,  6 Nov 2017 15:17:09 +0100
Subject: [Buildroot] [PATCH 1/2] jimtcl: update config.guess / config.sub
Message-ID: <20171106141710.6029-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/284/284876bd649cab26e5ecd696c03c71c077ea7411/

The build system doesn't use autotools, but does use an old version of
gnuconfig which doesn't know all the architectures supported by Buildroot,
so update config.guess / config.sub like we do in pkg-autotools.mk

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jimtcl/jimtcl.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
index 313970d94a..68c8a914db 100644
--- a/package/jimtcl/jimtcl.mk
+++ b/package/jimtcl/jimtcl.mk
@@ -38,6 +38,12 @@ define JIMTCL_INSTALL_LIB
 endef
 endif
 
+# build system doesn't use autotools, but does use an old version of
+# gnuconfig which doesn't know all the architectures supported by
+# Buildroot, so update config.guess / config.sub like we do in
+# pkg-autotools.mk
+JIMTCL_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
+
 define JIMTCL_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_OPTS) CCACHE=none \
-- 
2.11.0
