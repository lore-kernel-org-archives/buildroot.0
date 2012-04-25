From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 25 Apr 2012 16:45:13 +0200
Subject: [Buildroot] [git commit] berkeleydb: use O_DIRECT
Message-ID: <20120425144551.4609496BBF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9f160affcc78e8e503d1e0d082b10f8c6209fed1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
