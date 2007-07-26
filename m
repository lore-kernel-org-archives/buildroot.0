From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 26 Jul 2007 05:11:49 -0700
Subject: [Buildroot] [buildroot 0001443]: Patching fontconfig Makefile.am
	files fails
Message-ID: <4957852d69b76d1a0ad21235aabce9ac@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1443 
====================================================================== 
Reported By:                alanszlosek
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1443
Category:                   Other
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-26-2007 05:11 PDT
Last Modified:              07-26-2007 05:11 PDT
====================================================================== 
Summary:                    Patching fontconfig Makefile.am files fails
Description: 
While buildroot was attempting to compile fontconfig (buildroot revision
http://busybox.net/bugs/view.php?id=#19264, uclibc-0.9.29, busybox-1.6.1,
gcc-4.2.0) it would give the
following errors:

Applying host-tools.patch using plaintext: 
patching file fc-lang/Makefile.am
Hunk http://busybox.net/bugs/view.php?id=1 FAILED at 23.
1 out of 1 hunk FAILED -- saving rejects to file fc-lang/Makefile.am.rej
patching file fc-case/Makefile.am
Hunk http://busybox.net/bugs/view.php?id=1 FAILED at 23.
1 out of 1 hunk FAILED -- saving rejects to file fc-case/Makefile.am.rej
patching file fc-glyphname/Makefile.am
Hunk http://busybox.net/bugs/view.php?id=1 FAILED at 23.
1 out of 1 hunk FAILED -- saving rejects to file
fc-glyphname/Makefile.am.rej
patching file configure.in
Hunk http://busybox.net/bugs/view.php?id=1 succeeded at 105 (offset 4 lines).
patching file fc-arch/Makefile.am
Hunk http://busybox.net/bugs/view.php?id=1 FAILED at 23.
1 out of 1 hunk FAILED -- saving rejects to file fc-arch/Makefile.am.rej
Patch failed!  Please fix host-tools.patch!

I modified the package/fontconfig/host-tools.patch file by hand, so it
might not be 100% correct. I've attached the version that allowed
compilation to continue.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-26-07 05:11  alanszlosek    New Issue                                    
07-26-07 05:11  alanszlosek    Status                   new => assigned     
07-26-07 05:11  alanszlosek    Assigned To               => buildroot       
07-26-07 05:11  alanszlosek    File Added: host-tools.patch                    
======================================================================
