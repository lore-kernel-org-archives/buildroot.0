From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 02 Aug 2012 19:54:54 -0000
Subject: [Buildroot] [git commit branch/next] ttcp: warn that legal-info is
	not implemented
Message-ID: <20120802195251.5539781894@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bbd4e1ae6c79ad4a1df1eb97ab9fd54be93072bd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ttcp/ttcp.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

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
