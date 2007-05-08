From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 8 May 2007 08:02:21 -0700
Subject: [Buildroot] [buildroot 0001341]: e2fsprogs installs duplicate
	binaries instead of symlinking
Message-ID: <6e0a1a4021aef302e1c126a9e08e433d@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
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
Status:                     assigned
====================================================================== 
Date Submitted:             05-08-2007 08:02 PDT
Last Modified:              05-08-2007 08:02 PDT
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

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-08-07 08:02  repvik         New Issue                                    
05-08-07 08:02  repvik         Status                   new => assigned     
05-08-07 08:02  repvik         Assigned To               => buildroot       
05-08-07 08:02  repvik         File Added: e2fsprogs_symlinks.diff              
     
======================================================================
