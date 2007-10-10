From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 9 Oct 2007 23:48:54 -0700
Subject: [Buildroot] [buildroot 0001463]: build for i386/Geode fails
Message-ID: <ad8ef583cb761a00e733fe3434ad4b85@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1463 
====================================================================== 
Reported By:                Bob Keyes
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1463
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-13-2007 11:04 PDT
Last Modified:              10-09-2007 23:48 PDT
====================================================================== 
Summary:                    build for i386/Geode fails
Description: 
Buildroot tries to build Linx kernel, but the architecture isn't set, so it
can't find the Makefile.
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 09-07-07 12:02  
---------------------------------------------------------------------- 
Please attach your br2.config and kernel.config for me to reproduce. 

---------------------------------------------------------------------- 
 bradmssw - 09-07-07 12:11  
---------------------------------------------------------------------- 
This has been discussed in the past and is not limited to geode by any
means:

http://www.nabble.com/Problems-with-some-x86-Target-Architecture-Variants-p12385010.html
http://www.nabble.com/GCC---march%3Dgeode-doesn't-exist--t4108131.html 

---------------------------------------------------------------------- 
 alejandro_liu - 10-09-07 23:48  
---------------------------------------------------------------------- 
I am also experiencing the same problem.  I am using snapshot: 2007-10-09
(latest at the time of this writing)

I have tested using Target Arch i386, if I change the arch variants to:
pentium pro, pentium MMX, pentium mobile, pentium2, pentium3, etc... they
all seem to fail to set the ARCH macro correctly.

Arch variants i386, i486, i586, i686 seem to work OK.

This is unrelated to the note that bradmssw mentions as this is even
before buildroot tries to compile anything at all. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-13-07 11:04  Bob Keyes      New Issue                                    
08-13-07 11:04  Bob Keyes      Status                   new => assigned     
08-13-07 11:04  Bob Keyes      Assigned To               => buildroot       
09-07-07 12:02  bernhardf      Note Added: 0002733                          
09-07-07 12:11  bradmssw       Note Added: 0002734                          
10-09-07 23:48  alejandro_liu  Note Added: 0002815                          
======================================================================
