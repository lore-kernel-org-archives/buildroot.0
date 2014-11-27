From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 27 Nov 2014 13:48:18 -0300
Subject: [Buildroot] [PATCH 2/2] skeleton/fstab: add /run entry
In-Reply-To: <1417106898-14444-1-git-send-email-gustavo@zacarias.com.ar>
References: <1417106898-14444-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1417106898-14444-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that /run is a proper directory (or mountpoint) let's mount a tmpfs
filesystem there to avoid breaking things when the root filesystem
isn't writable.

While at it fix non-consitent spacing by using tabs, and drop the
"static file system information" header whatever that means.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 system/skeleton/etc/fstab | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/system/skeleton/etc/fstab b/system/skeleton/etc/fstab
index e000aad..2ee4787 100644
--- a/system/skeleton/etc/fstab
+++ b/system/skeleton/etc/fstab
@@ -1,9 +1,10 @@
 # /etc/fstab: static file system information.
 #
-# <file system> <mount pt>     <type>	<options>         <dump> <pass>
-/dev/root       /              ext2	rw,noauto         0      1
-proc		/proc	       proc     defaults	  0	 0
-devpts		/dev/pts       devpts   defaults,gid=5,mode=620	  0	 0
-tmpfs           /dev/shm       tmpfs    mode=0777         0      0
-tmpfs           /tmp           tmpfs    mode=1777         0      0
-sysfs		/sys	       sysfs    defaults	  0	 0
+# <file system>	<mount pt>	<type>	<options>	<dump>	<pass>
+/dev/root	/		ext2	rw,noauto	0	1
+proc		/proc		proc	defaults	0	0
+devpts		/dev/pts	devpts	defaults,gid=5,mode=620	0	0
+tmpfs		/dev/shm	tmpfs	mode=0777	0	0
+tmpfs		/tmp		tmpfs	mode=1777	0	0
+tmpfs		/run		tmpfs	mode=0777,nosuid,nodev	0	0
+sysfs		/sys		sysfs	defaults	0	0
-- 
2.0.4
