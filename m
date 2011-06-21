From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 21 Jun 2011 13:48:16 +0200
Subject: [Buildroot] [git commit] berkeleydb: fix build of shared libraries
Message-ID: <20110621114917.A301588D78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b1d02f73146731ce1f14ee81a2e92e3f8ab4d317
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

009d8fceab4 and 0a5e5534cbf8 moved the --enable-static configure flag
from package files to the default _CONFIGURE_CMDS in
package/Makefile.autotools.in.
This broke Autotools packages that override _CONFIGURE_CMDS.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.7.3.4
