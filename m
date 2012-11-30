From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Nov 2012 12:07:09 -0800
Subject: [Buildroot] [git commit] legacy: add error target for
	host-pkg-config
Message-ID: <20121130201153.500D19940D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=be2460c545def6f00b6aade8719e1eef5f3ba875
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile.legacy |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

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
