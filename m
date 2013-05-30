From: Markos Chandras <markos.chandras@gmail.com>
Date: Thu, 30 May 2013 10:27:17 +0100
Subject: [Buildroot] [PATCH] libplayer: Remove unsupported QUIET variable
Message-ID: <1369906037-5251-1-git-send-email-markos.chandras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markos Chandras <markos.chandras@imgtec.com>

Fixes the following compilation problem when building with 'make -s'

Unknown option "-q".
See ./configure --help for available options.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/libplayer/libplayer.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
 
-- 
1.8.2.1
