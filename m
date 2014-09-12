From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri, 12 Sep 2014 17:50:06 +0200
Subject: [Buildroot] [PATCH 07/12] xterm: depends on MMU
In-Reply-To: <1410537011-29662-1-git-send-email-jezz@sysmic.org>
References: <1410537011-29662-1-git-send-email-jezz@sysmic.org>
Message-ID: <1410537011-29662-8-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://sysmic.org/~jezz/results/53a729c3:

button.o: In function `_executeCommand':
./button.c:(.text+0x21be): undefined reference to `_fork'
main.o: In function `_get_pty':
./main.c:(.text+0xab0): undefined reference to `_getpt'
main.o: In function `_spawnXTerm':
./main.c:(.text+0x1030): undefined reference to `_fork'
misc.o: In function `_creat_as':
./misc.c:(.text+0x3a56): undefined reference to `_fork'
print.o: In function `_charToPrinter':
./print.c:(.text+0x1ee): undefined reference to `_fork'

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/xterm/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xterm/Config.in b/package/xterm/Config.in
index 33adf25..e17d2c6 100644
--- a/package/xterm/Config.in
+++ b/package/xterm/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_XTERM
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_XLIB_LIBXAW
 	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_MMU # fork()
 	help
 	  xterm terminal emulator
 
-- 
2.1.0
