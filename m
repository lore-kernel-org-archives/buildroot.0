From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 13 Aug 2007 08:30:33 -0700
Subject: [Buildroot] [buildroot 0001462]: X11R7 fails to build due to error
	in libxcb
Message-ID: <666e3a397e586f00652184b03e83225a@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1462 
====================================================================== 
Reported By:                simpa
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1462
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-13-2007 06:01 PDT
Last Modified:              08-13-2007 08:30 PDT
====================================================================== 
Summary:                    X11R7 fails to build due to error in libxcb
Description: 
Building X11R7 fails while building libxcb with:

xv.c: In function 'xcb_xv_put_image_checked':
xv.c:2870: error: 'data_size' undeclared (first use in this function)
xv.c:2870: error: (Each undeclared identifier is reported only once
xv.c:2870: error: for each function it appears in.)
xv.c: In function 'xcb_xv_put_image':
xv.c:2951: error: 'data_size' undeclared (first use in this function)

====================================================================== 

---------------------------------------------------------------------- 
 simpa - 08-13-07 06:05  
---------------------------------------------------------------------- 
tested with buildroot-snapshot from 08-13-07

With manually added x11r7-patch from Julien it builds... 

---------------------------------------------------------------------- 
 simpa - 08-13-07 08:30  
---------------------------------------------------------------------- 
It think its a problem with Cross-Compilation...(I'm building i686-files on
an x86_64 machine)

So it seems to be a problem with autotools, right?! (I'm not very familiar
with it)

I get some more errors while compiling X11R7, that could possibly prove
this. For example:
Compiling xlib_libX11 stops with the error, that src/util/makekeys cannot
be found. The file exists but was compiled for i386 not for x86_64 as it
should. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-13-07 06:01  simpa          New Issue                                    
08-13-07 06:01  simpa          Status                   new => assigned     
08-13-07 06:01  simpa          Assigned To               => buildroot       
08-13-07 06:05  simpa          Note Added: 0002659                          
08-13-07 08:30  simpa          Note Added: 0002660                          
======================================================================
