From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 14 May 2018 06:23:56 +0300
Subject: [Buildroot] [PATCH] skeleton: create include/ directory
Message-ID: <9873d2e0023b87545478d0615eb5d97bcbd82c2c.1526268236.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Don't rely on a random host package to create the include/ directory for
us. Some packages do the wrong thing since they implicitly assume that
this directory exists already. Commit a557aedad2 (zstd: fix host headers
installation) shows an example of that.

Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/skeleton/skeleton.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index efcf420d7243..9d97f02f08bf 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -16,6 +16,7 @@ SKELETON_ADD_SKELETON_DEPENDENCY = NO
 define HOST_SKELETON_INSTALL_CMDS
 	$(Q)ln -snf . $(HOST_DIR)/usr
 	$(Q)mkdir -p $(HOST_DIR)/lib
+	$(Q)mkdir -p $(HOST_DIR)/include
 	$(Q)case $(HOSTARCH) in \
 		(*64) ln -snf lib $(HOST_DIR)/lib64;; \
 		(*)   ln -snf lib $(HOST_DIR)/lib32;; \
-- 
2.17.0
