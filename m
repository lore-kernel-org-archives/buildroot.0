From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 12 Sep 2014 23:18:08 +0200
Subject: [Buildroot] [git commit] xapp_xinit: depends on MMU
Message-ID: <20140913074255.656959D688@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d1ac782486a83b893c3091e378deed126e03124a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://sysmic.org/~jezz/results/8b5af679:

xinit.o: In function `_main':
xinit.c:(.text+0x65e): undefined reference to `_fork'
xinit.c:(.text+0x7d4): undefined reference to `_fork'
collect2: ld returned 1 exit status

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xinit/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xapp_xinit/Config.in b/package/x11r7/xapp_xinit/Config.in
index aede5d9..d9fb1c5 100644
--- a/package/x11r7/xapp_xinit/Config.in
+++ b/package/x11r7/xapp_xinit/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XINIT
 	bool "xinit"
+	depends on BR2_USE_MMU # fork()
 	# Runtime dependency: can't start an X server unless there is one
 	depends on BR2_PACKAGE_XSERVER_XORG_SERVER
 	# Runtime dependency; mcookie is also in util-linux
