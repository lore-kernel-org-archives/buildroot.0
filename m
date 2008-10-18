From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 18 Oct 2008 04:19:10 -0700
Subject: [Buildroot] [buildroot 0005484]: Matchbox compilation crash into
	libmatchbox-1.9
Message-ID: <551146d9308757710337d5819eac73e4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5484 
====================================================================== 
Reported By:                robang74
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5484
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   crash
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-18-2008 03:24 PDT
Last Modified:              10-18-2008 04:19 PDT
====================================================================== 
Summary:                    Matchbox compilation crash into libmatchbox-1.9
Description: 
roberto at rafbook:~/gles/buildroot$ make

[...]

Making all in menu
make[4]: Entering directory
`/home/roberto/gles/buildroot/build_i586/libmatchbox-1.9/tests/menu'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/libmatchbox-1.9/tests/menu'
make[4]: Entering directory
`/home/roberto/gles/buildroot/build_i586/libmatchbox-1.9/tests'
if
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -I. -I. -I..  -I../libmb -g -Wall
-fno-strict-aliasing    
-I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/libpng12
    -Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64
-I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include -MT
dump-image.o -MD -MP -MF ".deps/dump-image.Tpo" -c -o dump-image.o
dump-image.c; \
	then mv -f ".deps/dump-image.Tpo" ".deps/dump-image.Po"; else rm -f
".deps/dump-image.Tpo"; exit 1; fi
/bin/bash ../libtool --tag=CC --mode=link
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -Os 
-I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64
-I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-L../libmb -lmb
-L/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib -o
dump-image  dump-image.o  
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -Os
-I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64
-I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include -o
.libs/dump-image dump-image.o 
-L/home/roberto/gles/buildroot/build_i586/libmatchbox-1.9/libmb
/home/roberto/gles/buildroot/build_i586/libmatchbox-1.9/libmb/.libs/libmb.so
-L/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib -Wl,--rpath
-Wl,/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib
/home/roberto/gles/buildroot/build_i586/libmatchbox-1.9/libmb/.libs/libmb.so:
undefined reference to `index'
collect2: ld returned 1 exit status
make[4]: *** [dump-image] Error 1
make[4]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/libmatchbox-1.9/tests'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/libmatchbox-1.9/tests'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/libmatchbox-1.9'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/libmatchbox-1.9'
make: ***
[/home/roberto/gles/buildroot/build_i586/libmatchbox-1.9/.compiled] Error
2

====================================================================== 

---------------------------------------------------------------------- 
 robang74 - 10-18-08 03:30  
---------------------------------------------------------------------- 
workaround waiting for a solution, in libmatchbox-1.9/Makefile.in:

s,SUBDIRS = libmb doc tests, SUBDIRS = libmb doc, 

---------------------------------------------------------------------- 
 robang74 - 10-18-08 03:52  
---------------------------------------------------------------------- 
applaying the workaround in note 0013764 conduce to another crash in

Making all in src
make[3]: Entering directory
`/home/roberto/gles/buildroot/build_i586/matchbox-window-manager-1.2/src'
if
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -I. -I. -I..
-DDATADIR=\"/usr/share/matchbox\" -DCONFDIR=\"/etc/matchbox\"
-DPKGDATADIR=\"/usr/share/matchbox/matchbox\"
-DPREFIX=\"/home/roberto/gles/buildroot/build_i586/staging_dir/usr\" -g
-Wall -fno-strict-aliasing 
-I/home/roberto/gles/buildroot/build_i586/staging_dir/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/libpng12 
  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/startup-notification-1.0
        -Os 
-I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64
-I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include -MT
main.o -MD -MP -MF ".deps/main.Tpo" -c -o main.o main.c; \
	then mv -f ".deps/main.Tpo" ".deps/main.Po"; else rm -f ".deps/main.Tpo";
exit 1; fi
In file included from main.c:21:
structs.h:60:22: error: libsn/sn.h: No such file or directory
In file included from main.c:21:
structs.h:615: error: expected specifier-qualifier-list before
?SnDisplay?
make[3]: *** [main.o] Error 1
make[3]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/matchbox-window-manager-1.2/src'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/matchbox-window-manager-1.2'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/matchbox-window-manager-1.2'
make: ***
[/home/roberto/gles/buildroot/build_i586/matchbox-window-manager-1.2/.compiled]
Error 2

the missing file should be found here:

roberto at rafbook:~/gles/buildroot$ find . -name sn.h
./build_i586/staging_dir/usr/include/startup-notification-1.0/libsn/sn.h
./build_i586/startup-notification-0.9/libsn/sn.h

however to work around the problem it should link a whole directory in
this way:

roberto at rafbook:~/gles/buildroot$ ln -sf
$BR2_STAGING_DIR/usr/include/startup-notification-1.0/libsn $(dirname
$BR2_STAGING_DIR)/matchbox-window-manager-1.2/src/libsn 

---------------------------------------------------------------------- 
 robang74 - 10-18-08 04:01  
---------------------------------------------------------------------- 
finally it crashes for the same reason of making testes which means that to
have success in tests is mandatory and a work around are not enough:

[...]

Making all in src
make[3]: Entering directory
`/home/roberto/gles/buildroot/build_i586/matchbox-window-manager-1.2/src'

[...]

/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -Os 
-I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64
-I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include 
-L/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib -o
matchbox-window-manager  main.o wm.o base_client.o main_client.o
toolbar_client.o toolbar_client_alt.o dockbar_client.o dialog_client.o
select_client.o desktop_client.o ewmh.o misc.o client_common.o keys.o
list.o stack.o composite-engine.o session.o mbtheme.o xml.o
-L/home/roberto/gles/buildroot/build_i586/staging_dir/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib
-lmb -lX11 -lXext -lpng12   
-L/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib -lexpat
-L/home/roberto/gles/buildroot/build_i586/staging_dir/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib
-lstartup-notification-1    -lXfixes   -lXcursor   
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib/libmb.so:
undefined reference to `index'
collect2: ld returned 1 exit status
make[3]: *** [matchbox-window-manager] Error 1
make[3]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/matchbox-window-manager-1.2/src'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/matchbox-window-manager-1.2'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/matchbox-window-manager-1.2'
make: ***
[/home/roberto/gles/buildroot/build_i586/matchbox-window-manager-1.2/.compiled]
Error 2 

---------------------------------------------------------------------- 
 robang74 - 10-18-08 04:19  
---------------------------------------------------------------------- 
N.B.: In spite the .config says kernel headers version is 2.6.27 in real I
had compiled the toolchain against 2.6.24-19 ubuntu 8.04 kernel source. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-18-08 03:24  robang74       New Issue                                    
10-18-08 03:24  robang74       Status                   new => assigned     
10-18-08 03:24  robang74       Assigned To               => buildroot       
10-18-08 03:24  robang74       File Added: .config                          
10-18-08 03:24  robang74       Issue Monitored: robang74                    
10-18-08 03:30  robang74       Note Added: 0013764                          
10-18-08 03:52  robang74       Note Added: 0013774                          
10-18-08 04:01  robang74       Note Added: 0013784                          
10-18-08 04:19  robang74       Note Added: 0013794                          
======================================================================
