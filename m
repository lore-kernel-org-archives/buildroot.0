From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 20 Feb 2020 12:37:19 +0000
Subject: [Buildroot] [Bug 12571] New: ltp-testsuite : Build failure
Message-ID: <bug-12571-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12571

            Bug ID: 12571
           Summary: ltp-testsuite : Build failure
           Product: buildroot
           Version: 2019.11.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: learn2kab at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hello,

While trying to prepare images for Beaglebone Black with "ltp-testsuite"
included (keeping other parameters to their default values),the build process
breaks .


-----------------------------
Error Message with Default Settings:
-----------------------------
Allocating group tables: done                            
Writing inode tables: done                            
Creating journal (4096 blocks): done
Copying files into the device: __populate_fs: Could not allocate block in ext2
filesystem while writing file "fanotify10"
mkfs.ext4: Could not allocate block in ext2 filesystem while populating file
system
*** Maybe you need to increase the filesystem size
(BR2_TARGET_ROOTFS_EXT2_SIZE)
fs/ext2/ext2.mk:46: recipe for target
'/home/workpc/dir_buildroot/buildroot-2019.11.1/output/images/rootfs.ext2'
failed
make[1]: ***
[/home/workpc/dir_buildroot/buildroot-2019.11.1/output/images/rootfs.ext2]
Error 1
Makefile:84: recipe for target '_all' failed
make: *** [_all] Error 2
-----------------------------


Updated the value of "BR2_TARGET_ROOTFS_EXT2_SIZE" from 60M to 64G.
An error message mentioning 
"part rootfs size (536870912) too small for rootfs.ext4 (68719476736)"
 (as below) appears in the build log.


-------------------------------
Error Message with Modified Values:
-------------------------------
INFO: cmd: "find
'/home/workpc/dir_buildroot/buildroot-2019.11.1/output/build/genimage.tmp/root'
-depth -type d -printf '%P\0' | xargs -0 -I {} touch -r
'/tmp/tmp.7ROXYVc0KU/{}'
'/home/workpc/dir_buildroot/buildroot-2019.11.1/output/build/genimage.tmp/root/{}'"
(stderr):
ERROR: hdimage(sdcard.img): part rootfs size (536870912) too small for
rootfs.ext4 (68719476736)
Makefile:809: recipe for target 'target-post-image' failed
make[1]: *** [target-post-image] Error 1
Makefile:84: recipe for target '_all' failed
make: *** [_all] Error 2


--------------------------------

What would be the apt value for this parameter??
Should any other parameter be accordingly modified?? 
Please advice.

Regards,
Adarsh

-- 
You are receiving this mail because:
You are on the CC list for the bug.
