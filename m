From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Nov 2017 13:34:31 +0100
Subject: [Buildroot] [git commit] jimtcl: update config.guess / config.sub
Message-ID: <20171108122956.18DC9807E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bca1d4af9bf6b60b37bf5d39e9e3e1b827854f52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
index 313970d..68c8a91 100644
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
