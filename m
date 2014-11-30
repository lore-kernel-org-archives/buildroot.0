From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Nov 2014 15:18:31 +0100
Subject: [Buildroot] [PATCHv3 43/74] gptfdisk: add error handling to for loop
In-Reply-To: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417357142-14307-44-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gptfdisk/gptfdisk.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
index 9828d4c..4c6af56 100644
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -33,7 +33,7 @@ endef
 
 define GPTFDISK_INSTALL_TARGET_CMDS
 	for i in $(GPTFDISK_TARGETS_y); do \
-		$(INSTALL) -D -m 0755 $(@D)/$$i $(TARGET_DIR)/usr/sbin/$$i; \
+		$(INSTALL) -D -m 0755 $(@D)/$$i $(TARGET_DIR)/usr/sbin/$$i || exit 1; \
 	done
 endef
 
-- 
2.1.0
