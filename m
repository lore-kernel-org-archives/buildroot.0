From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 15 May 2007 05:50:28 -0700
Subject: [Buildroot] [buildroot 0001341]: e2fsprogs installs duplicate
	binaries instead of symlinking
Message-ID: <fa9e7d2f482646c5accc15cb4f13f191@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1341 
====================================================================== 
Reported By:                repvik
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1341
Category:                   Other
Reproducibility:            always
Severity:                   trivial
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             05-08-2007 08:02 PDT
Last Modified:              05-15-2007 05:50 PDT
====================================================================== 
Summary:                    e2fsprogs installs duplicate binaries instead of
symlinking
Description: 
e2fsprogs install several duplicate binaries that act slightly differently
depending on what name they're called as. They can safely be removed and
replaced with symlinks. This saves 480kb space.

fsck.ext2 == fsck.ext3 == e2fsck
e2label == tune2fs == findfs
mkfs.ext2 == mkfs.ext3 == mke2fs

I've attached a patch which fixes this.
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 05-15-07 05:50  
---------------------------------------------------------------------- 
applied as r18629. Thanks! 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-08-07 08:02  repvik         New Issue                                    
05-08-07 08:02  repvik         Status                   new => assigned     
05-08-07 08:02  repvik         Assigned To               => buildroot       
05-08-07 08:02  repvik         File Added: e2fsprogs_symlinks.diff              
     
05-15-07 05:50  bernhardf      Status                   assigned => closed  
05-15-07 05:50  bernhardf      Note Added: 0002359                          
======================================================================
