From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 20 Oct 2014 16:18:44 -0300
Subject: [Buildroot] [PATCH] package/sysvinit: remove inline comment from
	root remount
Message-ID: <1413832724-15564-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It breaks the root rw remount as explained in bug #7442.
Thanks to joymarquis at hotmail.com for pointing it out.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sysvinit/inittab | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sysvinit/inittab b/package/sysvinit/inittab
index d3de4a7..fd0d2f0 100644
--- a/package/sysvinit/inittab
+++ b/package/sysvinit/inittab
@@ -5,7 +5,7 @@
 id:1:initdefault:
 
 proc::sysinit:/bin/mount -t proc proc /proc
-rwmo::sysinit:/bin/mount -o remount,rw / # REMOUNT_ROOTFS_RW
+rwmo::sysinit:/bin/mount -o remount,rw /
 dpts::sysinit:/bin/mkdir -p /dev/pts
 dshm::sysinit:/bin/mkdir -p /dev/shm
 moun::sysinit:/bin/mount -a
-- 
2.0.4
