From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 4 Jul 2008 23:07:32 -0700
Subject: [Buildroot] [buildroot 0003944]: "Makefile.Autotools.in" fails when
	patching ltmain.sh of the Ace of Penguins games suite
Message-ID: <3671bbc9f1464b14cccc557b0dc5e65b@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3944 
====================================================================== 
Reported By:                UlfSamuelsson
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3944
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-04-2008 23:07 PDT
Last Modified:              07-04-2008 23:07 PDT
====================================================================== 
Summary:                    "Makefile.Autotools.in" fails when patching
ltmain.sh of the Ace of Penguins games suite
Description: 


for i in `find
/home/ulf/projects/Buildroot/20080704/buildroot-ngw100-expanded/build_avr32/ace_of_penguins-1.2
-name ltmain.sh`; do \
                toolchain/patch-kernel.sh ${i%/*} package
buildroot-libtool.patch; \
        done 

Applying buildroot-libtool.patch using plaintext: 
patching file ltmain.sh
Hunk http://busybox.net/bugs/view.php?id=1 FAILED at 273.
Hunk http://busybox.net/bugs/view.php?id=2 FAILED at 2408.
Hunk http://busybox.net/bugs/view.php?id=3 FAILED at 2552.
Hunk http://busybox.net/bugs/view.php?id=4 FAILED at 2896.
Hunk http://busybox.net/bugs/view.php?id=5 FAILED at 5623.
Hunk http://busybox.net/bugs/view.php?id=6 FAILED at 5948.
6 out of 6 hunks FAILED -- saving rejects to file ltmain.sh.rej
Patch failed!  Please fix buildroot-libtool.patch!
make[1]: ***
[/home/ulf/projects/Buildroot/20080704/buildroot-ngw100-expanded/build_avr32/ace_of_penguins-1.2/.stamp_extracted]
Fel 1
make[1]: Leaving directory
`/home/ulf/projects/Buildroot/20080704/buildroot-ngw100-expanded'

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-04-08 23:07  UlfSamuelsson  New Issue                                    
07-04-08 23:07  UlfSamuelsson  Status                   new => assigned     
07-04-08 23:07  UlfSamuelsson  Assigned To               => buildroot       
======================================================================
