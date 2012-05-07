From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  7 May 2012 22:12:27 +0200
Subject: [Buildroot] [PATCH v3 06/22] ttcp: warn that legal-info is not
	implemented
In-Reply-To: <1336421563-5986-1-git-send-email-luca@lucaceresoli.net>
References: <1336421443-5871-1-git-send-email-luca@lucaceresoli.net>
 <1336421563-5986-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1336421563-5986-6-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/ttcp/ttcp.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/ttcp/ttcp.mk b/package/ttcp/ttcp.mk
index 1acf120..247ad71 100644
--- a/package/ttcp/ttcp.mk
+++ b/package/ttcp/ttcp.mk
@@ -27,6 +27,9 @@ $(TTCP_DIR)/ttcp: $(TTCP_DIR)/.configured
 $(TARGET_DIR)/usr/bin/ttcp: $(TTCP_DIR)/ttcp
 	cp -af $(TTCP_DIR)/ttcp $(TARGET_DIR)/usr/bin/
 
+ttcp-legal-info:
+	@$(call legal-warning-pkg,ttcp,cannot produce any legal info)
+
 ttcp: $(TARGET_DIR)/usr/bin/ttcp
 
 ttcp-source: $(DL_DIR)/$(TTCP_SOURCE)
-- 
1.7.5.4
