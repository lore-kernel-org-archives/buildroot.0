From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Nov 2014 21:39:12 +0100
Subject: [Buildroot] [PATCH 40/51] ebtables: add error handling to for loop
In-Reply-To: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1416775163-20215-41-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ebtables/ebtables.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ebtables/ebtables.mk b/package/ebtables/ebtables.mk
index 578c3ae..23c4628 100644
--- a/package/ebtables/ebtables.mk
+++ b/package/ebtables/ebtables.mk
@@ -28,7 +28,7 @@ define EBTABLES_INSTALL_TARGET_CMDS
 		$(@D)/$(EBTABLES_SUBDIR)/extensions/*.so; \
 		do \
 		$(INSTALL) -m 0755 -D $${so} \
-			$(TARGET_DIR)/lib/ebtables/`basename $${so}`; \
+			$(TARGET_DIR)/lib/ebtables/`basename $${so}` || exit 1; \
 	done
 	$(INSTALL) -m 0755 -D $(@D)/$(EBTABLES_SUBDIR)/ebtables \
 		$(TARGET_DIR)/sbin/ebtables
-- 
2.1.0
