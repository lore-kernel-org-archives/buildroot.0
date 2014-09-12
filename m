From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 12 Sep 2014 22:59:55 +0200
Subject: [Buildroot] [git commit] xapp_xkbevd: depends on MMU
Message-ID: <20140913074255.5D2269C9C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=11633cd0d706ff59c7815355c66e8b59dd5561da
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://sysmic.org/~jezz/results/a9ec03bd:

xkbevd.o: In function `_main':
xkbevd.c:(.text+0x3ca): undefined reference to `_fork'
collect2: ld returned 1 exit status

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xkbevd/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xapp_xkbevd/Config.in b/package/x11r7/xapp_xkbevd/Config.in
index cf31565..0cbb9e4 100644
--- a/package/x11r7/xapp_xkbevd/Config.in
+++ b/package/x11r7/xapp_xkbevd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XKBEVD
 	bool "xkbevd"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_XLIB_LIBXKBFILE
 	help
 	  XKB event daemon
