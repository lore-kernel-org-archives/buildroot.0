From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 18 Dec 2007 04:57:37 -0800
Subject: [Buildroot] [buildroot 0001462]: X11R7 fails to build due to error
	in libxcb
Message-ID: <bbaa9acc6458afa8c2d3c1361c5cef4e@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
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
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             08-13-2007 06:01 PDT
Last Modified:              12-18-2007 04:57 PST
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

---------------------------------------------------------------------- 
 simpa - 12-18-07 04:54  
---------------------------------------------------------------------- 
bug can be closed...

Error doesn't occur any more. 

---------------------------------------------------------------------- 
 vanokuten - 12-18-07 04:57  
---------------------------------------------------------------------- 
unable to reproduce, seems fixed somewhere in-between 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-13-07 06:01  simpa          New Issue                                    
08-13-07 06:01  simpa          Status                   new => assigned     
08-13-07 06:01  simpa          Assigned To               => buildroot       
08-13-07 06:05  simpa          Note Added: 0002659                          
08-13-07 08:30  simpa          Note Added: 0002660                          
12-18-07 04:54  simpa          Note Added: 0003244                          
12-18-07 04:57  vanokuten      Status                   assigned => closed  
12-18-07 04:57  vanokuten      Note Added: 0003249                          
======================================================================
