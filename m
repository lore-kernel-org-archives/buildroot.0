From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 21 Nov 2007 10:33:40 -0800
Subject: [Buildroot] [buildroot 0001469]: Add fuse and ntfs package for
	buildroot
Message-ID: <ff6d8ac594357be4ebc29ce1e5f237b7@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1469 
====================================================================== 
Reported By:                alextud
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1469
Category:                   New Features
Reproducibility:            N/A
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-22-2007 08:12 PDT
Last Modified:              11-21-2007 10:33 PST
====================================================================== 
Summary:                    Add fuse and ntfs package for buildroot
Description: 
Hi,
I made some makefile for fuse and ntfs-3g and I'll be happy if you can add
them to  buildroot package.
Ntfs-3g mount always fail with default busybox mount command, only work
with mount from util-linux package, I think that its related with fuse and
mount from busybox, fix me if I wrong.
Also I disabled in fuse symvers related to version 2.2 because on runtime
fusermount show: unknown '" option. 
I'm just started with buildroot and my files maybe contains some error,
feel free to modify them.

Thanks, Alex.
====================================================================== 

---------------------------------------------------------------------- 
 alonbl - 11-21-07 10:33  
---------------------------------------------------------------------- 
Hi!

The patch for fuse works, thanks!
Have you sent this to fuse developers?

Can you please rebase to 2.7.1? I don't fully understand these syms...

I succeeded to make busybox mount work, by creating a script that ignores
the "-i" option.

The problem is that I ntfs-3g segfaults when I umount.

I will try to figure out why. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-22-07 08:12  alextud        New Issue                                    
08-22-07 08:12  alextud        Status                   new => assigned     
08-22-07 08:12  alextud        Assigned To               => buildroot       
08-22-07 08:12  alextud        File Added: fuse&ntfs_mk.tar.gz                  
 
08-22-07 08:15  alextud        Issue Monitored: alextud                     
11-21-07 10:30  alonbl         Issue Monitored: alonbl                      
11-21-07 10:33  alonbl         Note Added: 0002946                          
======================================================================
