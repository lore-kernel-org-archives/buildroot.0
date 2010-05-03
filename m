From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 May 2010 12:01:19 +0200
Subject: [Buildroot] [git commit master] target/generic: inittab: fix devpts
	mounts when devtmpfs is used
Message-ID: <20100503100234.2501C8F456@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d39641ccd64b82494716e4bf35ac5d0c8fa67201
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If devtmpfs (the kernel-maintained /dev filesystem) is used, no
/dev/pts directory is created, causing the devpts mount to fail, which
in term causes stuff like dropbear to fail.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/generic/target_skeleton/etc/inittab |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/target/generic/target_skeleton/etc/inittab b/target/generic/target_skeleton/etc/inittab
index 7aa654f..2949c91 100644
--- a/target/generic/target_skeleton/etc/inittab
+++ b/target/generic/target_skeleton/etc/inittab
@@ -16,6 +16,7 @@
 # Startup the system
 null::sysinit:/bin/mount -o remount,rw /
 null::sysinit:/bin/mount -t proc proc /proc
+null::sysinit:/bin/mkdir -p /dev/pts
 null::sysinit:/bin/mount -a
 null::sysinit:/bin/hostname -F /etc/hostname
 null::sysinit:/sbin/ifconfig lo 127.0.0.1 up
-- 
1.6.3.3
