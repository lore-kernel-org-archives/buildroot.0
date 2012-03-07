From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  7 Mar 2012 21:58:11 +0100
Subject: [Buildroot] [RFC v2 11/31] ttcp: warn that legal-info is not
	implemented
In-Reply-To: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
References: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1331153911-22277-12-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/ttcp/ttcp.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/ttcp/ttcp.mk b/package/ttcp/ttcp.mk
index 006b74c..0fb0845 100644
--- a/package/ttcp/ttcp.mk
+++ b/package/ttcp/ttcp.mk
@@ -27,6 +27,10 @@ $(TTCP_DIR)/ttcp: $(TTCP_DIR)/.configured
 $(TARGET_DIR)/usr/bin/ttcp: $(TTCP_DIR)/ttcp
 	cp -af $(TTCP_DIR)/ttcp $(TARGET_DIR)/usr/bin/
 
+ttcp-legal-info:
+	@echo WARNING: Cannot produce any legal info for package ttcp \
+		>>$(LEGAL_WARNINGS)
+
 ttcp: $(TARGET_DIR)/usr/bin/ttcp
 
 ttcp-source: $(DL_DIR)/$(TTCP_SOURCE)
-- 
1.7.5.4
