From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 10 Nov 2012 22:08:35 -0500
Subject: [Buildroot] [PATCH] group file: define groups expected by udev
Message-ID: <1352603315-1731-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

udev-182 requires several groups to be resolvable at udev startup,
including disk, cdrom, floppy, tape, audio, video, lp, tty, dialout,
and kmem.  Only some of these are in the default skeleton's group
file, So let's add the missing groups, and plugdev too.

This avoids getting these logs in /var/logs/messages:

Jan  1 00:00:08 buildroot daemon.err udevd[37]: specified group 'dialout' unknown
Jan  1 00:00:08 buildroot daemon.err udevd[37]: specified group 'kmem' unknown
Jan  1 00:00:08 buildroot daemon.err udevd[37]: specified group 'video' unknown
Jan  1 00:00:08 buildroot daemon.err udevd[37]: specified group 'lp' unknown
Jan  1 00:00:08 buildroot daemon.err udevd[37]: specified group 'floppy' unknown
Jan  1 00:00:08 buildroot daemon.err udevd[37]: specified group 'cdrom' unknown
Jan  1 00:00:08 buildroot daemon.err udevd[37]: specified group 'tape' unknown

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 system/skeleton/etc/group |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/system/skeleton/etc/group b/system/skeleton/etc/group
index 8fc486d..864d1db 100644
--- a/system/skeleton/etc/group
+++ b/system/skeleton/etc/group
@@ -5,10 +5,18 @@ sys:x:3:
 adm:x:4:
 tty:x:5:
 disk:x:6:
+lp:x:7:
+kmem:x:9:
 wheel:x:10:root
+cdrom:x:11:
+dialout:x:18:
+floppy:x:19:
+video:x:28:
 audio:x:29:
+tape:x:32:
 www-data:x:33:
 utmp:x:43:
+plugdev:x:46:
 staff:x:50:
 lock:x:54:
 haldaemon:x:68:
-- 
1.7.9.5
