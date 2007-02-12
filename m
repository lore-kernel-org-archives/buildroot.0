From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:46:12 -0800
Subject: [Buildroot] [buildroot 0000570]: udhcp-0.9.8 fails to build with
	gcc 3.4.4 compiler due to some odd pedanticism
Message-ID: <780c8fc5f3c0a54589b03556fc154e10@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=570 
====================================================================== 
Reported By:                lord_apollyon
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   570
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-30-2005 04:18 PST
Last Modified:              02-12-2007 05:46 PST
====================================================================== 
Summary:                    udhcp-0.9.8 fails to build with gcc 3.4.4 compiler
due to some odd pedanticism
Description: 
When gcc 3.4.4 is configured for the toolchain, it subsequently fails to
compile udhcp-0.9.8/dhcpc.c complaining about an improper switch statement
syntax error:

dhcpc.c: In function `perform_renew':
dhcpc.c:136: error: label at end of compound statement
make[1]: *** [dhcpc.o] Error 1
make[1]: Leaving directory `/rootnew/buildroot/build_i686/udhcp-0.9.8'
make: *** [/rootnew/buildroot/build_i686/udhcp-0.9.8/udhcpc] Error 2

====================================================================== 

---------------------------------------------------------------------- 
 andersen - 04-06-06 11:18  
---------------------------------------------------------------------- 
thanks, applied 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-30-05 04:18  lord_apollyon  New Issue                                    
11-30-05 04:18  lord_apollyon  Status                   new => assigned     
11-30-05 04:18  lord_apollyon  Assigned To               => uClibc          
11-30-05 04:18  lord_apollyon  File Added: udhcp.patch                      
04-06-06 11:18  andersen       Note Added: 0001234                          
04-06-06 11:18  andersen       Status                   assigned => closed  
04-06-06 11:18  andersen       Resolution               open => fixed       
02-12-07 05:46  vapier         Status                   closed => assigned  
02-12-07 05:46  vapier         Assigned To              uClibc => buildroot 
======================================================================
