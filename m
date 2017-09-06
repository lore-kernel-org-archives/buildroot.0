From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Sep 2017 12:26:43 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] vim: add host variant
Message-ID: <20170906112607.4A4B48211D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f21b3b83f8c9d3c19105da4a4cecdda6ea63eea5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Vim contains a tool called xxd, which is needed by mediastreamer on
the host as part of its build process. Therefore, this commit
introduces a host variant for the vim package, that will be used by
mediastreamer.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 38d098402e620366d87699a7894d2e7918989156)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vim/vim.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index ec49460..9ea3fc2 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -75,4 +75,7 @@ VIM_POST_INSTALL_TARGET_HOOKS += VIM_INSTALL_RUNTIME_CMDS
 VIM_POST_INSTALL_TARGET_HOOKS += VIM_REMOVE_DOCS
 endif
 
+HOST_VIM_DEPENDENCIES = host-ncurses
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
