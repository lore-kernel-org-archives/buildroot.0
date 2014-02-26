From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 Feb 2014 09:42:54 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-02-25
In-Reply-To: <20140226073009.06EDD100CEF@stock.ovh.net> (Thomas Petazzoni's
 message of "Wed, 26 Feb 2014 08:30:08 +0100 (CET)")
References: <20140226073009.06EDD100CEF@stock.ovh.net>
Message-ID: <87k3cigt81.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

Last day before 2014.02!


 > Build statistics for 2014-02-25
 > ===============================

 >         success : 102
 >        failures : 19 
 >        timeouts : 0  
 >           TOTAL : 121

 > Classification of failures by reason
 > ====================================

 >                 libnftnl-1.0.0 | 2 
 >                      gdb-7.5.1 | 2 
 >                   pango-1.28.4 | 1 
 >                       tmux-1.8 | 1 
 >                        kmod-16 | 1 
 >                   sysklogd-1.5 | 1 
 >                     gpm-1.20.7 | 1 
 >                 sdl_ttf-2.0.11 | 1 
 >                      vlc-2.1.2 | 1 
 >                    cppdb-0.3.1 | 1 
 >                    iperf-2.0.5 | 1 
 >                   zeromq-3.2.4 | 1 
 >         ltp-testsuite-20130904 | 1 
 >            host-libxslt-1.1.28 | 1 
 >              xlib_libXau-1.0.8 | 1 
 >                     mpd-0.18.7 | 1 
 > mmc-utils-11f2ceabc4ad3f0dd... | 1 

 > Detail of failures
 > ===================

 >       bfin |                    cppdb-0.3.1 | NOK | http://autobuild.buildroot.net/results/cdc522c2cddb10a5c38239fcbea604bfa5a49045/

Fixed by Gustavoz yesterday.


 > microblaze |                      gdb-7.5.1 | NOK | http://autobuild.buildroot.net/results/8580840f6e41f198d2cfc0609e14765dbc2e7322/
 > microblaze |                      gdb-7.5.1 | NOK | http://autobuild.buildroot.net/results/85d04357cd2c44c1a7d24b6d774f48f1fbf07dbb/

Fixed by me yesterday.


 > microblaze |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/fd3675ebf52b77374dbb9112870fd420042795ed/

/home/test/test/3/output/host/usr/bin/microblaze-buildroot-linux-gnu-gcc libgpm.so.2 \
	 -L/home/test/test/3/output/build/gpm-1.20.7/src  -o lib/libgpm.so.2.1.0 lib/liblow.lo lib/libhigh.lo lib/libxtra.lo lib/report-lib.lo tools.lo  -lc 	
microblaze-buildroot-linux-gnu-gcc: error: libgpm.so.2: No such file or directory

Odd, parallel build issue?


 >       i686 |            host-libxslt-1.1.28 | NOK | http://autobuild.buildroot.net/results/6dcef647eb0f0db7de3f34194eb15ceebc645b39/

  CCLD   testThreads
/home/peko/scratch/host/usr/lib/libxml2.so: undefined reference to `lzma_code at XZ_5.0'
/home/peko/scratch/host/usr/lib/libxml2.so: undefined reference to `lzma_auto_decoder at XZ_5.0'
/home/peko/scratch/host/usr/lib/libxml2.so: undefined reference to `lzma_end at XZ_5.0'
/home/peko/scratch/host/usr/lib/libxml2.so: undefined reference to `lzma_properties_decode at XZ_5.0'
/home/peko/scratch/host/usr/lib/libxml2.so: undefined reference to `lzma_code at XZ_5.0'
/home/peko/scratch/host/usr/lib/libxml2.so: undefined reference to `lzma_auto_decoder at XZ_5.0'
/home/peko/scratch/host/usr/lib/libxml2.so: undefined reference to `lzma_end at XZ_5.0'
/home/peko/scratch/host/usr/lib/libxml2.so: undefined reference to `lzma_properties_decode at XZ_5.0'

Thomas, I think you looked into it and it was something about it picking
up lzma from the build machine. Do you have a fix?


 >        arc |                    iperf-2.0.5 | NOK | http://autobuild.buildroot.net/results/16389f4b7a8a38ba4c08de8ce6fa7410a0b32f0c/

Odd, multiple definitions of vfork?

/home/test/test/3/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(vfork.os): In function `vfork':
(.text+0x0): multiple definition of `vfork'
/home/test/test/3/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/lib/libpthread.a(ptfork.os):ptfork.c:(.text+0xc0): first defined here
collect2: error: ld returned 1 exit status


 >     xtensa |                        kmod-16 | NOK | http://autobuild.buildroot.net/results/1a6e7119feeb8c6098daf0d5cdc41aa778a30693/

Internal compiler error:

/home/test/test/1/output/host/usr/lib/gcc/xtensa-buildroot-linux-uclibc/4.7.3/../../../../xtensa-buildroot-linux-uclibc/bin/ld: BFD (GNU Binutils) 2.22 internal error, aborting at elf32-xtensa.c line 3374 in elf_xtensa_finish_dynamic_sections

/home/test/test/1/output/host/usr/lib/gcc/xtensa-buildroot-linux-uclibc/4.7.3/../../../../xtensa-buildroot-linux-uclibc/bin/ld: Please report this bug.

Perhaps we should mark kmod as !xtensa, but udev depends on it.


 >    powerpc |                 libnftnl-1.0.0 | NOK | http://autobuild.buildroot.net/results/6df9d1775807a62fd775790f8e63a115cbe0fcb9/
 >    powerpc |                 libnftnl-1.0.0 | NOK | http://autobuild.buildroot.net/results/914c8816f55a9743ed826e99fe9693177d443372/

old kernel headers issue?

/home/test/test/2/output/host/usr/powerpc-buildroot-linux-gnu/sysroot/usr/include/linux/netlink.h:31:2:
error: expected specifier-qualifier-list before 'sa_family_t'


 >        arm |         ltp-testsuite-20130904 | NOK | http://autobuild.buildroot.net/results/722fea5a4a30c271a83cadf61e2d1e07bcb7a4ea/

Ptrace issue:

/home/test/test/1/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/linux/ptrace.h:58:8: error: redefinition of 'struct ptrace_peeksiginfo_args'


 >    powerpc | mmc-utils-11f2ceabc4ad3f0dd... | NOK | http://autobuild.buildroot.net/results/fa45d93d145f3991e9c8bb99997b7e41cedc64b0/

Too old kernel headers?

mmc.h:18:29: fatal error: linux/mmc/ioctl.h: No such file or directory


 >    powerpc |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/2862eba84c0922f19dbc2c7babcf15dbc137af93/

C++ issue? Gustavo?

./src/fs/Path.hxx:61:29: error: invalid return type 'Path' of constexpr function 'static constexpr Path Path::Null()'
./src/fs/Path.hxx:69:47: error: invalid return type 'Path' of constexpr function 'static constexpr Path Path::FromFS(Path::const_pointer)'


 >       i686 |                   pango-1.28.4 | NOK | http://autobuild.buildroot.net/results/500df342c86f22a673ea1da3fcf4c529155c035a/

libtool, static/shared linking issue?

  CXXLD    libharfbuzz.la
libtool: link: warning: library `/home/test/test/1/output/host/opt/ext-toolchain/bin/../lib/gcc/i686-unknown-linux-uclibc/4.6.3/../../../../i686-unknown-linux-uclibc/lib/libstdc++.la' was moved.
  CXXLD    main
libtool: link: warning: library `/home/test/test/1/output/host/opt/ext-toolchain/bin/../lib/gcc/i686-unknown-linux-uclibc/4.6.3/../../../../i686-unknown-linux-uclibc/lib/libstdc++.la' was moved.
libtool: link: warning: library `/home/test/test/1/output/host/opt/ext-toolchain/bin/../lib/gcc/i686-unknown-linux-uclibc/4.6.3/../../../../i686-unknown-linux-uclibc/lib/libstdc++.la' was moved.
/home/test/test/1/output/host/opt/ext-toolchain/bin/../lib/gcc/i686-unknown-linux-uclibc/4.6.3/../../../../i686-unknown-linux-uclibc/bin/ld: attempted static link of dynamic object `/home/test/test/1/output/host/opt/ext-toolchain/bin/../lib/gcc/i686-unknown-linux-uclibc/4.6.3/../../../../i686-unknown-linux-uclibc/lib/libstdc++.so'


 >        arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/b3c7b1a16e03fca1c2f1fd99625d474e28773085/

X11/OpenGL issue?

libtool: link: /home/test/test/1/output/host/usr/bin/arm-none-linux-gnueabi-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os -I/home/test/test/1/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/freetype2 -I/home/test/test/1/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/SDL -D_GNU_SOURCE=1 -D_REENTRANT -DHAVE_OPENGL -o glfont glfont.o  -L/home/test/test/1/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib ./.libs/libSDL_ttf.so -lGL /home/test/test/1/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libfreetype.so /home/test/test/1/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libpng16.so -lbz2 /home/test/test/1/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libSDL.so -lm /home/test/test/1/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libdirectfb.so /home/test/test/1/output/build/directfb-1.6.3/lib/fusion/.libs/libfusion.so /home/test/test/1/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libfusion.so /home/test/test/1/output/build/directfb-1.6.3/lib/direct/.libs/libdirect.so /home/test/test/1/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libdirect.so -lz -ldl -lrt -lpthread -Wl,-rpath -Wl,/home/test/test/1/output/build/sdl_ttf-2.0.11/.libs -Wl,-rpath -Wl,/home/test/test/1/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib -Wl,-rpath -Wl,/home/test/test/1/output/build/directfb-1.6.3/lib/fusion/.libs -Wl,-rpath -Wl,/home/test/test/1/output/build/directfb-1.6.3/lib/direct/.libs -Wl,-rpath -Wl,/home/test/test/1/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib
/home/test/test/1/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.7.3/../../../../arm-none-linux-gnueabi/bin/ld: warning: libXdamage.so.1, needed by /home/test/test/1/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libGL.so, not found (try using -rpath or -rpath-link)
/home/test/test/1/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.7.3/../../../../arm-none-linux-gnueabi/bin/ld: warning: libXfixes.so.3, needed by /home/test/test/1/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libGL.so, not found (try using -rpath or -rpath-link)
/home/test/test/1/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.7.3/../../../../arm-none-linux-gnueabi/bin/ld: warning: libXext.so.6, needed by /home/test/test/1/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libGL.so, not found (try using -rpath or -rpath-link)
/home/test/test/1/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.7.3/../../../../arm-none-linux-gnueabi/bin/ld: warning: libX11.so.6, needed by /home/test/test/1/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libGL.so, not found (try using -rpath or -rpath-link)


 >    powerpc |                   sysklogd-1.5 | NOK | http://autobuild.buildroot.net/results/88d76be91d04a22dd2f1683396a172be085e1657/

Internal compiler error. Thomas, how old is this ctng toolchain?


 >      avr32 |                       tmux-1.8 | NOK | http://autobuild.buildroot.net/results/349bbb815828fe9c5a233b81a09cdb1e9f622dab/

compat misdetection?

compat.h:201: error: conflicting types for '__b64_ntop'
/home/test/test/3/output/host/usr/avr32-buildroot-linux-uclibc/sysroot/usr/include/resolv.h:367: error: previous declaration of '__b64_ntop' was here


 > microblaze |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/e4fd3b2344b455f425f77c7d359555fd8d0f9bc2/

Internal compiler error:

misc/objects.c:531:1: internal compiler error: in merge_overlapping_regs, at regrename.c:295


 >    powerpc |              xlib_libXau-1.0.8 | NOK | http://autobuild.buildroot.net/results/f62f8e63082fdfb9a68c8b4e629e5a7fa02b3bba/

Out of memory?

configure: creating ./config.status
./config.status: fork: Cannot allocate memory


 >       bfin |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/0bf4621fad59fb0a42ae42b0a9d71e16ec49c617/

atomics missings, perhaps we should mark it as !bfin?

/home/test/test/2/output/host/usr/bfin-buildroot-linux-uclibc/sysroot/usr/lib/libpgm.so: undefined reference to `___sync_add_and_fetch_2'
/home/test/test/2/output/host/usr/bfin-buildroot-linux-uclibc/sysroot/usr/lib/libpgm.so: undefined reference to `___sync_fetch_and_add_2'

-- 
Bye, Peter Korsgaard
