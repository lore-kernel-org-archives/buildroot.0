From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:33:34 -0800
Subject: [Buildroot] [buildroot 0001190]: PATCH: nfs-tools package -
	fakeroot install
Message-ID: <4f8166e0ed8046b5a8693ed0bcd02c23@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1190 
====================================================================== 
Reported By:                janlana
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1190
Category:                   Other
Reproducibility:            always
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-01-2007 03:11 PST
Last Modified:              02-12-2007 05:33 PST
====================================================================== 
Summary:                    PATCH: nfs-tools package - fakeroot install
Description: 
nfs-tools.mk used fakeroot for install because the nfs-tools Makefile wants
chmod one directory to nobody. To use fakeroot is a bit dirty but mainly it
causes spurious rebuild each time.

The attached patch fix it - it set $statduser=`whoami` so the 'make
install' does not fail. Because buildroot does not need the dirs
(nfs-tools.mk removes them), it  does not make any run problems.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-01-07 03:11  janlana        New Issue                                    
02-01-07 03:11  janlana        Status                   new => assigned     
02-01-07 03:11  janlana        Assigned To               => uClibc          
02-01-07 03:11  janlana        File Added: package_nfs.patch                    
02-12-07 05:33  vapier         Assigned To              uClibc => buildroot 
======================================================================
