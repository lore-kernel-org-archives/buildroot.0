From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 06:05:16 -0800
Subject: [Buildroot] [buildroot 0000881]: Buildroot new feature: Generate
	initramfs description file of root filesystem for initial
	kernel ramdisk
Message-ID: <0908d712d168dc6735096b8a98ab1c91@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=881 
====================================================================== 
Reported By:                fred
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   881
Category:                   New Features
Reproducibility:            N/A
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             05-24-2006 16:27 PDT
Last Modified:              02-12-2007 06:05 PST
====================================================================== 
Summary:                    Buildroot new feature: Generate initramfs
description file of root filesystem for initial kernel ramdisk
Description: 
This patch contains a new target "initramfs" which builds a description
file for the initial kernel ramdisk. I use this together with kernel
2.6.12. The mechanism is based on a shell script "gen_initramfs_list.sh"
which is provided together with the kernel. The description file is then
used to build a cpio filesystem via the gen_init_cpio tool during the
kernel build.

This is inspired by the procedure described here: 

http://www.student.tue.nl/Q/t.f.a.wilms/adm5120/

That procedure produces an ext2 filesystem with buildroot. Then this
filesystem is mounted in the kernel build directory where
"gen_initramfs_list.sh" produces a filesystem description file which is
used then by gen_init_cpio to produce the cpio filesystem. This procedure
requires root rights to mount the filesystem. The idea is to produce the
filesystem description file directly from buildroot. Then the complete
kernel including rootfilesystem as ramdisk can be build as normal user.

The patch adds a new target and modifies the config.in file in the target
directory.
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 12-01-06 10:12  
---------------------------------------------------------------------- 
That's an excellent idea except for the mount.

Please be so kind and update the patch to
     select tarroot # or however the creation of a tarball is named

or just ln -s the build_$()/root to the dir gen_initramfs expects.
Also, it's easier for me if you could (also) send the patch with a copy'n
paste of the adjusted description above to the mailing-list.

TIA! 

---------------------------------------------------------------------- 
 fred - 02-12-07 06:05  
---------------------------------------------------------------------- 
Hi,

thanks for the reply to the patch! Unfortunatly I do not get the
suggestion you made below. Just to make sure: Is it clear that you do not
need to mount any filesystem with this proposed procedure? 

Regards

Friedrich 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-24-06 16:27  fred           New Issue                                    
05-24-06 16:27  fred           Status                   new => assigned     
05-24-06 16:27  fred           Assigned To               => uClibc          
05-24-06 16:27  fred           File Added: buildroot_initramfs_target.patch     
              
12-01-06 10:12  bernhardf      Note Added: 0001850                          
02-12-07 05:34  vapier         Assigned To              uClibc => buildroot 
02-12-07 06:05  fred           Note Added: 0002153                          
======================================================================
