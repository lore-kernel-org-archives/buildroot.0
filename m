From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 11 Sep 2008 05:44:29 -0700
Subject: [Buildroot] [buildroot 0004914]: Large file support missing,
	however selected
Message-ID: <e4a06eb52971333aa3b50f6db966b1f7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=4914 
====================================================================== 
Reported By:                maleadt
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4914
Category:                   Architecture Specific
Reproducibility:            sometimes
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-11-2008 05:44 PDT
Last Modified:              09-11-2008 05:44 PDT
====================================================================== 
Summary:                    Large file support missing, however selected
Description: 
Sometimes, my build failed with some cryptic errors like:
swapon.c:87: error: expected declaration specifiers or '...' before
'swapon'
swapon.c:87: error: expected declaration specifiers or '...' before
'path'
swapon.c:87: error: expected declaration specifiers or '...' before
'flags'
swapon.c:87: warning: type defaults to 'int' in declaration of
'_syscall2'
swapon.c:89: error: expected declaration specifiers or '...' before
'swapoff'
swapon.c:89: error: expected declaration specifiers or '...' before
'path'
swapon.c:89: warning: type defaults to 'int' in declaration of
'_syscall1'

A quick google turned up that this failure is caused by "Large File
Support" not being checked. It seems that some dependency is not being
checked by the menuconfig.

Anyhow, even with the LFS option checked, the build still fails sometimes!
I cannot pinpoint the cause of this bug, but to fix it I need to enter the
menuconfig once more, uncheck and recheck the LFS option, exit from the
menuconfig, and answer "Yes" when menuconfig asks whether the
configuration should be saved. After doing this, the build successfully
continues.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-11-08 05:44  maleadt        New Issue                                    
09-11-08 05:44  maleadt        Status                   new => assigned     
09-11-08 05:44  maleadt        Assigned To               => buildroot       
======================================================================
