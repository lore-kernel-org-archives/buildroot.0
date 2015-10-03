From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Oct 2015 15:29:50 +0200
Subject: [Buildroot] [git commit] busybox: inittab: don't redirect output to
	/dev/null
Message-ID: <20151003133557.40E2481914@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=246131a593ba80879e2a7a81356c0b5fdfccc000
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Several inittab steps are redirected to /dev/null. This means any error or
warning printed by these crucial commands would be hidden from the user.
There is no evident reason to hide this output, so stop doing that.

Suggested by Thomas Petazzoni:
http://lists.busybox.net/pipermail/buildroot/2015-September/139146.html

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/inittab |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/busybox/inittab b/package/busybox/inittab
index b1892c1..24d9199 100644
--- a/package/busybox/inittab
+++ b/package/busybox/inittab
@@ -14,12 +14,12 @@
 # process   == program to run
 
 # Startup the system
-null::sysinit:/bin/mount -t proc proc /proc
-null::sysinit:/bin/mount -o remount,rw /
-null::sysinit:/bin/mkdir -p /dev/pts
-null::sysinit:/bin/mkdir -p /dev/shm
-null::sysinit:/bin/mount -a
-null::sysinit:/bin/hostname -F /etc/hostname
+::sysinit:/bin/mount -t proc proc /proc
+::sysinit:/bin/mount -o remount,rw /
+::sysinit:/bin/mkdir -p /dev/pts
+::sysinit:/bin/mkdir -p /dev/shm
+::sysinit:/bin/mount -a
+::sysinit:/bin/hostname -F /etc/hostname
 # now run any rc scripts
 ::sysinit:/etc/init.d/rcS
 
