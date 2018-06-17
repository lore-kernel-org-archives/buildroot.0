From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 17:19:42 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] busybox: reduce number of
 mkdir calls in inittab
Message-ID: <20180617155626.29CCB81070@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a765cfb34dc2f5f321c05f76e1a3aaf203deda72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

The default busybox inittab does two separate mkdir calls
to create /dev/pts and /dev/shm. Reduce this to call mkdir
only once for both directories.

Signed-off-by: Florian La Roche <F.LaRoche@pilz.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 13dbe73782c3555b382ea8ebd9cda34ac9ef5744)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/inittab | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/busybox/inittab b/package/busybox/inittab
index 3f49f6bd7a..368b037ee2 100644
--- a/package/busybox/inittab
+++ b/package/busybox/inittab
@@ -16,8 +16,7 @@
 # Startup the system
 ::sysinit:/bin/mount -t proc proc /proc
 ::sysinit:/bin/mount -o remount,rw /
-::sysinit:/bin/mkdir -p /dev/pts
-::sysinit:/bin/mkdir -p /dev/shm
+::sysinit:/bin/mkdir -p /dev/pts /dev/shm
 ::sysinit:/bin/mount -a
 ::sysinit:/bin/hostname -F /etc/hostname
 # now run any rc scripts
