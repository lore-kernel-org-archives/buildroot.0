From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 12 Sep 2014 23:18:19 +0200
Subject: [Buildroot] [git commit] xapp_xsm: depends on MMU
Message-ID: <20140913074255.6C7939D688@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=41d2979fe3d4dc688d64bd009f2c7ddab060af35
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes: http://sysmic.org/~jezz/results/455f2788:

remote.o: In function `_remote_start':
remote.c:(.text+0x74): undefined reference to `_fork'
restart.o: In function `_Clone':
restart.c:(.text+0x5a8): undefined reference to `_fork'
restart.o: In function `_Restart':
restart.c:(.text+0xa44): undefined reference to `_fork'
collect2: ld returned 1 exit status

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xsm/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xapp_xsm/Config.in b/package/x11r7/xapp_xsm/Config.in
index d06dc6c..88f20cf 100644
--- a/package/x11r7/xapp_xsm/Config.in
+++ b/package/x11r7/xapp_xsm/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XSM
 	bool "xsm"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_XLIB_LIBXAW
 	help
 	  X Session Manager
