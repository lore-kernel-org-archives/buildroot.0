From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 16 Feb 2007 18:40:24 -0800
Subject: [Buildroot] [buildroot 0001094]: ntpd version bump
Message-ID: <397750e1e41687d3637fe1a251bb0b4a@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1094 
====================================================================== 
Reported By:                daisuke
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1094
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-18-2006 03:06 PST
Last Modified:              02-16-2007 18:40 PST
====================================================================== 
Summary:                    ntpd version bump
Description: 
This patch does these things:
(1) bump version from 4.2.0 to 4.2.2p4
(2) remove tickadj utility. It causes make to fail for current uClibc

This patch was created against buildroot-20061118 snapshot.
====================================================================== 

---------------------------------------------------------------------- 
 daisuke - 11-24-06 06:18  
---------------------------------------------------------------------- 
Sorry, I uploaded wrong patch. Here is right patch.
Please use `ntp-new.patch'.

 

---------------------------------------------------------------------- 
 foogod - 02-15-07 14:06  
---------------------------------------------------------------------- 
I just noticed that this is basically a duplicate of the patch I just
submitted in bug 1222 (mine bumps the version to 4.2.4 (which is now
current))

Please note that _some_ version bump is required to get ntpd to compile at
all, as far as I can tell.  4.2.0 just does not work. 

---------------------------------------------------------------------- 
 daisuke - 02-16-07 18:40  
---------------------------------------------------------------------- 
I just tried bumps the version to 4.2.4 like as bug 1222,
buildroot-20070216 and uClibc-20070216, but I got error "sys/var.h: No
such file or directory" at tickadj . I removed tickadj utility, it
worked.

Updated patch is `ntp-new2.patch', which bump version to 4.2.4, remove
ntp-cross-compile.patch and remove tickadj utility. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-18-06 03:06  daisuke        New Issue                                    
11-18-06 03:06  daisuke        Status                   new => assigned     
11-18-06 03:06  daisuke        Assigned To               => uClibc          
11-18-06 03:06  daisuke        File Added: ntp.patch                        
11-24-06 06:08  daisuke        Note Added: 0001802                          
11-24-06 06:09  daisuke        Issue Monitored: daisuke                     
11-24-06 06:09  daisuke        Issue End Monitor: daisuke                    
11-24-06 06:13  daisuke        File Added: ntp-new.patch                    
11-24-06 06:18  daisuke        Note Edited: 0001802                         
02-12-07 05:34  vapier         Assigned To              uClibc => buildroot 
02-15-07 14:06  foogod         Note Added: 0002170                          
02-16-07 18:40  daisuke        File Added: ntp-new2.patch                    
02-16-07 18:40  daisuke        Note Added: 0002176                          
======================================================================
