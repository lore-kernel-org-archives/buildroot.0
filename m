From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:48:33 -0800
Subject: [Buildroot] [buildroot 0000163]: Target Skeleton Update
Message-ID: <7136edc79a536a3f9ea1b0022bb4ad86@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=163 
====================================================================== 
Reported By:                pgrayson
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   163
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-15-2005 18:31 PST
Last Modified:              02-12-2007 05:48 PST
====================================================================== 
Summary:                    Target Skeleton Update
Description: 
Currently, there are two mechanisms for creating the target root filesystem
skeleton. The first mechanism uses a tarball containing a root filesystem
skeleton. The second mechanism overlays a directory tree on-top of the
target root filesystem. Buildroot currently uses both of these mechanisms
concurrently.

A deficiency of the current directory tree overlay mechanism is that it
only works for files -- directories must already exist (ostensibly from
the tarball skeleton).

The attached patch resolves this deficiency. A side-effect of this is that
the tarball mechanism can be deprecated and the directory tree overlay can
entirely supercede it. This has [obvious and] significant advantages in
terms of version controlling the root filesystem skeleton.

This patch also makes a tweak that allows TARGET_SKELETON,
TARGET_SKEL_DIR, and TARGET_DEVICE_TABLE to be overridden correctly.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-15-05 18:31  pgrayson       New Issue                                    
03-15-05 18:31  pgrayson       File Added: buildroot-target-skel.patch          
         
03-16-05 12:10  andersen       Status                   new => assigned     
03-16-05 12:10  andersen       Assigned To               => uClibc          
02-10-06 10:46  prpplague      Status                   assigned => closed  
02-10-06 10:46  prpplague      Resolution               open => won't fix   
02-10-06 10:46  prpplague      Additional Information Updated                   

02-12-07 05:48  vapier         Status                   closed => assigned  
02-12-07 05:48  vapier         Assigned To              uClibc => buildroot 
======================================================================
