From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 30 Oct 2007 23:54:46 -0700
Subject: [Buildroot] [buildroot 0001565]: e2fsprogs generates absolute
	symlinks in the root, confusing ldconfig
Message-ID: <54b7bbfb553cb4feabfc29adaae4f812@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1565 
====================================================================== 
Reported By:                hmoffatt
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1565
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-30-2007 23:54 PDT
Last Modified:              10-30-2007 23:54 PDT
====================================================================== 
Summary:                    e2fsprogs generates absolute symlinks in the root,
confusing ldconfig
Description: 
e2fsprogs generates symlinks within the build tree to absolute paths eg
/lib/libext2.so.*. This works ok on the target system, but confuses
ldconfig when run on the host before generating the image - it ends up
reading the host libraries and gets confused, especially if the endianness
of the host is different to the target.

Attached patch causes e2fsprogs to make relative links instead.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-30-07 23:54  hmoffatt       New Issue                                    
10-30-07 23:54  hmoffatt       Status                   new => assigned     
10-30-07 23:54  hmoffatt       Assigned To               => buildroot       
10-30-07 23:54  hmoffatt       File Added: br-e2fs.diff                     
======================================================================
