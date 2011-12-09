From: Belisko Marek <marek.belisko@gmail.com>
Date: Fri, 9 Dec 2011 20:09:58 +0100
Subject: [Buildroot] problem with ccache during valgrind compiling
Message-ID: <CAAfyv341H2aP2sMHJxBanOgMHHv+bOz1KNwVocqkL2UKiacquQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm trying to build valgrind but it fails on my system with:

../coregrind/link_tool_exe_linux 0x38000000
/home/open-nandra/projects/buildroot-new/output/host/usr/bin/ccache
/home/open-nandra/projects/buildroot-new/output/host/usr/bin/arm-none-linux-gnueabi-gcc
 -Wno-long-long -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -Wno-pointer-sign -fno-stack-protector   -o
memcheck-arm-linux -O2 -g -Wall -Wmissing-prototypes -Wshadow
-Wpointer-arith -Wstrict-prototypes -Wmissing-declarations
-Wno-format-zero-length -fno-strict-aliasing -marm -O2 -static
-nodefaultlibs -nostartfiles -u _start -Wl,--build-id=none
memcheck_arm_linux-mc_leakcheck.o
memcheck_arm_linux-mc_malloc_wrappers.o memcheck_arm_linux-mc_main.o
memcheck_arm_linux-mc_translate.o memcheck_arm_linux-mc_machine.o
memcheck_arm_linux-mc_errors.o ../coregrind/libcoregrind-arm-linux.a
../VEX/libvex-arm-linux.a -lgcc
mkdir -p ../.in_place; \
	for f in ; do \
	  rm -f ../.in_place/$f.dSYM; \
	  ln -f -s ../memcheck/$f.dSYM ../.in_place; \
	done
cache directory                     /home/open-nandra/.buildroot-ccache
cache hit (direct)                     1
cache hit (preprocessed)               1
cache miss                           543
called for link                       10
compile failed                        10
preprocessor error                     9
bad compiler arguments                 2
unsupported source language           22
autoconf compile/link                 40
unsupported compiler option            4
no input file                         76
files in cache                      1593
cache size                          18.8 Mbytes
max cache size                       1.0 Gbytes
/home/open-nandra/projects/buildroot-new/output/host/usr/bin/ccache:
invalid option -- 't'
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

Config is in attachment.

Thanks,

Marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 17238 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111209/55fe0a3a/attachment-0001.obj>
