From: Aleksandar Zivkovic <Aleksandar.Zivkovic@rt-rk.com>
Date: Tue, 17 Jul 2012 01:18:43 +0200
Subject: [Buildroot] Midori 0.4.6 impossible to build
Message-ID: <ju27gi$sdh$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Hi all,

I'm having dificulties with building of new version of midori browser 
(0.4.6). On Buildroot repository I can see that version 0.4.6 is already 
there. Still, even the latest BR release 2012.05 doesn't contain it. 
Does it means that it is not tested and it doesn't build correctly?
I'm having issue with valac part where midori code is full of errors. 
Log below contains typical error I get. If I remove lines with errors 
build will report other vala files compile errors and so on. Where it 
goes wrong?

Thank you,
Aleksandar

[7m>>> midori 0.4.6 Configuring[27m
(cd 
/var/lib/hudson/jobs/Buildroot_2011-05_x86/workspace/buildroot-2011.05/output/build/midori-0.4.6; 
PATH="/var/lib/hudson/jobs/Buildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/bin:/var/lib/hudson/jobs/Buildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/usr/bin:/var/lib/hudson/jobs/Buildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/usr/sbin/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games" 
AR="/var/lib/hudson/jobs/Buildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/usr/bin/i686-linux-ar" 
AS="/var/lib/hudson/jobs/Buildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/usr/bin/i686-linux-as" 
LD="/var/lib/hudson/jobs/Buildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/usr/bin/i686-linux-ld" 
NM="/var/lib/hudson/jobs/Buildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/usr/bin/i686-linux-nm" 
CC="/var/lib/hudson/jobs/Buildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/usr/bin/i686-linux-gcc" 
GCC="/var/lib/hudson/jobs/Buildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/usr/bin/i686-linux-gcc" 
CPP="/var/lib/hudson/jobs/Buildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/usr/bin/i686-linux-cpp" 
CXX="/var/lib/hudson/jobs/Buildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/usr/bin/i686-linux-g++" 
FC="/var/lib/hudson/jobs/Buildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/usr/bin/i686-linux-gfortran" 
RANLIB="/var/lib/hudson/jobs/Buildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/usr/bin/i686-linux-ranlib" 
STRIP="/var/lib/hudson/jobs/Buildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/usr/bin/i686-linux-strip" 
OBJCOPY="/var/lib/hudson/jobs/Buildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/usr/bin/i686-linux-objcopy" 
OBJDUMP="/var/lib/hudson/jobs/Buildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/usr/bin/i686-linux-objdump" 
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as" 
CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc" 
CXX_FOR_BUILD="/usr/bin/g++" FC_FOR_BUILD="/usr/bin/ld" 
LD_FOR_BUILD="/usr/bin/ld" CFLAGS_FOR_BUILD="-O2 
-I/var/lib/hudson/jobs/Buildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/include 
-I/var/lib/hudson/jobs/Buildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/usr/include" 
CXXFLAGS_FOR_BUILD="-I/var/lib/hudson/jobs/Buildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/include 
-I/var/lib/hudson/jobs/Buildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/usr/include" 
LDFLAGS_FOR_BUILD="-L/var/lib/hudson/jobs/Buildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/lib 
-L/var/lib/hudson/jobs/Buildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/usr/lib 
-Wl,-rpath,/var/lib/hudson/jobs/Buildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/usr/lib" 
FCFLAGS_FOR_BUILD="" 
DEFAULT_ASSEMBLER="/var/lib/hudson/jobs/Buildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/usr/bin/i686-linux-as" 
DEFAULT_LINKER="/var/lib/hudson/jobs/Buildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/usr/bin/i686-linux-ld" 
CFLAGS="-pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE 
-D_FILE_OFFSET_BITS=64" CXXFLAGS="-pipe -Os  -D_LARGEFILE_SOURCE 
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS="" FCFLAGS="" 
PKG_CONFIG="/var/lib/hudson/jobs/Buildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/usr/bin/pkg-config" 
PERLLIB="/var/lib/hudson/jobs/Buildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/usr/lib/perl" 
STAGING_DIR="/var/lib/hudson/jobs/Buildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/usr/i686-unknown-linux-gnu/sysroot" 
./waf configure --prefix=/usr --disable-libnotify )
Checking for program gcc or cc           : 
/var/lib/hudson/jobs/Buildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/usr/bin/i686-linux-gcc 

Checking for program ar                  : 
/var/lib/hudson/jobs/Buildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/usr/bin/i686-linux-ar 

Checking for program ranlib              : 
/var/lib/hudson/jobs/Buildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/usr/bin/i686-linux-ranlib 

Checking for gcc                         : ok
Checking for program valac               : 
/var/lib/hudson/jobs/Buildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/usr/bin/valac 

Checking for gobject-2.0                 : yes
Checking for gthread-2.0                 : yes
Checking for program version valac >= 0.1.6 : ok 0.15.2
Checking for program glib-genmarshal        : 
/var/lib/hudson/jobs/Buildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/usr/bin/glib-genmarshal 

Checking for program glib-mkenums           : 
/var/lib/hudson/jobs/Buildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/usr/bin/glib-mkenums 

Checking for program msgfmt                 : /usr/bin/msgfmt
Checking for program intltool-merge         : 
/var/lib/hudson/jobs/Buildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/usr/bin/intltool-merge 

Checking for header locale.h                : yes
Checking for program rsvg-convert           : not found
Checking for unique-1.0 >= 0.9              : no
Checking for library m                      : yes
Checking for gmodule-2.0 >= 2.8.0           : yes
Checking for gthread-2.0 >= 2.8.0           : yes
Checking for gio-2.0 >= 2.22.0              : yes
Checking for x11 >=                         : yes
Checking for header X11/extensions/scrnsaver.h : not found
Checking for library Xss                       : not found
Checking for gtk+-2.0 >= 2.10.0                : yes
Checking for webkit-1.0 >= 1.1.17              : yes
Checking for libsoup-2.4 >= 2.27.90            : yes
Checking for libxml-2.0 >= 2.6                 : yes
Checking for sqlite3 >= 3.0                    : yes
Checking for header unistd.h                   : yes
Checking for header netdb.h                    : yes
Checking for header sys/wait.h                 : yes
Checking for header sys/select.h               : yes
Checking for function inet_aton                : yes
Checking for function inet_addr                : yes
Checking for header signal.h                   : yes
'configure' finished successfully (0.720s)

         Localization:        yes (intltool)
         Icon optimizations:  no  (rsvg-convert)
         Notifications:       no  (libnotify)

         API documentation:   no  (gtk-doc)

[7m>>> midori 0.4.6 Building[27m
(cd 
/var/lib/hudson/jobs/Buildroot_2011-05_x86/workspace/buildroot-2011.05/output/build/midori-0.4.6; 
./waf build -j 4)
Waf: Entering directory 
`/var/lib/hudson/jobs/Buildroot_2011-05_x86/workspace/buildroot-2011.05/output/build/midori-0.4.6/_build'
[  1/130] glib_genmarshal: midori/marshal.list -> 
_build/default/midori/marshal.h _build/default/midori/marshal.c
[  2/130] valac: katze/midori-uri.vala 
midori/midori-extensions-column.vala -> 
_build/default/katze/midori-uri.c _build/default/midori/midori-core.h 
_build/default/midori/midori-core.vapi 
_build/default/midori/midori-core.deps 
_build/default/midori/midori-extensions-column.c 
_build/default/midori/midori-core.h 
_build/default/midori/midori-core.vapi 
_build/default/midori/midori-core.deps
../katze/midori-uri.vala:24.37-24.47: error: The expression `string?' 
does not denote an array
../katze/midori-uri.vala:131.17-131.22: error: The expression `string?' 
does not denote an array
../katze/midori-uri.vala:134.17-134.22: error: The expression `string?' 
does not denote an array
../katze/midori-uri.vala:134.38-134.43: error: The expression `string?' 
does not denote an array
../katze/midori-uri.vala:135.17-135.22: error: The expression `string?' 
does not denote an array
../katze/midori-uri.vala:135.38-135.43: error: The expression `string?' 
does not denote an array
../katze/midori-uri.vala:135.59-135.64: error: The expression `string?' 
does not denote an array
../katze/midori-uri.vala:136.18-136.23: error: The expression `string?' 
does not denote an array
../katze/midori-uri.vala:136.35-136.40: error: The expression `string?' 
does not denote an array
Waf: Leaving directory 
`/var/lib/hudson/jobs/Buildroot_2011-05_x86/workspace/buildroot-2011.05/output/build/midori-0.4.6/_build'
Build failed:  -> task failed (err #1):
	{task: valac_task midori-uri.vala,midori-extensions-column.vala -> 
midori-uri.c,midori-core.h,midori-core.vapi,midori-core.deps,midori-extensions-column.c,midori-core.h,midori-core.vapi,midori-core.deps}
make: *** 
[/var/lib/hudson/jobs/Buildroot_2011-05_x86/workspace/buildroot-2011.05/output/build/midori-0.4.6/.stamp_built] 
Error 1
