From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Date: Wed, 21 Dec 2016 19:56:59 -0300
Subject: [Buildroot] [PATCH] lzlib: depends on lua
In-Reply-To: <20161221234842.649a8277@free-electrons.com>
References: <20161221202244.7197-1-gustavo.zacarias@free-electrons.com>
 <20161221234842.649a8277@free-electrons.com>
Message-ID: <423a657c-f5bb-f7a8-bce5-30af25ed5fe1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/12/16 19:48, Thomas Petazzoni wrote:

> I'm probably missing something, but even without PPS we should have
> seen build failures of this package, no?
>
> Or because lzlib is after lua in alphabetic ordering, and nothing makes
> lzlib built before lua due to dependencies, we were lucky enough?
>
> Thanks!
>
> Thomas

Hi.
I didn't try to reproduce this outside PPS, but i'm inclined to side 
with your second theory, the failure looks like:

*****
-- The C compiler identification is GNU 4.8.3
-- Check for working C compiler: 
/home/gustavoz/b/pps3/output/host/usr/bin/arm-none-linux-gnueabi-gcc
-- Check for working C compiler: 
/home/gustavoz/b/pps3/output/host/usr/bin/arm-none-linux-gnueabi-gcc -- 
works
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Detecting C compile features
-- Detecting C compile features - done
DIST_NAME: lzlib
DIST_VERSION: 0.4.2
DIST_LICENSE: MIT/X11
DIST_AUTHOR: Tiago Dionizio
DIST_MAINTAINER: Peter Draho?
DIST_URL: http://luaforge.net/projects/lzlib/
DIST_DESC: Lua bindings to the ZLib compression library
DIST_DEPENDS:
CMake Error at 
/usr/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:148 (message):
   Could NOT find Lua (missing: LUA_LIBRARIES LUA_INCLUDE_DIR)
Call Stack (most recent call first):
   /usr/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:388 
(_FPHSA_FAILURE_MESSAGE)
   cmake/FindLua.cmake:113 (FIND_PACKAGE_HANDLE_STANDARD_ARGS)
   cmake/lua.cmake:116 (find_package)
   cmake/lua.cmake:163 (_lua_module_helper)
   CMakeLists.txt:15 (install_lua_module)


-- Configuring incomplete, errors occurred!
See also 
"/home/gustavoz/b/pps3/output/build/lzlib-0.4.3/CMakeFiles/CMakeOutput.log".
package/pkg-generic.mk:206: recipe for target 
'/home/gustavoz/b/pps3/output/build/lzlib-0.4.3/.stamp_configured' failed
make: *** 
[/home/gustavoz/b/pps3/output/build/lzlib-0.4.3/.stamp_configured] Error 1
*****

Even if lua was built i can reproduce this after cleaning the lzlib 
package staging and build directories.

Regards.
