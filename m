From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  6 Feb 2013 21:46:03 +0100
Subject: [Buildroot] [PATCH 5/8] gptfdisk: fix installation step
In-Reply-To: <1360183566-27556-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1360183566-27556-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1360183566-27556-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The installation step was not giving the full destination path even
though it was using -D, and it was forgetting to explicitly specify
the permissions of the file to install. This commit fixes both of
these minor issues.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gptfdisk/gptfdisk.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
index 656a187..988eecf 100644
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -22,7 +22,7 @@ endef
 
 define GPTFDISK_INSTALL_TARGET_CMDS
 	for i in $(GPTFDISK_TARGETS_y); do \
-	    $(INSTALL) -D $(@D)/$$i $(TARGET_DIR)/usr/sbin/; \
+	    $(INSTALL) -D -m 0755 $(@D)/$$i $(TARGET_DIR)/usr/sbin/$$i; \
 	done
 endef
 
-- 
1.7.9.5
