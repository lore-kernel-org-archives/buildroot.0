From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 4 Nov 2007 03:14:16 -0800
Subject: [Buildroot] [buildroot 0001560]: libmad should be libtoolized
Message-ID: <2c44ec566e421c7aa7c94e7201c786eb@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1560 
====================================================================== 
Reported By:                ikonst
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1560
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-28-2007 11:53 PDT
Last Modified:              11-04-2007 03:14 PST
====================================================================== 
Summary:                    libmad should be libtoolized
Description: 
Current version of libmad comes with ltmain.sh which is incompatible with
modern versions of libtool, causing shared objects to be built without the
.so extension.

This patch invokes libtoolize (which is a utility from the libtool package
and comes along with libtool itself) to create an appropriate ltmain.sh.
====================================================================== 

---------------------------------------------------------------------- 
 ikonst - 11-04-07 03:14  
---------------------------------------------------------------------- 
Actually, this patch does not solve the issue and should be reverted.

BTW, I've seen ulf already commited this patch (without marking is as
FIXED  :(, so if you can, please revert it; the real solution is in issue
0001571. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-28-07 11:53  ikonst         New Issue                                    
10-28-07 11:53  ikonst         Status                   new => assigned     
10-28-07 11:53  ikonst         Assigned To               => buildroot       
10-28-07 11:53  ikonst         File Added: buildroot-libmad-libtoolize.patch    
               
11-04-07 03:14  ikonst         Note Added: 0002886                          
======================================================================
