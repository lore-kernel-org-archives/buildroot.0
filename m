From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 28 Aug 2013 12:47:55 +0200
Subject: [Buildroot] redis not building with ccache enabled
Message-ID: <6207A04461874603B0024CB383FFDEA7@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
 Hi

Redis is not building when the ccache build option is enabled.

>>> redis 2.6.11 Configuring
>>> redis 2.6.11 Building
PATH="/home/buildroot12git/output/host/bin:/home/buildroot12git/output/host/usr/bin:/home/buildroot12git/output/host/usr/sbin/:/usr/
local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/buildroot12git/output/host/usr/bin"
PERLLIB="/home/buildroot12git/output/host/usr/lib/perl" /usr/bin/make -j5
PATH="/home/buildroot12git/output/host/bin:/home/buildroot12git/output/host/usr/bin:/home/buildroot12git/output/host/usr/sbin/:/usr/
local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/buildroot12git/output/host/usr/bin"
AR="/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-ar"
AS="/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-as"
LD="/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-ld"
NM="/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-nm"
CC="/home/buildroot12git/output/host/usr/bin/ccache /home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc"
GCC="/home/buildroot12git/output/host/usr/bin/ccache /home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc"
CPP="/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-cpp"
CXX="/home/buildroot12git/output/host/usr/bin/ccache /home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++"
FC="/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gfortran"
RANLIB="/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-ranlib"
READELF="/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-readelf"
STRIP="/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-strip"
OBJCOPY="/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-objcopy"
OBJDUMP="/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-objdump" AR_FOR_BUILD="/usr/bin/ar"
AS_FOR_BUILD="/usr/bin/as" CC_FOR_BUILD="/home/buildroot12git/output/host/usr/bin/ccache /usr/bin/gcc"
GCC_FOR_BUILD="/home/buildroot12git/output/host/usr/bin/ccache /usr/bin/gcc"
CXX_FOR_BUILD="/home/buildroot12git/output/host/usr/bin/ccache /usr/bin/g++" FC_FOR_BUILD="/usr/bin/ld" LD_FOR_BUILD="/usr/bin/ld"
CPPFLAGS_FOR_BUILD="-I/home/buildroot12git/output/host/usr/include" CFLAGS_FOR_BUILD="-O2
-I/home/buildroot12git/output/host/usr/include" CXXFLAGS_FOR_BUILD="-O2 -I/home/buildroot12git/output/host/usr/include"
LDFLAGS_FOR_BUILD="-L/home/buildroot12git/output/host/lib -L/home/buildroot12git/output/host/usr/lib
-Wl,-rpath,/home/buildroot12git/output/host/usr/lib" FCFLAGS_FOR_BUILD=""
DEFAULT_ASSEMBLER="/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-as"
DEFAULT_LINKER="/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-ld" CPPFLAGS="-D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os "
CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os " LDFLAGS="" FCFLAGS=""
PKG_CONFIG="/home/buildroot12git/output/host/usr/bin/pkg-config" PERLLIB="/home/buildroot12git/output/host/usr/lib/perl"
STAGING_DIR="/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot"
PREFIX=/home/buildroot12git/output/target/usr MALLOC=libc  -C /home/buildroot12git/output/build/redis-2.6.11
make[1]: Entering directory `/home/buildroot12git/output/build/redis-2.6.11'
cd src && /usr/bin/make all
make[2]: Entering directory `/home/buildroot12git/output/build/redis-2.6.11/src'
rm -rf redis-server redis-sentinel redis-cli redis-benchmark redis-check-dump redis-check-aof *.o *.gcda *.gcno *.gcov redis.info
lcov-html
(cd ../deps && /usr/bin/make distclean)
make[3]: Entering directory `/home/buildroot12git/output/build/redis-2.6.11/deps'
(cd hiredis && /usr/bin/make clean) > /dev/null || true
(cd linenoise && /usr/bin/make clean) > /dev/null || true
(cd lua && /usr/bin/make clean) > /dev/null || true
(cd jemalloc && [ -f Makefile ] && /usr/bin/make distclean) > /dev/null || true
(rm -f .make-*)
make[3]: Leaving directory `/home/buildroot12git/output/build/redis-2.6.11/deps'
(rm -f .make-*)
echo STD=-std=c99 -pedantic >> .make-settings
echo WARN=-Wall >> .make-settings
echo OPT=-O2 >> .make-settings
echo MALLOC=libc >> .make-settings
echo CFLAGS=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  >> .make-settings
echo LDFLAGS= >> .make-settings
echo REDIS_CFLAGS= >> .make-settings
echo REDIS_LDFLAGS= >> .make-settings
echo PREV_FINAL_CFLAGS=-std=c99 -pedantic -Wall -O2 -g -rdynamic -ggdb -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -pipe -Os   -I../deps/hiredis -I../deps/linenoise -I../deps/lua/src >> .make-settings
echo PREV_FINAL_LDFLAGS=  -g -rdynamic -ggdb >> .make-settings
(cd ../deps && /usr/bin/make CC=/home/buildroot12git/output/host/usr/bin/ccache
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc hiredis linenoise lua)
make[3]: Entering directory `/home/buildroot12git/output/build/redis-2.6.11/deps'
make[3]: Nothing to be done for `/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc'.
(cd hiredis && /usr/bin/make clean) > /dev/null || true
(cd linenoise && /usr/bin/make clean) > /dev/null || true
(cd lua && /usr/bin/make clean) > /dev/null || true
(cd jemalloc && [ -f Makefile ] && /usr/bin/make distclean) > /dev/null || true
(rm -f .make-*)
(echo "" > .make-ldflags)
(echo "-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os " > .make-cflags)
MAKE hiredis
cd hiredis && /usr/bin/make static
MAKE linenoise
cd linenoise && /usr/bin/make
MAKE lua
cd lua/src && /usr/bin/make all CFLAGS="-O2 -Wall -DLUA_ANSI -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe
-Os " MYLDFLAGS="" AR="/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-ar rcu"
make[4]: Entering directory `/home/buildroot12git/output/build/redis-2.6.11/deps/linenoise'
/home/buildroot12git/output/host/usr/bin/ccache  -Wall -Os -g -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-pipe -Os  -c linenoise.c
/home/buildroot12git/output/host/usr/bin/ccache: invalid option -- 'W'
Usage:
    ccache [options]
    ccache compiler [compiler options]
    compiler [compiler options]          (via symbolic link)

Options:
    -c, --cleanup         delete old files and recalculate size counters
                          (normally not needed as this is done automatically)
    -C, --clear           clear the cache completely
    -F, --max-files=N     set maximum number of files in cache to N (use 0 for
                          no limit)
    -M, --max-size=SIZE   set maximum size of cache to SIZE (use 0 for no
                          limit; available suffixes: G, M and K; default
                          suffix: G)
    -s, --show-stats      show statistics summary
    -z, --zero-stats      zero statistics counters

    -h, --help            print this help text
    -V, --version         print version and copyright information

See also <http://ccache.samba.org>.
make[4]: *** [linenoise.o] Error 1
make[4]: Leaving directory `/home/buildroot12git/output/build/redis-2.6.11/deps/linenoise'
make[3]: *** [linenoise] Error 2
make[3]: *** Waiting for unfinished jobs....
make[4]: Entering directory `/home/buildroot12git/output/build/redis-2.6.11/deps/lua/src'
/home/buildroot12git/output/host/usr/bin/ccache -O2 -Wall -DLUA_ANSI -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -c -o lapi.o lapi.c
/home/buildroot12git/output/host/usr/bin/ccache -O2 -Wall -DLUA_ANSI -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -c -o lcode.o lcode.c
/home/buildroot12git/output/host/usr/bin/ccache: invalid option -- 'O'
Usage:
    ccache [options]
    ccache compiler [compiler options]
    compiler [compiler options]          (via symbolic link)

Options:
    -c, --cleanup         delete old files and recalculate size counters
                          (normally not needed as this is done automatically)
    -C, --clear           clear the cache completely
    -F, --max-files=N     set maximum number of files in cache to N (use 0 for
                          no limit)
    -M, --max-size=SIZE   set maximum size of cache to SIZE (use 0 for no
                          limit; available suffixes: G, M and K; default
                          suffix: G)
    -s, --show-stats      show statistics summary
    -z, --zero-stats      zero statistics counters

    -h, --help            print this help text
    -V, --version         print version and copyright information

See also <http://ccache.samba.org>.
make[4]: *** [lapi.o] Error 1
make[4]: *** Waiting for unfinished jobs....
/home/buildroot12git/output/host/usr/bin/ccache: invalid option -- 'O'
Usage:
    ccache [options]
    ccache compiler [compiler options]
    compiler [compiler options]          (via symbolic link)

Options:
    -c, --cleanup         delete old files and recalculate size counters
                          (normally not needed as this is done automatically)
    -C, --clear           clear the cache completely
    -F, --max-files=N     set maximum number of files in cache to N (use 0 for
                          no limit)
    -M, --max-size=SIZE   set maximum size of cache to SIZE (use 0 for no
                          limit; available suffixes: G, M and K; default
                          suffix: G)
    -s, --show-stats      show statistics summary
    -z, --zero-stats      zero statistics counters

    -h, --help            print this help text
    -V, --version         print version and copyright information

See also <http://ccache.samba.org>.
make[4]: *** [lcode.o] Error 1
make[4]: Leaving directory `/home/buildroot12git/output/build/redis-2.6.11/deps/lua/src'
make[3]: *** [lua] Error 2
make[4]: Entering directory `/home/buildroot12git/output/build/redis-2.6.11/deps/hiredis'
/home/buildroot12git/output/host/usr/bin/ccache -std=c99 -pedantic -c -O3 -fPIC -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -pipe -Os  -Wall -W -Wstrict-prototypes -Wwrite-strings -g -ggdb  net.c
/home/buildroot12git/output/host/usr/bin/ccache -std=c99 -pedantic -c -O3 -fPIC -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -pipe -Os  -Wall -W -Wstrict-prototypes -Wwrite-strings -g -ggdb  hiredis.c
cache directory                     /root/.buildroot-ccache
cache hit (direct)                446983
cache hit (preprocessed)           87739
cache miss                        172208
called for link                   128003
called for preprocessing           52918
multiple source files                420
compiler produced stdout              27
compile failed                     29765
preprocessor error                  9377
bad compiler arguments              8582
unsupported source language         5606
autoconf compile/link             125214
unsupported compiler option          231
no input file                      47115
files in cache                     71908
cache size                         933.3 Mbytes
max cache size                       1.0 Gbytes
/home/buildroot12git/output/host/usr/bin/ccache: invalid option -- 't'
Usage:
    ccache [options]
    ccache compiler [compiler options]
    compiler [compiler options]          (via symbolic link)

Options:
    -c, --cleanup         delete old files and recalculate size counters
                          (normally not needed as this is done automatically)
    -C, --clear           clear the cache completely
    -F, --max-files=N     set maximum number of files in cache to N (use 0 for
                          no limit)
    -M, --max-size=SIZE   set maximum size of cache to SIZE (use 0 for no
                          limit; available suffixes: G, M and K; default
                          suffix: G)
    -s, --show-stats      show statistics summary
    -z, --zero-stats      zero statistics counters

    -h, --help            print this help text
    -V, --version         print version and copyright information

See also <http://ccache.samba.org>.
cache directory                     /root/.buildroot-ccache
cache hit (direct)                446983
cache hit (preprocessed)           87739
cache miss                        172208
called for link                   128003
called for preprocessing           52918
multiple source files                420
compiler produced stdout              27
compile failed                     29765
preprocessor error                  9377
bad compiler arguments              8582
unsupported source language         5606
autoconf compile/link             125214
unsupported compiler option          231
no input file                      47115
files in cache                     71908
cache size                         933.3 Mbytes
max cache size                       1.0 Gbytes
/home/buildroot12git/output/host/usr/bin/ccache: invalid option -- 't'
Usage:
    ccache [options]
    ccache compiler [compiler options]
    compiler [compiler options]          (via symbolic link)

Options:
    -c, --cleanup         delete old files and recalculate size counters
                          (normally not needed as this is done automatically)
    -C, --clear           clear the cache completely
    -F, --max-files=N     set maximum number of files in cache to N (use 0 for
                          no limit)
    -M, --max-size=SIZE   set maximum size of cache to SIZE (use 0 for no
                          limit; available suffixes: G, M and K; default
                          suffix: G)
    -s, --show-stats      show statistics summary
    -z, --zero-stats      zero statistics counters

    -h, --help            print this help text
    -V, --version         print version and copyright information

See also <http://ccache.samba.org>.
make[4]: *** [net.o] Error 1
make[4]: *** Waiting for unfinished jobs....
make[4]: *** [hiredis.o] Error 1
make[4]: Leaving directory `/home/buildroot12git/output/build/redis-2.6.11/deps/hiredis'
make[3]: *** [hiredis] Error 2
make[3]: Leaving directory `/home/buildroot12git/output/build/redis-2.6.11/deps'
make[2]: [persist-settings] Error 2 (ignored)
    CC adlist.o
    CC anet.o
    CC ae.o
    CC dict.o
    CC redis.o
    CC sds.o
    CC zmalloc.o
    CC lzf_c.o
    CC lzf_d.o
    CC pqsort.o
    CC zipmap.o
    CC sha1.o
    CC ziplist.o
    CC release.o
    CC networking.o
    CC util.o
    CC object.o
    CC db.o
    CC replication.o
    CC rdb.o
    CC t_string.o
    CC t_list.o
    CC t_set.o
    CC t_zset.o
    CC t_hash.o
    CC config.o
    CC aof.o
    CC pubsub.o
    CC multi.o
    CC debug.o
    CC sort.o
    CC intset.o
    CC syncio.o
    CC migrate.o
    CC endianconv.o
    CC slowlog.o
    CC scripting.o
    CC bio.o
    CC rio.o
    CC rand.o
    CC crc64.o
    CC memtest.o
    CC bitops.o
    CC sentinel.o
    CC redis-cli.o
    CC redis-benchmark.o
    CC redis-check-dump.o
    CC redis-check-aof.o
    LINK redis-cli
    LINK redis-server
arm-buildroot-linux-uclibcgnueabi-gcc: error: ../deps/hiredis/libhiredis.a: No such file or directory
arm-buildroot-linux-uclibcgnueabi-gcc: error: ../deps/linenoise/linenoise.o: No such file or directory
arm-buildroot-linux-uclibcgnueabi-gcc: error: ../deps/hiredis/libhiredis.a: No such file or directory
arm-buildroot-linux-uclibcgnueabi-gcc: error: ../deps/lua/src/liblua.a: No such file or directory
make[2]: *** [redis-cli] Error 1
make[2]: *** Waiting for unfinished jobs....
make[2]: *** [redis-server] Error 1
    LINK redis-check-dump
    LINK redis-benchmark
    LINK redis-check-aof
arm-buildroot-linux-uclibcgnueabi-gcc: error: ../deps/hiredis/libhiredis.a: No such file or directory
make[2]: *** [redis-benchmark] Error 1
make[2]: Leaving directory `/home/buildroot12git/output/build/redis-2.6.11/src'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/home/buildroot12git/output/build/redis-2.6.11'
make: *** [/home/buildroot12git/output/build/redis-2.6.11/.stamp_built] Error 2

 

Sagaert Johan
