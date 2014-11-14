From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 14 Nov 2014 09:44:52 -0300
Subject: [Buildroot] [PATCH 06/10] package/sysvinit: drop tty1/2
In-Reply-To: <1415969096-3032-1-git-send-email-gustavo@zacarias.com.ar>
References: <1415969096-3032-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1415969096-3032-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We don't do it for busybox init so do the same for consistency here.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sysvinit/inittab | 3 ---
 1 file changed, 3 deletions(-)

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
-- 
2.0.4
