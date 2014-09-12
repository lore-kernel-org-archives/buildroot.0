From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 12 Sep 2014 23:18:19 +0200
Subject: [Buildroot] [git commit] xapp_xdm: depends on MMU
Message-ID: <20140913074255.7EEA79D688@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=52d650a6b94dd05b34d1d2a3acd0af7e8266bc64
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://sysmic.org/~jezz/results/e891eb7e:

dm.o: In function `_StartDisplay':
dm.c:(.text+0xd6e): undefined reference to `_fork'
server.o: In function `_StartServerOnce':
server.c:(.text+0x266): undefined reference to `_fork'
session.o: In function `_runAndWait':
session.c:(.text+0x67a): undefined reference to `_fork'
session.o: In function `_ManageSession':
session.c:(.text+0xa2a): undefined reference to `_fork'
collect2: ld returned 1 exit status

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xdm/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xapp_xdm/Config.in b/package/x11r7/xapp_xdm/Config.in
index 477cd77..6982970 100644
--- a/package/x11r7/xapp_xdm/Config.in
+++ b/package/x11r7/xapp_xdm/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XDM
 	bool "xdm"
+	depends on BR2_USE_MMU # fork()
 	# Runtime dependency: can't start an X server unless there is one
 	depends on BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XAPP_SESSREG
