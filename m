From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 12 Jun 2008 02:25:14 -0700
Subject: [Buildroot] [buildroot 0003444]: fontconfig fails to build in
	current svn version of buildroot (mipsel architecture)
Message-ID: <4b54b47d51d02e73b0fbabfd6b4385e5@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
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
Last Modified:              06-12-2008 02:25 PDT
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

---------------------------------------------------------------------- 
 KHAksnes - 06-12-08 02:25  
---------------------------------------------------------------------- 
The problem is that 
freetype-config --cflags returns:
-I/media/EkstraDisk/buildroot/build_mipsel/staging_dir/usr/include/freetype2
-I/media/EkstraDisk/buildroot/build_mipsel/staging_dir/usr/include

The second -I is the cause of the problem compilation problems for fc-case
and the other host only tools built as part of fontconfig 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-26-08 06:00  KHAksnes       New Issue                                    
05-26-08 06:00  KHAksnes       Status                   new => assigned     
05-26-08 06:00  KHAksnes       Assigned To               => buildroot       
06-12-08 02:25  KHAksnes       Note Added: 0008164                          
======================================================================
