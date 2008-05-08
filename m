From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 8 May 2008 05:17:07 -0700
Subject: [Buildroot] [buildroot 0003284]: configure cannot find libz and
	usage of __USE_GNU breaks build
Message-ID: <1142ffee02b52e8bdf286fc718fb293e@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3284 
====================================================================== 
Reported By:                rhunger
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3284
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             05-08-2008 05:17 PDT
Last Modified:              05-08-2008 05:17 PDT
====================================================================== 
Summary:                    configure cannot find libz and usage of __USE_GNU
breaks build
Description: 
When selecting dropbear, configure is not able to find the libz in
staging_dir (Libz builds and installs ok). Defining LDFLAGS before running
configure solve this problem for me (see patch).

But than the compilation failed because of undefined structs in stdio.h.
This originates from the patch
"package/dropbear/dropbear-fix-missing-TIMEVAL_TO_TIMESPEC.patch" where
__USE_GNU is added. IMHO _GNU_SOURCE would be better. Anyway, the patch
seams unnecessary.
Dropbear works just fine without it.

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-08-08 05:17  rhunger        New Issue                                    
05-08-08 05:17  rhunger        Status                   new => assigned     
05-08-08 05:17  rhunger        Assigned To               => buildroot       
05-08-08 05:17  rhunger        File Added: dropbear.patch                    
======================================================================
