From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 29 Oct 2008 04:28:53 -0700
Subject: [Buildroot] [buildroot 0005674]: Outdated syslinux links.
Message-ID: <8d66c30b6bbf3e187d4cef325847e17c@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5674 
====================================================================== 
Reported By:                ksnieck
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5674
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-22-2008 15:38 PDT
Last Modified:              10-29-2008 04:28 PDT
====================================================================== 
Summary:                    Outdated syslinux links.
Description: 
When configuring for pxelinux or syslinux images, build fails because
syslinux has since been updated and the version number buildroot looks for
is no longer at kernel.org.
Changing the version number and commenting out the bit about the patch, in
the buildroot/target/x86/syslinux/syslinux.mk file causes the build to
complete succesfully, but I don't know what the patch was doing, so it
might not do what it was intended to anymore.

====================================================================== 

---------------------------------------------------------------------- 
 nickpeirson - 10-29-08 04:28  
---------------------------------------------------------------------- 
Patch to bump the syslinux version to 3.72, update the makefile patch, and
fix a couple of "printf"s that were throwing errors during the compile.

Not sure if the printf issues are uClibc specific or the patch should be
pushed upstream? 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-22-08 15:38  ksnieck        New Issue                                    
10-22-08 15:38  ksnieck        Status                   new => assigned     
10-22-08 15:38  ksnieck        Assigned To               => buildroot       
10-29-08 04:28  nickpeirson    Note Added: 0014564                          
======================================================================
