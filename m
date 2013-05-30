From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 30 May 2013 13:11:42 +0200
Subject: [Buildroot] [git commit] libplayer: Remove unsupported QUIET
	variable
Message-ID: <20130530120918.EDE9599AB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=95e54f65a23fc75864a1a29f7d9ff7b7ddfc3dcb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following compilation problem when building with 'make -s'

Unknown option "-q".
See ./configure --help for available options.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libplayer/libplayer.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libplayer/libplayer.mk b/package/libplayer/libplayer.mk
index 8f655ae..511c7f6 100644
--- a/package/libplayer/libplayer.mk
+++ b/package/libplayer/libplayer.mk
@@ -18,7 +18,7 @@ define LIBPLAYER_CONFIGURE_CMDS
 		--prefix=/usr \
 		--cross-compile \
 		$(SHARED_STATIC_LIBS_OPTS) \
-		$(QUIET) $(LIBPLAYER_CONF_OPT) \
+		$(LIBPLAYER_CONF_OPT) \
 	)
 endef
 
