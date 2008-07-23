From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 22 Jul 2008 18:32:52 -0700
Subject: [Buildroot] [buildroot 0004234]: Mesa doesn't build on x86_64 for
	mipsel target
Message-ID: <13a3a302234a789303e48523a37b86b0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=4234 
====================================================================== 
Reported By:                KHAksnes
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4234
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-22-2008 15:31 PDT
Last Modified:              07-22-2008 18:32 PDT
====================================================================== 
Summary:                    Mesa doesn't build on x86_64 for mipsel target
Description: 
  Target Architecture: mipsel
  Target Architecture Variant: mips 32
  Target ABI: o32          
  Target arcitecture is nofpu.
  Compilation is done on a machine running fedora 9 on x86_64
architecture.
  gcc  version is 4.2.4 as 4.3.1 fails for mipsel target.
====================================================================== 

---------------------------------------------------------------------- 
 pepe - 07-22-08 18:32  
---------------------------------------------------------------------- 
The attached log ends with 

"Please run 'make realclean' before changing configs"

which is probably not the actual error.

On i686, make goes into an endless loop while failing to compile due to
missing include files. Log attached. 

It misses a stddef.h which is installed as <linux/stddef.h> but included
as <stddef.h>. After copying stddef.h in to staging/usr/include/, it does
not find "GL/...". I'm unable to find where to set these paths in the .mk
file.. :-( 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-22-08 15:31  KHAksnes       New Issue                                    
07-22-08 15:31  KHAksnes       Status                   new => assigned     
07-22-08 15:31  KHAksnes       Assigned To               => buildroot       
07-22-08 15:31  KHAksnes       File Added: buildlog                         
07-22-08 18:32  pepe           Note Added: 0009904                          
======================================================================
