From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 17 May 2012 19:33:05 +0200
Subject: [Buildroot] [PATCH v4 06/22] ttcp: warn that legal-info is not
	implemented
In-Reply-To: <1337276001-26149-1-git-send-email-luca@lucaceresoli.net>
References: <1337276001-26149-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1337276001-26149-7-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/ttcp/ttcp.mk |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/ttcp/ttcp.mk b/package/ttcp/ttcp.mk
index 1acf120..080286b 100644
--- a/package/ttcp/ttcp.mk
+++ b/package/ttcp/ttcp.mk
@@ -27,6 +27,9 @@ $(TTCP_DIR)/ttcp: $(TTCP_DIR)/.configured
 $(TARGET_DIR)/usr/bin/ttcp: $(TTCP_DIR)/ttcp
 	cp -af $(TTCP_DIR)/ttcp $(TARGET_DIR)/usr/bin/
 
+ttcp-legal-info:
+	@$(call legal-warning-pkg,ttcp,legal-info not yet implemented)
+
 ttcp: $(TARGET_DIR)/usr/bin/ttcp
 
 ttcp-source: $(DL_DIR)/$(TTCP_SOURCE)
-- 
1.7.9.5
