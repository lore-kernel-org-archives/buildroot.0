From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 10 Mar 2013 22:22:55 +0100
Subject: [Buildroot] [git commit] gptfdisk: fix installation step
Message-ID: <20130310213207.E2C4A9AFA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a4b61bf3785283605252876825d49253434da5b9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The installation step was not giving the full destination path even
though it was using -D, and it was forgetting to explicitly specify
the permissions of the file to install. This commit fixes both of
these minor issues.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gptfdisk/gptfdisk.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
 
