From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jul 2012 19:06:19 +0200
Subject: [Buildroot] [git commit] netkittelnet: warn that legal-info is not
	implemented
Message-ID: <20120717173300.2FB9796A7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f8c6e4883442a88744d98fc6f5ddca39fc3adfa3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netkittelnet/netkittelnet.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/netkittelnet/netkittelnet.mk b/package/netkittelnet/netkittelnet.mk
index ff05318..43ba324 100644
--- a/package/netkittelnet/netkittelnet.mk
+++ b/package/netkittelnet/netkittelnet.mk
@@ -48,6 +48,9 @@ $(TARGET_DIR)/$(NETKITTELNET_TARGET_BINARY): $(NETKITTELNET_DIR)/$(NETKITTELNET_
 	#rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
 	# $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
 
+netkittelnet-legal-info:
+	@$(call legal-warning-pkg,netkittelnet,legal-info not yet implemented)
+
 netkittelnet: netkitbase $(TARGET_DIR)/$(NETKITTELNET_TARGET_BINARY)
 
 netkittelnet-clean:
