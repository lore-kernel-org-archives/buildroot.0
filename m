From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  7 Mar 2012 21:58:13 +0100
Subject: [Buildroot] [RFC v2 13/31] vpnc: warn that legal-info is not
	implemented
In-Reply-To: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
References: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1331153911-22277-14-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/vpnc/vpnc.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/vpnc/vpnc.mk b/package/vpnc/vpnc.mk
index 5a8c700..34f9118 100644
--- a/package/vpnc/vpnc.mk
+++ b/package/vpnc/vpnc.mk
@@ -42,6 +42,10 @@ $(VPNC_TARGET_BINARY): $(VPNC_BINARY)
 		-C $(VPNC_DIR) install
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(VPNC_TARGET_BINARY)
 
+vpnc-legal-info:
+	@echo WARNING: Cannot produce any legal info for package vpnc \
+		>>$(LEGAL_WARNINGS)
+
 vpnc: libgcrypt $(VPNC_TARGET_BINARY)
 
 vpnc-source: $(DL_DIR)/$(VPNC_SOURCE)
-- 
1.7.5.4
