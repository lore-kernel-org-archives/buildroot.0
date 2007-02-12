From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:03 -0800
Subject: [Buildroot] [buildroot 0000091]: toolchain c++ compiler was not
	built
Message-ID: <5e8e4162c2ffd090ca57d8ac72549d7e@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=91 
====================================================================== 
Reported By:                Michael
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   91
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-09-2005 02:30 PST
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    toolchain c++ compiler was not built
Description: 
- Configure buildroot wihthout the c++ compiler
- Build the system by calling make in the top level dir
- Call make menuconfig and select 'Build/install c++ compiler and
libstdc++'
- Call make again and the c++ compiler will not be build

====================================================================== 

---------------------------------------------------------------------- 
 scott - 02-22-05 10:54  
---------------------------------------------------------------------- 
I've had this same problem.  It's because that flag (to build C++) only
changes an option passed to configure for gcc.  The solution is to force
configure to run again either my removing the '.configured' file or by
doing a full clean on gcc.
remove the .configured file, which will cause gcc mk to run configure:

   rm $(TOOL_BUILD_DIR)/gcc-$(GCC_VERSION)-final

which for me, looks like:

   rm toolchain_build_powerpc/gcc-3.4.3-final/.configured


Or, you can remove the whole gcc area, causing it to build again.

   make gcc-clean; make gcc

The ideal solution would sense a change in the flag setting, and remove
the .configured file automatically.

hope this helps. 

---------------------------------------------------------------------- 
 vapier - 10-17-05 15:11  
---------------------------------------------------------------------- 
dupe of http://busybox.net/bugs/view.php?id=51 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-09-05 02:30  Michael        New Issue                                    
02-22-05 10:54  scott          Note Added: 0000053                          
03-16-05 12:13  andersen       Status                   new => assigned     
03-16-05 12:13  andersen       Assigned To               => uClibc          
10-17-05 15:11  vapier         Note Added: 0000630                          
10-17-05 15:11  vapier         Status                   assigned => closed  
10-17-05 15:11  vapier         Resolution               open => duplicate   
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
