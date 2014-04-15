From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 15 Apr 2014 07:07:26 +0200
Subject: [Buildroot] [PATCH 3/3] xserver_xorg-server: Compile fix for mips64
In-Reply-To: <1397538446-25247-1-git-send-email-bernd.kuhls@t-online.de>
References: <1397538446-25247-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1397538446-25247-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xserver_xorg-server-mips.patch                    |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 package/x11r7/xserver_xorg-server/xserver_xorg-server-mips.patch

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
-- 
1.7.10.4
