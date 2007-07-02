From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 2 Jul 2007 04:56:07 -0700
Subject: [Buildroot] [buildroot 0001415]: SVN buildroot does not build
	configuration package
Message-ID: <b48cb65bb8ca3d8789ef5723860367d9@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1415 
====================================================================== 
Reported By:                bjdooks
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1415
Category:                   Other
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-02-2007 04:56 PDT
Last Modified:              07-02-2007 04:56 PDT
====================================================================== 
Summary:                    SVN buildroot does not build configuration package
Description: 
The new import of the package/config no longer builds even for the default
by using 'make'

The following fails building mconf.c.

/usr/bin/gcc -g -O2   -c -o mconf.o mconf.c
In file included from mconf.c:27:
lxdialog/dialog.h:32:10: error: #include expects "FILENAME" or <FILENAME>
In file included from mconf.c:27:
lxdialog/dialog.h:97: error: expected specifier-qualifier-list before
'chtype'

This seems to require the $(HOST_EXTRACFLAGS) to build. 

I tried adding:

%.o: %.c
        $(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) -c $<
-o $@

but this just then fails to link the project.

I do not have enough make expertise to try and fix this, as it is a
complicated piece of make.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-02-07 04:56  bjdooks        New Issue                                    
07-02-07 04:56  bjdooks        Status                   new => assigned     
07-02-07 04:56  bjdooks        Assigned To               => buildroot       
======================================================================
