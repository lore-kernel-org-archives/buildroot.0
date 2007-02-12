From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:44:07 -0800
Subject: [Buildroot] [buildroot 0001044]: ext2root.mk uses LANG to specify C
	locale for 'du' instead of LC_ALL
Message-ID: <2cd906861c3593f4312df915265082f8@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1044 
====================================================================== 
Reported By:                ambrox8
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1044
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-23-2006 15:23 PDT
Last Modified:              02-12-2007 05:44 PST
====================================================================== 
Summary:                    ext2root.mk uses LANG to specify C locale for 'du'
instead of LC_ALL
Description: 
ext2root.mk uses LANG enviroment variable to specify C locale for 'du', but
it should also specify LC_ALL, as only specifying LANG still causes 'du' to
use localised messages instead of english. As a result, not enough space is
used and creating the image fails.
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 11-22-06 15:36  
---------------------------------------------------------------------- 
I think that the correct setting is LC_ALL=POSIX
Applied. Please report back.

Thanks for pointing this out. 

---------------------------------------------------------------------- 
 vapier - 11-27-06 07:27  
---------------------------------------------------------------------- 
LC_ALL=C is the accepted convention used everywhere, not LC_ALL=POSIX

if you set LC_ALL, there's no point in setting LANG 

---------------------------------------------------------------------- 
 bernhardf - 11-28-06 00:50  
---------------------------------------------------------------------- 
So be it. Fixed in svn.

Mike, thanks. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-23-06 15:23  ambrox8        New Issue                                    
09-23-06 15:23  ambrox8        Status                   new => assigned     
09-23-06 15:23  ambrox8        Assigned To               => uClibc          
11-22-06 15:36  bernhardf      Note Added: 0001786                          
11-27-06 07:27  vapier         Note Added: 0001810                          
11-28-06 00:50  bernhardf      Status                   assigned => closed  
11-28-06 00:50  bernhardf      Note Added: 0001819                          
11-28-06 00:50  bernhardf      Resolution               open => fixed       
02-12-07 05:44  vapier         Status                   closed => assigned  
02-12-07 05:44  vapier         Assigned To              uClibc => buildroot 
======================================================================
