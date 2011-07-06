From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 6 Jul 2011 07:21:08 +0200
Subject: [Buildroot] [git commit] infrastructure: remove leftover of old
	style hooks
Message-ID: <20110706052314.A88CA8A348@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=76b128f11c07d62654928e597747fe972c079ca7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit ae2be8d (infrastructure: remove support for old style hooks)
forgot to update an uninstall rule.

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Daniel Hobi <daniel.hobi@schmid-telecom.ch>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.7.3.4
