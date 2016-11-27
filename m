From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Nov 2016 21:12:24 +0100
Subject: [Buildroot] [git commit] Revert "package/pseudo: add a legacy
	symlink to emulate fakeroot"
Message-ID: <20161127202537.AA20C7FBF4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6d3e05690f3ecfdd1512393f7afd67e0042d05f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 7158403805f650e8e34de6c0ac0dcd9b565c679b.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pseudo/pseudo.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/pseudo/pseudo.mk b/package/pseudo/pseudo.mk
index a924e10..8144cca 100644
--- a/package/pseudo/pseudo.mk
+++ b/package/pseudo/pseudo.mk
@@ -26,9 +26,4 @@ HOST_PSEUDO_CONF_OPTS = \
 	--libdir=$(HOST_DIR)/usr/lib \
 	--with-sqlite=$(HOST_DIR)/usr
 
-define HOST_PSEUDO_FAKEROOT_SYMLINK
-	ln -sf pseudo $(HOST_DIR)/usr/bin/fakeroot
-endef
-HOST_PSEUDO_POST_INSTALL_HOOKS += HOST_PSEUDO_FAKEROOT_SYMLINK
-
 $(eval $(host-autotools-package))
