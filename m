From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:43:50 -0800
Subject: [Buildroot] [buildroot 0001024]: Buildroot fails with error in
	readahead.c
Message-ID: <0ed9a0315320df60c98ed11b1ce33777@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1024 
====================================================================== 
Reported By:                mboutte
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1024
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-07-2006 18:07 PDT
Last Modified:              02-12-2007 05:43 PST
====================================================================== 
Summary:                    Buildroot fails with error in readahead.c
Description: 
Hello,
I svn'd a new copy of buildroot and attempted to run with a powerpc
target. The build loaded was 16066. On setting the target and running make
the build failed with errors in readahead.c as if the headers did not
exist. Multiple attempts using different kernel headers, binutils and gcc
versions all resulted in the same error. A fresh download with new setting
still had the same result. The last items reported are show below.

Any help would be appreciated. Is it my setup? I did the same thing a few
days ago with build version 16060 on another computer and it worked.

Thanks,
Mike

  CC libc/sysdeps/linux/common/readahead.os
libc/sysdeps/linux/common/readahead.c:45: error: syntax error before
'off64_t'
libc/sysdeps/linux/common/readahead.c: In function 'readahead':
libc/sysdeps/linux/common/readahead.c:46: error: number of arguments
doesn't match prototype
./include/bits/fcntl.h:205: error: prototype declaration
libc/sysdeps/linux/common/readahead.c:47: error: 'fd' undeclared (first
use in this function)
libc/sysdeps/linux/common/readahead.c:47: error: (Each undeclared
identifier is reported only once
libc/sysdeps/linux/common/readahead.c:47: error: for each function it
appears in.)
libc/sysdeps/linux/common/readahead.c:47: error: 'offset' undeclared
(first use in this function)
libc/sysdeps/linux/common/readahead.c:47: error: 'count' undeclared (first
use in this function)
make[2]: *** [libc/sysdeps/linux/common/readahead.os] Error 1
make[1]: *** [lib/libc.so.0] Error 2

====================================================================== 

---------------------------------------------------------------------- 
 mboutte - 09-07-06 18:37  
---------------------------------------------------------------------- 
Sorry, bad typing - the GCC compiler put into config file is 4.1.1 (not
4.4.4) and I also tried the default which is 3.4.2 plus a few others. 

---------------------------------------------------------------------- 
 bernhardf - 09-30-06 14:12  
---------------------------------------------------------------------- 
Can you check if it works again for current trunk of uClibc, please?

thanks, 

---------------------------------------------------------------------- 
 bernhardf - 11-22-06 14:31  
---------------------------------------------------------------------- 
ping.
Please re-check with uClibc trunk and report back. 

---------------------------------------------------------------------- 
 bernhardf - 11-29-06 11:10  
---------------------------------------------------------------------- 
This was fixed in uClibc-svn a while ago.
Unless you have LFS support off in uClibc, all is working fine WRT
readahead now.
Closing.
Thanks for reporting this issue. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-07-06 18:07  mboutte        New Issue                                    
09-07-06 18:07  mboutte        Status                   new => assigned     
09-07-06 18:07  mboutte        Assigned To               => uClibc          
09-07-06 18:37  mboutte        Note Added: 0001628                          
09-30-06 14:12  bernhardf      Note Added: 0001674                          
11-22-06 14:31  bernhardf      Note Added: 0001782                          
11-22-06 14:31  bernhardf      Status                   assigned => feedback
11-29-06 11:10  bernhardf      Status                   feedback => closed  
11-29-06 11:10  bernhardf      Note Added: 0001839                          
11-29-06 11:10  bernhardf      Resolution               open => no change
required
02-12-07 05:43  vapier         Status                   closed => assigned  
02-12-07 05:43  vapier         Assigned To              uClibc => buildroot 
======================================================================
