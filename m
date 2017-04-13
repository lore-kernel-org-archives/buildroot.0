From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Apr 2017 22:38:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/rapidjson: switch to CMake
In-Reply-To: <20170409153516.896-1-bernd.kuhls@t-online.de>
References: <20170409153516.896-1-bernd.kuhls@t-online.de>
Message-ID: <20170413223831.0e36831e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Apr 2017 17:35:16 +0200, Bernd Kuhls wrote:
> Upcoming Kodi v18 depends on RapidJSON and detects it by using pkg-conf:
> https://github.com/xbmc/xbmc/blob/master/cmake/modules/FindRapidJSON.cmake#L13
> 
> Currently our package installs only the header files, but RapidJSON.pc
> is also needed. Luckily this can be fixed by just switching to CMake
> which does the job.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/rapidjson/rapidjson.mk | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

With this patch applied, rapidjson does not build:

>>> rapidjson v1.1.0 Building
PATH="/home/thomas/projets/buildroot/output/host/bin:/home/thomas/projets/buildroot/output/host/sbin:/home/thomas/projets/buildroot/output/host/usr/bin:/home/thomas/projets/buildroot/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/thomas/.rvm/bin:/home/thomas/sys/bin:/home/thomas/.gem/ruby/2.1.0/bin:/home/thomas/.rvm/bin"  /usr/bin/make -j5  -C /home/thomas/projets/buildroot/output/build/rapidjson-v1.1.0/
Scanning dependencies of target simplereader
Scanning dependencies of target pretty
Scanning dependencies of target parsebyparts
Scanning dependencies of target filterkeydom
Scanning dependencies of target simpledom
[  6%] Building CXX object example/CMakeFiles/simplereader.dir/simplereader/simplereader.cpp.o
[  6%] Building CXX object example/CMakeFiles/pretty.dir/pretty/pretty.cpp.o
[ 10%] Building CXX object example/CMakeFiles/filterkeydom.dir/filterkeydom/filterkeydom.cpp.o
[ 13%] Building CXX object example/CMakeFiles/simpledom.dir/simpledom/simpledom.cpp.o
cc1plus: error: unrecognized argument in option ?-march=native?
cc1plus: note: valid arguments to ?-march=? are: armv2 armv2a armv3 armv3m armv4 armv4t armv5 armv5e armv5t armv5te armv6 armv6-m armv6j armv6k armv6s-m armv6t2 armv6z armv6zk armv7 armv7-a armv7-m armv7-r armv7e-m armv8-a iwmmxt iwmmxt2 native
cc1plus: error: unrecognized argument in option ?-march=native?
cc1plus: note: valid arguments to ?-march=? are: armv2 armv2a armv3 armv3m armv4 armv4t armv5 armv5e armv5t armv5te armv6 armv6-m armv6j armv6k armv6s-m armv6t2 armv6z armv6zk armv7 armv7-a armv7-m armv7-r armv7e-m armv8-a iwmmxt iwmmxt2 native
cc1plus: error: unrecognized argument in option ?-march=native?
cc1plus: note: valid arguments to ?-march=? are: armv2 armv2a armv3 armv3m armv4 armv4t armv5 armv5e armv5t armv5te armv6 armv6-m armv6j armv6k armv6s-m armv6t2 armv6z armv6zk armv7 armv7-a armv7-m armv7-r armv7e-m armv8-a iwmmxt iwmmxt2 native
example/CMakeFiles/pretty.dir/build.make:62: recipe for target 'example/CMakeFiles/pretty.dir/pretty/pretty.cpp.o' failed
make[4]: *** [example/CMakeFiles/pretty.dir/pretty/pretty.cpp.o] Error 1
cc1plus: error: unrecognized argument in option ?-march=native?
cc1plus: note: valid arguments to ?-march=? are: armv2 armv2a armv3 armv3m armv4 armv4t armv5 armv5e armv5t armv5te armv6 armv6-m armv6j armv6k armv6s-m armv6t2 armv6z armv6zk armv7 armv7-a armv7-m armv7-r armv7e-m armv8-a iwmmxt iwmmxt2 native
CMakeFiles/Makefile2:734: recipe for target 'example/CMakeFiles/pretty.dir/all' failed
make[3]: *** [example/CMakeFiles/pretty.dir/all] Error 2
make[3]: *** Waiting for unfinished jobs....
[ 16%] Building CXX object example/CMakeFiles/parsebyparts.dir/parsebyparts/parsebyparts.cpp.o
example/CMakeFiles/filterkeydom.dir/build.make:62: recipe for target 'example/CMakeFiles/filterkeydom.dir/filterkeydom/filterkeydom.cpp.o' failed
make[4]: *** [example/CMakeFiles/filterkeydom.dir/filterkeydom/filterkeydom.cpp.o] Error 1
example/CMakeFiles/simpledom.dir/build.make:62: recipe for target 'example/CMakeFiles/simpledom.dir/simpledom/simpledom.cpp.o' failed
make[4]: *** [example/CMakeFiles/simpledom.dir/simpledom/simpledom.cpp.o] Error 1
CMakeFiles/Makefile2:290: recipe for target 'example/CMakeFiles/filterkeydom.dir/all' failed
make[3]: *** [example/CMakeFiles/filterkeydom.dir/all] Error 2
CMakeFiles/Makefile2:216: recipe for target 'example/CMakeFiles/simpledom.dir/all' failed
make[3]: *** [example/CMakeFiles/simpledom.dir/all] Error 2
example/CMakeFiles/simplereader.dir/build.make:62: recipe for target 'example/CMakeFiles/simplereader.dir/simplereader/simplereader.cpp.o' failed
make[4]: *** [example/CMakeFiles/simplereader.dir/simplereader/simplereader.cpp.o] Error 1
CMakeFiles/Makefile2:253: recipe for target 'example/CMakeFiles/simplereader.dir/all' failed
make[3]: *** [example/CMakeFiles/simplereader.dir/all] Error 2
cc1plus: error: unrecognized argument in option ?-march=native?
cc1plus: note: valid arguments to ?-march=? are: armv2 armv2a armv3 armv3m armv4 armv4t armv5 armv5e armv5t armv5te armv6 armv6-m armv6j armv6k armv6s-m armv6t2 armv6z armv6zk armv7 armv7-a armv7-m armv7-r armv7e-m armv8-a iwmmxt iwmmxt2 native
example/CMakeFiles/parsebyparts.dir/build.make:62: recipe for target 'example/CMakeFiles/parsebyparts.dir/parsebyparts/parsebyparts.cpp.o' failed
make[4]: *** [example/CMakeFiles/parsebyparts.dir/parsebyparts/parsebyparts.cpp.o] Error 1
CMakeFiles/Makefile2:327: recipe for target 'example/CMakeFiles/parsebyparts.dir/all' failed
make[3]: *** [example/CMakeFiles/parsebyparts.dir/all] Error 2
Makefile:127: recipe for target 'all' failed
make[2]: *** [all] Error 2
package/pkg-generic.mk:227: recipe for target '/home/thomas/projets/buildroot/output/build/rapidjson-v1.1.0/.stamp_built' failed
make[1]: *** [/home/thomas/projets/buildroot/output/build/rapidjson-v1.1.0/.stamp_built] Error 2
Makefile:79: recipe for target '_all' failed
make: *** [_all] Error 2

Basically the -march=native added in CMakeLists.txt is bogus.

Could you look at fixing this?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
