From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:49:13 -0800
Subject: [Buildroot] [buildroot 0000483]: fakeroot can't compile with
	gcc-3.4 over
Message-ID: <d5ed1113fc02a24417c97935812410b7@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=483 
====================================================================== 
Reported By:                mata
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   483
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-12-2005 06:31 PDT
Last Modified:              02-12-2007 05:49 PST
====================================================================== 
Summary:                    fakeroot can't compile with gcc-3.4 over
Description: 
After gcc-3.4 can't use forword references.
But fakeroot source uses forward reference.
I have tried fakeroot-1.2.13, fakeroot-1.5.1, fakerot-1.5.4,
with gcc-3.4.4, gcc-4.0.2
But each versions are stopped with same error. 

Therefore, gcc-3.4/4.0 environment can't compile host-fakeroot,
and can't build target images(ext2, tar, ... so on).

Hear is the top of the error messages:
gcc -DHAVE_CONFIG_H -I. -I. -I. -g -O2 -MT libfakeroot.lo -MD -MP -MF
.deps/lifakeroot.Tpo -c libfakeroot.c  -fPIC -DPIC -o .libs/libfakeroot.o
In file included from libfakeroot.c:96:
wrapped.h:9: error: syntax error before 'LSTAT_ARG'
... 

====================================================================== 

---------------------------------------------------------------------- 
 mata - 01-09-06 01:05  
---------------------------------------------------------------------- 
This problem was resolved with newer fakeroot-1.2.13. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-12-05 06:31  mata           New Issue                                    
10-12-05 06:31  mata           Status                   new => assigned     
10-12-05 06:31  mata           Assigned To               => uClibc          
01-09-06 01:05  mata           Note Added: 0000885                          
01-23-06 10:55  prpplague      Status                   assigned => closed  
01-23-06 10:55  prpplague      Resolution               open => no change
required
01-23-06 10:55  prpplague      Additional Information Updated                   

02-12-07 05:49  vapier         Status                   closed => assigned  
02-12-07 05:49  vapier         Assigned To              uClibc => buildroot 
======================================================================
