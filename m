From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 25 Apr 2012 11:30:32 -0300
Subject: [Buildroot] [PATCH 1/2] berkeleydb: use O_DIRECT
Message-ID: <1335364233-21057-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/berkeleydb/berkeleydb.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index bb3fd5d..b2b0a45 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -28,6 +28,7 @@ define BERKELEYDB_CONFIGURE_CMDS
 		--disable-compat185 \
 		$(SHARED_STATIC_LIBS_OPTS) \
 		--with-pic \
+		--enable-o_direct \
 	)
 	$(SED) 's/\.lo/.o/g' $(@D)/build_unix/Makefile
 endef
-- 
1.7.3.4
