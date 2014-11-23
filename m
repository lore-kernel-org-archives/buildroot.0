From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Nov 2014 21:39:06 +0100
Subject: [Buildroot] [PATCH 34/51] pptp-linux: don't install man page
In-Reply-To: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1416775163-20215-35-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We don't support installing documentation on the target, so there's no
point in having explicit code to do so.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pptp-linux/pptp-linux.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/pptp-linux/pptp-linux.mk b/package/pptp-linux/pptp-linux.mk
index dc624eb..d7edf6c 100644
--- a/package/pptp-linux/pptp-linux.mk
+++ b/package/pptp-linux/pptp-linux.mk
@@ -21,7 +21,6 @@ endef
 
 define PPTP_LINUX_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/pptp $(TARGET_DIR)/usr/sbin/pptp
-	$(INSTALL) -m 0644 -D $(@D)/pptp.8 $(TARGET_DIR)/usr/share/man/man8/pptp.8
 endef
 
 $(eval $(generic-package))
-- 
2.1.0
