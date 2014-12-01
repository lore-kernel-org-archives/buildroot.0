From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 23:14:25 +0100
Subject: [Buildroot] [git commit] tree: don't install man page
Message-ID: <20141201223450.2F51B80048@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0882557b6ed0ece9ce0a3f6f9a69fabca888617a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We don't support installing documentation on the target, so there's no
point in having explicit code to do so.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tree/tree.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/tree/tree.mk b/package/tree/tree.mk
index 922deb8..83ea472 100644
--- a/package/tree/tree.mk
+++ b/package/tree/tree.mk
@@ -16,8 +16,6 @@ endef
 
 define TREE_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/tree $(TARGET_DIR)/usr/bin/tree
-	$(INSTALL) -D -m 0644 $(@D)/doc/tree.1 \
-		$(TARGET_DIR)/usr/share/man/man1/tree.1
 endef
 
 $(eval $(generic-package))
