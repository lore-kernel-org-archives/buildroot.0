From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 4 Nov 2008 11:06:39 -0800
Subject: [Buildroot] [buildroot 0005724]: libglib2 compilation crash on
	/usr/bin/glib-genmarshal
Message-ID: <10900a083408da3fe00b684d3a62b84a@busybox.net>
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
Last Modified:              11-04-2008 11:06 PST
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
 robang74 - 10-24-08 22:53  
---------------------------------------------------------------------- 
Proposed solution: glib-genmarshal should be compiled for $HOST not for
$TARGET system. Probably tests should be avoided too.

roberto at rafbook:~/gles/buildroot$ svn info | grep Last
Last Changed Author: jacmet
Last Changed Rev: 23778
Last Changed Date: 2008-10-24 13:02:32 +0200 (Fri, 24 Oct 2008)

 

---------------------------------------------------------------------- 
 robang74 - 10-28-08 02:21  
---------------------------------------------------------------------- 
roberto at rafbook:~/gles/buildroot$ svn info | grep Last
Last Changed Author: jacmet
Last Changed Rev: 23821
Last Changed Date: 2008-10-27 16:15:52 +0100 (Mon, 27 Oct 2008) 

---------------------------------------------------------------------- 
 tpetazzoni - 10-28-08 02:43  
---------------------------------------------------------------------- 
glib2 is designed to use the glib-genmarshal binary available in the PATH
in the case of cross-compilation. The ./configure script checks that a
glib-genmarshal binary is available in the PATH in the cross-compile case,
and fails if glib-genmarshal is not found:

if test $cross_compiling = yes; then
  AC_PATH_PROG(GLIB_GENMARSHAL, glib-genmarshal, no)
  if test x$GLIB_GENMARSHAL = xno; then
    AC_MSG_ERROR(Could not find a glib-genmarshal in your PATH)
  fi
fi

Do you have the output of the configure script ? And the config.log file
?

It should either :

 * Think that you are cross-compiling, testing in the configure script
that you have glib-genmarshal in your PATH and fail if not. Which is not
your case, it seems.

 * Think that you are *not* cross-compiling, and use the internally
compiled glib-genmarshal. Which is not your case either.

So, I'm quite confused with what you're seeing. 

---------------------------------------------------------------------- 
 jacmet - 11-04-08 01:42  
---------------------------------------------------------------------- 
Do you have the glib development package installed on your system? (E.G.
something like libglib2.0-dev) 

---------------------------------------------------------------------- 
 robang74 - 11-04-08 08:46  
---------------------------------------------------------------------- 
To answer to tpetazzoni I need more time but I can answer to jacmet pretty
immediately: no, I do not have any libglib*-dev installed. ASAP I will
investigate the problem deeper. Thanks to both, for the answer. 

---------------------------------------------------------------------- 
 intravenoes - 11-04-08 11:06  
---------------------------------------------------------------------- 
One thing to keep in mind here is that the options for glib-genmarshal or
rather glib-mkenums change a bit for newer versions of glib (2.18+).
glib-mkenum adds ENUMPREFIX. Newer versions of libgtk (2.14+) use this,
e.g. in gdk/gdkenumtypes.h.template.
So if the host system version of glib is below 2.18 but you try to cross
compile here and use the host system libs it will fail since this feature
is not supported. I know that these versions are not in buildroot right
now, just wanted to make you aware of this issue since I just ran into it. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-24-08 21:51  robang74       New Issue                                    
10-24-08 21:51  robang74       Status                   new => assigned     
10-24-08 21:51  robang74       Assigned To               => buildroot       
10-24-08 22:09  robang74       Issue Monitored: robang74                    
10-24-08 22:10  robang74       Note Added: 0014134                          
10-24-08 22:30  robang74       Note Edited: 0014134                         
10-24-08 22:53  robang74       Note Edited: 0014134                         
10-26-08 15:31  robang74       File Added: 5724.config                      
10-28-08 02:21  robang74       Note Added: 0014424                          
10-28-08 02:43  tpetazzoni     Note Added: 0014454                          
11-04-08 01:42  jacmet         Note Added: 0015044                          
11-04-08 08:46  robang74       Note Added: 0015064                          
11-04-08 11:06  intravenoes    Note Added: 0015074                          
======================================================================
