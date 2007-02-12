From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:49:54 -0800
Subject: [Buildroot] [buildroot 0000536]: Selecting busybox in buildroot's
	config clobbers ar (and probably other binutils)
Message-ID: <acf0abd607a7acfec35b3c04968f4c2e@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=536 
====================================================================== 
Reported By:                alemc
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   536
Category:                   Architecture Specific
Reproducibility:            have not tried
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-07-2005 17:35 PST
Last Modified:              02-12-2007 05:49 PST
====================================================================== 
Summary:                    Selecting busybox in buildroot's config clobbers ar
(and probably other binutils)
Description: 
Using buildroot from 20051105 I run into a problem trying to compile apps
in my target system due to the fact that busybox's mini apps clobber the
real binutils in buildroot.  This is most noticable with ar for which the
busybox version cannot create archives as is necessary to compile many
apps/tools.
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 11-07-05 18:38  
---------------------------------------------------------------------- 
this was disabled a while ago:
$ grep _AR package/busybox/busybox.config
# CONFIG_AR is not set 

---------------------------------------------------------------------- 
 alemc - 11-09-05 13:58  
---------------------------------------------------------------------- 
I forget to mention that I was using a custom busybox config.  It would be
nice (wishlist) if there were and option to build but not install busybox,
but not to create it's links.  Or perhaps when changing the busybox config
path if there were a message warning about this problem. 

---------------------------------------------------------------------- 
 vapier - 11-09-05 18:59  
---------------------------------------------------------------------- 
if you're using a custom config then it's your own fault you enabled the ar
util

i will add an option to control whether or not to generate symlinks though
as i would find that a useful option myself ;) 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-07-05 17:35  alemc          New Issue                                    
11-07-05 17:35  alemc          Status                   new => assigned     
11-07-05 17:35  alemc          Assigned To               => uClibc          
11-07-05 18:38  vapier         Note Added: 0000672                          
11-07-05 18:38  vapier         Status                   assigned => closed  
11-07-05 18:38  vapier         Resolution               open => unable to
reproduce
11-09-05 13:58  alemc          Status                   closed => feedback  
11-09-05 13:58  alemc          Resolution               unable to reproduce =>
reopened
11-09-05 13:58  alemc          Note Added: 0000674                          
11-09-05 18:59  vapier         Note Added: 0000676                          
11-09-05 18:59  vapier         Status                   feedback => closed  
11-09-05 18:59  vapier         Resolution               reopened => fixed   
02-12-07 05:49  vapier         Status                   closed => assigned  
02-12-07 05:49  vapier         Assigned To              uClibc => buildroot 
======================================================================
