From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 26 Oct 2008 02:43:25 -0700
Subject: [Buildroot] [buildroot 0003734]: dbus-glib fails to compile for a
	i686 platform
Message-ID: <cc6195146560764485a1037dd677244d@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3734 
====================================================================== 
Reported By:                KHAksnes
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3734
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-13-2008 08:53 PDT
Last Modified:              10-26-2008 02:43 PDT
====================================================================== 
Summary:                    dbus-glib fails to compile for a i686 platform
Description: 
The build of dbus-glib seems to look for several libraries in
build_i686/staging_dir/lib instead of build_i6i6/staging_dir/usr/lib
This is the case for recent svn versions of buildroot Explicit paths to
files
on the form lib*.so is used instead of -L and -l
====================================================================== 

---------------------------------------------------------------------- 
 pepe - 10-26-08 02:43  
---------------------------------------------------------------------- 
Sorry, dbus-glib-libs.patch was the wrong file and I don't seem to be able
to delete it.

I was unable to get dbus-glib to compile with -I -L flags instead of
explicit libs. The appended patch simply adjusts the corresponding
libraries. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-13-08 08:53  KHAksnes       New Issue                                    
06-13-08 08:53  KHAksnes       Status                   new => assigned     
06-13-08 08:53  KHAksnes       Assigned To               => buildroot       
10-26-08 02:30  pepe           File Added: dbus-glib-libs.patch                 
  
10-26-08 02:30  pepe           Issue Monitored: pepe                        
10-26-08 02:41  pepe           File Added: dbus-glib-libs2.patch                
   
10-26-08 02:43  pepe           Note Added: 0014204                          
======================================================================
