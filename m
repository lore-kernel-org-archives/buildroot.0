From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 2 Nov 2008 10:34:50 -0800
Subject: [Buildroot] [buildroot 0005674]: Outdated syslinux links.
Message-ID: <ed3a5e9d493a454800d57e1cae7c3883@bugs.uclibc.org>
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
Last Modified:              11-02-2008 10:34 PST
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

---------------------------------------------------------------------- 
 jacmet - 11-02-08 10:34  
---------------------------------------------------------------------- 
It seems like we'll need host-nasm support (or a check in dependencies.sh)
before we can move to 3.7x 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-22-08 15:38  ksnieck        New Issue                                    
10-22-08 15:38  ksnieck        Status                   new => assigned     
10-22-08 15:38  ksnieck        Assigned To               => buildroot       
10-29-08 04:28  nickpeirson    Note Added: 0014564                          
10-29-08 04:29  nickpeirson    File Added: syslinux-3.72.patch                  
 
11-02-08 10:34  jacmet         Note Added: 0014874                          
======================================================================
