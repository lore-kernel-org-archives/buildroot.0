From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Nov 2014 21:39:04 +0100
Subject: [Buildroot] [PATCH 32/51] iostat: don't install man page
In-Reply-To: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1416775163-20215-33-git-send-email-thomas.petazzoni@free-electrons.com>
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
