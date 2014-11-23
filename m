From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Nov 2014 21:39:14 +0100
Subject: [Buildroot] [PATCH 42/51] googlefontdirectory: add error handling
	to for loop
In-Reply-To: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1416775163-20215-43-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/googlefontdirectory/googlefontdirectory.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/googlefontdirectory/googlefontdirectory.mk b/package/googlefontdirectory/googlefontdirectory.mk
index 076e654..0e60892 100644
--- a/package/googlefontdirectory/googlefontdirectory.mk
+++ b/package/googlefontdirectory/googlefontdirectory.mk
@@ -16,7 +16,7 @@ define GOOGLEFONTDIRECTORY_INSTALL_TARGET_CMDS
 	for i in $(GOOGLEFONTDIRECTORY_FONTS); \
 	do \
 		$(INSTALL) -d $(TARGET_DIR)/usr/share/fonts/$$i && \
-		$(INSTALL) -m 0644 -t $(TARGET_DIR)/usr/share/fonts/$$i $(@D)/$$i/*.ttf; \
+		$(INSTALL) -m 0644 -t $(TARGET_DIR)/usr/share/fonts/$$i $(@D)/$$i/*.ttf || exit 1; \
 	done
 endef
 
-- 
2.1.0
