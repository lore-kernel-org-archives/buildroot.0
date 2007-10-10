From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 10 Oct 2007 00:07:21 -0700
Subject: [Buildroot] [buildroot 0001463]: build for i386/Geode fails
Message-ID: <f1ef1b8306e3a1bf912180327ae820fe@busybox.net>
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
Last Modified:              10-10-2007 00:07 PDT
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
 alejandro_liu - 10-10-07 00:07  
---------------------------------------------------------------------- 
Hi,

I was having the same problems with snapshot 2007-10-09 (latest at the
time of this writing).

I can confirm that the patch
(http://www.nabble.com/Problems-with-some-x86-Target-Architecture-Variants-p12385010.html)
mentioned by bradmssw did solve my problem.

The issue can be recreated consistently by selecting the i386 architecture
and then selecting one of the un-supported architecture variants.  (i.e.
geode or pentium2) 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-13-07 11:04  Bob Keyes      New Issue                                    
08-13-07 11:04  Bob Keyes      Status                   new => assigned     
08-13-07 11:04  Bob Keyes      Assigned To               => buildroot       
09-07-07 12:02  bernhardf      Note Added: 0002733                          
09-07-07 12:11  bradmssw       Note Added: 0002734                          
10-09-07 23:48  alejandro_liu  Note Added: 0002815                          
10-10-07 00:03  alejandro_liu  Note Deleted: 0002815                        
10-10-07 00:07  alejandro_liu  Note Added: 0002816                          
======================================================================
