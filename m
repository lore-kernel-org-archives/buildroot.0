From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  6 Feb 2010 22:57:49 +0000 (UTC)
Subject: [Buildroot] [Bug 1051] New: Webkit doesn't compile (Linuxthreads
	new, x86)
Message-ID: <bug-1051-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1051

              Host: i386-pc-linux-gnu
            Target: i386-pc-linux-uclibc
             Build: i386-pc-linux-gnu
           Summary: Webkit doesn't compile (Linuxthreads new, x86)
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: dandart at googlemail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=1069)
 --> (https://bugs.busybox.net/attachment.cgi?id=1069)
Dan's Config File

I have managed to compile x86 buildroot with LINUXTHREADS NEW, because
apparently you have to if you want Webkit.

After replacing a syscall.h with sys/sysdep.h as in this thread (3rd post)
http://old.nabble.com/LINUXTHREADS_NEW-bug.-td19717126.html ...

After patching ParagraphLayout.h in icu-host and icu...

When it gets to Webkit it drops out with these errors:

./doltlibtool --tag=CXX   --mode=link
/home/dan/xenon/buildroot/output/staging/usr/bin/i686-linux-uclibc-g++ -Os
-pipe -Os  -I/home/dan/xenon/buildroot/output/staging/usr/include
-I/home/dan/xenon/buildroot/output/staging/include
--sysroot=/home/dan/xenon/buildroot/output/staging/ -isysroot
/home/dan/xenon/buildroot/output/staging -mtune=i686 -march=i686
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -W
-Wcast-align -Wchar-subscripts -Wreturn-type -Wformat -Wformat-security
-Wno-format-y2k -Wundef -Wmissing-format-attribute -Wpointer-arith
-Wwrite-strings -Wno-unused-parameter -Wno-parentheses -fno-exceptions
-fvisibility=hidden -fvisibility-inlines-hidden -fno-rtti
-I./WebKitTools/DumpRenderTree -I./WebKitTools/DumpRenderTree/gtk
-I./WebKit/gtk -I./WebKit/gtk -DBUILDING_CAIRO__=1 -DBUILDING_GTK__=1
-DWTF_CHANGES -DWTF_USE_ICU_UNICODE=1   -DNDEBUG 
-I./JavaScriptCore/ForwardingHeaders -I./JavaScriptCore/parser
-I./JavaScriptCore/wtf -I./DerivedSources -I./JavaScriptCore
-I./JavaScriptCore/API -I./JavaScriptCore/ForwardingHeaders
-I./JavaScriptCore/interpreter -I./JavaScriptCore/bytecode
-I./JavaScriptCore/bytecompiler -I./JavaScriptCore/debugger
-I./JavaScriptCore/jit -I./JavaScriptCore/pcre -I./JavaScriptCore/profiler
-I./JavaScriptCore/runtime -I./JavaScriptCore/wrec -I./JavaScriptCore/jit
-I./JavaScriptCore/assembler -I./JavaScriptCore/wtf/unicode
-I./JavaScriptCore/yarr -I./JavaScriptCore/pcre -I./JavaScriptCore/parser
-I./JavaScriptCore/runtime
-DTEST_PLUGIN_DIR=\"/home/dan/xenon/buildroot/output/build/webkit-r44552/./TestNetscapePlugin/.libs\"
-fno-strict-aliasing -I./WebKitTools/DumpRenderTree
-I./WebKitTools/DumpRenderTree/gtk -I./WebKit/gtk -I./WebKit/gtk
-DBUILDING_CAIRO__=1 -DBUILDING_GTK__=1 -DWTF_CHANGES -DWTF_USE_ICU_UNICODE=1  
-DNDEBUG  -I./JavaScriptCore/ForwardingHeaders -I./JavaScriptCore/parser
-I./JavaScriptCore/wtf -I./DerivedSources -I./JavaScriptCore
-I./JavaScriptCore/API -I./JavaScriptCore/ForwardingHeaders
-I./JavaScriptCore/interpreter -I./JavaScriptCore/bytecode
-I./JavaScriptCore/bytecompiler -I./JavaScriptCore/debugger
-I./JavaScriptCore/jit -I./JavaScriptCore/pcre -I./JavaScriptCore/profiler
-I./JavaScriptCore/runtime -I./JavaScriptCore/wrec -I./JavaScriptCore/jit
-I./JavaScriptCore/assembler -I./JavaScriptCore/wtf/unicode
-I./JavaScriptCore/yarr -I./JavaScriptCore/pcre -I./JavaScriptCore/parser
-I./JavaScriptCore/runtime
-DTEST_PLUGIN_DIR=\"/home/dan/xenon/buildroot/output/build/webkit-r44552/./TestNetscapePlugin/.libs\"
-Wall -W -Wcast-align -Wchar-subscripts -Wreturn-type -Wformat
-Wformat-security -Wno-format-y2k -Wundef -Wmissing-format-attribute
-Wpointer-arith -Wwrite-strings -Wno-unused-parameter -Wno-parentheses
-fno-exceptions -fvisibility=hidden 
-I/home/dan/xenon/buildroot/output/staging/usr/include/cairo
-I/home/dan/xenon/buildroot/output/staging/usr/include/freetype2
-I/home/dan/xenon/buildroot/output/staging/usr/include/libpng12
-I/home/dan/xenon/buildroot/output/staging/usr/include/pixman-1  
-I/home/dan/xenon/buildroot/output/staging/usr/include/gtk-2.0
-I/home/dan/xenon/buildroot/output/staging/usr/lib/gtk-2.0/include
-I/home/dan/xenon/buildroot/output/staging/usr/include/atk-1.0
-I/home/dan/xenon/buildroot/output/staging/usr/include/cairo
-I/home/dan/xenon/buildroot/output/staging/usr/include/pango-1.0
-I/home/dan/xenon/buildroot/output/staging/usr/include/glib-2.0
-I/home/dan/xenon/buildroot/output/staging/usr/lib/glib-2.0/include
-I/home/dan/xenon/buildroot/output/staging/usr/include/freetype2
-I/home/dan/xenon/buildroot/output/staging/usr/include/libpng12
-I/home/dan/xenon/buildroot/output/staging/usr/include/pixman-1  
-I/home/dan/xenon/buildroot/output/staging/usr/include/libsoup-2.4
-I/home/dan/xenon/buildroot/output/staging/usr/include/libxml2
-I/home/dan/xenon/buildroot/output/staging/usr/include/glib-2.0
-I/home/dan/xenon/buildroot/output/staging/usr/lib/glib-2.0/include   -Os -pipe
-Os  -I/home/dan/xenon/buildroot/output/staging/usr/include
-I/home/dan/xenon/buildroot/output/staging/include
--sysroot=/home/dan/xenon/buildroot/output/staging/ -isysroot
/home/dan/xenon/buildroot/output/staging -mtune=i686 -march=i686
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2
-no-fast-install -no-install -L/home/dan/xenon/buildroot/output/staging/lib
-L/home/dan/xenon/buildroot/output/staging/usr/lib
--sysroot=/home/dan/xenon/buildroot/output/staging/ -o Programs/DumpRenderTree
WebKitTools/DumpRenderTree/Programs_DumpRenderTree-GCController.o
WebKitTools/DumpRenderTree/Programs_DumpRenderTree-LayoutTestController.o
WebKitTools/DumpRenderTree/Programs_DumpRenderTree-WorkQueue.o
WebKitTools/DumpRenderTree/gtk/Programs_DumpRenderTree-DumpRenderTree.o
WebKitTools/DumpRenderTree/gtk/Programs_DumpRenderTree-GCControllerGtk.o
WebKitTools/DumpRenderTree/gtk/Programs_DumpRenderTree-LayoutTestControllerGtk.o
WebKitTools/DumpRenderTree/gtk/Programs_DumpRenderTree-WorkQueueItemGtk.o
libwebkit-1.0.la  -lcairo   -lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0
-lgdk_pixbuf-2.0 -lpangocairo-1.0 -lpango-1.0 -lcairo -lgobject-2.0
-lgmodule-2.0 -lglib-2.0 -lintl   -pthread -lgobject-2.0 -lgthread-2.0
-lglib-2.0 -lintl   -lsoup-2.4 -lgio-2.0 -lgobject-2.0 -lgmodule-2.0 -lglib-2.0
-lintl                                                                 
libtool: link:
/home/dan/xenon/buildroot/output/staging/usr/bin/i686-linux-uclibc-gcc -Os
-pipe -Os -I/home/dan/xenon/buildroot/output/staging/usr/include
-I/home/dan/xenon/buildroot/output/staging/include
--sysroot=/home/dan/xenon/buildroot/output/staging/ -isysroot
/home/dan/xenon/buildroot/output/staging -mtune=i686 -march=i686
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -ansi
-fno-strict-aliasing -Wall -W -Wcast-align -Wchar-subscripts -Wreturn-type
-Wformat -Wformat-security -Wno-format-y2k -Wundef -Wmissing-format-attribute
-Wpointer-arith -Wwrite-strings -Wno-unused-parameter -Wno-parentheses
-fno-exceptions -fvisibility=hidden
-I/home/dan/xenon/buildroot/output/staging/usr/include/gtk-2.0
-I/home/dan/xenon/buildroot/output/staging/usr/lib/gtk-2.0/include
-I/home/dan/xenon/buildroot/output/staging/usr/include/atk-1.0
-I/home/dan/xenon/buildroot/output/staging/usr/include/cairo
-I/home/dan/xenon/buildroot/output/staging/usr/include/pango-1.0
-I/home/dan/xenon/buildroot/output/staging/usr/include/glib-2.0
-I/home/dan/xenon/buildroot/output/staging/usr/lib/glib-2.0/include
-I/home/dan/xenon/buildroot/output/staging/usr/include/freetype2
-I/home/dan/xenon/buildroot/output/staging/usr/include/libpng12
-I/home/dan/xenon/buildroot/output/staging/usr/include/pixman-1
-I/home/dan/xenon/buildroot/output/staging/usr/include/libsoup-2.4
-I/home/dan/xenon/buildroot/output/staging/usr/include/libxml2
-I/home/dan/xenon/buildroot/output/staging/usr/include/glib-2.0
-I/home/dan/xenon/buildroot/output/staging/usr/lib/glib-2.0/include -Os -pipe
-Os -I/home/dan/xenon/buildroot/output/staging/usr/include
-I/home/dan/xenon/buildroot/output/staging/include
--sysroot=/home/dan/xenon/buildroot/output/staging/ -isysroot
/home/dan/xenon/buildroot/output/staging -mtune=i686 -march=i686
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2
--sysroot=/home/dan/xenon/buildroot/output/staging/ -o Programs/GtkLauncher
WebKitTools/GtkLauncher/Programs_GtkLauncher-main.o -pthread 
-L/home/dan/xenon/buildroot/output/staging/lib
-L/home/dan/xenon/buildroot/output/staging/usr/lib ./.libs/libwebkit-1.0.so
/home/dan/xenon/buildroot/output/staging/usr/lib/libgtk-x11-2.0.so
/home/dan/xenon/buildroot/output/staging/usr/lib/libgdk-x11-2.0.so
/home/dan/xenon/buildroot/output/staging/usr/lib/libatk-1.0.so
/home/dan/xenon/buildroot/output/staging/usr/lib/libgdk_pixbuf-2.0.so
/home/dan/xenon/buildroot/output/staging/usr/lib/libpangocairo-1.0.so
/home/dan/xenon/buildroot/output/staging/usr/lib/libpango-1.0.so
/home/dan/xenon/buildroot/output/staging/usr/lib/libcairo.so
/home/dan/xenon/buildroot/output/staging/usr/lib/libgmodule-2.0.so
/home/dan/xenon/buildroot/output/staging/usr/lib/libgobject-2.0.so
/home/dan/xenon/buildroot/output/staging/usr/lib/libgthread-2.0.so
/home/dan/xenon/buildroot/output/staging/usr/lib/libglib-2.0.so
/home/dan/xenon/buildroot/output/staging/usr/lib/libintl.so -pthread -Wl,-rpath
-Wl,/home/dan/xenon/buildroot/output/build/webkit-r44552/.libs -Wl,-rpath
-Wl,/home/dan/xenon/buildroot/output/staging/usr/lib -Wl,-rpath
-Wl,/home/dan/xenon/buildroot/output/staging/usr/lib                            
libtool: link:
/home/dan/xenon/buildroot/output/staging/usr/bin/i686-linux-uclibc-g++ -Os
-pipe -Os -I/home/dan/xenon/buildroot/output/staging/usr/include
-I/home/dan/xenon/buildroot/output/staging/include
--sysroot=/home/dan/xenon/buildroot/output/staging/ -isysroot
/home/dan/xenon/buildroot/output/staging -mtune=i686 -march=i686
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -W
-Wcast-align -Wchar-subscripts -Wreturn-type -Wformat -Wformat-security
-Wno-format-y2k -Wundef -Wmissing-format-attribute -Wpointer-arith
-Wwrite-strings -Wno-unused-parameter -Wno-parentheses -fno-exceptions
-fvisibility=hidden -fvisibility-inlines-hidden -fno-rtti
-I./WebKitTools/DumpRenderTree -I./WebKitTools/DumpRenderTree/gtk
-I./WebKit/gtk -I./WebKit/gtk -DBUILDING_CAIRO__=1 -DBUILDING_GTK__=1
-DWTF_CHANGES -DWTF_USE_ICU_UNICODE=1 -DNDEBUG
-I./JavaScriptCore/ForwardingHeaders -I./JavaScriptCore/parser
-I./JavaScriptCore/wtf -I./DerivedSources -I./JavaScriptCore
-I./JavaScriptCore/API -I./JavaScriptCore/ForwardingHeaders
-I./JavaScriptCore/interpreter -I./JavaScriptCore/bytecode
-I./JavaScriptCore/bytecompiler -I./JavaScriptCore/debugger
-I./JavaScriptCore/jit -I./JavaScriptCore/pcre -I./JavaScriptCore/profiler
-I./JavaScriptCore/runtime -I./JavaScriptCore/wrec -I./JavaScriptCore/jit
-I./JavaScriptCore/assembler -I./JavaScriptCore/wtf/unicode
-I./JavaScriptCore/yarr -I./JavaScriptCore/pcre -I./JavaScriptCore/parser
-I./JavaScriptCore/runtime
-DTEST_PLUGIN_DIR=\"/home/dan/xenon/buildroot/output/build/webkit-r44552/./TestNetscapePlugin/.libs\"
-fno-strict-aliasing -I./WebKitTools/DumpRenderTree
-I./WebKitTools/DumpRenderTree/gtk -I./WebKit/gtk -I./WebKit/gtk
-DBUILDING_CAIRO__=1 -DBUILDING_GTK__=1 -DWTF_CHANGES -DWTF_USE_ICU_UNICODE=1
-DNDEBUG -I./JavaScriptCore/ForwardingHeaders -I./JavaScriptCore/parser
-I./JavaScriptCore/wtf -I./DerivedSources -I./JavaScriptCore
-I./JavaScriptCore/API -I./JavaScriptCore/ForwardingHeaders
-I./JavaScriptCore/interpreter -I./JavaScriptCore/bytecode
-I./JavaScriptCore/bytecompiler -I./JavaScriptCore/debugger
-I./JavaScriptCore/jit -I./JavaScriptCore/pcre -I./JavaScriptCore/profiler
-I./JavaScriptCore/runtime -I./JavaScriptCore/wrec -I./JavaScriptCore/jit
-I./JavaScriptCore/assembler -I./JavaScriptCore/wtf/unicode
-I./JavaScriptCore/yarr -I./JavaScriptCore/pcre -I./JavaScriptCore/parser
-I./JavaScriptCore/runtime
-DTEST_PLUGIN_DIR=\"/home/dan/xenon/buildroot/output/build/webkit-r44552/./TestNetscapePlugin/.libs\"
-Wall -W -Wcast-align -Wchar-subscripts -Wreturn-type -Wformat
-Wformat-security -Wno-format-y2k -Wundef -Wmissing-format-attribute
-Wpointer-arith -Wwrite-strings -Wno-unused-parameter -Wno-parentheses
-fno-exceptions -fvisibility=hidden
-I/home/dan/xenon/buildroot/output/staging/usr/include/cairo
-I/home/dan/xenon/buildroot/output/staging/usr/include/freetype2
-I/home/dan/xenon/buildroot/output/staging/usr/include/libpng12
-I/home/dan/xenon/buildroot/output/staging/usr/include/pixman-1
-I/home/dan/xenon/buildroot/output/staging/usr/include/gtk-2.0
-I/home/dan/xenon/buildroot/output/staging/usr/lib/gtk-2.0/include
-I/home/dan/xenon/buildroot/output/staging/usr/include/atk-1.0
-I/home/dan/xenon/buildroot/output/staging/usr/include/cairo
-I/home/dan/xenon/buildroot/output/staging/usr/include/pango-1.0
-I/home/dan/xenon/buildroot/output/staging/usr/include/glib-2.0
-I/home/dan/xenon/buildroot/output/staging/usr/lib/glib-2.0/include
-I/home/dan/xenon/buildroot/output/staging/usr/include/freetype2
-I/home/dan/xenon/buildroot/output/staging/usr/include/libpng12
-I/home/dan/xenon/buildroot/output/staging/usr/include/pixman-1
-I/home/dan/xenon/buildroot/output/staging/usr/include/libsoup-2.4
-I/home/dan/xenon/buildroot/output/staging/usr/include/libxml2
-I/home/dan/xenon/buildroot/output/staging/usr/include/glib-2.0
-I/home/dan/xenon/buildroot/output/staging/usr/lib/glib-2.0/include -Os -pipe
-Os -I/home/dan/xenon/buildroot/output/staging/usr/include
-I/home/dan/xenon/buildroot/output/staging/include
--sysroot=/home/dan/xenon/buildroot/output/staging/ -isysroot
/home/dan/xenon/buildroot/output/staging -mtune=i686 -march=i686
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2
--sysroot=/home/dan/xenon/buildroot/output/staging/ -o Programs/DumpRenderTree
WebKitTools/DumpRenderTree/Programs_DumpRenderTree-GCController.o
WebKitTools/DumpRenderTree/Programs_DumpRenderTree-LayoutTestController.o
WebKitTools/DumpRenderTree/Programs_DumpRenderTree-WorkQueue.o
WebKitTools/DumpRenderTree/gtk/Programs_DumpRenderTree-DumpRenderTree.o
WebKitTools/DumpRenderTree/gtk/Programs_DumpRenderTree-GCControllerGtk.o
WebKitTools/DumpRenderTree/gtk/Programs_DumpRenderTree-LayoutTestControllerGtk.o
WebKitTools/DumpRenderTree/gtk/Programs_DumpRenderTree-WorkQueueItemGtk.o
-pthread  -L/home/dan/xenon/buildroot/output/staging/lib
-L/home/dan/xenon/buildroot/output/staging/usr/lib ./.libs/libwebkit-1.0.so
/home/dan/xenon/buildroot/output/staging/usr/lib/libgtk-x11-2.0.so
/home/dan/xenon/buildroot/output/staging/usr/lib/libgdk-x11-2.0.so
/home/dan/xenon/buildroot/output/staging/usr/lib/libatk-1.0.so
/home/dan/xenon/buildroot/output/staging/usr/lib/libgdk_pixbuf-2.0.so
/home/dan/xenon/buildroot/output/staging/usr/lib/libpangocairo-1.0.so
/home/dan/xenon/buildroot/output/staging/usr/lib/libpango-1.0.so
/home/dan/xenon/buildroot/output/staging/usr/lib/libcairo.so
/home/dan/xenon/buildroot/output/staging/usr/lib/libgthread-2.0.so
/home/dan/xenon/buildroot/output/staging/usr/lib/libsoup-2.4.so
/home/dan/xenon/buildroot/output/staging/usr/lib/libgio-2.0.so
/home/dan/xenon/buildroot/output/staging/usr/lib/libgobject-2.0.so
/home/dan/xenon/buildroot/output/staging/usr/lib/libgmodule-2.0.so
/home/dan/xenon/buildroot/output/staging/usr/lib/libglib-2.0.so
/home/dan/xenon/buildroot/output/staging/usr/lib/libintl.so -pthread -Wl,-rpath
-Wl,/home/dan/xenon/buildroot/output/build/webkit-r44552/.libs -Wl,-rpath
-Wl,/home/dan/xenon/buildroot/output/staging/usr/lib -Wl,-rpath
-Wl,/home/dan/xenon/buildroot/output/staging/usr/lib
/home/dan/xenon/buildroot/output/staging/usr/lib/libgio-2.0.so.0: warning: the
use of LEGACY `utimes' is discouraged, use `utime'
/home/dan/xenon/buildroot/output/staging/usr/bin/../lib/gcc/i686-linux-uclibc/4.4.3/../../../../i686-linux-uclibc/bin/ld:
warning: libstdc++.so.6, needed by ./.libs/libwebkit-1.0.so, not found (try
using -rpath or -rpath-link)
/home/dan/xenon/buildroot/output/staging/usr/lib/libicui18n.so.38: undefined
reference to `operator delete(void*)@GLIBCXX_3.4'
./.libs/libwebkit-1.0.so: undefined reference to `operator delete(void*,
std::nothrow_t const&)@GLIBCXX_3.4'
./.libs/libwebkit-1.0.so: undefined reference to
`__cxa_guard_release at CXXABI_1.3'
./.libs/libwebkit-1.0.so: undefined reference to
`__cxa_guard_acquire at CXXABI_1.3'
./.libs/libwebkit-1.0.so: undefined reference to `std::nothrow at GLIBCXX_3.4'
/home/dan/xenon/buildroot/output/staging/usr/lib/libicui18n.so.38: undefined
reference to `vtable for __cxxabiv1::__class_type_info at CXXABI_1.3'
/home/dan/xenon/buildroot/output/staging/usr/lib/libicui18n.so.38: undefined
reference to `__gxx_personality_v0 at CXXABI_1.3'
./.libs/libwebkit-1.0.so: undefined reference to `operator new(unsigned int,
std::nothrow_t const&)@GLIBCXX_3.4'
/home/dan/xenon/buildroot/output/staging/usr/lib/libicui18n.so.38: undefined
reference to `vtable for __cxxabiv1::__si_class_type_info at CXXABI_1.3'
/home/dan/xenon/buildroot/output/staging/usr/lib/libicui18n.so.38: undefined
reference to `vtable for __cxxabiv1::__vmi_class_type_info at CXXABI_1.3'
./.libs/libwebkit-1.0.so: undefined reference to
`__cxa_pure_virtual at CXXABI_1.3'
collect2: ld returned 1 exit status
make[2]: *** [Programs/GtkLauncher] Error 1
make[2]: *** Waiting for unfinished jobs....
/home/dan/xenon/buildroot/output/staging/usr/lib/libgio-2.0.so: warning: the
use of LEGACY `utimes' is discouraged, use `utime'
make[2]: Leaving directory
`/home/dan/xenon/buildroot/output/build/webkit-r44552'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/dan/xenon/buildroot/output/build/webkit-r44552'
make: *** [/home/dan/xenon/buildroot/output/build/webkit-r44552/.stamp_built]
Error 2

How do I fix this?
Does it panic when it doesn't find GCC 3.4?
I recall hearing something about libstdc++ not being compiled along with g++ as
you'd expect.

Note: C++ compiler installed - blackbox was compiled.

Config file attached.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
