From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 25 Jun 2007 10:59:11 -0700
Subject: [Buildroot] [buildroot 0001323]: zlib problems
Message-ID: <cb2a20b22e1478e29a7fdb8511e93227@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1323 
====================================================================== 
Reported By:                asquared
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1323
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             04-23-2007 17:18 PDT
Last Modified:              06-25-2007 10:59 PDT
====================================================================== 
Summary:                    zlib problems
Description: 
Many packages are failing to compile because they are unable to find the
zlib headers. This appears to happen regardless of whether or not
installation of zlib headers is enabled in 'make menuconfig'. Zlib headers
have been installed on the development system, and this does not solve the
problem. This has been reproduced with both default and customized
configurations of buildroot.
====================================================================== 

---------------------------------------------------------------------- 
 asquared - 04-23-07 17:20  
---------------------------------------------------------------------- 
It appears that I have filed this bug under the architecture-specific
category, so I probably should add that this occurs when targeting x86. 

---------------------------------------------------------------------- 
 asquared - 04-24-07 05:33  
---------------------------------------------------------------------- 
Bug only appears to occur when zlib has been selected for installation.
'make defconfig; make' succeeds. 

---------------------------------------------------------------------- 
 rordway - 04-27-07 20:40  
---------------------------------------------------------------------- 
The problem looks to be a missing symlink in build_<arch>/staging_dir/usr.

When the build fails, cd to build_<arch>/staging_dir/usr and run:

ln -s ../include include

This fixed the problem for me. 

I have not tested it, but I expect that this patch against the top-level
Makefile will fix the problem.

 

---------------------------------------------------------------------- 
 bernhardf - 06-25-07 10:59  
---------------------------------------------------------------------- 
Fixed in current svn. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-23-07 17:18  asquared       New Issue                                    
04-23-07 17:18  asquared       Status                   new => assigned     
04-23-07 17:18  asquared       Assigned To               => buildroot       
04-23-07 17:20  asquared       Note Added: 0002328                          
04-24-07 05:33  asquared       Note Added: 0002329                          
04-27-07 20:39  rordway        Note Added: 0002333                          
04-27-07 20:39  rordway        File Added: buildroot-Makefile.diff              
     
04-27-07 20:40  rordway        Note Edited: 0002333                         
06-25-07 10:59  bernhardf      Status                   assigned => closed  
06-25-07 10:59  bernhardf      Note Added: 0002506                          
======================================================================
