From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  2 Dec 2014 12:04:55 +0200
Subject: [Buildroot] [PATCH] live555: fix test programs target installation
Message-ID: <c7c68a682b5c2a31db07f2ba1bec4cae5384b316.1417514695.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 43ebd93e1fcb (live555: add error handling to for loop) removed the
shell command delimiter. Add it back.

Fixes:
http://autobuild.buildroot.net/results/00f/00f26fa3b6fc8c707009f44ede7b680849f18d5f/

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/live555/live555.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index 064450546fc2..46fca5b93ddd 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -55,7 +55,7 @@ endef
 
 define LIVE555_INSTALL_TARGET_CMDS
 	for i in $(LIVE555_FILES_TO_INSTALL-y); do \
-		$(INSTALL) -D -m 0755 $(@D)/$$i $(TARGET_DIR)/usr/bin/`basename $$i` || exit 1 \
+		$(INSTALL) -D -m 0755 $(@D)/$$i $(TARGET_DIR)/usr/bin/`basename $$i` || exit 1; \
 	done
 endef
 
-- 
2.1.3
