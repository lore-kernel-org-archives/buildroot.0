From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:40 -0800
Subject: [Buildroot] [buildroot 0000357]: error when compiling under cygwin
Message-ID: <6146eea6833fb8cce85ba1d0400c9c6e@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=357 
====================================================================== 
Reported By:                Sourcerer
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   357
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-26-2005 02:01 PDT
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    error when compiling under cygwin
Description: 
I always receive following error message when trying to compile under
cygwin. 

I took following configuration

kernel header 2.4.29
gcc 3.3.5
gdb 6.3
binutils 2.15.94.0.0.2
with multilib and largefile
no soft float
no busybox
including c++ and java
building into ${BUILD_DIR}/staging_dir default)

for arm920t with MMU, little endian

I build the same configuration under SuSE Linux and it worked fine


====================================================================== 

---------------------------------------------------------------------- 
 vapier - 07-26-05 16:08  
---------------------------------------------------------------------- 
your cygwin build env is incomplete

the most notable issue is missing header files from your libc (link.h) 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-26-05 02:01  Sourcerer      New Issue                                    
07-26-05 02:01  Sourcerer      Status                   new => assigned     
07-26-05 02:01  Sourcerer      Assigned To               => uClibc          
07-26-05 16:08  vapier         Status                   assigned => resolved
07-26-05 16:08  vapier         Resolution               open => won't fix   
07-26-05 16:08  vapier         Note Added: 0000349                          
08-02-05 20:13  andersen       Status                   resolved => closed  
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
