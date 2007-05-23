From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 23 May 2007 08:42:17 -0700
Subject: [Buildroot] [buildroot 0001365]: ncftp: strip binarys
Message-ID: <d2be248a3e705475758da427992d9654@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1365 
====================================================================== 
Reported By:                razzor
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1365
Category:                   Other
Reproducibility:            always
Severity:                   trivial
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             05-23-2007 08:18 PDT
Last Modified:              05-23-2007 08:42 PDT
====================================================================== 
Summary:                    ncftp: strip binarys
Description: 
Strip binarys with correct strip (from http://busybox.net/bugs/view.php?id=1355)
====================================================================== 

---------------------------------------------------------------------- 
 jacmet - 05-23-07 08:27  
---------------------------------------------------------------------- 
Why is this needed? The ncftp makefile alreay strips the executables as
part of the build.

E.G.
file bin/ncftp
bin/ncftp: ELF 64-bit LSB executable, AMD x86-64, version 1 (SYSV), for
GNU/Linux 2.6.0, dynamically linked (uses shared libs), for GNU/Linux
2.6.0, stripped 

---------------------------------------------------------------------- 
 razzor - 05-23-07 08:39  
---------------------------------------------------------------------- 
Ah, okay. That explains why stripping saves only 2kb :)
Guess the patch can be dropped.

# ls -l build_i686/ncftp-3.2.0/bin/ncftp build_i686/root/usr/bin/ncftp
-rwxr-xr-x 1 root root 191160 2007-05-23 15:53
build_i686/ncftp-3.2.0/bin/ncftp
-rwxr-xr-x 1 root root 189276 2007-05-23 17:53
build_i686/root/usr/bin/ncftp

# file build_i686/ncftp-3.2.0/bin/ncftp
ncftp: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV),
dynamically linked (uses shared libs), stripped

# file build_i686/root/usr/bin/ncftp
ncftp: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV),
dynamically linked (uses shared libs), stripped 

---------------------------------------------------------------------- 
 jacmet - 05-23-07 08:42  
---------------------------------------------------------------------- 
Ahh, the makefile doesn't pick up the right strip - Sorry about that, fix
checked in as r18675 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-23-07 08:18  razzor         New Issue                                    
05-23-07 08:18  razzor         Status                   new => assigned     
05-23-07 08:18  razzor         Assigned To               => buildroot       
05-23-07 08:18  razzor         File Added: 0001-ncftp-strip-binarys.txt         
          
05-23-07 08:27  jacmet         Note Added: 0002396                          
05-23-07 08:39  razzor         Note Added: 0002397                          
05-23-07 08:42  jacmet         Status                   assigned => closed  
05-23-07 08:42  jacmet         Note Added: 0002398                          
======================================================================
