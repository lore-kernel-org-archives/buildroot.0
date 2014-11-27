From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 27 Nov 2014 08:44:36 +0200
Subject: [Buildroot] [PATCH] system/device_table.txt: add /dev/null entry
Message-ID: <0a2f80f7ceb3272bf534f85fbf5030df36cae191.1417070676.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

/dev/null is the "console" for system startup commands listed in the default
/etc/inittab. These commands fail when /dev/null isn't there. This breaks
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV, as /proc and /sys are not mounted when
mdev runs, causing the following errors:

can't open /dev/null: No such file or directory
can't open /dev/null: No such file or directory
can't open /dev/null: No such file or directory
can't open /dev/null: No such file or directory
can't open /dev/null: No such file or directory
can't open /dev/null: No such file or directory
...
Starting mdev...
/etc/init.d/S10mdev: line 19: can't create /proc/sys/kernel/hotplug: nonexistent directory
mdev: /sys/class: No such file or directory

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 system/device_table.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/system/device_table.txt b/system/device_table.txt
index 8e7dbd218a2c..7b92d23b822f 100644
--- a/system/device_table.txt
+++ b/system/device_table.txt
@@ -7,6 +7,7 @@
 #
 # <name>				<type>	<mode>	<uid>	<gid>	<major>	<minor>	<start>	<inc>	<count>
 /dev					d	755	0	0	-	-	-	-	-
+/dev/null				c	666	0	0	1	3	0	0	-
 /tmp					d	1777	0	0	-	-	-	-	-
 /etc					d	755	0	0	-	-	-	-	-
 /root					d	700	0	0	-	-	-	-	-
-- 
2.1.3
