From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Nov 2014 22:56:47 +0100
Subject: [Buildroot] [PATCHv2 29/74] wipe: don't install man pages
In-Reply-To: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417125452-18705-30-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We don't support installing documentation on the target, so there's no
point in having explicit code to do so.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wipe/wipe.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/wipe/wipe.mk b/package/wipe/wipe.mk
index 4deabab..ee4682c 100644
--- a/package/wipe/wipe.mk
+++ b/package/wipe/wipe.mk
@@ -13,7 +13,6 @@ WIPE_LICENSE_FILES = LICENSE
 
 define WIPE_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/wipe $(TARGET_DIR)/usr/bin/wipe
-	$(INSTALL) -D $(@D)/wipe.1 $(TARGET_DIR)/usr/share/man/man1/wipe.1
 endef
 
 $(eval $(autotools-package))
-- 
2.1.0
