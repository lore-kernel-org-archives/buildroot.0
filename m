From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 3 Nov 2008 09:40:53 -0800
Subject: [Buildroot] [buildroot 0005934]: HOST_GLIB not set correctly for
	libgtk2
Message-ID: <3b73e85f998986f2c7761b6df238a6b7@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5934 
====================================================================== 
Reported By:                john_schimandle
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5934
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-03-2008 09:40 PST
Last Modified:              11-03-2008 09:40 PST
====================================================================== 
Summary:                    HOST_GLIB not set correctly for libgtk2
Description: 
HOST_GLIB is set to the path that contains the host glib tool set and is
used when building package libgtk2 to create certain files. The buildroot
top level Makefile sets HOST_GLIB using which to find the path where
glib-genmarshal is located.

The problem is that a cross compiled version of glib-genmarshal is also
put in the build_ARCH/staging_dir/usr/bin directory when the package
libglib2 is built. This cross compiled version will typically not run on
the host system.

If you have build_ARCH/staging_dir/usr/bin in your PATH variable before
the host location of glib-genmarshal then HOST_GLIB will be set
incorrectly. build_ARCH/staging_dir/usr/bin can easily be in your path if
you follow the buildroot documentation to use the gcc cross compiler
located in build_ARCH/staging_dir/usr/bin and place this directory in your
PATH.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-03-08 09:40  john_schimandleNew Issue                                    
11-03-08 09:40  john_schimandleStatus                   new => assigned     
11-03-08 09:40  john_schimandleAssigned To               => buildroot       
11-03-08 09:40  john_schimandleFile Added: HOST_GLIBpath.patch                  
 
======================================================================
