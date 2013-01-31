From: john <john.osullivan@cloudiumsystems.com>
Date: Thu, 31 Jan 2013 11:05:53 +0000
Subject: [Buildroot] Problem build haserl with lua support
Message-ID: <1359630353.9888.41.camel@john-ubu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm using Buildroot 2012.05 and am trying to configure haserl v0.9.X
with lua support. I select the lua intrepreter and have not selected lua
library modules.

The relevant config section is:
# Interpreter languages and scripting
#
BR2_PACKAGE_HASERL=y
BR2_PACKAGE_HASERL_WITH_LUA=y
# BR2_PACKAGE_HASERL_VERSION_0_8_X is not set
BR2_PACKAGE_HASERL_VERSION_0_9_X=y
BR2_PACKAGE_HASERL_VERSION="0.9.29"
BR2_PACKAGE_LUA=y
# BR2_PACKAGE_LUA_COMPILER is not set
BR2_PACKAGE_LUA_INTERPRETER=y
# BR2_PACKAGE_LUA_INTERPRETER_READLINE is not set
BR2_PACKAGE_LUA_SHARED_LIBRARY=y

#
# LUA libraries/modules
#
# BR2_PACKAGE_CGILUA is not set
# BR2_PACKAGE_COPAS is not set
# BR2_PACKAGE_COXPCALL is not set
# BR2_PACKAGE_LUAFILESYSTEM is not set
# BR2_PACKAGE_LUASOCKET is not set
# BR2_PACKAGE_RINGS is not set
# BR2_PACKAGE_WSAPI is not set
# BR2_PACKAGE_XAVANTE is not set
# BR2_PACKAGE_MICROPERL is not set
# BR2_PACKAGE_PHP is not set
# BR2_PACKAGE_PYTHON is not set
# BR2_PACKAGE_RUBY is not set
# BR2_PACKAGE_TCL is not set

I am getting the following error when I try and build:

>>> host-lua 5.1.4 Building
sed -i -e
's/-O2//' /home/myname/src/shannon/buildroot-2012.05/output/build/host-lua-5.1.4/src/Makefile
sed -i -e 's/\/usr
\/local/\/usr/' /home/myname/src/shannon/buildroot-2012.05/output/build/host-lua-5.1.4/etc/lua.pc
/usr/bin/make -j2 MYCFLAGS="-fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX"
MYLIBS="-ldl" PKG_VERSION=5.1.4
-C /home/myname/src/shannon/buildroot-2012.05/output/build/host-lua-5.1.4/src all
make[1]: Entering directory
`/home/myname/src/shannon/buildroot-2012.05/output/build/host-lua-5.1.4/src'
gcc -o liblua.so.5.1.4 -shared -Wl,-soname="liblua.so.5.1.4" lapi.o
lcode.o ldebug.o ldo.o ldump.o lfunc.o lgc.o llex.o lmem.o lobject.o
lopcodes.o lparser.o lstate.o lstring.o ltable.o ltm.o lundump.o lvm.o
lzio.o lauxlib.o lbaselib.o ldblib.o liolib.o lmathlib.o loslib.o
ltablib.o lstrlib.o loadlib.o linit.o -nostdlib -lgcc
ldo.o: In function `luaD_callhook':
ldo.c:(.text+0x825): undefined reference to `__stack_chk_fail_local'
ldump.o: In function `DumpHeader':
ldump.c:(.text+0x54a): undefined reference to `__stack_chk_fail_local'
llex.o: In function `luaX_lexerror':
llex.c:(.text+0x31b): undefined reference to `__stack_chk_fail_local'
lobject.o: In function `luaO_pushvfstring':
lobject.c:(.text+0x632): undefined reference to `__stack_chk_fail_local'
lundump.o: In function `LoadHeader':
lundump.c:(.text+0x9a9): undefined reference to `__stack_chk_fail_local'
lvm.o:lvm.c:(.text+0x11c): more undefined references to
`__stack_chk_fail_local' follow
collect2: ld returned 1 exit status
make[1]: *** [liblua.so] Error 1

If I select v0.8.X of haserl and separately select the lua option it
builds okay, of course then I don't get lua support integrated into
haserl. Any suggestions on how I can fix this?

regards
