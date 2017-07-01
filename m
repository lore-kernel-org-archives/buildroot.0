From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 12:45:47 +0200
Subject: [Buildroot] [git commit] trinity: fix MIPS support
Message-ID: <20170701104255.2293981999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=981c39ea72a7a05a12657b22edd89dfdc4fa8988
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an upstream patch that fixes segfaults when executed on MIPS due to
incorrect handling of system call numbers on MIPS platforms.

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/trinity/trinity.hash | 1 +
 package/trinity/trinity.mk   | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/trinity/trinity.hash b/package/trinity/trinity.hash
index 4998f5a..b896158 100644
--- a/package/trinity/trinity.hash
+++ b/package/trinity/trinity.hash
@@ -3,3 +3,4 @@ sha256 4cb2bd4049ce523fdf47490c4c18b8eb713c720d4b3b13d6ec2ae246aac908ad  trinity
 sha256 5601474b10973b99f6f4ecc67c8ac54000754d7110553cc81c7648bd7e73c810  b0e66a2d084ffc210bc1fc247efb4d177e9f7e3d.patch
 sha256 1974e473113b4e79fb2ff820e2b03f475a538e43343c24ca077a04214b9e0418  f447db18b389050ecc5e66dbf549d5953633e23e.patch
 sha256 9f9846a9c257b7df7e944c8b3ea956a8e8166bba67b3ea6c231382f095753312  87427256640f806710dd97fc807a9a896147c617.patch
+sha256 e6e47e813424f6b92b5a2e8f56bbd3bae63db47b76ece81a934a9390e194cbfc  1d9af9d07ae111c253c92112fb50000adac47a0c.patch
diff --git a/package/trinity/trinity.mk b/package/trinity/trinity.mk
index ee695fb..7396570 100644
--- a/package/trinity/trinity.mk
+++ b/package/trinity/trinity.mk
@@ -12,7 +12,8 @@ TRINITY_LICENSE_FILES = COPYING
 
 TRINITY_PATCH = https://github.com/kernelslacker/trinity/commit/b0e66a2d084ffc210bc1fc247efb4d177e9f7e3d.patch \
 		https://github.com/kernelslacker/trinity/commit/f447db18b389050ecc5e66dbf549d5953633e23e.patch \
-		https://github.com/kernelslacker/trinity/commit/87427256640f806710dd97fc807a9a896147c617.patch
+		https://github.com/kernelslacker/trinity/commit/87427256640f806710dd97fc807a9a896147c617.patch \
+		https://github.com/kernelslacker/trinity/commit/1d9af9d07ae111c253c92112fb50000adac47a0c.patch
 
 ifeq ($(BR2_PACKAGE_BTRFS_PROGS),y)
 TRINITY_DEPENDENCIES += btrfs-progs
