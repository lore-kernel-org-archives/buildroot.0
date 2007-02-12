From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:42:33 -0800
Subject: [Buildroot] [buildroot 0000937]: Trouble adding buildfile for
	Matchbox
Message-ID: <78ecee0efd1abd6bd44a2950fd38f57d@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=937 
====================================================================== 
Reported By:                kfries6
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   937
Category:                   New Features
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-07-2006 15:24 PDT
Last Modified:              02-12-2007 05:42 PST
====================================================================== 
Summary:                    Trouble adding buildfile for Matchbox
Description: 
I am trying to add a configuration for matchbox.  I was only able to find
old configurations from back when Matchbox was a monolithic application. 
Since this is my first additional application, I thought I would start
with just making libmb build and install, then add the other packages one
at a time.  I followed the instructions at:
http://buildroot.uclibc.org/buildroot.html

I created a directory: package/libmb/

I then created the Config.in and libmb.mk (attached).
I then tried to do a make menuconfig from the base directory.  libmb did
not appear in the menu.  After poking around a little, I found the piece
missing out of the documentation: packages/Config.in needs updating [this
needs fixed in the docs]

After fixing the config file, I tried make menuconfig again, success!  It
now appeared in the menu.  I selected it for build, then debugged my
makefile to eliminate any typos.  The system now compiles, but does not
include libmb in the build... No errors, it just ignores it.  Is there
something wrong with my Config.in or libmb.mk files?
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 02-04-07 09:18  
---------------------------------------------------------------------- 
Please ask on the mailing-list if somebody can help you with adding new
packages.

Thanks 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-07-06 15:24  kfries6        New Issue                                    
07-07-06 15:24  kfries6        Status                   new => assigned     
07-07-06 15:24  kfries6        Assigned To               => uClibc          
07-07-06 15:24  kfries6        File Added: libmb.tgz                        
07-07-06 15:26  kfries6        Issue Monitored: kfries6                     
01-27-07 15:03  bernhardf      Severity                 major => minor      
01-27-07 15:03  bernhardf      Category                 Architecture Specific =>
New Features
02-04-07 09:18  bernhardf      Status                   assigned => closed  
02-04-07 09:18  bernhardf      Note Added: 0002111                          
02-04-07 09:18  bernhardf      Resolution               open => fixed       
02-12-07 05:42  vapier         Status                   closed => assigned  
02-12-07 05:42  vapier         Assigned To              uClibc => buildroot 
======================================================================
