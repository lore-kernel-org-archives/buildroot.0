From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 19 Oct 2007 13:10:44 -0700
Subject: [Buildroot] [buildroot 0001306]: wireless-tools v28 did not compile
Message-ID: <223f27367e4437c2b1e4a612ab9ed13a@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
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
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             04-08-2007 05:23 PDT
Last Modified:              10-19-2007 13:10 PDT
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

---------------------------------------------------------------------- 
 vanokuten - 10-19-07 13:10  
---------------------------------------------------------------------- 
fixed in svn, now wireless-tools v29 are used. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-08-07 05:23  flo            New Issue                                    
04-08-07 05:23  flo            Status                   new => assigned     
04-08-07 05:23  flo            Assigned To               => buildroot       
04-08-07 05:23  flo            File Added: wireless-tools_update_29-pre17.patch 
                  
10-19-07 13:10  vanokuten      Status                   assigned => closed  
10-19-07 13:10  vanokuten      Note Added: 0002843                          
======================================================================
