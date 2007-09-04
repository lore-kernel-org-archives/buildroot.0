From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 4 Sep 2007 13:59:54 -0700
Subject: [Buildroot] [buildroot 0001485]: DirectFB: Download site moved and
	x11 always required
Message-ID: <17ac266d02db25430f714153df726c4e@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1485 
====================================================================== 
Reported By:                HappyCactus
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1485
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-04-2007 08:03 PDT
Last Modified:              09-04-2007 13:59 PDT
====================================================================== 
Summary:                    DirectFB: Download site moved and x11 always
required
Description: 
The directFB main site has removed the 1.0.0 version.
Now 1.0.1 is the current stable version.
Also, configure do not specify either --enable-x11 or --disable-x11, so
that x11 is always required to compile the package.
Working patch attached.
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 09-04-07 13:59  
---------------------------------------------------------------------- 
+ifeq ($(BR2_PACKAGE_XORG7),y)
+DIRECTFB_X := --enable-x11
+else
+DIRECTFB_X := --disable-x11
+endif
+
This is not really accurate:
If BR2_PACKAGE_XSERVER_none is y, then disable-x11, else --enable-x11.

Please send patches to the mailing list and only add them to the
bugtracker if it is not applied (or explicitely rejected) within a
reasonable amount of time, TIA 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-04-07 08:03  HappyCactus    New Issue                                    
09-04-07 08:03  HappyCactus    Status                   new => assigned     
09-04-07 08:03  HappyCactus    Assigned To               => buildroot       
09-04-07 08:03  HappyCactus    File Added: buildroot-directfb-x11.patch         
          
09-04-07 13:59  bernhardf      Note Added: 0002711                          
======================================================================
