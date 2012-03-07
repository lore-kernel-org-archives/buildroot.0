From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  7 Mar 2012 21:58:12 +0100
Subject: [Buildroot] [RFC v2 12/31] uemacs: warn that legal-info is not
	implemented
In-Reply-To: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
References: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1331153911-22277-13-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/uemacs/uemacs.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/uemacs/uemacs.mk b/package/uemacs/uemacs.mk
index 8355a7f..e690eee 100644
--- a/package/uemacs/uemacs.mk
+++ b/package/uemacs/uemacs.mk
@@ -29,6 +29,10 @@ $(UEMACS_DIR)/$(UEMACS_BINARY): $(UEMACS_DIR)/.unpacked
 $(TARGET_DIR)/$(UEMACS_TARGET_BINARY): $(UEMACS_DIR)/$(UEMACS_BINARY)
 	$(INSTALL) -m 0755 -D $(UEMACS_DIR)/$(UEMACS_BINARY) $(TARGET_DIR)/$(UEMACS_TARGET_BINARY)
 
+uemacs-legal-info:
+	@echo WARNING: Cannot produce any legal info for package uemacs \
+		>>$(LEGAL_WARNINGS)
+
 uemacs: ncurses $(TARGET_DIR)/$(UEMACS_TARGET_BINARY)
 
 uemacs-clean:
-- 
1.7.5.4
