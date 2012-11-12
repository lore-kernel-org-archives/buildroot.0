From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 12 Nov 2012 21:08:30 +0100
Subject: [Buildroot] [PATCH for-2012.11 3/5] legacy: add error target for
	host-pkg-config
In-Reply-To: <1352750912-16012-1-git-send-email-arnout@mind.be>
References: <1352750912-16012-1-git-send-email-arnout@mind.be>
Message-ID: <1352750912-16012-4-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile.legacy |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Makefile.legacy b/Makefile.legacy
index c8b568d..e0b7ec2 100644
--- a/Makefile.legacy
+++ b/Makefile.legacy
@@ -13,6 +13,16 @@ $(error "You have legacy configuration in your .config! Please check your config
 endif
 
 #
+# Legacy options from 2012.08
+#
+
+host-pkg-config:
+	@$(call MESSAGE,host-pkg-config is replaced by host-pkgconf)
+	@$(call MESSAGE,please update your .mk files)
+	@false
+.PHONY: host-pkg-config
+
+#
 # Legacy options from 2012.05
 #
 GENTARGETS = $$(error The GENTARGETS macro no longer exists; use $$$$(eval $$$$(generic-package)) or $$$$(eval $$$$(host-generic-package)))
-- 
1.7.10.4
