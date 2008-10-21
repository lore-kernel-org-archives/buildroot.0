From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 21 Oct 2008 08:27:56 -0700
Subject: [Buildroot] [buildroot 0005624]: xapp_xfsinfo undefined reference
	to `bcopy'
Message-ID: <5b7de3887bafdb89cd430b51b82fd043@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=5624 
====================================================================== 
Reported By:                robang74
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5624
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             10-21-2008 06:46 PDT
Last Modified:              10-21-2008 08:27 PDT
====================================================================== 
Summary:                    xapp_xfsinfo undefined reference to `bcopy'
Description: 

roberto at rafbook:~/gles/buildroot$ make <-- with .config attached
roberto at rafbook:~/gles/buildroot$ make menuconfig <-- add xfs and xfsinfo
roberto@rafbook:~/gles/buildroot$ make

[...]

>>> xapp_xfsinfo 1.0.1 Extracting
>>> xapp_xfsinfo 1.0.1 Patching libtool
>>> xapp_xfsinfo 1.0.1 Patching package/x11r7/xapp_xfsinfo
>>> xapp_xfsinfo 1.0.1 Configuring
cd /home/roberto/gles/buildroot/build_i586/xapp_xfsinfo-1.0.1/ && rm -f
config.cache && \

[...]

checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for gawk... no
checking for mawk... mawk
checking whether make sets $(MAKE)... yes
checking for i586-linux-strip...
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-strip
checking whether to enable maintainer-specific portions of Makefiles...
no
checking for i586-linux-gcc...
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64
checking for C compiler default output file name... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... yes
checking for suffix of executables... 
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 accepts -g... yes
checking for
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 option to accept ANSI C... none needed
checking for style of include used by make... GNU
checking dependency style of
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64... gcc3
checking for a BSD-compatible install... /usr/bin/install -c
checking pkg-config is at least version 0.9.0... yes
checking for XFSINFO... yes
checking build system type... i386-pc-linux-gnu
checking host system type... i586-pc-linux-gnu
configure: creating ./config.status
config.status: creating Makefile
config.status: creating config.h
config.status: executing depfiles commands
>>> xapp_xfsinfo 1.0.1 Building
/usr/bin/make -j1  -C
/home/roberto/gles/buildroot/build_i586/xapp_xfsinfo-1.0.1/
make[1]: Entering directory
`/home/roberto/gles/buildroot/build_i586/xapp_xfsinfo-1.0.1'
/usr/bin/make  all-am
make[2]: Entering directory
`/home/roberto/gles/buildroot/build_i586/xapp_xfsinfo-1.0.1'
if
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -I. -I. -I.     -g -O2 -MT
xfsinfo-xfsinfo.o -MD -MP -MF ".deps/xfsinfo-xfsinfo.Tpo" \
	  -c -o xfsinfo-xfsinfo.o `test -f 'xfsinfo.c' || echo './'`xfsinfo.c; \
	then mv -f ".deps/xfsinfo-xfsinfo.Tpo" ".deps/xfsinfo-xfsinfo.Po"; \
	else rm -f ".deps/xfsinfo-xfsinfo.Tpo"; exit 1; \
	fi
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -g -O2   -o xfsinfo  xfsinfo-xfsinfo.o -lX11 -lFS 
 
/home/roberto/gles/buildroot/build_i586/staging_dir//usr/lib/libFS.so:
undefined reference to `bcopy'
collect2: ld returned 1 exit status
make[2]: *** [xfsinfo] Error 1
make[2]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/xapp_xfsinfo-1.0.1'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/xapp_xfsinfo-1.0.1'
make: ***
[/home/roberto/gles/buildroot/build_i586/xapp_xfsinfo-1.0.1/.stamp_built]
Error 2

roberto at rafbook:~/gles/buildroot$ ls -al
/home/roberto/gles/buildroot/build_i586/staging_dir//usr/lib/libFS.so*
lrwxrwxrwx 1 roberto roberto     14 2008-10-21 15:37
/home/roberto/gles/buildroot/build_i586/staging_dir//usr/lib/libFS.so ->
libFS.so.6.0.0
lrwxrwxrwx 1 roberto roberto     14 2008-10-21 15:37
/home/roberto/gles/buildroot/build_i586/staging_dir//usr/lib/libFS.so.6 ->
libFS.so.6.0.0
-rwxr-xr-x 1 roberto roberto 183026 2008-10-21 15:37
/home/roberto/gles/buildroot/build_i586/staging_dir//usr/lib/libFS.so.6.0.0



====================================================================== 

---------------------------------------------------------------------- 
 jacmet - 10-21-08 08:27  
---------------------------------------------------------------------- 
Thanks, fixed in r23756 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-21-08 06:46  robang74       New Issue                                    
10-21-08 06:46  robang74       Status                   new => assigned     
10-21-08 06:46  robang74       Assigned To               => buildroot       
10-21-08 06:46  robang74       File Added: .config                          
10-21-08 06:46  robang74       Issue Monitored: robang74                    
10-21-08 08:27  jacmet         Status                   assigned => closed  
10-21-08 08:27  jacmet         Note Added: 0013934                          
======================================================================
