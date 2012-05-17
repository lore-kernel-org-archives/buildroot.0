From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 17 May 2012 19:33:02 +0200
Subject: [Buildroot] [PATCH v4 03/22] netkitbase: warn that legal-info is
	not implemented
In-Reply-To: <1337276001-26149-1-git-send-email-luca@lucaceresoli.net>
References: <1337276001-26149-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1337276001-26149-4-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/netkitbase/netkitbase.mk |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/netkitbase/netkitbase.mk b/package/netkitbase/netkitbase.mk
index 83991f2..56480fc 100644
--- a/package/netkitbase/netkitbase.mk
+++ b/package/netkitbase/netkitbase.mk
@@ -47,6 +47,9 @@ $(TARGET_DIR)/$(NETKITBASE_TARGET_BINARY): $(NETKITBASE_DIR)/$(NETKITBASE_BINARY
 	fi
 	touch -c $(TARGET_DIR)/$(NETKITBASE_TARGET_BINARY)
 
+netkitbase-legal-info:
+	@$(call legal-warning-pkg,netkitbase,legal-info not yet implemented)
+
 netkitbase: $(TARGET_DIR)/$(NETKITBASE_TARGET_BINARY)
 
 netkitbase-clean:
-- 
1.7.9.5
