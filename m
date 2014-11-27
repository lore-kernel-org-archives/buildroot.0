From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Nov 2014 22:56:50 +0100
Subject: [Buildroot] [PATCHv2 32/74] iostat: don't install man page
In-Reply-To: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417125452-18705-33-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We don't support installing documentation on the target, so there's no
point in having explicit code to do so.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iostat/iostat.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/iostat/iostat.mk b/package/iostat/iostat.mk
index 8610f8f..2080e56 100644
--- a/package/iostat/iostat.mk
+++ b/package/iostat/iostat.mk
@@ -17,8 +17,6 @@ endef
 
 define IOSTAT_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(IOSTAT_DIR)/iostat $(TARGET_DIR)/usr/bin/iostat
-	$(INSTALL) -D $(IOSTAT_DIR)/iostat.8 \
-		$(TARGET_DIR)/usr/share/man/man8/iostat.8
 endef
 
 $(eval $(generic-package))
-- 
2.1.0
