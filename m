From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:56 -0800
Subject: [Buildroot] [buildroot 0000178]: modutils/module-init-tools package
Message-ID: <e74be97996778e4b8b80a10c1d5667b3@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=178 
====================================================================== 
Reported By:                basile
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   178
Category:                   New Features
Reproducibility:            N/A
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-21-2005 00:39 PST
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    modutils/module-init-tools  package
Description: 
This patch provides modutils and module-init-tools. I know busybox can load
modules, but modinfo may also be very useful for kernel/driver debugging
purposes.

I have managed binaries concurrency between modutils and
module-init-tools, but I'm not sure this is the best way to do it... 

Thanks for your work.
====================================================================== 

---------------------------------------------------------------------- 
 david_bachelart - 03-22-05 13:27  
---------------------------------------------------------------------- 
I just uploaded a second patch. It avoids now building man pages for
module-init-tools. The old patch had a buggy behaviour if you invoke make
on an existing rootfs. 

tested on i386 

---------------------------------------------------------------------- 
 db - 06-07-05 08:48  
---------------------------------------------------------------------- 
Another reason to want module-init-tools rather than use what's
built in to "busybox" that busybox doesn't yet handle the kernel
MODULE_ALIAS construct, which is starting to be used by fancier
hotplug and kmod infrastructure.  Briefly, very small hotplug
scripts can look like:

   modprobe $MODALIAS

And that will replace both hotplug scripts and diethotplug.

(Plus there are several bugs in the busybox module tools, like
not working on 2.6 kernels unless you also configure 2.4 support,
and some glitches in parameter handling...)

Yes, please merge ... 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-21-05 00:39  basile         New Issue                                    
03-21-05 00:39  basile         File Added: modules.patch                    
03-22-05 04:53  basile         Issue Monitored: basile                      
03-22-05 13:24  david_bachelartFile Added: modutils-2.patch                    
03-22-05 13:27  david_bachelartNote Added: 0000115                          
06-07-05 08:48  db             Note Added: 0000235                          
06-09-05 02:46  andersen       Status                   assigned => closed  
06-09-05 02:46  andersen       Resolution               open => fixed       
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
