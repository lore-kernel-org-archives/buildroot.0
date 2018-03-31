From: Romain Naour <romain.naour@smile.fr>
Date: Sat, 31 Mar 2018 12:55:30 +0200
Subject: [Buildroot] [PATCH] package/zsh: remove busybox show others
 dependency
Message-ID: <20180331105530.30668-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Back in 2013, zsh was added to Buildroot [1] with the dependency on
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS. This dependency was keept with the
refactoring [2].
But Busybox doesn't provide a zsh shell in the firt place.
This dependency can be removed.

[1] 3d19b7ef598f3534b46cf0746a81bc437579127c
[2] 1dbd7b991025a8bf39ab5d25c2fd97f47f084bac

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Phil Eichinger <phil.eichinger@gmail.com>
---
 package/zsh/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/zsh/Config.in b/package/zsh/Config.in
index 2e9daac6ef..2319477979 100644
--- a/package/zsh/Config.in
+++ b/package/zsh/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_ZSH
 	bool "zsh"
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_NCURSES
 	help
 	  zsh is a shell designed for interactive use, although it is
-- 
2.14.3
