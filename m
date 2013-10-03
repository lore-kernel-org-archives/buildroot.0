From: Axel Lin <axel.lin@ingics.com>
Date: Thu, 03 Oct 2013 09:20:07 +0800
Subject: [Buildroot] [PATCH] zsh: needs mmu
Message-ID: <1380763207.1614.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix below build error if !BR2_USE_MMU:

exec.o: In function `zfork':
exec.c:(.text+0x150c): undefined reference to `fork'
collect2: ld returned 1 exit status
make[2]: *** [zsh] Error 1

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/zsh/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zsh/Config.in b/package/zsh/Config.in
index fd63aa9..6853249 100644
--- a/package/zsh/Config.in
+++ b/package/zsh/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ZSH
 	bool "zsh"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NCURSES
 	help
 	  zsh is a shell designed for interactive use, although it is also
-- 
1.8.1.2
