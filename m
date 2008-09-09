From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 8 Sep 2008 18:11:49 -0700
Subject: [Buildroot] [buildroot 0004844]: Bridge-utils broken under kernel
	2.4
Message-ID: <047397ea9896b05f239f9ce8fc0ef428@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=4844 
====================================================================== 
Reported By:                Feynman
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4844
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-08-2008 11:05 PDT
Last Modified:              09-08-2008 18:11 PDT
====================================================================== 
Summary:                    Bridge-utils broken under kernel 2.4
Description: 
Snapshot buildroot-20080905

The bridge-utils package compiles but the brctl command fails.
The error message is:
# brctl addbr br0
add bridge failed: Invalid argument

I think this is a problem with the bridge-utils 1.4. The former version
1.06 works fine.

My configuration is: 386, kernel 2.4, busybox 1.11.x
The project is openMGB, a RDC based NAS with WAP.


====================================================================== 

---------------------------------------------------------------------- 
 jacmet - 09-08-08 11:26  
---------------------------------------------------------------------- 
I don't have access to any system with a 2.4 kernel anymore - Does it work
if you change the version in bridge.mk back to v1.06? If so, please report
the problem with bridge-utils upstream. 

---------------------------------------------------------------------- 
 hmoffatt - 09-08-08 18:11  
---------------------------------------------------------------------- 
1.4 seems to use /sys/class/net which wouldn't exist on linux 2.4 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-08-08 11:05  Feynman        New Issue                                    
09-08-08 11:05  Feynman        Status                   new => assigned     
09-08-08 11:05  Feynman        Assigned To               => buildroot       
09-08-08 11:26  jacmet         Note Added: 0011194                          
09-08-08 18:11  hmoffatt       Note Added: 0011214                          
======================================================================
