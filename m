From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 26 May 2008 06:00:34 -0700
Subject: [Buildroot] [buildroot 0003444]: fontconfig fails to build in
	current svn version of buildroot (mipsel architecture)
Message-ID: <12541fca54bd3bfe02b776b31b3a9e24@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3444 
====================================================================== 
Reported By:                KHAksnes
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3444
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             05-26-2008 06:00 PDT
Last Modified:              05-26-2008 06:00 PDT
====================================================================== 
Summary:                    fontconfig fails to build in current svn version of
buildroot (mipsel architecture)
Description: 
I am using the current head revision of busybox. And are trying to build
for mipsel target architecture from a fedora8 i686 host platform.
Somewhere during compilation make tries to run this command:

if /usr/lib/ccache/gcc -DHAVE_CONFIG_H -I. -I. -I.. -I../src -I..
-I/media/EkstraDisk/buildroot/build_mipsel/staging_dir/usr/include/freetype2
-I/media/EkstraDisk/buildroot/build_mipsel/staging_dir/usr/include -Wall
-Wpointer-arith -Wstrict-prototypes     -Wmissing-prototypes
-Wmissing-declarations     -Wnested-externs -fno-strict-aliasing    -g -O2
-MT fc-case.o -MD -MP -MF ".deps/fc-case.Tpo" -c -o fc-case.o fc-case.c; \
        then mv -f ".deps/fc-case.Tpo" ".deps/fc-case.Po"; else rm -f
".deps/fc-case.Tpo"; exit 1; fi

This fails as the host gcc is invoked with an include of target includes.

The result is that fontconfig doesn't build at all.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-26-08 06:00  KHAksnes       New Issue                                    
05-26-08 06:00  KHAksnes       Status                   new => assigned     
05-26-08 06:00  KHAksnes       Assigned To               => buildroot       
======================================================================
