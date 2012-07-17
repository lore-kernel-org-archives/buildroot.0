From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jul 2012 19:06:25 +0200
Subject: [Buildroot] [git commit] vpnc: warn that legal-info is not
	implemented
Message-ID: <20120717173300.5E9DC96A7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=86f7382a6c8d216658ae400dee93a4c45a7f5406
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vpnc/vpnc.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

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
