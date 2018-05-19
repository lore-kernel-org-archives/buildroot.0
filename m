From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 22:43:30 +0200
Subject: [Buildroot] [git commit branch/next] skeleton: create include/
 directory
Message-ID: <20180519204235.7F12780F6D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=967d302e8bbb409c5b5106b0c87091d47f01a890
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Don't rely on a random host package to create the include/ directory for
us. Some packages do the wrong thing since they implicitly assume that
this directory exists already. Commit a557aedad2 (zstd: fix host headers
installation) shows an example of that.

Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/skeleton/skeleton.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index efcf420d72..9d97f02f08 100644
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
