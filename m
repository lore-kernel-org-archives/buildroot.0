From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 27 Dec 2009 18:13:20 +0000 (UTC)
Subject: [Buildroot] [Bug 355] Please update WebKit - it doesn't compile!
In-Reply-To: <bug-355-163@https.bugs.busybox.net/>
References: <bug-355-163@https.bugs.busybox.net/>
Message-ID: <20091227181320.5B4AD777BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=355





--- Comment #8 from Dan Dart <dandart@googlemail.com>  2009-12-27 18:13:19 UTC ---
> Do you still see problems with latest git now that we're using r44552?

Yes. And it looks like it's in the same place.

./doltlibtool  --tag=CXX   --mode=compile
/home/dan/xenon/buildroot/output/staging/usr/bin/i686-linux-uclibc-g++ -Os
-pipe -Os  -I/home/dan/xenon/buildroot/output/staging/usr/include
-I/home/dan/xenon/buildroot/output/staging/include
--sysroot=/home/dan/xenon/buildroot/output/staging/ -isysroot
/home/dan/xenon/buildroot/output/staging -mtune=i686 -march=i686
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DHAVE_CONFIG_H -I.  -DBUILDING_CAIRO__=1 -DBUILDING_GTK__=1 -DWTF_CHANGES
-DWTF_USE_ICU_UNICODE=1   -DNDEBUG  -I./JavaScriptCore/ForwardingHeaders
-I./JavaScriptCore/parser -I./JavaScriptCore/wtf -I./DerivedSources
-I./JavaScriptCore -I./JavaScriptCore/API -I./JavaScriptCore/ForwardingHeaders
-I./JavaScriptCore/interpreter -I./JavaScriptCore/bytecode
-I./JavaScriptCore/bytecompiler -I./JavaScriptCore/debugger
-I./JavaScriptCore/jit -I./JavaScriptCore/pcre -I./JavaScriptCore/profiler
-I./JavaScriptCore/runtime -I./JavaScriptCore/wrec -I./JavaScriptCore/jit
-I./JavaScriptCore/assembler -I./JavaScriptCore/wtf/unicode
-I./JavaScriptCore/yarr -I./JavaScriptCore/pcre -I./JavaScriptCore/parser
-I./JavaScriptCore/runtime  -Wall -W -Wcast-align -Wchar-subscripts
-Wreturn-type -Wformat -Wformat-security -Wno-format-y2k -Wundef
-Wmissing-format-attribute -Wpointer-arith -Wwrite-strings
-Wno-unused-parameter -Wno-parentheses -fno-exceptions -fvisibility=hidden
-fvisibility-inlines-hidden -fno-rtti -fstrict-aliasing -O3 -Wall -W
-Wcast-align -Wchar-subscripts -Wreturn-type -Wformat -Wformat-security
-Wno-format-y2k -Wundef -Wmissing-format-attribute -Wpointer-arith
-Wwrite-strings -Wno-unused-parameter -Wno-parentheses -fno-exceptions
-fvisibility=hidden -pthread
-I/home/dan/xenon/buildroot/output/staging/usr/include/glib-2.0
-I/home/dan/xenon/buildroot/output/staging/usr/lib/glib-2.0/include  
-D_REENTRANT -I/home/dan/xenon/buildroot/output/staging/usr/include -Os -pipe
-Os  -I/home/dan/xenon/buildroot/output/staging/usr/include
-I/home/dan/xenon/buildroot/output/staging/include
--sysroot=/home/dan/xenon/buildroot/output/staging/ -isysroot
/home/dan/xenon/buildroot/output/staging -mtune=i686 -march=i686
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -MT
JavaScriptCore/libJavaScriptCore_la-AllInOneFile.lo -MD -MP -MF
JavaScriptCore/.deps/libJavaScriptCore_la-AllInOneFile.Tpo -c -o
JavaScriptCore/libJavaScriptCore_la-AllInOneFile.lo `test -f
'JavaScriptCore/AllInOneFile.cpp' || echo './'`JavaScriptCore/AllInOneFile.cpp  
In file included from JavaScriptCore/runtime/JSFunction.cpp:26,                 
                 from JavaScriptCore/AllInOneFile.cpp:35:                       
JavaScriptCore/runtime/JSFunction.h: In member function ?JSC::JSValue (*
JSC::JSFunction::nativeFunction())(JSC::ExecState*, JSC::JSObject*,
JSC::JSValue, const JSC::ArgList&)?:                                          
JavaScriptCore/runtime/JSFunction.h:87: warning: dereferencing type-punned
pointer will break strict-aliasing rules   
JavaScriptCore/runtime/JSFunction.h: In member function ?JSC::ScopeChain&
JSC::JSFunction::scopeChain()?:             
JavaScriptCore/runtime/JSFunction.h:104: warning: dereferencing type-punned
pointer will break strict-aliasing rules  
JavaScriptCore/runtime/JSFunction.h: In member function ?void
JSC::JSFunction::setScopeChain(const JSC::ScopeChain&)?:
JavaScriptCore/runtime/JSFunction.h:119: warning: dereferencing type-punned
pointer will break strict-aliasing rules  
JavaScriptCore/runtime/JSFunction.h: In member function ?void
JSC::JSFunction::setNativeFunction(JSC::JSValue (*)(JSC::ExecState*,
JSC::JSObject*, JSC::JSValue, const JSC::ArgList&))?:                         
JavaScriptCore/runtime/JSFunction.h:123: warning: dereferencing type-punned
pointer will break strict-aliasing rules  
In file included from JavaScriptCore/AllInOneFile.cpp:47:                       
JavaScriptCore/runtime/Collector.cpp: In function ?void*
JSC::currentThreadStackBase()?:                              
JavaScriptCore/runtime/Collector.cpp:451: error: ?pthread_getattr_np? was
not declared in this scope                  
mv -f JavaScriptCore/yarr/.deps/libJavaScriptCore_la-RegexJIT.Tpo
JavaScriptCore/yarr/.deps/libJavaScriptCore_la-RegexJIT.Plo                     
./doltlibtool  --tag=CXX   --mode=compile
/home/dan/xenon/buildroot/output/staging/usr/bin/i686-linux-uclibc-g++ -Os
-pipe -Os  -I/home/dan/xenon/buildroot/output/staging/usr/include
-I/home/dan/xenon/buildroot/output/staging/include
--sysroot=/home/dan/xenon/buildroot/output/staging/ -isysroot
/home/dan/xenon/buildroot/output/staging -mtune=i686 -march=i686
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DHAVE_CONFIG_H -I.  -DBUILDING_CAIRO__=1 -DBUILDING_GTK__=1 -DWTF_CHANGES
-DWTF_USE_ICU_UNICODE=1   -DNDEBUG  -I./JavaScriptCore/ForwardingHeaders
-I./JavaScriptCore/parser -I./JavaScriptCore/wtf -I./DerivedSources
-I./JavaScriptCore -I./JavaScriptCore/API -I./JavaScriptCore/ForwardingHeaders
-I./JavaScriptCore/interpreter -I./JavaScriptCore/bytecode
-I./JavaScriptCore/bytecompiler -I./JavaScriptCore/debugger
-I./JavaScriptCore/jit -I./JavaScriptCore/pcre -I./JavaScriptCore/profiler
-I./JavaScriptCore/runtime -I./JavaScriptCore/wrec -I./JavaScriptCore/jit
-I./JavaScriptCore/assembler -I./JavaScriptCore/wtf/unicode
-I./JavaScriptCore/yarr -I./JavaScriptCore/pcre -I./JavaScriptCore/parser
-I./JavaScriptCore/runtime  -Wall -W -Wcast-align -Wchar-subscripts
-Wreturn-type -Wformat -Wformat-security -Wno-format-y2k -Wundef
-Wmissing-format-attribute -Wpointer-arith -Wwrite-strings
-Wno-unused-parameter -Wno-parentheses -fno-exceptions -fvisibility=hidden
-fvisibility-inlines-hidden -fno-rtti -fstrict-aliasing -O3 -Wall -W
-Wcast-align -Wchar-subscripts -Wro-format-y2k -Wundef
-Wmissing-format-attribute -Wpointer-arith -Wwrite-strin -fno-exceptions
-fvisibility=hidden -pthread
-I/home/dan/xenon/buildroot/outdan/xenon/buildroot/output/staging/usr/lib/glib-2.0/include
  -D_REENTRANT -Iusr/include -Os -pipe -Os 
-I/home/dan/xenon/buildroot/output/staging/usr/inctaging/include
--sysroot=/home/dan/xenon/buildroot/output/staging/ -isysroot -mtune=i686
-march=i686 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFF/libJavaScriptCore_la-ParserArena.lo -MD -MP -MF
JavaScriptCore/parser/.deps/o
JavaScriptCore/parser/libJavaScriptCore_la-ParserArena.lo `test -f
'JavaScr./'`JavaScriptCore/parser/ParserArena.cpp
make[2]: *** [JavaScriptCore/libJavaScriptCore_la-AllInOneFile.lo] Error 1
make[2]: *** Waiting for unfinished jobs....
mv -f JavaScriptCore/parser/.deps/libJavaScriptCore_la-ParserArena.Tpo
JavaSca-ParserArena.Plo
make[2]: Leaving directory `/home/dan/xenon/buildroot/output/build/webkit-r44
make[1]: *** [all] Error 2
make[1]: Leaving directory `/home/dan/xenon/buildroot/output/build/webkit-r44
make: *** [/home/dan/xenon/buildroot/output/build/webkit-r44552/.stamp_built]


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
