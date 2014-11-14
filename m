From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Nov 2014 14:35:49 +0100
Subject: [Buildroot] [git commit] package/sysvinit: drop tty1/2
Message-ID: <20141114134036.ED396B5660@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=11ed52866077774a86b99358ba5362745bd813cf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We don't do it for busybox init so do the same for consistency here.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysvinit/inittab |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/package/sysvinit/inittab b/package/sysvinit/inittab
index fd0d2f0..9b3a119 100644
--- a/package/sysvinit/inittab
+++ b/package/sysvinit/inittab
@@ -12,9 +12,6 @@ moun::sysinit:/bin/mount -a
 host::sysinit:/bin/hostname -F /etc/hostname
 init::sysinit:/etc/init.d/rcS
 
-1:1:respawn:/sbin/getty 38400 tty1
-2:1:respawn:/sbin/getty 38400 tty2
-
 # S0:1:respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
 
 # Stuff to do for the 3-finger salute
