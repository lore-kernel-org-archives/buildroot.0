From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 13 Oct 2008 03:24:32 -0700
Subject: [Buildroot] [buildroot 0005374]: Cannot compile libpng, directfb,
	and other packages due to missing -L option
Message-ID: <420cca809853eda1871a3d5fb5936cfc@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5374 
====================================================================== 
Reported By:                tpetazzoni
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5374
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-13-2008 03:24 PDT
Last Modified:              10-13-2008 03:24 PDT
====================================================================== 
Summary:                    Cannot compile libpng, directfb, and other packages
due to missing -L option
Description: 
With current Buildroot SVN, I have an issue when trying to build libpng
and directfb: the configure script cannot find that zlib is installed.

The configure script tries to compile a simple program that makes a
call to zlibVersion() using the -lz option. But the
-L$(STAGING_DIR)/usr/lib/ option is not passed to gcc (the -I options
are correct however), so the compilation fails and configure complains
that it can't find the configure script.

In package/Makefile.in, it seems that the library path is passed in
TARGET_CONFIGURE_OPTS, using LD :

 LD="$(TARGET_LD) $(TARGET_LDFLAGS)" \

In the config.log, I see reference to the correct -L paths, but these
paths seem to be removed when testing the compilation of the sample
zlib program.

I'm using the following patches to workaround the problem, but I don't
think these are the proper fixes.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-13-08 03:24  tpetazzoni     New Issue                                    
10-13-08 03:24  tpetazzoni     Status                   new => assigned     
10-13-08 03:24  tpetazzoni     Assigned To               => buildroot       
======================================================================
