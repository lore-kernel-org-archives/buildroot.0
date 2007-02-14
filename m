From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 14 Feb 2007 01:11:05 -0800
Subject: [Buildroot] [buildroot 0001218]: PATCH: X.org xkbcomp library path
	issues
Message-ID: <8b34e6b4f9aa5da55f2d419b0dfb4f50@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1218 
====================================================================== 
Reported By:                foogod
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1218
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-14-2007 01:11 PST
Last Modified:              02-14-2007 01:11 PST
====================================================================== 
Summary:                    PATCH: X.org xkbcomp library path issues
Description: 
The X.org 6.8.2 source needs to build a native version of the xkbcomp
utility during cross-compilation.  To do this, it attempts to link it with
libxkbfile and libX11 from the build system, which it assumes will be found
in /usr/X11R6/lib.

The attached patch adds /usr/lib to the search path for those people using
distributions that put the X libraries in /usr/lib instead of /usr/X11/lib.
 Note that it is still necessary to have the appropriate devel package for
libxkbfile and libX11 installed in order to build properly.

This is all rather broken anyway, as the X sources are blindly assuming
that the host system not only has X libraries installed but that they're
going to be compatible with the utilities (from a potentially different X
distribution) that are being built.  A more correct solution would be to
modify things to build a host version of libxkbfile and libX11 from the
6.8.2 sources and link to those (but that's a much larger endeavor, and if
I'm going to work on that sort of thing I think I'll just start over with
the newer 7.1 sources, which I'll probably look into shortly.)

But anyway, this patch at least allows X to compile on my system (Ubuntu
Edgy)..
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-14-07 01:11  foogod         New Issue                                    
02-14-07 01:11  foogod         Status                   new => assigned     
02-14-07 01:11  foogod         Assigned To               => buildroot       
02-14-07 01:11  foogod         File Added: buildroot.17879.xorg_xkbcomp.patch   
                
======================================================================
