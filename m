From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  7 Mar 2012 21:58:03 +0100
Subject: [Buildroot] [RFC v2 03/31] fis: warn that legal-info is not
	implemented
In-Reply-To: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
References: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1331153911-22277-4-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/fis/fis.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/fis/fis.mk b/package/fis/fis.mk
index 2942449..1d22068 100644
--- a/package/fis/fis.mk
+++ b/package/fis/fis.mk
@@ -32,6 +32,10 @@ $(TARGET_DIR)/$(FIS_TARGET_BINARY): $(FIS_DIR)/$(FIS_BINARY)
 	$(INSTALL) -D -m 0755 $(FIS_DIR)/$(FIS_BINARY) $(TARGET_DIR)/$(FIS_TARGET_BINARY)
 	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
 
+fis-legal-info:
+	@echo WARNING: Cannot produce any legal info for package fis \
+		>>$(LEGAL_WARNINGS)
+
 fis: $(TARGET_DIR)/$(FIS_TARGET_BINARY)
 
 fis-clean:
-- 
1.7.5.4
