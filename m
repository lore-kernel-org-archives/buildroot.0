From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:49:59 -0800
Subject: [Buildroot] [buildroot 0000489]: ncurses library is incorrectly
	installed in /lib, not /usr/lib
Message-ID: <d885545d120394243b0be7ca92f6b873@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=489 
====================================================================== 
Reported By:                mikewhit
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   489
Category:                   Standards Compliance
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-17-2005 04:17 PDT
Last Modified:              02-12-2007 05:49 PST
====================================================================== 
Summary:                    ncurses library is incorrectly installed in /lib,
not /usr/lib
Description: 
libncurses.so is installed in /lib, which is reserved for libraries needed
for boot and operation of /bin and /sbin commands.

Other packages (e.g. CUnit) expect to find it there.
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 10-17-05 08:54  
---------------------------------------------------------------------- 
shells typically link against ncurses hence it goes in /lib

if you have a package which expects a library in a certain directory then
that package is broken 

---------------------------------------------------------------------- 
 mikewhit - 10-17-05 09:54  
---------------------------------------------------------------------- 
Maybe on your systems, not ours, but you should still be able to configure
it.

The ncurses.mk file hardwires it.

Not strictly relevant, but my desktop Fedora system works happily with it
in /usr/lib !

 

---------------------------------------------------------------------- 
 vapier - 10-17-05 10:45  
---------------------------------------------------------------------- 
seeing as how you have the source it should be easy enough to make the
change on your side of things 

---------------------------------------------------------------------- 
 mikewhit - 10-18-05 01:04  
---------------------------------------------------------------------- 
Editing individual package make files is NOT the reason for choosing an
off-the-shelf package-based build component such as buildroot !!

If there was some means of tweaking some of the options (like /lib vs.
/usr/lib) using a configure step/file, then that would be most useful.
Forgive me if this exists and I am unaware of it.

As it stands, busybox and boot components in our system do not require
ncurses so it needs to live in /usr/lib rather than occupying space in a
minimal /lib, apart from any package compatibility issues.

Thanks. 

---------------------------------------------------------------------- 
 vapier - 10-18-05 05:49  
---------------------------------------------------------------------- 
buildroot is more of a development tool ... and it isnt meant to be an
'off-the-shelf' system but more of a tool to easily build and test uClibc

if you can come up with a flexible way to control packages in general i'll
consider it but adding a configure option simply to control the location of
libncurses is not acceptable 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-17-05 04:17  mikewhit       New Issue                                    
10-17-05 04:17  mikewhit       Status                   new => assigned     
10-17-05 04:17  mikewhit       Assigned To               => uClibc          
10-17-05 08:54  vapier         Note Added: 0000625                          
10-17-05 08:54  vapier         Status                   assigned => closed  
10-17-05 08:54  vapier         Resolution               open => won't fix   
10-17-05 09:52  mikewhit       Status                   closed => feedback  
10-17-05 09:52  mikewhit       Resolution               won't fix => reopened
10-17-05 09:52  mikewhit       Note Added: 0000626                          
10-17-05 09:54  mikewhit       Note Edited: 0000626                         
10-17-05 10:45  vapier         Note Added: 0000627                          
10-17-05 10:45  vapier         Status                   feedback => closed  
10-17-05 10:45  vapier         Resolution               reopened => won't fix
10-18-05 01:04  mikewhit       Status                   closed => feedback  
10-18-05 01:04  mikewhit       Resolution               won't fix => reopened
10-18-05 01:04  mikewhit       Note Added: 0000633                          
10-18-05 05:49  vapier         Note Added: 0000636                          
10-18-05 05:49  vapier         Status                   feedback => closed  
10-18-05 05:49  vapier         Resolution               reopened => won't fix
10-25-05 03:53  danieljlaird   Issue Monitored: danieljlaird                    
02-12-07 05:49  vapier         Status                   closed => assigned  
02-12-07 05:49  vapier         Assigned To              uClibc => buildroot 
======================================================================
