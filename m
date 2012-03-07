From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  7 Mar 2012 21:58:08 +0100
Subject: [Buildroot] [RFC v2 08/31] netkittelnet: warn that legal-info is
	not implemented
In-Reply-To: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
References: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1331153911-22277-9-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/netkittelnet/netkittelnet.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/netkittelnet/netkittelnet.mk b/package/netkittelnet/netkittelnet.mk
index e9f40ca..c489709 100644
--- a/package/netkittelnet/netkittelnet.mk
+++ b/package/netkittelnet/netkittelnet.mk
@@ -48,6 +48,10 @@ $(TARGET_DIR)/$(NETKITTELNET_TARGET_BINARY): $(NETKITTELNET_DIR)/$(NETKITTELNET_
 	#rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
 	# $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
 
+netkittelnet-legal-info:
+	@echo WARNING: Cannot produce any legal info for package netkittelnet \
+		>>$(LEGAL_WARNINGS)
+
 netkittelnet: netkitbase $(TARGET_DIR)/$(NETKITTELNET_TARGET_BINARY)
 
 netkittelnet-clean:
-- 
1.7.5.4
