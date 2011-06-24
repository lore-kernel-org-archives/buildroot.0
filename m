From: Daniel Hobi <daniel.hobi@schmid-telecom.ch>
Date: Fri, 24 Jun 2011 14:09:46 +0200
Subject: [Buildroot] [PATCH] infrastructure: remove leftover of old style
	hooks
Message-ID: <1308917386-11117-1-git-send-email-daniel.hobi@schmid-telecom.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit ae2be8d (infrastructure: remove support for old style hooks)
forgot to update an uninstall rule.

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Daniel Hobi <daniel.hobi@schmid-telecom.ch>
---
 package/Makefile.package.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index bf4e1b4..4bd40ba 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -324,7 +324,7 @@ $(BUILD_DIR)/%/.stamp_uninstalled:
 	$($(PKG)_UNINSTALL_STAGING_CMDS)
 	rm -f $($(PKG)_TARGET_INSTALL_STAGING)
 	$($(PKG)_UNINSTALL_TARGET_CMDS)
-	rm -f $($(PKG)_TARGET_INSTALL_TARGET) $($(PKG)_HOOK_POST_INSTALL)
+	rm -f $($(PKG)_TARGET_INSTALL_TARGET)
 
 # Remove package sources
 $(BUILD_DIR)/%/.stamp_dircleaned:
-- 
1.7.5.3
