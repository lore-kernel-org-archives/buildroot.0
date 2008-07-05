From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 5 Jul 2008 01:16:49 -0700
Subject: [Buildroot] [buildroot 0003924]: Buildroot assumes that host
	glib-genmarschal is located in /usr/bin/
Message-ID: <5a4ada2c71c6002f38d92d93ed7d5186@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3924 
====================================================================== 
Reported By:                UlfSamuelsson
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3924
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-04-2008 01:59 PDT
Last Modified:              07-05-2008 01:16 PDT
====================================================================== 
Summary:                    Buildroot assumes that host glib-genmarschal is
located in /usr/bin/
Description: 
The build of libglib2-2.15.4 assumes that /usr/bin/glib-genmarschal
exists.
On OpenSUSE 10.2 (at least) it it located in
/opt/gnome/bin/glib-genmarschal.

A simple fox for this problem is to do:
sudo ln -s /opt/gnome/bin/glib-genmarshal /usr/bin/glib-genmarshal

====================================================================== 

---------------------------------------------------------------------- 
 UlfSamuelsson - 07-05-08 01:16  
---------------------------------------------------------------------- 
Same problem for glib-mkenums when building libgtk2-2.12.6/gdk-pixbuf

sudo ln -s /opt/gnome/bin/glib-mkenums /usr/bin/glib-mkenums 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-04-08 01:59  UlfSamuelsson  New Issue                                    
07-04-08 01:59  UlfSamuelsson  Status                   new => assigned     
07-04-08 01:59  UlfSamuelsson  Assigned To               => buildroot       
07-05-08 01:16  UlfSamuelsson  Note Added: 0008974                          
======================================================================
