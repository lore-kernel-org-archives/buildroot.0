From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Jul 2021 16:01:36 +0200
Subject: [Buildroot] [git commit] Revert "package/libtirpc: install rpc.h"
Message-ID: <20210717133254.37232912AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=0f727fb51284a312aa3b35cdb633577959821bcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit b991962993357092625e5b18d8203acd1e9b8b1f, which was
incomplete and did not actually fix the issue it purported to fix, and
we'll soon commit a proper fix.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr: explain the reason for reverting]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libtirpc/libtirpc.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index 8cdc453cd4..2678c144e9 100644
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -21,7 +21,6 @@ LIBTIRPC_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -DGQ"
 LIBTIRPC_CONF_OPTS = --disable-gssapi
 
 define HOST_LIBTIRPC_INSTALL_CMDS
-	$(INSTALL) -D -m 0644 $(@D)/tirpc/rpc/rpc.h $(HOST_DIR)/include/rpc/rpc.h
 	$(INSTALL) -D -m 0644 $(@D)/tirpc/rpc/types.h $(HOST_DIR)/include/rpc/types.h
 	$(INSTALL) -D -m 0644 $(@D)/tirpc/netconfig.h $(HOST_DIR)/include/netconfig.h
 endef
