From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 Jan 2016 23:16:08 +0100
Subject: [Buildroot] [git commit] inittab: disable reboot by ctrl-alt-del
Message-ID: <20160103223207.661F48230F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fb4c041cfb6b754397309c4cfc95050a7f3a506e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Most embedded systems do not have a keyboard.
If a keyboard is attached afterwards (e.g. to an accessible USB host port)
this allows the user to reboot the system by pressing Ctrl-Alt-Del, which
might not be desired.

Signed-off-by: lothar felten <felten@vaxnet.de>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/inittab  | 2 +-
 package/sysvinit/inittab | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/busybox/inittab b/package/busybox/inittab
index 24d9199..3f49f6b 100644
--- a/package/busybox/inittab
+++ b/package/busybox/inittab
@@ -27,7 +27,7 @@
 #ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
 
 # Stuff to do for the 3-finger salute
-::ctrlaltdel:/sbin/reboot
+#::ctrlaltdel:/sbin/reboot
 
 # Stuff to do before rebooting
 ::shutdown:/etc/init.d/rcK
diff --git a/package/sysvinit/inittab b/package/sysvinit/inittab
index fc0c9b5..27eb4a6 100644
--- a/package/sysvinit/inittab
+++ b/package/sysvinit/inittab
@@ -15,7 +15,7 @@ si6::sysinit:/etc/init.d/rcS
 # S0:1:respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
 
 # Stuff to do for the 3-finger salute
-ca::ctrlaltdel:/sbin/reboot
+#ca::ctrlaltdel:/sbin/reboot
 
 # Stuff to do before rebooting
 shd0:06:wait:/etc/init.d/rcK
