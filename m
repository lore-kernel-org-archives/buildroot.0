From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 Feb 2011 23:30:46 +0100
Subject: [Buildroot] [git commit master 1/1] fs/skeleton: mount /proc before
	remounting rw
Message-ID: <20110221223153.069A58F627@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a7da53bd2c80caf9ae3883857a82b97772a369c7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

inittab ordering causes mount to fail on remount,rw.  inittab
changed to mount /proc first.

Signed-off-by: Andy Kennedy <Andy.Kennedy@AdTran.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/skeleton/etc/inittab |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/skeleton/etc/inittab b/fs/skeleton/etc/inittab
index 4be14b8..873db29 100644
--- a/fs/skeleton/etc/inittab
+++ b/fs/skeleton/etc/inittab
@@ -14,8 +14,8 @@
 # process   == program to run
 
 # Startup the system
-null::sysinit:/bin/mount -o remount,rw /
 null::sysinit:/bin/mount -t proc proc /proc
+null::sysinit:/bin/mount -o remount,rw /
 null::sysinit:/bin/mkdir -p /dev/pts
 null::sysinit:/bin/mount -a
 null::sysinit:/bin/hostname -F /etc/hostname
-- 
1.7.3.4
