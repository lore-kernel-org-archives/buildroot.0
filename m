From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 11 Sep 2008 05:41:28 -0700
Subject: [Buildroot] [buildroot 0004904]: fsck.cramfs: asm/page.h is missing
Message-ID: <6a823cbc22f26536f2b2e4ae0867bbdc@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=4904 
====================================================================== 
Reported By:                maleadt
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4904
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-11-2008 05:41 PDT
Last Modified:              09-11-2008 05:41 PDT
====================================================================== 
Summary:                    fsck.cramfs: asm/page.h is missing
Description: 
When compiling fsck in buildroot, the compilation fails due to a missing
"asm/page.h". This file effectively is not present on my system. It seems
that "asm/page.h" is included in order to define PAGE_SIZE.

When replacing this include statement with the following routine extracted
from mkswap.c (which serves the same purpose, defining PAGE_SIZE), the
build successfully continues.

#ifdef HAVE_sys_user_h
				/* Note: <sys/user.h> says: for gdb only */
#include <sys/user.h>		/* for PAGE_SIZE and PAGE_SHIFT */
#else
#ifdef HAVE_asm_page_h
#include <asm/page.h>	
#endif
#endif
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-11-08 05:41  maleadt        New Issue                                    
09-11-08 05:41  maleadt        Status                   new => assigned     
09-11-08 05:41  maleadt        Assigned To               => buildroot       
======================================================================
