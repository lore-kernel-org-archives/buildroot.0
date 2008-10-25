From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 24 Oct 2008 22:10:25 -0700
Subject: [Buildroot] [buildroot 0005724]: libglib2 compilation crash on
	/usr/bin/glib-genmarshal
Message-ID: <67c1251220b97dc4c728d67992abc860@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5724 
====================================================================== 
Reported By:                robang74
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5724
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   crash
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-24-2008 21:51 PDT
Last Modified:              10-24-2008 22:10 PDT
====================================================================== 
Summary:                    libglib2 compilation crash on
/usr/bin/glib-genmarshal
Description: 
make[3]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/libglib2-2.15.4/glib'
Making all in gobject
make[3]: Entering directory
`/home/roberto/gles/buildroot/build_i586/libglib2-2.15.4/gobject'
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -I. -I.. 
-DG_LOG_DOMAIN=\"GLib-GObject\" -I.. -I../glib -I.. -DG_ENABLE_DEBUG
-DG_DISABLE_DEPRECATED -DGOBJECT_COMPILATION -DG_DISABLE_CONST_RETURNS
-pthread  -g -O2 -Wall -MT glib-genmarshal.o -MD -MP -MF
.deps/glib-genmarshal.Tpo -c -o glib-genmarshal.o glib-genmarshal.c
mv -f .deps/glib-genmarshal.Tpo .deps/glib-genmarshal.Po
/bin/bash ../libtool --tag=CC   --mode=link
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -g -O2 -Wall   -o glib-genmarshal
glib-genmarshal.o ../glib/libglib-2.0.la -lintl  
mkdir .libs
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -g -O2 -Wall -o glib-genmarshal glib-genmarshal.o 
../glib/.libs/libglib-2.0.so -lintl   -Wl,--rpath
-Wl,/home/roberto/gles/buildroot/build_i586/libglib2-2.15.4/glib/.libs
/usr/bin/make glib-genmarshal
make[4]: Entering directory
`/home/roberto/gles/buildroot/build_i586/libglib2-2.15.4/gobject'
make[4]: `glib-genmarshal' is up to date.
make[4]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/libglib2-2.15.4/gobject'
echo "#ifndef __G_MARSHAL_H__" > xgen-gmh \
	&& echo "#define __G_MARSHAL_H__" >> xgen-gmh \
	&& /usr/bin/glib-genmarshal --nostdinc --prefix=g_cclosure_marshal
./gmarshal.list --header >> xgen-gmh \
	&& echo "#endif /* __G_MARSHAL_H__ */" >> xgen-gmh \
	&& (cmp -s xgen-gmh gmarshal.h 2>/dev/null || cp xgen-gmh gmarshal.h) \
	&& rm -f xgen-gmh xgen-gmh~ \
	&& echo timestamp > stamp-gmarshal.h
/bin/bash: line 2: /usr/bin/glib-genmarshal: No such file or directory
make[3]: *** [stamp-gmarshal.h] Error 127
make[3]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/libglib2-2.15.4/gobject'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/libglib2-2.15.4'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/libglib2-2.15.4'
make: ***
[/home/roberto/gles/buildroot/build_i586/libglib2-2.15.4/.stamp_built]
Error 2

====================================================================== 

---------------------------------------------------------------------- 
 robang74 - 10-24-08 22:10  
---------------------------------------------------------------------- 
Solution: glib-genmarshal should be compiled for $HOST not for $TARGET
system 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-24-08 21:51  robang74       New Issue                                    
10-24-08 21:51  robang74       Status                   new => assigned     
10-24-08 21:51  robang74       Assigned To               => buildroot       
10-24-08 22:09  robang74       Issue Monitored: robang74                    
10-24-08 22:10  robang74       Note Added: 0014134                          
======================================================================
