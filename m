From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Nov 2014 22:56:49 +0100
Subject: [Buildroot] [PATCHv2 31/74] tree: don't install man page
In-Reply-To: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417125452-18705-32-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We don't support installing documentation on the target, so there's no
point in having explicit code to do so.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tree/tree.mk | 2 --
 1 file changed, 2 deletions(-)

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
-- 
2.1.0
