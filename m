From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:33:37 -0800
Subject: [Buildroot] [buildroot 0001138]: Adds the ability to select
	dmidecode as part of the buildroot system.
Message-ID: <28b518768c62133beb8640d8b6413d71@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1138 
====================================================================== 
Reported By:                decandia50
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1138
Category:                   New Features
Reproducibility:            always
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             12-29-2006 12:23 PST
Last Modified:              02-12-2007 05:33 PST
====================================================================== 
Summary:                    Adds the ability to select dmidecode as part of the
buildroot system.
Description: 
I have a yet to be released open source project that requires dmidecode to
be loaded on the system and pull the serial number of the machine out of
the BIOS.  Since I'm using busybox/buildroot to create my boot image, I
thought it would be nice to give back to the community ;)

So I've added the ability to wget dmidecode and compile it in to the
current buildroot.  Also thanks for the documentation, that made it all
possible.

FYI: I'm not sure how well this will cross compile, but it's fine on x86
architectures.
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 01-19-07 08:11  
---------------------------------------------------------------------- 
Can you please send a complete
$ svn diff package/ > ~/buildroot.add-dmidecode.patch
to the list?

TIA, 

---------------------------------------------------------------------- 
 decandia50 - 01-23-07 20:30  
---------------------------------------------------------------------- 
uploaded the diff...  Since there have been so many revisions ahead, you
will probably have to make dmidecode fit in a better category.

Maybe something more along the lines of the following from today's
(01/23/2007) SVN snapshot

Index: package/Config.in
===================================================================
--- package/Config.in   (revision 17489)
+++ package/Config.in   (working copy)
@@ -57,6 +57,7 @@
 source "package/bsdiff/Config.in"
 source "package/customize/Config.in"
 source "package/dash/Config.in"
+source "package/dmidecode/Config.in"
 source "package/file/Config.in"
 source "package/kexec/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-29-06 12:23  decandia50     New Issue                                    
12-29-06 12:23  decandia50     Status                   new => assigned     
12-29-06 12:23  decandia50     Assigned To               => uClibc          
12-29-06 12:23  decandia50     File Added: dmidecode-patch.tgz                  
 
01-19-07 08:11  bernhardf      Note Added: 0001996                          
01-19-07 08:11  bernhardf      Status                   assigned => feedback
01-23-07 20:25  decandia50     File Added: buildroot.add-dmidecode.patch        
           
01-23-07 20:30  decandia50     Note Added: 0002038                          
02-12-07 05:33  vapier         Status                   feedback => assigned
02-12-07 05:33  vapier         Assigned To              uClibc => buildroot 
======================================================================
