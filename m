From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 20 Jun 2011 17:59:55 +0200
Subject: [Buildroot] [PATCH 2/2] berkeleydb: fix build of shared libraries
In-Reply-To: <1308585595-3948-1-git-send-email-luca@lucaceresoli.net>
References: <1308585595-3948-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1308585595-3948-3-git-send-email-luca@lucaceresoli.net>
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
 package/berkeleydb/berkeleydb.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index 1bac745..e80f66f 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -38,6 +38,7 @@ define BERKELEYDB_CONFIGURE_CMDS
 		--disable-rpc \
 		--disable-tcl \
 		--disable-compat185 \
+		$(SHARED_STATIC_LIBS_OPTS) \
 		--with-pic \
 	)
 	$(SED) 's/\.lo/.o/g' $(@D)/build_unix/Makefile
-- 
1.7.4.1
