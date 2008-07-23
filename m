From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 23 Jul 2008 16:07:20 -0700
Subject: [Buildroot] [buildroot 0004294]: portage does not compile
Message-ID: <5e4ba10713eef56c95456f269494b0ac@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=4294 
====================================================================== 
Reported By:                pepe
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4294
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-23-2008 16:07 PDT
Last Modified:              07-23-2008 16:07 PDT
====================================================================== 
Summary:                    portage does not compile
Description: 
In buildroot, portage 2.1.4 has a patch to update to 2.1.4.4.

The portage.mk does not apply the patch by default(why?):

> PORTAGE_PATCH_APPLY:=n

But sets the final build directory with the updated version number, so the
(not actually updated) tree is not found:

> PORTAGE_VERSION:=$(PORTAGE_BASE_VERSION)$(PORTAGE_PATCH_VERSION)

Attached a simple fix to make the directory name depend on whether the
patch is applied or not.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-23-08 16:07  pepe           New Issue                                    
07-23-08 16:07  pepe           Status                   new => assigned     
07-23-08 16:07  pepe           Assigned To               => buildroot       
07-23-08 16:07  pepe           File Added: portage_vers.patch                   

======================================================================
