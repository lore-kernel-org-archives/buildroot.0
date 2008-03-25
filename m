From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 25 Mar 2008 09:23:36 -0700
Subject: [Buildroot] [buildroot 0002604]: Unable to compile Buildroot
Message-ID: <95cac1b60969f9ebb6bbe097b4942584@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2604 
====================================================================== 
Reported By:                Graol
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2604
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-14-2008 09:13 PDT
Last Modified:              03-25-2008 09:23 PDT
====================================================================== 
Summary:                    Unable to compile Buildroot
Description: 
Hi,

I'm running a virtual machine with Debian 32 bits installed (on a Xeon
core 2 server). I tried to install buildroot in x86_64 arch but I always
get the same error at last:

Unknown CPU given in --with-tune=core2.
make[1]: *** [configure-gcc] Error 1
make[1]: Leaving directory
`/usr/src/buildroot/toolchain_build_x86_64/gcc-4.2.1-initial'
make: ***
[/usr/src/buildroot/toolchain_build_x86_64/gcc-4.2.1-initial/.compiled]
Error 2

====================================================================== 

---------------------------------------------------------------------- 
 Graol - 03-25-08 08:28  
---------------------------------------------------------------------- 
CPU is Intel Core2 2.13 GHz (according to cpuinfo)

Toolchain Config: 
- Toolchain type: Buildroot toolchain
- target arch x86_64
- variant arch core2
- kernel headers 2.6.24.x
- uClib = daily snapshot
- busybox 1.9.x
- gcc 4.2.1
- binutils 2.18
- multilib disabled

 

---------------------------------------------------------------------- 
 Graol - 03-25-08 07:42  
---------------------------------------------------------------------- 
I reinstalled the official 64 bits Debian distrib, then updated the kernel
to 2.6.24.3 version. I changed sources list to testing repository to get
gcc 4.3: nothing new, I still have the same error message (Unknown CPU).

 

---------------------------------------------------------------------- 
 Graol - 03-25-08 09:23  
---------------------------------------------------------------------- 
I solved the problem by specifying a Nocona CPU instead of a Core2 one.
Seems like  the Core2 does not support EM64T technology, unlike the Xeaon
Nocona. See http://softwarecommunity.intel.com/articles/eng/1699.htm 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-14-08 09:13  Graol          New Issue                                    
03-14-08 09:13  Graol          Status                   new => assigned     
03-14-08 09:13  Graol          Assigned To               => buildroot       
03-14-08 09:13  Graol          Issue Monitored: Graol                       
03-14-08 09:21  Graol          Note Added: 0005774                          
03-25-08 07:41  Graol          Note Added: 0005894                          
03-25-08 07:42  Graol          Note Edited: 0005894                         
03-25-08 07:44  Graol          Note Edited: 0005774                         
03-25-08 07:45  Graol          Note Edited: 0005774                         
03-25-08 07:52  Graol          Issue End Monitor: Graol                     
03-25-08 07:52  Graol          Issue Monitored: Graol                       
03-25-08 07:56  Graol          Note Edited: 0005774                         
03-25-08 08:28  Graol          Note Edited: 0005774                         
03-25-08 09:23  Graol          Note Added: 0005904                          
======================================================================
