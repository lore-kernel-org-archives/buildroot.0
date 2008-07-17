From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 17 Jul 2008 03:40:17 -0700
Subject: [Buildroot] [buildroot 0001579]: libstdc++ build fails with uclibc
	headers
Message-ID: <53012683433d83360af402b2c6659b0d@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1579 
====================================================================== 
Reported By:                atle
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1579
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 no change required
Fixed in Version:           
====================================================================== 
Date Submitted:             11-08-2007 03:30 PST
Last Modified:              07-17-2008 03:40 PDT
====================================================================== 
Summary:                    libstdc++ build fails with uclibc headers
Description: 
Building gcc-3.4.6 with c++ support still fails as reported in the closed
issue http://bugs.uclibc.org/view.php?id=904.
The issue is reported in gcc PR14939,
http://gcc.gnu.org/bugzilla/show_bug.cgi?id=14939
and a patch (incorporated in 4.2) is found here:
http://gcc.gnu.org/bugzilla/attachment.cgi?id=6132

The patch is tested with gcc-3.4.6 and uClibc-0.9.29 for the nios2
architecture, and works well. Could you please include this patch in
toolchain/gcc/3.4.6 ?
This issue is a show-stopper for compiling libstdc++ on the nios2 as we're
stuck with gcc 3.4.x.

====================================================================== 

---------------------------------------------------------------------- 
 atle - 11-09-07 05:46  
---------------------------------------------------------------------- 
I'll be darned... It works without the mentioned patch now (for nios2).
Must have been a configuration issue. Well, I guess this issue can be
closed. 

---------------------------------------------------------------------- 
 vanokuten - 11-09-07 06:07  
---------------------------------------------------------------------- 
atle, I'm closing this issue - if you will be able to reproduce - just
reopen bug. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-08-07 03:30  atle           New Issue                                    
11-08-07 03:30  atle           Status                   new => assigned     
11-08-07 03:30  atle           Assigned To               => buildroot       
11-08-07 03:31  atle           Issue Monitored: atle                        
11-09-07 05:46  atle           Note Added: 0002904                          
11-09-07 06:07  vanokuten      Status                   assigned => closed  
11-09-07 06:07  vanokuten      Note Added: 0002905                          
11-09-07 06:07  vanokuten      Resolution               open => unable to
reproduce
11-27-07 13:51  UlfSamuelsson  Status                   closed => resolved  
11-27-07 13:51  UlfSamuelsson  Resolution               unable to reproduce =>
no change required
07-16-08 08:02  bernhardf      Status                   resolved => new     
07-17-08 03:40  bernhardf      Status                   new => closed       
======================================================================
