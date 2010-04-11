From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Apr 2010 21:10:35 +0200
Subject: [Buildroot] [git commit master] Do not remove documentation on a
	per-package basis
Message-ID: <20100411195033.E93B620B81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bb36364742486116fb7dbe57bea110b1305fd616
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the documentation cleanup is done by the main Makefile in a
global way, there's no need to do that on a per-package basis in the
generic package infrastructure.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.package.in |    9 ---------
 1 files changed, 0 insertions(+), 9 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index fbd7f69..e98fda8 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -171,15 +171,6 @@ $(BUILD_DIR)/%/.stamp_target_installed:
 	@$(call MESSAGE,"Installing to target")
 	$($(PKG)_INSTALL_TARGET_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
-	$(if $(BR2_HAVE_MANPAGES),,for d in man share/man; do \
-		rm -rf $(TARGET_DIR)/$$d $(TARGET_DIR)/usr/$$d; \
-	done)
-	$(if $(BR2_HAVE_INFOPAGES),,for d in info share/info; do \
-		rm -rf $(TARGET_DIR)/$$d $(TARGET_DIR)/usr/$$d; \
-	done)
-	$(if $(BR2_HAVE_DOCUMENTATION),,for d in doc share/doc; do \
-		rm -rf $(TARGET_DIR)/$$d $(TARGET_DIR)/usr/$$d; \
-	done)
 	$(Q)touch $@
 
 # Clean package
-- 
1.6.3.3
