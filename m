From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:49:17 -0800
Subject: [Buildroot] [buildroot 0000625]: rootfs isn't updated with changes
	made in target_skeleton or device_table.txt as described in
	documentation
Message-ID: <2717315338eb8e869ea54d1c6f6efdff@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=625 
====================================================================== 
Reported By:                hagepe
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   625
Category:                   Documentation
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-06-2006 06:19 PST
Last Modified:              02-12-2007 05:49 PST
====================================================================== 
Summary:                    rootfs isn't updated with changes made in
target_skeleton or device_table.txt as described in documentation
Description: 
At least with the daily snapshot from 5.1.2006:
If I understand the documentation right,
changing files in /target/generic/target_skeleton 
and a simple make in the main directory should rebuild the
rootfs including the changes. 
In fact the rootfs is rebuild but without the changes. There
must be something else that has to be done between the changes
and the "make" or the major makefile needs some changes?




====================================================================== 

---------------------------------------------------------------------- 
 scott - 01-19-06 13:42  
---------------------------------------------------------------------- 
To fix this, we need to change the main Makefile.  It's a one liner...

buildroot/Makefile:

--- Old Line...
$(TARGET_DIR):

+++ New Line...
$(TARGET_DIR): $(TARGET_SKELETON) $(TARGET_SKEL_DIR) 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-06-06 06:19  hagepe         New Issue                                    
01-06-06 06:19  hagepe         Status                   new => assigned     
01-06-06 06:19  hagepe         Assigned To               => uClibc          
01-19-06 13:42  scott          Note Added: 0000957                          
01-23-06 06:29  prpplague      Status                   assigned => closed  
01-23-06 06:29  prpplague      Resolution               open => no change
required
01-23-06 06:29  prpplague      Additional Information Updated                   

02-12-07 05:49  vapier         Status                   closed => assigned  
02-12-07 05:49  vapier         Assigned To              uClibc => buildroot 
======================================================================
