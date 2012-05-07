From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  7 May 2012 22:12:28 +0200
Subject: [Buildroot] [PATCH v3 07/22] vpnc: warn that legal-info is not
	implemented
In-Reply-To: <1336421563-5986-1-git-send-email-luca@lucaceresoli.net>
References: <1336421443-5871-1-git-send-email-luca@lucaceresoli.net>
 <1336421563-5986-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1336421563-5986-7-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/vpnc/vpnc.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/vpnc/vpnc.mk b/package/vpnc/vpnc.mk
index d8d9654..b5aea58 100644
--- a/package/vpnc/vpnc.mk
+++ b/package/vpnc/vpnc.mk
@@ -42,6 +42,9 @@ $(VPNC_TARGET_BINARY): $(VPNC_BINARY)
 		-C $(VPNC_DIR) install
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(VPNC_TARGET_BINARY)
 
+vpnc-legal-info:
+	@$(call legal-warning-pkg,vpnc,cannot produce any legal info)
+
 vpnc: libgcrypt $(VPNC_TARGET_BINARY)
 
 vpnc-source: $(DL_DIR)/$(VPNC_SOURCE)
-- 
1.7.5.4
