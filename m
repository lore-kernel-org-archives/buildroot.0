From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 12 Sep 2014 23:18:19 +0200
Subject: [Buildroot] [git commit] xapp_xmh: depends on MMU
Message-ID: <20140913074255.759A69D688@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f68f8347e04fb40e53cb6823f68aa1e947a20e7d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://sysmic.org/~jezz/results/1a0bc183:

command.o: In function `__DoCommandToFileOrPipe':
command.c:(.text+0x35e): undefined reference to `_fork'
collect2: ld returned 1 exit status

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xmh/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xapp_xmh/Config.in b/package/x11r7/xapp_xmh/Config.in
index 1ef65c7..4e86d0f 100644
--- a/package/x11r7/xapp_xmh/Config.in
+++ b/package/x11r7/xapp_xmh/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XMH
 	bool "xmh"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_XLIB_LIBXAW
 	select BR2_PACKAGE_XDATA_XBITMAPS
 	help
