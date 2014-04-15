From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Apr 2014 23:16:02 +0200
Subject: [Buildroot] [git commit] xserver_xorg-server: Compile fix for mips64
Message-ID: <20140415211637.775C29C7C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8813aa2f898986262aac44979af45b7a22bb2b20
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xserver_xorg-server-mips.patch                 |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-mips.patch b/package/x11r7/xserver_xorg-server/xserver_xorg-server-mips.patch
new file mode 100644
index 0000000..ac01e7c
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server-mips.patch
@@ -0,0 +1,17 @@
+Taken from upstream bug tracker:
+https://bugs.freedesktop.org/show_bug.cgi?id=72126
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -up xorg-server-1.14.4/hw/xfree86/common/compiler.h xorg-server-1.14.4-fix/hw/xfree86/common/compiler.h
+--- xorg-server-1.14.4/hw/xfree86/common/compiler.h	2013-07-26 01:14:32.000000000 -0400
++++ xorg-server-1.14.4-fix/hw/xfree86/common/compiler.h	2013-11-27 23:16:46.000000000 -0500
+@@ -727,7 +727,7 @@ xf86WriteMmio32LeNB(__volatile__ void *b
+ #define PORT_SIZE short
+ #endif
+ 
+-_X_EXPORT unsigned int IOPortBase;      /* Memory mapped I/O port area */
++_X_EXPORT uintptr_t IOPortBase;      /* Memory mapped I/O port area */
+ 
+ static __inline__ void
+ outb(unsigned PORT_SIZE port, unsigned char val)
