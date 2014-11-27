From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Nov 2014 22:57:04 +0100
Subject: [Buildroot] [PATCHv2 46/74] live555: add error handling to for loop
In-Reply-To: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417125452-18705-47-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/live555/live555.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index b923388..7dbded3 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -54,7 +54,7 @@ endef
 
 define LIVE555_INSTALL_TARGET_CMDS
 	for i in $(LIVE555_FILES_TO_INSTALL-y); do \
-		$(INSTALL) -D -m 0755 $(@D)/$$i $(TARGET_DIR)/usr/bin/`basename $$i`; \
+		$(INSTALL) -D -m 0755 $(@D)/$$i $(TARGET_DIR)/usr/bin/`basename $$i` || exit 1 \
 	done
 endef
 
-- 
2.1.0
