From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 8 Apr 2007 05:23:33 -0700
Subject: [Buildroot] [buildroot 0001306]: wireless-tools v28 did not compile
Message-ID: <19f4a3fa91dfe24f6f91fb5341d43d23@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1306 
====================================================================== 
Reported By:                flo
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1306
Category:                   Other
Reproducibility:            always
Severity:                   trivial
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-08-2007 05:23 PDT
Last Modified:              04-08-2007 05:23 PDT
====================================================================== 
Summary:                    wireless-tools v28 did not compile
Description: 
The current (2007/04/08 svn co) package for the wireless-tools did not
compile.
Problems occured after following warning:
  iwpriv.c:387: warning: incompatible implicit declaration of built-in
function 'index'

This caused the linker to fail.

FIX: changed to v29-pre, see attached patch

Additionally the path to the "ar" and "ranlib" binaries should be
overwritten to the according target binaries as it is done for gcc. I'm
afraid I do not now about the buildroot-internal Make variables, otherwise
I would have wrote a patch
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-08-07 05:23  flo            New Issue                                    
04-08-07 05:23  flo            Status                   new => assigned     
04-08-07 05:23  flo            Assigned To               => buildroot       
04-08-07 05:23  flo            File Added: wireless-tools_update_29-pre17.patch 
                  
======================================================================
