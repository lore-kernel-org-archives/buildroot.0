From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:44:01 -0800
Subject: [Buildroot] [buildroot 0000961]: compiler version check broken on
	cygwin
Message-ID: <9a011f95cd155bdfb97210598c5d7b19@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=961 
====================================================================== 
Reported By:                alessio
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   961
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-19-2006 04:00 PDT
Last Modified:              02-12-2007 05:44 PST
====================================================================== 
Summary:                    compiler version check broken on cygwin
Description: 
cygwin gcc --version spits out something like the following

gcc (GCC) 3.4.4 (cygming special) (gdc 0.12, using dmd 0.125)
Copyright (C) 2004 etc etc

so the sed regexp at dependencies.sh(73) doesn't work

however, the build process continues without problems

======================================================================
Relationships       ID      Summary
----------------------------------------------------------------------
has duplicate       0001097 dependency checks - Debian gcc
====================================================================== 

---------------------------------------------------------------------- 
 wiml - 07-21-06 00:03  
---------------------------------------------------------------------- 
buildroot running on macosx has a similar problem (see
http://busybox.net/bugs/view.php?id=944). 

---------------------------------------------------------------------- 
 bernhardf - 11-28-06 02:08  
---------------------------------------------------------------------- 
Fixed in r16703 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-19-06 04:00  alessio        New Issue                                    
07-19-06 04:00  alessio        Status                   new => assigned     
07-19-06 04:00  alessio        Assigned To               => uClibc          
07-21-06 00:03  wiml           Note Added: 0001546                          
11-28-06 02:07  bernhardf      Relationship added       has duplicate 0001097
11-28-06 02:08  bernhardf      Status                   assigned => closed  
11-28-06 02:08  bernhardf      Note Added: 0001823                          
11-28-06 02:08  bernhardf      Resolution               open => fixed       
02-12-07 05:44  vapier         Status                   closed => assigned  
02-12-07 05:44  vapier         Assigned To              uClibc => buildroot 
======================================================================
