From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:36 -0800
Subject: [Buildroot] [buildroot 0000369]: hardlinks break when creating
	root_fs_i386.ext2
Message-ID: <fb1e5e1ddd9e2caba230216d2672d5c9@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=369 
====================================================================== 
Reported By:                jakelly
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   369
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-08-2005 10:26 PDT
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    hardlinks break when creating root_fs_i386.ext2
Description: 
hardlinks break when creating root_fs_i386.ext2

I noticed this when trying to fit a small buildroot onto a floppy.  I had
e2fsck, fsck.ext2, fsck.ext3 all hardlinked in build_i386/root/sbin, but
they became separate inodes in root_fs_i386.ext2.  The genext2fs man page
says it does not support hard links, and that "hard links present in the
input tree will be represented as separate files in the ext2 image."

Well that's not much good when you need to squeeze root into a very small
space.  So now I create my own filesystem image, without using genext2fs. 
It's not too hard to replace genext2fs with a script, and maintain the
hardlinks.

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-08-05 10:26  jakelly        New Issue                                    
08-08-05 10:26  jakelly        Status                   new => assigned     
08-08-05 10:26  jakelly        Assigned To               => uClibc          
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
