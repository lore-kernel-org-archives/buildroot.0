From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 22 Aug 2008 07:10:50 -0700
Subject: [Buildroot] [buildroot 0004614]: Unable to build varius xorg X11
	drivers.
Message-ID: <6c4c715446fbf0e6b36ebda5dc7f9e7b@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=4614 
====================================================================== 
Reported By:                antialize
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4614
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-17-2008 03:55 PDT
Last Modified:              08-22-2008 07:10 PDT
====================================================================== 
Summary:                    Unable to build varius xorg X11 drivers.
Description: 
One cannot build the x11 {joystick,mouse}-input-driver, amongst others. As
it seems they expect pixman.h to be located in /usr/include/ and not
/usr/include/pixman-1/ after all.  As almost all input drivers I have
tried expects this, I would suggest to change the pixman package to place
a copy of the files there.

I have submitted a patch to that effect.
====================================================================== 

---------------------------------------------------------------------- 
 lykowdk - 08-21-08 15:18  
---------------------------------------------------------------------- 
I don't see it so much as being put in the wrong place as much as it is
looking in the wrong place on my machine.

...

-I/home/lykowdk/buildroot/build_i686/staging_dir/home/lykowdk/buildroot/build_i686/staging_dir/usr/include/pixman-1
...

Should be

...
 -I/home/lykowdk/buildroot/build_i686/staging_dir/usr/include/pixman-1
...

Changing the makefiles by hand fixes the build issues.. So.. Where is this
include generated from? 

---------------------------------------------------------------------- 
 antialize - 08-22-08 07:10  
---------------------------------------------------------------------- 
Ok, so I found out that the *real* bug was in the xserver package. In
paticular the xorg-xserver.pc file produced contained a absolute path,
witch was the course of the double substitution. I have produced a new
patch that fixes the problem. I do not know if I will be able to get
upstream to accept. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-17-08 03:55  antialize      New Issue                                    
08-17-08 03:55  antialize      Status                   new => assigned     
08-17-08 03:55  antialize      Assigned To               => buildroot       
08-17-08 03:55  antialize      File Added: pixman-copy.patch                    
08-17-08 03:59  antialize      Issue Monitored: antialize                    
08-21-08 15:18  lykowdk        Note Added: 0010604                          
08-22-08 07:10  antialize      Note Added: 0010664                          
======================================================================
