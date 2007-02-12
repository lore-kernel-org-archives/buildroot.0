From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:55 -0800
Subject: [Buildroot] [buildroot 0000187]: buildroot hotplug requires linux
	to compile
Message-ID: <316b20fa2b661c8948666281eae0df1d@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=187 
====================================================================== 
Reported By:                gnat
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   187
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-23-2005 15:30 PST
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    buildroot hotplug requires linux to compile
Description: 
When compiling using buildroot, you can select hotplug, which will fail to
compile if there is no linux target defined as it needs modules directory.
====================================================================== 

---------------------------------------------------------------------- 
 db - 06-07-05 08:18  
---------------------------------------------------------------------- 
No no no.  There are multiple tasks that hotplug addresses, and only
one of them involves modules.

Two others that don't involve modules are (a) running device setup
scripts, e.g. telling a daemon about the device, and (b) doing the
stuff "udev" does, making device nodes.

Plus, buildroot should not depend on having a kernel built; it's
just there to build the root file system.  At this point only
pcmcia-cs even thinks it needs a kernel (bridge module patch is
in the patch database) and even that's just because of stupid
build rules in the pcmcia tools package ... soon to be replaced
by normal hotplugging.

Do NOT merge this patch! 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-23-05 15:30  gnat           New Issue                                    
03-23-05 15:30  gnat           File Added: hotplug.patch                    
06-07-05 08:18  db             Note Added: 0000234                          
06-09-05 02:48  andersen       Status                   assigned => closed  
06-09-05 02:48  andersen       Resolution               open => won't fix   
07-30-05 19:41  viscous_liquid Issue Monitored: viscous_liquid                  
 
07-30-05 19:42  viscous_liquid Issue End Monitor: viscous_liquid                
   
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
