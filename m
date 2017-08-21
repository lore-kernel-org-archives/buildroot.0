From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Aug 2017 22:55:15 +0200
Subject: [Buildroot] [PATCH 2/3] vim: add host variant
In-Reply-To: <20170821205516.20620-1-thomas.petazzoni@free-electrons.com>
References: <20170821205516.20620-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170821205516.20620-2-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vim contains a tool called xxd, which is needed by mediastreamer on
the host as part of its build process. Therefore, this commit
introduces a host variant for the vim package, that will be used by
mediastreamer.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vim/vim.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index c235a08..5ee8898 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -75,4 +75,7 @@ VIM_POST_INSTALL_TARGET_HOOKS += VIM_INSTALL_RUNTIME_CMDS
 VIM_POST_INSTALL_TARGET_HOOKS += VIM_REMOVE_DOCS
 endif
 
+HOST_VIM_DEPENDENCIES = host-ncurses
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.9.4
