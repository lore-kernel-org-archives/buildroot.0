From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 13 Jul 2012 12:47:41 +0000 (UTC)
Subject: [Buildroot] [Bug 5354] host-lua doesn't build for EFL elementary
In-Reply-To: <bug-5354-163@https.bugs.busybox.net/>
References: <bug-5354-163@https.bugs.busybox.net/>
Message-ID: <20120713124741.BFAD490B4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5354

--- Comment #1 from Vincent de RIBOU <belzo2005-dolphin@yahoo.fr> 2012-07-13 12:47:41 UTC ---
Here it is the log:


make -C /home/vincent/BR2/buildroot O=/home/vincent/BR2/qemu-i686-build/.
host-lua
>>> host-lua 5.1.4 Extracting
gzip -d -c /home/vincent/BR2/buildroot/dl/lua-5.1.4.tar.gz | tar
--strip-components=1 -C /home/vincent/BR2/qemu-i686-build/build/host-lua-5.1.4 
-xf -
>>> host-lua 5.1.4 Patching package//lua

Applying lua-bug3-boolean_expression.patch using patch: 
patching file src/lcode.c

Applying lua-bug4-table.patch using patch: 
patching file src/lvm.c

Applying lua-bug5-debug_getfenv.patch using patch: 
patching file src/ldblib.c

Applying lua-bug6-gc_performance.patch using patch: 
patching file src/llex.c

Applying lua-bug7-string_format.patch using patch: 
patching file src/lstrlib.c

Applying lua-bug8-io_read.patch using patch: 
patching file src/liolib.c

Applying lua-root-path.patch using patch: 
patching file src/luaconf.h

Applying lua-shared-libs.patch using patch: 
patching file Makefile
patching file src/ldo.h
patching file src/lfunc.h
patching file src/lmem.h
patching file src/lstring.h
patching file src/lundump.h
patching file src/Makefile
>>> host-lua 5.1.4 Configuring
>>> host-lua 5.1.4 Building
sed -i -e 's/-O2//'
/home/vincent/BR2/qemu-i686-build/build/host-lua-5.1.4/src/Makefile
sed -i -e 's/\/usr\/local/\/usr/'
/home/vincent/BR2/qemu-i686-build/build/host-lua-5.1.4/etc/lua.pc
/usr/bin/make -j8 MYCFLAGS="-fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX"
MYLIBS="-ldl" PKG_VERSION=5.1.4 -C
/home/vincent/BR2/qemu-i686-build/build/host-lua-5.1.4/src all
gcc -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX   -c -o lapi.o lapi.c
gcc -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX   -c -o lcode.o lcode.c
gcc -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX   -c -o ldebug.o ldebug.c
gcc -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX   -c -o ldo.o ldo.c
gcc -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX   -c -o ldump.o ldump.c
gcc -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX   -c -o lfunc.o lfunc.c
gcc -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX   -c -o lgc.o lgc.c
gcc -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX   -c -o llex.o llex.c
gcc -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX   -c -o lmem.o lmem.c
gcc -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX   -c -o lobject.o lobject.c
gcc -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX   -c -o lopcodes.o lopcodes.c
gcc -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX   -c -o lparser.o lparser.c
gcc -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX   -c -o lstate.o lstate.c
gcc -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX   -c -o lstring.o lstring.c
gcc -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX   -c -o ltable.o ltable.c
gcc -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX   -c -o ltm.o ltm.c
gcc -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX   -c -o lundump.o lundump.c
gcc -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX   -c -o lvm.o lvm.c
gcc -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX   -c -o lzio.o lzio.c
gcc -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX   -c -o lauxlib.o lauxlib.c
gcc -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX   -c -o lbaselib.o lbaselib.c
gcc -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX   -c -o ldblib.o ldblib.c
gcc -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX   -c -o liolib.o liolib.c
gcc -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX   -c -o lmathlib.o lmathlib.c
gcc -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX   -c -o loslib.o loslib.c
gcc -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX   -c -o ltablib.o ltablib.c
gcc -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX   -c -o lstrlib.o lstrlib.c
gcc -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX   -c -o loadlib.o loadlib.c
gcc -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX   -c -o linit.o linit.c
gcc -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX   -c -o lua.o lua.c
gcc -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX   -c -o luac.o luac.c
gcc -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX   -c -o print.o print.c
ar rcu liblua.a lapi.o lcode.o ldebug.o ldo.o ldump.o lfunc.o lgc.o llex.o
lmem.o lobject.o lopcodes.o lparser.o lstate.o lstring.o ltable.o ltm.o
lundump.o lvm.o lzio.o lauxlib.o lbaselib.o ldblib.o liolib.o lmathlib.o
loslib.o ltablib.o lstrlib.o loadlib.o linit.o
gcc -o liblua.so.5.1.4 -shared -Wl,-soname="liblua.so.5.1.4" lapi.o lcode.o
ldebug.o ldo.o ldump.o lfunc.o lgc.o llex.o lmem.o lobject.o lopcodes.o
lparser.o lstate.o lstring.o ltable.o ltm.o lundump.o lvm.o lzio.o lauxlib.o
lbaselib.o ldblib.o liolib.o lmathlib.o loslib.o ltablib.o lstrlib.o loadlib.o
linit.o -nostdlib -lgcc
ranlib liblua.a
ldebug.o: In function `addinfo':
ldebug.c:(.text+0x1822): undefined reference to `__stack_chk_fail_local'
ldo.o: In function `luaD_callhook':
ldo.c:(.text+0x825): undefined reference to `__stack_chk_fail_local'
ldump.o: In function `DumpHeader':
ldump.c:(.text+0x54a): undefined reference to `__stack_chk_fail_local'
llex.o: In function `luaX_lexerror':
llex.c:(.text+0x31b): undefined reference to `__stack_chk_fail_local'
lobject.o: In function `luaO_pushvfstring':
lobject.c:(.text+0x632): undefined reference to `__stack_chk_fail_local'
lundump.o:lundump.c:(.text+0x9a9): more undefined references to
`__stack_chk_fail_local' follow
collect2: ld returned 1 exit status
make[2]: *** [liblua.so] Error 1
make[1]: ***
[/home/vincent/BR2/qemu-i686-build/build/host-lua-5.1.4/.stamp_built] Error 2
make: *** [all] Error 2

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
