From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  7 Mar 2012 21:58:14 +0100
Subject: [Buildroot] [RFC v2 14/31] xfsprogs: warn that legal-info is not
	implemented
In-Reply-To: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
References: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1331153911-22277-15-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/xfsprogs/xfsprogs.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index 68db2f7..b07ab08 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -77,6 +77,10 @@ $(TARGET_DIR)/$(XFSPROGS_TARGET_BINARY): $(XFSPROGS_DIR)/$(XFSPROGS_BINARY)
 	rm -rf $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
 	touch -c $(TARGET_DIR)/$(XFSPROGS_TARGET_BINARY)
 
+xfsprogs-legal-info:
+	@echo WARNING: Cannot produce any legal info for package xfsprogs \
+		>>$(LEGAL_WARNINGS)
+
 xfsprogs: util-linux $(TARGET_DIR)/$(XFSPROGS_TARGET_BINARY)
 
 xfsprogs-clean:
-- 
1.7.5.4
