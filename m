From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  7 May 2012 22:12:24 +0200
Subject: [Buildroot] [PATCH v3 03/22] netkitbase: warn that legal-info is
	not implemented
In-Reply-To: <1336421563-5986-1-git-send-email-luca@lucaceresoli.net>
References: <1336421443-5871-1-git-send-email-luca@lucaceresoli.net>
 <1336421563-5986-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1336421563-5986-3-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/netkitbase/netkitbase.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/netkitbase/netkitbase.mk b/package/netkitbase/netkitbase.mk
index 83991f2..d06db33 100644
--- a/package/netkitbase/netkitbase.mk
+++ b/package/netkitbase/netkitbase.mk
@@ -47,6 +47,9 @@ $(TARGET_DIR)/$(NETKITBASE_TARGET_BINARY): $(NETKITBASE_DIR)/$(NETKITBASE_BINARY
 	fi
 	touch -c $(TARGET_DIR)/$(NETKITBASE_TARGET_BINARY)
 
+netkitbase-legal-info:
+	@$(call legal-warning-pkg,netkitbase,cannot produce any legal info)
+
 netkitbase: $(TARGET_DIR)/$(NETKITBASE_TARGET_BINARY)
 
 netkitbase-clean:
-- 
1.7.5.4
