From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Nov 2014 21:39:07 +0100
Subject: [Buildroot] [PATCH 35/51] gnupg: don't both removing a man page
In-Reply-To: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1416775163-20215-36-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The target-finalize target in the main Makefile removes
$(TARGET_DIR)/usr/share/man entirely, so there's no point in having
some package specific logic to remove man pages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnupg/gnupg.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
index e7c403a..c0bf88c 100644
--- a/package/gnupg/gnupg.mk
+++ b/package/gnupg/gnupg.mk
@@ -39,8 +39,7 @@ endif
 
 ifneq ($(BR2_PACKAGE_GNUPG_GPGV),y)
 define GNUPG_REMOVE_GPGV
-	rm -f $(TARGET_DIR)/usr/bin/gpgv \
-		$(TARGET_DIR)/usr/share/man/man1/gpgv.1
+	rm -f $(TARGET_DIR)/usr/bin/gpgv
 endef
 GNUPG_POST_INSTALL_TARGET_HOOKS += GNUPG_REMOVE_GPGV
 endif
-- 
2.1.0
