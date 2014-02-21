From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 21 Feb 2014 22:30:24 +0100
Subject: [Buildroot] [git commit] skeleton: /etc/fstab: make sure /tmp is
	world writable and sticky
Message-ID: <20140221213607.A36E9826F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a1451719dfca5b40619b396b01da5fbddb65ba32
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ramfs (which is used instead of tmpfs if CONFIG_SHMEM isn't enabled in the
kernel configuration), defaults to mode 0755 instead of 01777 like tmpfs
uses.

/tmp should be world writable and sticky, so explictly enforce the mode so
ramfs users gets it correct instead of relying on the defaults.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/skeleton/etc/fstab |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/system/skeleton/etc/fstab b/system/skeleton/etc/fstab
index a2f56ff..e000aad 100644
--- a/system/skeleton/etc/fstab
+++ b/system/skeleton/etc/fstab
@@ -5,5 +5,5 @@
 proc		/proc	       proc     defaults	  0	 0
 devpts		/dev/pts       devpts   defaults,gid=5,mode=620	  0	 0
 tmpfs           /dev/shm       tmpfs    mode=0777         0      0
-tmpfs           /tmp           tmpfs    defaults          0      0
+tmpfs           /tmp           tmpfs    mode=1777         0      0
 sysfs		/sys	       sysfs    defaults	  0	 0
