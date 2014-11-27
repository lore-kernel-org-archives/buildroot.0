From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Nov 2014 22:56:54 +0100
Subject: [Buildroot] [PATCHv2 36/74] rp-pppoe: don't install man pages
In-Reply-To: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417125452-18705-37-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We don't support installing documentation on the target, so there's no
point in having explicit code to do so.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rp-pppoe/rp-pppoe.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/rp-pppoe/rp-pppoe.mk b/package/rp-pppoe/rp-pppoe.mk
index b17086b..6827628 100644
--- a/package/rp-pppoe/rp-pppoe.mk
+++ b/package/rp-pppoe/rp-pppoe.mk
@@ -21,9 +21,6 @@ define RP_PPPOE_INSTALL_TARGET_CMDS
 	for ff in $(RP_PPPOE_TARGET_FILES); do \
 		$(INSTALL) -m 0755 $(@D)/src/$$ff $(TARGET_DIR)/usr/sbin/$$ff; \
 	done
-	for ff in $(RP_PPPOE_TARGET_FILES); do \
-		$(INSTALL) -m 644 -D $(RP_PPPOE_DIR)/man/$$ff.8 $(TARGET_DIR)/usr/share/man/man8/$$ff.8; \
-	done
 endef
 
 $(eval $(autotools-package))
-- 
2.1.0
