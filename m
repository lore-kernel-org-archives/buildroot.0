From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 12 Sep 2014 23:18:19 +0200
Subject: [Buildroot] [git commit] xterm: depends on MMU
Message-ID: <20140913074255.881DD9D688@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3eca26b3c0ee2189cd25b03cd40add7fb106bb37
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xterm/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
 
