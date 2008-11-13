From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 12 Nov 2008 16:27:46 -0800
Subject: [Buildroot] [buildroot 0006064]: Making install in curl fails
Message-ID: <7576f0f4c89c277e16d4fa1891eb8eb9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=6064 
====================================================================== 
Reported By:                robang74
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   6064
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-10-2008 07:11 PST
Last Modified:              11-12-2008 16:27 PST
====================================================================== 
Summary:                    Making install in curl fails
Description: 
Making install in curl
make[6]: Entering directory
`/home/roberto/gles/buildroot/build_i586/curl-7.17.1/include/curl'
make[7]: Entering directory
`/home/roberto/gles/buildroot/build_i586/curl-7.17.1/include/curl'
make[7]: Nothing to be done for `install-exec-am'.
test -z "/usr/include/curl" || @MKDIR_P@
"/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/curl"
/bin/bash: @MKDIR_P@: command not found
make[7]: *** [install-pkgincludeHEADERS] Error 127
make[7]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/curl-7.17.1/include/curl'
make[6]: *** [install-am] Error 2
make[6]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/curl-7.17.1/include/curl'
make[5]: *** [install-recursive] Error 1
make[5]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/curl-7.17.1/include'
make[4]: *** [install-data-hook] Error 2
make[4]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/curl-7.17.1'
make[3]: *** [install-data-am] Error 2
make[3]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/curl-7.17.1'
make[2]: *** [install-am] Error 2
make[2]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/curl-7.17.1'
make[1]: *** [install-recursive] Error 1
make[1]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/curl-7.17.1'
make: ***
[/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/curl] Error
2

====================================================================== 

---------------------------------------------------------------------- 
 robang74 - 11-10-08 08:45  
---------------------------------------------------------------------- 
Applying curl-7.17.1-mkdirp.patch using plaintext:
patching file Makefile
touch /home/roberto/gles/buildroot/build_i586/curl-7.17.1/.unpacked
(cd /home/roberto/gles/buildroot/build_i586/curl-7.17.1; rm -rf
config.cache; \
                aclocal; \
                libtoolize --force; \
                ./reconf; )
/bin/sh: libtoolize: not found
lib/Makefile.am:42: Libtool library used but `LIBTOOL' is undefined
lib/Makefile.am:42:   The usual way to define `LIBTOOL' is to add
`AC_PROG_LIBTOOL'
lib/Makefile.am:42:   to `configure.ac' and run `aclocal' and `autoconf'
again.
lib/Makefile.am:42:   If `AC_PROG_LIBTOOL' is in `configure.ac', make
sure
lib/Makefile.am:42:   its definition is in aclocal's search path.
The command 'automake' failed
cp -f package/gnuconfig/config.sub package/gnuconfig/config.guess
/home/roberto/gles/buildroot/build_i586/curl-7.17.1

[...]

[ ----- What is in description follows ---- ]

roberto at rafbook:~/gles/buildroot$ automake --version
automake (GNU automake) 1.10.1
Copyright (C) 2008 Free Software Foundation, Inc.
License GPLv2+: GNU GPL version 2 or later
<http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written by Tom Tromey <tromey@redhat.com>
       and Alexandre Duret-Lutz <adl@gnu.org>.

roberto at rafbook:~/gles/buildroot$ make MKDIR_P="mkdir -p"

[...]

Making install in examples
make[6]: Entering directory
`/home/roberto/gles/buildroot/build_i586/curl-7.17.1/docs/examples'
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H  -I../../include  -DCURL_NO_OLDIES 
-g -O2 -MT 10-at-a-time.o -MD -MP -MF .deps/10-at-a-time.Tpo -c -o
10-at-a-time.o 10-at-a-time.c
mv -f .deps/10-at-a-time.Tpo .deps/10-at-a-time.Po
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -g -O2   -o 10-at-a-time 10-at-a-time.o
../../lib/libcurl.la 
../../lib/libcurl.la: file not recognized: File format not recognized
collect2: ld returned 1 exit status
make[6]: *** [10-at-a-time] Error 1
make[6]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/curl-7.17.1/docs/examples'
make[5]: *** [install-recursive] Error 1
make[5]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/curl-7.17.1/docs'
make[4]: *** [install-data-hook] Error 2
make[4]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/curl-7.17.1'
make[3]: *** [install-data-am] Error 2
make[3]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/curl-7.17.1'
make[2]: *** [install-am] Error 2
make[2]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/curl-7.17.1'
make[1]: *** [install-recursive] Error 1
make[1]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/curl-7.17.1'
make: ***
[/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/curl] Error 2

 

---------------------------------------------------------------------- 
 robang74 - 11-12-08 16:27  
---------------------------------------------------------------------- 
Please close this report because the problem was: libtool not installed in
the host system. If you like remove the host libtool need try to take a
look to the attached patch. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-10-08 07:11  robang74       New Issue                                    
11-10-08 07:11  robang74       Status                   new => assigned     
11-10-08 07:11  robang74       Assigned To               => buildroot       
11-10-08 07:11  robang74       Issue Monitored: robang74                    
11-10-08 07:16  robang74       Note Added: 0015334                          
11-10-08 08:29  robang74       Note Added: 0015354                          
11-10-08 08:29  robang74       Note Edited: 0015334                         
11-10-08 08:30  robang74       Note Edited: 0015354                         
11-10-08 08:45  robang74       Note Edited: 0015354                         
11-10-08 08:45  robang74       Note Deleted: 0015334                        
11-12-08 16:27  robang74       Note Added: 0015724                          
======================================================================
