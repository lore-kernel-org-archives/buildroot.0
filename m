From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 23 Mar 2008 11:13:14 -0700
Subject: [Buildroot] [buildroot 0002664]: Linking xvmc fails looking for
	libs in wrong places
Message-ID: <0a89df27029969f1ddb6f71b97bbf0ad@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2664 
====================================================================== 
Reported By:                jbruchon
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2664
Category:                   Shared Library Support
Reproducibility:            have not tried
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-23-2008 11:13 PDT
Last Modified:              03-23-2008 11:13 PDT
====================================================================== 
Summary:                    Linking xvmc fails looking for libs in wrong places
Description: 
I'm having to make symlinks to fulfill missing library searches because
compiling libxvmc is looking for my Slackware libs instead of my uClibc
libs.  Here's an example:

(cd /home/nonroot/Desktop/buildroot/build_i486/libxcb-1.1/src; /bin/sh
../libtool  --tag=CC --mode=relink
/home/nonroot/Desktop/buildroot/build_i486/staging_dir/usr/bin/i486-linux-uclibc-gcc
-Os -I/home/nonroot/Desktop/buildroot/build_i486/staging_dir/usr/include
-I/home/nonroot/Desktop/buildroot/build_i486/staging_dir/include
--sysroot=/home/nonroot/Desktop/buildroot/build_i486/staging_dir/
-isysroot /home/nonroot/Desktop/buildroot/build_i486/staging_dir
-mtune=i486 -march=i486 -Wall -pedantic -Wpointer-arith
-Wstrict-prototypes -Wmissing-declarations -Wnested-externs
-I/home/nonroot/Desktop/buildroot/build_i486/staging_dir/usr/include
-I/home/nonroot/Desktop/buildroot/build_i486/staging_dir/usr/include -g
-O2 -o libxcb-xvmc.la -rpath /usr/lib -version-info 0:0:0 xvmc.lo
libxcb.la -inst-prefix-dir
/home/nonroot/Desktop/buildroot/project_build_i486/uclibc/root)
/home/nonroot/Desktop/buildroot/build_i486/staging_dir/usr/bin/i486-linux-uclibc-gcc
-Os  -I/home/nonroot/Desktop/buildroot/build_i486/staging_dir/usr/include
-I/home/nonroot/Desktop/buildroot/build_i486/staging_dir/include
--sysroot=/home/nonroot/Desktop/buildroot/build_i486/staging_dir/
-isysroot /home/nonroot/Desktop/buildroot/build_i486/staging_dir
-mtune=i486 -march=i486 -shared  .libs/xvmc.o 
-L/home/nonroot/Desktop/buildroot/project_build_i486/uclibc/root/usr/lib
-L/usr/lib -lxcb  -mtune=i486 -march=i486 -Wl,-soname -Wl,libxcb-xvmc.so.0
-o .libs/libxcb-xvmc.so.0.0.0
/home/nonroot/Desktop/buildroot/build_i486/staging_dir/usr/bin-ccache/../lib/gcc/i486-linux-uclibc/4.2.1/../../../../i486-linux-uclibc/bin/ld:
cannot find /usr/lib/uclibc_nonshared.a
collect2: ld returned 1 exit status
libtool: install: error: relink `libxcb-xvmc.la' with the above command
before installing it
make[2]: *** [install-libLTLIBRARIES] Error 1
make[2]: Leaving directory
`/home/nonroot/Desktop/buildroot/build_i486/libxcb-1.1/src'
make[1]: *** [install-exec-recursive] Error 1
make[1]: Leaving directory
`/home/nonroot/Desktop/buildroot/build_i486/libxcb-1.1'
make: ***
[/home/nonroot/Desktop/buildroot/build_i486/libxcb-1.1/.stamp_target_installed]
Error 2

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-23-08 11:13  jbruchon       New Issue                                    
03-23-08 11:13  jbruchon       Status                   new => assigned     
03-23-08 11:13  jbruchon       Assigned To               => buildroot       
======================================================================
