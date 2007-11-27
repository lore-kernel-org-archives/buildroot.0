From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 27 Nov 2007 01:27:59 -0800
Subject: [Buildroot] [buildroot 0001608]: flex should go to staging dir
Message-ID: <04c0688156386cf334893375b73f058a@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1608 
====================================================================== 
Reported By:                ikonst
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1608
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-27-2007 01:26 PST
Last Modified:              11-27-2007 01:27 PST
====================================================================== 
Summary:                    flex should go to staging dir
Description: 
/usr/bin/flex and /usr/lib/libfl.a is needed for building some packages
(e.g. ipsec-tools) but it's almost never needed on a device.

Issue 0000438 added copying libfl.a to the staging dir but placing it in
the target dir is unnecessary in the first place and usually needlessly
increases the size of the target device.
====================================================================== 

---------------------------------------------------------------------- 
 ikonst - 11-27-07 01:27  
---------------------------------------------------------------------- 
This patch builds flex for the host platform and libfl.a for the target
platform, and places them both into the staging dir.

It also removes the old (unneeded) BR2_PACKAGE_FLEX_LIBFL target. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-27-07 01:26  ikonst         New Issue                                    
11-27-07 01:26  ikonst         Status                   new => assigned     
11-27-07 01:26  ikonst         Assigned To               => buildroot       
11-27-07 01:27  ikonst         Note Added: 0002967                          
======================================================================
