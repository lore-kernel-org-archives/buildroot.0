From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jun 2018 18:50:22 +0200
Subject: [Buildroot] [git commit] busybox: reduce number of mkdir calls in
 inittab
Message-ID: <20180605164929.6994D83B2E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=13dbe73782c3555b382ea8ebd9cda34ac9ef5744
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The default busybox inittab does two separate mkdir calls
to create /dev/pts and /dev/shm. Reduce this to call mkdir
only once for both directories.

Signed-off-by: Florian La Roche <F.LaRoche@pilz.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/busybox/inittab | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/busybox/inittab b/package/busybox/inittab
index ef58c32f0d..7cd203de0b 100644
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
 null::sysinit:/bin/ln -sf /proc/self/fd /dev/fd
 null::sysinit:/bin/ln -sf /proc/self/fd/0 /dev/stdin
