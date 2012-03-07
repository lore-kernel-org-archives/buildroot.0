From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  7 Mar 2012 21:58:07 +0100
Subject: [Buildroot] [RFC v2 07/31] netkitbase: warn that legal-info is not
	implemented
In-Reply-To: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
References: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1331153911-22277-8-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/netkitbase/netkitbase.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/netkitbase/netkitbase.mk b/package/netkitbase/netkitbase.mk
index dde8f9f..b8c965d 100644
--- a/package/netkitbase/netkitbase.mk
+++ b/package/netkitbase/netkitbase.mk
@@ -47,6 +47,10 @@ $(TARGET_DIR)/$(NETKITBASE_TARGET_BINARY): $(NETKITBASE_DIR)/$(NETKITBASE_BINARY
 	fi
 	touch -c $(TARGET_DIR)/$(NETKITBASE_TARGET_BINARY)
 
+netkitbase-legal-info:
+	@echo WARNING: Cannot produce any legal info for package netkitbase \
+		>>$(LEGAL_WARNINGS)
+
 netkitbase: $(TARGET_DIR)/$(NETKITBASE_TARGET_BINARY)
 
 netkitbase-clean:
-- 
1.7.5.4
