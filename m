From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:44:11 -0800
Subject: [Buildroot] [buildroot 0001019]: source code of specific version of
	XFS-tools not available anymore
Message-ID: <b3a328638c9452363ef6eb53d3ea5db7@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1019 
====================================================================== 
Reported By:                mindbender
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1019
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-05-2006 08:57 PDT
Last Modified:              02-12-2007 05:44 PST
====================================================================== 
Summary:                    source code of specific version of XFS-tools not
available anymore
Description: 
everything compiles nicely except one thing. if i add XFS-tools via the
buildroot-config-menu, make stops when it tries to download the source for
the XFS-tools. it tries to download
ftp://oss.sgi.com/projects/xfs/cmd_tars/xfsprogs_2.7.11-1.src.tar.gz but
exits because this file isn`t available anymore. if you look at
ftp://oss.sgi.com/projects/xfs/cmd_tars/ you will see that there are some
files with newer version number, but without the extension
src.tar.gz....only tar.gz. i hope this files can be used also as we would
like to use XFS. i tried to change the name of the file in the
corresponding .mk-file but then it fails also.

i hope i provided enough information.
====================================================================== 

---------------------------------------------------------------------- 
 mindbender - 10-26-06 16:04  
---------------------------------------------------------------------- 
i found the solution for my problem.

the source of the specific version can be downloaded from 
ftp://oss.sgi.com/projects/xfs/previous/cmd_tars/xfsprogs-2.7.11.src.tar.gz 

---------------------------------------------------------------------- 
 bernhardf - 11-22-06 14:18  
---------------------------------------------------------------------- 
I've applied the path to the old sources of xfsprogs-2.7.11 but someone who
uses xfs should download, build/patch and verify a current version.

Thanks for pointing this out. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-05-06 08:57  mindbender     New Issue                                    
09-05-06 08:57  mindbender     Status                   new => assigned     
09-05-06 08:57  mindbender     Assigned To               => uClibc          
10-26-06 16:04  mindbender     Note Added: 0001724                          
11-22-06 14:18  bernhardf      Status                   assigned => closed  
11-22-06 14:18  bernhardf      Note Added: 0001780                          
11-22-06 14:18  bernhardf      Resolution               open => fixed       
02-12-07 05:44  vapier         Status                   closed => assigned  
02-12-07 05:44  vapier         Assigned To              uClibc => buildroot 
======================================================================
