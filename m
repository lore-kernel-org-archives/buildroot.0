From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  7 May 2012 22:12:25 +0200
Subject: [Buildroot] [PATCH v3 04/22] netkittelnet: warn that legal-info is
	not implemented
In-Reply-To: <1336421563-5986-1-git-send-email-luca@lucaceresoli.net>
References: <1336421443-5871-1-git-send-email-luca@lucaceresoli.net>
 <1336421563-5986-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1336421563-5986-4-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/netkittelnet/netkittelnet.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/netkittelnet/netkittelnet.mk b/package/netkittelnet/netkittelnet.mk
index ff05318..1ed5fc5 100644
--- a/package/netkittelnet/netkittelnet.mk
+++ b/package/netkittelnet/netkittelnet.mk
@@ -48,6 +48,9 @@ $(TARGET_DIR)/$(NETKITTELNET_TARGET_BINARY): $(NETKITTELNET_DIR)/$(NETKITTELNET_
 	#rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
 	# $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
 
+netkittelnet-legal-info:
+	@$(call legal-warning-pkg,netkittelnet,cannot produce any legal info)
+
 netkittelnet: netkitbase $(TARGET_DIR)/$(NETKITTELNET_TARGET_BINARY)
 
 netkittelnet-clean:
-- 
1.7.5.4
