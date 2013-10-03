From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 3 Oct 2013 08:40:09 +0200
Subject: [Buildroot] [git commit] zsh: needs mmu
Message-ID: <20131003101321.23BAF9B930@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=05b442a62886f9a6efe5a8a5d025e11d72e8656c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix below build error if !BR2_USE_MMU:

exec.o: In function `zfork':
exec.c:(.text+0x150c): undefined reference to `fork'
collect2: ld returned 1 exit status
make[2]: *** [zsh] Error 1

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zsh/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
