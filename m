From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:18 -0800
Subject: [Buildroot] [buildroot 0000233]: host-sed-clean target always
	assumes that host-sed was built via build-sed-host-binary
Message-ID: <564da43a8aa0649cfaca684adf4d655e@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=233 
====================================================================== 
Reported By:                samrobb
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   233
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-22-2005 19:40 PDT
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    host-sed-clean target always assumes that host-sed
was built via build-sed-host-binary
Description: 
When a usable sed is detected on the host, the host-sed built target is set
to depend on use-sed-host-binary.  The host-sed-clean and host-sed-dirclean
targets always assume that host version of sed was built using the
build-sed-host-binary target.

The attached patch make host-sed-clean and host-sed-dirclean empty targets
that call clean and dirclean targets that depend on the intial sed build
type.

====================================================================== 

---------------------------------------------------------------------- 
 samrobb - 04-22-05 19:56  
---------------------------------------------------------------------- 
Sorry - this isn;t (and shouldn't be) marked as arch-specific. 

---------------------------------------------------------------------- 
 vapier - 09-07-05 17:39  
---------------------------------------------------------------------- 
fixed in a slightly different way, thanks 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-22-05 19:40  samrobb        New Issue                                    
04-22-05 19:40  samrobb        File Added: host-sed-clean.patch                 
  
04-22-05 19:56  samrobb        Note Added: 0000183                          
09-07-05 17:39  vapier         Note Added: 0000503                          
09-07-05 17:39  vapier         Status                   assigned => closed  
09-07-05 17:39  vapier         Resolution               open => fixed       
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
