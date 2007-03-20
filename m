From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 20 Mar 2007 10:24:58 -0700
Subject: [Buildroot] [buildroot 0000369]: hardlinks break when creating
	root_fs_i386.ext2
Message-ID: <bf3da9b0e264e4f95d2eaa9acf1a935d@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
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
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             08-08-2005 10:26 PDT
Last Modified:              03-20-2007 10:24 PDT
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

---------------------------------------------------------------------- 
 bernhardf - 03-20-07 10:24  
---------------------------------------------------------------------- 
This should be fixed in the meantime. We switched to genext2fs-1.4
recently.
Please re-open this bug if you still encounter problems.

thanks 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-08-05 10:26  jakelly        New Issue                                    
08-08-05 10:26  jakelly        Status                   new => assigned     
08-08-05 10:26  jakelly        Assigned To               => uClibc          
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
03-20-07 10:24  bernhardf      Status                   assigned => closed  
03-20-07 10:24  bernhardf      Note Added: 0002250                          
======================================================================
