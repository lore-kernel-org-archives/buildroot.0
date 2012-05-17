From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 17 May 2012 19:33:06 +0200
Subject: [Buildroot] [PATCH v4 07/22] vpnc: warn that legal-info is not
	implemented
In-Reply-To: <1337276001-26149-1-git-send-email-luca@lucaceresoli.net>
References: <1337276001-26149-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1337276001-26149-8-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/vpnc/vpnc.mk |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/vpnc/vpnc.mk b/package/vpnc/vpnc.mk
index d8d9654..f585dc4 100644
--- a/package/vpnc/vpnc.mk
+++ b/package/vpnc/vpnc.mk
@@ -42,6 +42,9 @@ $(VPNC_TARGET_BINARY): $(VPNC_BINARY)
 		-C $(VPNC_DIR) install
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(VPNC_TARGET_BINARY)
 
+vpnc-legal-info:
+	@$(call legal-warning-pkg,vpnc,legal-info not yet implemented)
+
 vpnc: libgcrypt $(VPNC_TARGET_BINARY)
 
 vpnc-source: $(DL_DIR)/$(VPNC_SOURCE)
-- 
1.7.9.5
