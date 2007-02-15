From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 15 Feb 2007 13:56:22 -0800
Subject: [Buildroot] [buildroot 0001222]: PATCH: ntpd 4.2.0 build fails with
	"incomplete element type"
Message-ID: <35535214c611342444ee3b7fe435582f@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1222 
====================================================================== 
Reported By:                foogod
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1222
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-15-2007 13:56 PST
Last Modified:              02-15-2007 13:56 PST
====================================================================== 
Summary:                    PATCH: ntpd 4.2.0 build fails with "incomplete
element type"
Description: 
The ntpd 4.2.0 sources which are the default for buildroot are apparently
broken and will not compile (I'm not sure how they would ever compile on
anyone's system, actually).  They fail with the following error:

In file included from systime.c:11:
../include/ntp_stdlib.h:138: error: array type has incomplete element
type

This is apparently due to a coding error in the 4.2.0 distribution which
has been fixed in 4.2.0b and later.

The attached patch bumps the ntpd version to 4.2.4 (the current version)
which fixes this compilation error.  Note that it also removes the
ntp-cross-compile.patch, which is no longer needed with newer versions of
ntpd.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-15-07 13:56  foogod         New Issue                                    
02-15-07 13:56  foogod         Status                   new => assigned     
02-15-07 13:56  foogod         Assigned To               => buildroot       
02-15-07 13:56  foogod         File Added: buildroot.17902.ntp.patch            
       
======================================================================
