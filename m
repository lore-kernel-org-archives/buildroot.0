From: Anthony Brandon <anthonybrandon@gmail.com>
Date: Fri, 26 Aug 2011 19:47:44 +0200
Subject: [Buildroot] ncurses build failure
In-Reply-To: <CALsyMRhq-JAyC2tT8kZ9xnB5xvYBqqG1HG7qzr0+TLduL105xQ@mail.gmail.com>
References: <CALsyMRhq-JAyC2tT8kZ9xnB5xvYBqqG1HG7qzr0+TLduL105xQ@mail.gmail.com>
Message-ID: <CALsyMRh2uZjypg+aq6=pcidAcOBq4vTE3iMdQdovw3xK53EB7A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am using buildroot to build an image for running on a ppc 405 processor.
Using make menuconfig I also set the target architecture to powerpc
and variant to 405.
In package selection I also set customize and enabled the nano text editor.
I set the baudrate for ttyS0 to 9600.

The other options were left as default.
I'm not sure what I should do about the kernel headers. Should they be
set to the version I will eventually be using?
For now I left them at 3.0 since I am only testing if it will build at
this point.
Anyway next I did a make and after some time I get a bunch or errors
while building host-ncurses-5.7

I deleted the host-ncurses-5.7 directory from output/build and did another make.
The output follows below.

The errors seem to start with this:
In file included from ../ncurses/curses.priv.h:55,
? ? ? ? ? ? ? ? from ./tinfo/comp_hash.c:42:
./../include/ncurses_cfg.h:58:23: warning: missing terminating " character

This file seems to be automatically generated.
Do you have any idea how I can fix this, or what could be causing the problem?
Or where I can find a solution?

>>> host-ncurses 5.7 Extracting
gzip -d -c /home/anthony/work/virtex4linux/buildroot/dl/ncurses-5.7.tar.gz
| tar --strip-components=1 -C
/home/anthony/work/virtex4linux/buildroot/output/build/host-ncurses-5.7
?-xf -
>>> host-ncurses 5.7 Patching package/ncurses
for file in config.guess config.sub; do for i in $(find
/home/anthony/work/virtex4linux/buildroot/output/build/host-ncurses-5.7
-name $file); do cp package/gnuconfig/$file $i; done; done
>>> host-ncurses 5.7 Patching libtool
>>> host-ncurses 5.7 Configuring
(cd /home/anthony/work/virtex4linux/buildroot/output/build/host-ncurses-5.7/
&& rm -rf config.cache;
PATH=/home/anthony/work/virtex4linux/buildroot/output/host/bin:/home/anthony/work/virtex4linux/buildroot/output/host/usr/bin:/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/i486-pc-linux-gnu/gcc-bin/4.1.2:/usr/i686-pc-linux-gnu/gcc-bin/4.4.5
AR="/usr/bin/ar" AS="/usr/bin/as" LD="/usr/bin/ld" NM="/usr/bin/nm"
CC="/usr/bin/gcc" GCC="/usr/bin/gcc" CXX="/usr/bin/g++"
CPP="/usr/bin/cpp" CFLAGS="-O2
-I/home/anthony/work/virtex4linux/buildroot/output/host/include
-I/home/anthony/work/virtex4linux/buildroot/output/host/usr/include"
CXXFLAGS="-I/home/anthony/work/virtex4linux/buildroot/output/host/include
-I/home/anthony/work/virtex4linux/buildroot/output/host/usr/include"
LDFLAGS="-L/home/anthony/work/virtex4linux/buildroot/output/host/lib
-L/home/anthony/work/virtex4linux/buildroot/output/host/usr/lib
-Wl,-rpath,/home/anthony/work/virtex4linux/buildroot/output/host/usr/lib"
PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG="/home/anthony/work/virtex4linux/buildroot/output/host/usr/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/"
PKG_CONFIG_LIBDIR="/home/anthony/work/virtex4linux/buildroot/output/host/usr/lib/pkgconfig:/home/anthony/work/virtex4linux/buildroot/output/host/usr/share/pkgconfig"
PERLLIB="/home/anthony/work/virtex4linux/buildroot/output/host/usr/lib/perl"
LD_LIBRARY_PATH="/home/anthony/work/virtex4linux/buildroot/output/host/usr/lib:"
CFLAGS="-O2 -I/home/anthony/work/virtex4linux/buildroot/output/host/include
-I/home/anthony/work/virtex4linux/buildroot/output/host/usr/include"
LDFLAGS="-L/home/anthony/work/virtex4linux/buildroot/output/host/lib
-L/home/anthony/work/virtex4linux/buildroot/output/host/usr/lib
-Wl,-rpath,/home/anthony/work/virtex4linux/buildroot/output/host/usr/lib"
?./configure --prefix="/home/anthony/work/virtex4linux/buildroot/output/host/usr"
--sysconfdir="/home/anthony/work/virtex4linux/buildroot/output/host/etc"
--enable-shared --disable-static --without-shared )
checking for egrep... grep -E
Configuring NCURSES 5.7 ABI 5 (Fri Aug 26 19:15:11 CEST 2011)
checking build system type... i686-pc-linux-gnu
checking host system type... i686-pc-linux-gnu
checking target system type... i686-pc-linux-gnu
Configuring for linux-gnu
checking for prefix... /home/anthony/work/virtex4linux/buildroot/output/host/usr
checking for gcc... /usr/bin/gcc
checking for C compiler default output... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... no
checking for executable suffix...
checking for object suffix... o
checking whether we are using the GNU C compiler... yes
checking whether /usr/bin/gcc accepts -g... yes
checking version of /usr/bin/gcc... 4.4.5
checking how to run the C preprocessor... /usr/bin/cpp
checking whether /usr/bin/gcc needs -traditional... no
checking whether /usr/bin/gcc understands -c and -o together... yes
checking for POSIXized ISC... no
checking for /usr/bin/gcc option to accept ANSI C... -DCC_HAS_PROTOS
checking for ldconfig...
/home/anthony/work/virtex4linux/buildroot/output/host/usr/bin/ldconfig
checking if you want to ensure bool is consistent with C++... yes
checking whether we are using the GNU C++ compiler... yes
checking whether /usr/bin/g++ accepts -g... yes
checking version of g++... 4.4.5
checking if you want to build C++ binding and demo... yes
checking if you want to build with Ada95... yes
checking if you want to build programs such as tic... yes
checking if you wish to install curses.h... yes
checking for mawk... no
checking for gawk... gawk
checking for egrep... (cached) grep -E
checking for a BSD compatible install... /usr/bin/install -c
checking for tdlint... no
checking for lint... no
checking for alint... no
checking whether ln -s works... yes
checking for long file names... yes
checking if we should assume mixed-case filenames... auto
checking if filesystem supports mixed-case filenames... yes
checking whether make sets ${MAKE}... yes
checking for ctags... yes
checking for etags... yes
checking for makeflags variable... given option "-${MAKEFLAGS}", no
match "make[1]: Entering directory
`/home/anthony/work/virtex4linux/buildroot/output/build/host-ncurses-5.7'
.-wk
make[1]: Leaving directory
`/home/anthony/work/virtex4linux/buildroot/output/build/host-ncurses-5.7'"
given option "${MFLAGS}", no match "make[1]: Entering directory
`/home/anthony/work/virtex4linux/buildroot/output/build/host-ncurses-5.7'
.-wk
make[1]: Leaving directory
`/home/anthony/work/virtex4linux/buildroot/output/build/host-ncurses-5.7'"

checking for ranlib... ranlib
checking for ld... /usr/bin/ld
checking for ar... /usr/bin/ar
checking for archiver options (symbol AR_OPTS)... rv
checking if you have specified an install-prefix...
checking if you want to build libraries with libtool... no
checking if you want to build shared libraries... no
checking if you want to build static libraries... yes
checking if you want to build debug libraries... yes
checking if you want to build profiling libraries... no
checking for specified models... ?normal debug
checking for default model... normal
checking if you want to build a separate terminfo library... no
checking if you want to build a separate tic library... no
checking if you want to link with the GPM mouse library... maybe
checking for gpm.h... yes
checking for Gpm_Open in -lgpm... yes
checking if you want to load GPM dynamically... yes
checking for dlsym... no
checking for dlsym in -ldl... yes
checking whether able to link to dl*() functions... ok
checking for soname of gpm library... libgpm.so.1'
libgpm.so.1
checking for Gpm_Wgetch in -lgpm... no
checking for default loader flags...
checking if release/abi version should be used for shared libs... auto
checking which /usr/bin/gcc option to use...
checking if you wish to install ncurses overwriting curses... no
checking if external terminfo-database is used... yes
checking which terminfo source-file will be installed...
${top_srcdir}/misc/terminfo.src
checking whether to use hashed database instead of directory/tree... no
checking for list of fallback descriptions...
checking if you want modern xterm or antique... xterm-new
checking for list of terminfo directories...
/home/anthony/work/virtex4linux/buildroot/output/host/usr/share/terminfo
checking for default terminfo directory...
/home/anthony/work/virtex4linux/buildroot/output/host/usr/share/terminfo
checking if big-core option selected... no
checking if big-strings option selected... yes
checking if you want termcap-fallback support... no
checking if ~/.terminfo is wanted... yes
checking if you want to use restricted environment when running as root... yes
checking for remove... no
checking for unlink... no
checking if link/symlink functions work... no
checking if tic should use hard links... no
checking if you want broken-linker support code... no
checking if tputs should process BSD-style prefix padding... no
checking if /usr/bin/gcc -U and -D options work together... no
checking if we must define _GNU_SOURCE... yes
checking if SIGWINCH is defined... no
checking for nl_langinfo and CODESET... no
checking if you want wide-character code... no
checking whether to enable _LP64 definition in curses.h... no
checking for special C compiler options needed for large files... no
checking for _FILE_OFFSET_BITS value needed for large files... no
checking for _LARGE_FILES value needed for large files... no
checking for _LARGEFILE_SOURCE value needed for large files... no
checking for fseeko... no
checking whether to use struct dirent64... no
checking if you want tparm not to use X/Open fixed-parameter list... yes
checking for type of bool... auto
checking for alternate terminal capabilities file... Caps
checking for type of chtype... auto
checking for type of ospeed... short
checking for type of mmask_t... auto
checking if RCS identifiers should be compiled-in... no
checking format of man-pages... ?normal
checking for manpage renaming... no
checking if manpage aliases will be installed... yes
checking if manpage symlinks should be used... yes
checking for manpage tbl... no
checking if you want to build with function extensions... yes
checking for extended use of const keyword... no
checking if you want to use extended colors... no
checking if you want to use extended mouse encoding... no
checking if you want $NCURSES_NO_PADDING code... yes
checking for ANSI C header files... no
checking for sys/types.h... no
checking for sys/stat.h... no
checking for stdlib.h... no
checking for string.h... no
checking for memory.h... no
checking for strings.h... no
checking for inttypes.h... no
checking for stdint.h... no
checking for unistd.h... no
checking for signed char... no
checking size of signed char... 0
checking if you want to use signed Boolean array in term.h... no
checking if you want SIGWINCH handler... yes
checking if you want user-definable terminal capabilities like termcap... yes
checking if you want all development code... no
checking if you want hard-tabs code... no
checking if you want limited support for xmc... no
checking if you do not want to assume colors are white-on-black... yes
checking if you want hashmap scrolling-optimization code... yes
checking if you want colorfgbg code... no
checking if you want to link with the pthread library... no
checking if you want to use weak-symbols for pthreads... no
checking if you want experimental reentrant code... no
checking if you want experimental safe-sprintf code... no
checking if you want experimental wgetch-events code... no
checking if you want to display full commands during build... yes
checking if you want to see compiler warnings...
configure: checking for /usr/bin/gcc __attribute__ directives...
checking if you want to enable runtime assertions... no
checking if you want to use dmalloc for testing... no
checking if you want to use dbmalloc for testing... no
checking if you want to use valgrind for testing... no
checking if you want to perform memory-leak testing... no
checking whether to add trace feature to all models... no
checking for gettimeofday... no
checking for gettimeofday in -lbsd... no
checking if -lm needed for math functions... yes
checking for ANSI C header files... (cached) no
checking for dirent.h that defines DIR... no
checking for sys/ndir.h that defines DIR... no
checking for sys/dir.h that defines DIR... no
checking for ndir.h that defines DIR... no
checking for opendir in -lx... no
checking whether time.h and sys/time.h may both be included... no
checking for regular-expression headers...
checking for fcntl.h... yes
checking for getopt.h... yes
checking for limits.h... yes
checking for locale.h... yes
checking for poll.h... yes
checking for sys/bsdtypes.h... no
checking for sys/ioctl.h... yes
checking for sys/param.h... yes
checking for sys/poll.h... yes
checking for sys/select.h... yes
checking for sys/time.h... yes
checking for sys/times.h... yes
checking for ttyent.h... yes
checking for unistd.h... (cached) no
checking for wctype.h... yes
checking if sys/time.h works with sys/select.h... no
checking for /usr/bin/gcc option to accept ANSI C... none needed
checking for an ANSI C-conforming const... no
checking for inline... no
checking for signal global datatype... no
checking for type of chtype... long
checking if unsigned literals are legal... no
checking if external errno is declared... no
checking if external errno exists... no
checking if data-only library module links... no
checking for getcwd... no
checking for getegid... no
checking for geteuid... no
checking for getttynam... no
checking for issetugid... no
checking for poll... no
checking for remove... (cached) no
checking for select... no
checking for setbuf... no
checking for setbuffer... no
checking for setvbuf... no
checking for sigaction... no
checking for sigvec... no
checking for strdup... no
checking for strstr... no
checking for tcgetpgrp... no
checking for times... no
checking for vsnprintf... no
checking for isascii... no
checking if nanosleep really works... no
checking for termio.h... yes
checking for termios.h... yes
checking for unistd.h... (cached) no
checking whether termios.h needs _POSIX_SOURCE... maybe
checking for tcgetattr... no
checking for vsscanf function or workaround... no
checking for working mkstemp... no
checking whether setvbuf arguments are reversed... no
checking return type of signal handlers... int
checking for type sigaction_t... no
checking declaration of size-change... no
checking for memmove... no
checking for bcopy... no
checking if poll really works... no
checking for openpty in -lutil... no
checking for openpty header... no
checking if we should include stdbool.h... no
checking for builtin bool type... no
checking for library stdc++... no
checking whether /usr/bin/g++ understands -c and -o together... yes
checking how to run the C++ preprocessor... /usr/bin/g++ -E
checking for iostream... yes
checking for typeinfo... yes
checking if iostream uses std-namespace... no
checking if we should include stdbool.h... (cached) no
checking for builtin bool type... no
checking for size of bool... unknown
configure: WARNING: Assuming unsigned for type of bool
checking for special defines needed for etip.h... none
checking if /usr/bin/g++ accepts parameter initialization... no
checking if /usr/bin/g++ accepts static_cast... no
checking for gnatmake... no
checking for library subsets... ticlib+termlib+ext_tinfo+base+ext_funcs
checking default library suffix...
checking default library-dependency suffix... .a
checking default object directory... objects
checking c++ library-dependency suffix... .a
checking where we will install curses.h... ${prefix}/include/ncurses
checking for src modules... ncurses progs panel menu form
configure: creating ./config.status
config.status: creating include/MKterm.h.awk
config.status: creating include/curses.head
config.status: creating include/termcap.h
config.status: creating include/unctrl.h
config.status: creating man/Makefile
config.status: creating include/Makefile
config.status: creating ncurses/Makefile
config.status: creating progs/Makefile
config.status: creating panel/Makefile
config.status: creating menu/Makefile
config.status: creating form/Makefile
config.status: creating test/Makefile
config.status: creating misc/Makefile
config.status: creating c++/Makefile
config.status: creating Ada95/gen/adacurses-config
config.status: creating misc/run_tic.sh
config.status: creating misc/ncurses-config
config.status: creating Makefile
config.status: creating include/ncurses_cfg.h
Appending rules for normal model (ncurses:
ticlib+termlib+ext_tinfo+base+ext_funcs)
Appending rules for debug model (ncurses:
ticlib+termlib+ext_tinfo+base+ext_funcs)
Appending rules for normal model (progs:
ticlib+termlib+ext_tinfo+base+ext_funcs)
Appending rules for debug model (progs: ticlib+termlib+ext_tinfo+base+ext_funcs)
Appending rules for normal model (panel:
ticlib+termlib+ext_tinfo+base+ext_funcs)
Appending rules for debug model (panel: ticlib+termlib+ext_tinfo+base+ext_funcs)
Appending rules for normal model (menu: ticlib+termlib+ext_tinfo+base+ext_funcs)
Appending rules for debug model (menu: ticlib+termlib+ext_tinfo+base+ext_funcs)
Appending rules for normal model (form: ticlib+termlib+ext_tinfo+base+ext_funcs)
Appending rules for debug model (form: ticlib+termlib+ext_tinfo+base+ext_funcs)
Appending rules for normal model (test: ticlib+termlib+ext_tinfo+base+ext_funcs)
Appending rules for debug model (test: ticlib+termlib+ext_tinfo+base+ext_funcs)
Appending rules for normal model (c++: ticlib+termlib+ext_tinfo+base+ext_funcs)
Appending rules for debug model (c++: ticlib+termlib+ext_tinfo+base+ext_funcs)
creating headers.sh
make[1]: Entering directory
`/home/anthony/work/virtex4linux/buildroot/output/build/host-ncurses-5.7'

** Configuration summary for NCURSES 5.7 20081102:

? ? extended funcs: yes
? ? xterm terminfo: xterm-new

? ? ?bin directory:
/home/anthony/work/virtex4linux/buildroot/output/host/usr/bin
? ? ?lib directory:
/home/anthony/work/virtex4linux/buildroot/output/host/usr/lib
?include directory:
/home/anthony/work/virtex4linux/buildroot/output/host/usr/include/ncurses
? ? ?man directory:
/home/anthony/work/virtex4linux/buildroot/output/host/usr/man
?terminfo directory:
/home/anthony/work/virtex4linux/buildroot/output/host/usr/share/terminfo

** Include-directory is not in a standard location
make[1]: Leaving directory
`/home/anthony/work/virtex4linux/buildroot/output/build/host-ncurses-5.7'
>>> host-ncurses 5.7 Building
/usr/bin/make -j1 -C
/home/anthony/work/virtex4linux/buildroot/output/build/host-ncurses-5.7
sources
make[1]: Entering directory
`/home/anthony/work/virtex4linux/buildroot/output/build/host-ncurses-5.7'
cd man && /usr/bin/make DESTDIR="" sources
make[2]: Entering directory
`/home/anthony/work/virtex4linux/buildroot/output/build/host-ncurses-5.7/man'
sh ./MKterminfo.sh ./terminfo.head ./../include/Caps ./terminfo.tail >terminfo.5
make[2]: Leaving directory
`/home/anthony/work/virtex4linux/buildroot/output/build/host-ncurses-5.7/man'
cd include && /usr/bin/make DESTDIR="" sources
make[2]: Entering directory
`/home/anthony/work/virtex4linux/buildroot/output/build/host-ncurses-5.7/include'
cat curses.head >curses.h
AWK=gawk sh ./MKkey_defs.sh ./Caps >>curses.h
sh -c 'if test "chtype" = "cchar_t" ; then cat ./curses.wide >>curses.h ; fi'
cat ./curses.tail >>curses.h
sh ./MKhashsize.sh ./Caps >hashsize.h
AWK=gawk sh ./MKncurses_def.sh ./ncurses_defs >ncurses_def.h
AWK=gawk sh ./MKparametrized.sh ./Caps >parametrized.h
gawk -f MKterm.h.awk ./Caps > term.h
sh ./edit_cfg.sh ../include/ncurses_cfg.h term.h
** edit: HAVE_TCGETATTR 0
** edit: HAVE_TERMIOS_H 1
** edit: HAVE_TERMIO_H 1
** edit: BROKEN_LINKER 1
make[2]: Leaving directory
`/home/anthony/work/virtex4linux/buildroot/output/build/host-ncurses-5.7/include'
cd ncurses && /usr/bin/make DESTDIR="" sources
make[2]: Entering directory
`/home/anthony/work/virtex4linux/buildroot/output/build/host-ncurses-5.7/ncurses'
gawk -f ./tinfo/MKcodes.awk bigstrings=1 ./../include/Caps >codes.c
/usr/bin/gcc -o make_hash -DHAVE_CONFIG_H -I../ncurses -I.
-I./../include -I../include -DHAVE_CONFIG_H -I../ncurses -I. -I.
-I../include ?-D_GNU_SOURCE -DNDEBUG
-I/home/anthony/work/virtex4linux/buildroot/output/host/usr/include/ncurses
-O2 -I/home/anthony/work/virtex4linux/buildroot/output/host/include
-I/home/anthony/work/virtex4linux/buildroot/output/host/usr/include
-DMAIN_PROGRAM ./tinfo/comp_hash.c
-L/home/anthony/work/virtex4linux/buildroot/output/host/lib
-L/home/anthony/work/virtex4linux/buildroot/output/host/usr/lib
-Wl,-rpath,/home/anthony/work/virtex4linux/buildroot/output/host/usr/lib
?-ldl
In file included from ../ncurses/curses.priv.h:55,
? ? ? ? ? ? ? ? from ./tinfo/comp_hash.c:42:
./../include/ncurses_cfg.h:58:23: warning: missing terminating " character
In file included from ../ncurses/curses.priv.h:55,
? ? ? ? ? ? ? ? from ./tinfo/comp_hash.c:42:
./../include/ncurses_cfg.h:59: error: expected '=', ',', ';', 'asm' or
'__attribute__' before '.' token
./../include/ncurses_cfg.h:59:12: warning: missing terminating " character
./../include/ncurses_cfg.h:59: error: missing terminating " character
In file included from ../ncurses/curses.priv.h:63,
? ? ? ? ? ? ? ? from ./tinfo/comp_hash.c:42:
/usr/include/stdlib.h:140: error: expected '=', ',', ';', 'asm' or
'__attribute__' before '__ctype_get_mb_cur_max'
In file included from ../ncurses/curses.priv.h:63,
? ? ? ? ? ? ? ? from ./tinfo/comp_hash.c:42:
/usr/include/stdlib.h:337: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/stdlib.h:367: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/stdlib.h:369: error: nonnull argument with out-of-range
operand number (argument 1, operand 4)
/usr/include/stdlib.h:471: error: expected ')' before '__size'
/usr/include/stdlib.h:473: error: expected ')' before '__nmemb'
/usr/include/stdlib.h:485: error: expected declaration specifiers or
'...' before 'size_t'
In file included from /usr/include/stdlib.h:497,
? ? ? ? ? ? ? ? from ../ncurses/curses.priv.h:63,
? ? ? ? ? ? ? ? from ./tinfo/comp_hash.c:42:
/usr/include/alloca.h:33: error: expected ')' before '__size'
In file included from ../ncurses/curses.priv.h:63,
? ? ? ? ? ? ? ? from ./tinfo/comp_hash.c:42:
/usr/include/stdlib.h:503: error: expected ')' before '__size'
/usr/include/stdlib.h:508: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/stdlib.h:508: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/stdlib.h:756: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/stdlib.h:756: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/stdlib.h:757: error: nonnull argument with out-of-range
operand number (argument 1, operand 5)
/usr/include/stdlib.h:761: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/stdlib.h:761: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/stdlib.h:762: error: nonnull argument with out-of-range
operand number (argument 1, operand 4)
/usr/include/stdlib.h:764: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/stdlib.h:764: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/stdlib.h:766: error: nonnull argument with out-of-range
operand number (argument 1, operand 4)
/usr/include/stdlib.h:840: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/stdlib.h:843: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/stdlib.h:847: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/stdlib.h:851: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/stdlib.h:860: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/stdlib.h:864: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/stdlib.h:871: error: expected '=', ',', ';', 'asm' or
'__attribute__' before 'mbstowcs'
/usr/include/stdlib.h:874: error: expected '=', ',', ';', 'asm' or
'__attribute__' before 'wcstombs'
/usr/include/stdlib.h:937: error: expected declaration specifiers or
'...' before 'size_t'
In file included from /usr/include/stdlib.h:955,
? ? ? ? ? ? ? ? from ../ncurses/curses.priv.h:63,
? ? ? ? ? ? ? ? from ./tinfo/comp_hash.c:42:
/usr/include/bits/stdlib.h:26: error: expected declaration specifiers
or '...' before 'size_t'
/usr/include/bits/stdlib.h:30: error: expected declaration specifiers
or '...' before 'size_t'
/usr/include/bits/stdlib.h: In function 'realpath':
/usr/include/bits/stdlib.h:40: error: 'size_t' undeclared (first use
in this function)
/usr/include/bits/stdlib.h:40: error: (Each undeclared identifier is
reported only once
/usr/include/bits/stdlib.h:40: error: for each function it appears in.)
/usr/include/bits/stdlib.h:46: error: too many arguments to function
'__realpath_chk'
/usr/include/bits/stdlib.h: At top level:
/usr/include/bits/stdlib.h:53: error: expected declaration specifiers
or '...' before 'size_t'
/usr/include/bits/stdlib.h:54: error: expected declaration specifiers
or '...' before 'size_t'
/usr/include/bits/stdlib.h:55: error: expected declaration specifiers
or '...' before 'size_t'
/usr/include/bits/stdlib.h:58: error: expected declaration specifiers
or '...' before 'size_t'
/usr/include/bits/stdlib.h:58: error: expected declaration specifiers
or '...' before 'size_t'
/usr/include/bits/stdlib.h:65: error: expected declaration specifiers
or '...' before 'size_t'
/usr/include/bits/stdlib.h: In function 'ptsname_r':
/usr/include/bits/stdlib.h:67: error: 'size_t' undeclared (first use
in this function)
/usr/include/bits/stdlib.h:69: error: '__buflen' undeclared (first use
in this function)
/usr/include/bits/stdlib.h:70: error: too many arguments to function
'__ptsname_r_chk'
/usr/include/bits/stdlib.h:72: error: too many arguments to function
'__ptsname_r_chk_warn'
/usr/include/bits/stdlib.h:74: error: too many arguments to function
'__ptsname_r_alias'
/usr/include/bits/stdlib.h: At top level:
/usr/include/bits/stdlib.h:78: error: expected declaration specifiers
or '...' before 'size_t'
/usr/include/bits/stdlib.h: In function 'wctomb':
/usr/include/bits/stdlib.h:93: error: 'size_t' undeclared (first use
in this function)
/usr/include/bits/stdlib.h:94: error: too many arguments to function
'__wctomb_chk'
/usr/include/bits/stdlib.h: At top level:
/usr/include/bits/stdlib.h:99: error: expected '=', ',', ';', 'asm' or
'__attribute__' before '__mbstowcs_chk'
/usr/include/bits/stdlib.h:102: error: expected '=', ',', ';', 'asm'
or '__attribute__' before '__mbstowcs_alias'
/usr/include/bits/stdlib.h:106: error: expected '=', ',', ';', 'asm'
or '__attribute__' before '__mbstowcs_chk_warn'
/usr/include/bits/stdlib.h:114: error: expected ',' or ';' before 'mbstowcs'
/usr/include/bits/stdlib.h:131: error: expected '=', ',', ';', 'asm'
or '__attribute__' before '__wcstombs_chk'
/usr/include/bits/stdlib.h:134: error: expected '=', ',', ';', 'asm'
or '__attribute__' before '__wcstombs_alias'
/usr/include/bits/stdlib.h:138: error: expected '=', ',', ';', 'asm'
or '__attribute__' before '__wcstombs_chk_warn'
/usr/include/bits/stdlib.h:145: error: expected ',' or ';' before 'wcstombs'
In file included from ../ncurses/curses.priv.h:64,
? ? ? ? ? ? ? ? from ./tinfo/comp_hash.c:42:
/usr/include/string.h:45: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/string.h:49: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/string.h:58: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/string.h:65: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/string.h:68: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/string.h:95: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/string.h:120: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/string.h:132: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/string.h:140: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/string.h:146: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/string.h:153: error: expected '=', ',', ';', 'asm' or
'__attribute__' before 'strxfrm'
/usr/include/string.h:168: error: expected '=', ',', ';', 'asm' or
'__attribute__' before 'strxfrm_l'
/usr/include/string.h:183: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/string.h:284: error: expected '=', ',', ';', 'asm' or
'__attribute__' before 'strcspn'
/usr/include/string.h:288: error: expected '=', ',', ';', 'asm' or
'__attribute__' before 'strspn'
/usr/include/string.h:382: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/string.h:383: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/string.h:384: error: nonnull argument with out-of-range
operand number (argument 1, operand 3)
/usr/include/string.h:389: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/string.h:392: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/string.h:399: error: expected '=', ',', ';', 'asm' or
'__attribute__' before 'strlen'
/usr/include/string.h:406: error: expected '=', ',', ';', 'asm' or
'__attribute__' before 'strnlen'
/usr/include/string.h:438: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/string.h:451: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/string.h:455: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/string.h:459: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/string.h:462: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/string.h:540: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/string.h:552: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/string.h:553: error: nonnull argument with out-of-range
operand number (argument 1, operand 4)
/usr/include/string.h:577: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/string.h:580: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/string.h:593: error: expected declaration specifiers or
'...' before 'size_t'
In file included from /usr/include/string.h:637,
? ? ? ? ? ? ? ? from ../ncurses/curses.priv.h:64,
? ? ? ? ? ? ? ? from ./tinfo/comp_hash.c:42:
/usr/include/bits/string2.h:969: error: expected '=', ',', ';', 'asm'
or '__attribute__' before '__strcspn_c1'
/usr/include/bits/string2.h:971: error: expected '=', ',', ';', 'asm'
or '__attribute__' before '__strcspn_c1'
/usr/include/bits/string2.h:979: error: expected '=', ',', ';', 'asm'
or '__attribute__' before '__strcspn_c2'
/usr/include/bits/string2.h:982: error: expected '=', ',', ';', 'asm'
or '__attribute__' before '__strcspn_c2'
/usr/include/bits/string2.h:991: error: expected '=', ',', ';', 'asm'
or '__attribute__' before '__strcspn_c3'
/usr/include/bits/string2.h:994: error: expected '=', ',', ';', 'asm'
or '__attribute__' before '__strcspn_c3'
/usr/include/bits/string2.h:1045: error: expected '=', ',', ';', 'asm'
or '__attribute__' before '__strspn_c1'
/usr/include/bits/string2.h:1047: error: expected '=', ',', ';', 'asm'
or '__attribute__' before '__strspn_c1'
/usr/include/bits/string2.h:1056: error: expected '=', ',', ';', 'asm'
or '__attribute__' before '__strspn_c2'
/usr/include/bits/string2.h:1059: error: expected '=', ',', ';', 'asm'
or '__attribute__' before '__strspn_c2'
/usr/include/bits/string2.h:1068: error: expected '=', ',', ';', 'asm'
or '__attribute__' before '__strspn_c3'
/usr/include/bits/string2.h:1071: error: expected '=', ',', ';', 'asm'
or '__attribute__' before '__strspn_c3'
/usr/include/bits/string2.h: In function '__strpbrk_c2':
/usr/include/bits/string2.h:1129: error: expected ';' before '__s'
/usr/include/bits/string2.h: In function '__strpbrk_c3':
/usr/include/bits/string2.h:1142: error: expected ';' before '__s'
/usr/include/bits/string2.h: At top level:
/usr/include/bits/string2.h:1322: error: expected declaration
specifiers or '...' before 'size_t'
In file included from /usr/include/string.h:642,
? ? ? ? ? ? ? ? from ../ncurses/curses.priv.h:64,
? ? ? ? ? ? ? ? from ./tinfo/comp_hash.c:42:
/usr/include/bits/string3.h:49: error: expected declaration specifiers
or '...' before 'size_t'
/usr/include/bits/string3.h: In function 'memcpy':
/usr/include/bits/string3.h:52: error: '__len' undeclared (first use
in this function)
/usr/include/bits/string3.h: At top level:
/usr/include/bits/string3.h:56: error: expected declaration specifiers
or '...' before 'size_t'
/usr/include/bits/string3.h: In function 'memmove':
/usr/include/bits/string3.h:58: error: '__len' undeclared (first use
in this function)
/usr/include/bits/string3.h: At top level:
/usr/include/bits/string3.h:63: error: expected declaration specifiers
or '...' before 'size_t'
/usr/include/bits/string3.h: In function 'mempcpy':
/usr/include/bits/string3.h:66: error: '__len' undeclared (first use
in this function)
/usr/include/bits/string3.h: At top level:
/usr/include/bits/string3.h:77: error: expected declaration specifiers
or '...' before 'size_t'
/usr/include/bits/string3.h: In function 'memset':
/usr/include/bits/string3.h:79: error: '__len' undeclared (first use
in this function)
/usr/include/bits/string3.h: At top level:
/usr/include/bits/string3.h:90: error: expected declaration specifiers
or '...' before 'size_t'
/usr/include/bits/string3.h: In function 'bcopy':
/usr/include/bits/string3.h:92: error: '__len' undeclared (first use
in this function)
/usr/include/bits/string3.h: At top level:
/usr/include/bits/string3.h:96: error: expected declaration specifiers
or '...' before 'size_t'
/usr/include/bits/string3.h: In function 'bzero':
/usr/include/bits/string3.h:98: error: '__len' undeclared (first use
in this function)
/usr/include/bits/string3.h: At top level:
/usr/include/bits/string3.h:118: error: expected declaration
specifiers or '...' before 'size_t'
/usr/include/bits/string3.h: In function 'strncpy':
/usr/include/bits/string3.h:121: error: '__len' undeclared (first use
in this function)
/usr/include/bits/string3.h: At top level:
/usr/include/bits/string3.h:125: error: expected declaration
specifiers or '...' before 'size_t'
/usr/include/bits/string3.h:126: error: expected declaration
specifiers or '...' before 'size_t'
/usr/include/bits/string3.h:127: error: expected declaration
specifiers or '...' before 'size_t'
/usr/include/bits/string3.h:132: error: expected declaration
specifiers or '...' before 'size_t'
/usr/include/bits/string3.h: In function 'stpncpy':
/usr/include/bits/string3.h:135: error: '__n' undeclared (first use in
this function)
/usr/include/bits/string3.h:136: error: too many arguments to function
'__stpncpy_chk'
/usr/include/bits/string3.h:137: error: too many arguments to function
'__stpncpy_alias'
/usr/include/bits/string3.h: At top level:
/usr/include/bits/string3.h:149: error: expected declaration
specifiers or '...' before 'size_t'
/usr/include/bits/string3.h: In function 'strncat':
/usr/include/bits/string3.h:152: error: '__len' undeclared (first use
in this function)
In file included from /usr/include/stdio.h:75,
? ? ? ? ? ? ? ? from ../ncurses/curses.priv.h:82,
? ? ? ? ? ? ? ? from ./tinfo/comp_hash.c:42:
/usr/include/libio.h: At top level:
/usr/include/libio.h:332: error: expected specifier-qualifier-list
before 'size_t'
/usr/include/libio.h:364: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/libio.h:373: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/libio.h:495: error: expected '=', ',', ';', 'asm' or
'__attribute__' before '_IO_sgetn'
In file included from ../ncurses/curses.priv.h:82,
? ? ? ? ? ? ? ? from ./tinfo/comp_hash.c:42:
/usr/include/stdio.h:316: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/stdio.h:322: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/stdio.h:334: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/stdio.h:341: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/stdio.h:383: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/stdio.h:385: error: format string argument not a string type
/usr/include/stdio.h:387: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/stdio.h:659: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/stdio.h:662: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/stdio.h:672: error: expected declaration specifiers or
'...' before 'size_t'
/usr/include/stdio.h:702: error: expected '=', ',', ';', 'asm' or
'__attribute__' before 'fread'
/usr/include/stdio.h:708: error: expected '=', ',', ';', 'asm' or
'__attribute__' before 'fwrite'
/usr/include/stdio.h:730: error: expected '=', ',', ';', 'asm' or
'__attribute__' before 'fread_unlocked'
/usr/include/stdio.h:732: error: expected '=', ',', ';', 'asm' or
'__attribute__' before 'fwrite_unlocked'
In file included from /usr/include/stdio.h:927,
? ? ? ? ? ? ? ? from ../ncurses/curses.priv.h:82,
? ? ? ? ? ? ? ? from ./tinfo/comp_hash.c:42:
/usr/include/bits/stdio.h:116: error: expected declaration specifiers
or '...' before 'size_t'
/usr/include/bits/stdio.h: In function 'getline':
/usr/include/bits/stdio.h:118: error: '__n' undeclared (first use in
this function)
/usr/include/bits/stdio.h:118: error: too many arguments to function
'__getdelim'
In file included from /usr/include/stdio.h:930,
? ? ? ? ? ? ? ? from ../ncurses/curses.priv.h:82,
? ? ? ? ? ? ? ? from ./tinfo/comp_hash.c:42:
/usr/include/bits/stdio2.h: At top level:
/usr/include/bits/stdio2.h:24: error: expected declaration specifiers
or '...' before 'size_t'
/usr/include/bits/stdio2.h:26: error: expected declaration specifiers
or '...' before 'size_t'
/usr/include/bits/stdio2.h:53: error: expected declaration specifiers
or '...' before 'size_t'
/usr/include/bits/stdio2.h:54: error: expected declaration specifiers
or '...' before 'size_t'
/usr/include/bits/stdio2.h:56: error: expected declaration specifiers
or '...' before 'size_t'
/usr/include/bits/stdio2.h:57: error: expected declaration specifiers
or '...' before 'size_t'
/usr/include/bits/stdio2.h:62: error: expected declaration specifiers
or '...' before 'size_t'
/usr/include/bits/stdio2.h: In function 'snprintf':
/usr/include/bits/stdio2.h:65: error: '__n' undeclared (first use in
this function)
/usr/include/bits/stdio2.h: At top level:
/usr/include/bits/stdio2.h:75: error: expected declaration specifiers
or '...' before 'size_t'
/usr/include/bits/stdio2.h: In function 'vsnprintf':
/usr/include/bits/stdio2.h:78: error: '__n' undeclared (first use in
this function)
/usr/include/bits/stdio2.h: At top level:
/usr/include/bits/stdio2.h:220: error: expected declaration specifiers
or '...' before 'size_t'
/usr/include/bits/stdio2.h: In function 'gets':
/usr/include/bits/stdio2.h:229: error: too many arguments to function
'__gets_chk'
/usr/include/bits/stdio2.h: At top level:
/usr/include/bits/stdio2.h:233: error: expected declaration specifiers
or '...' before 'size_t'
/usr/include/bits/stdio2.h:238: error: expected declaration specifiers
or '...' before 'size_t'
/usr/include/bits/stdio2.h: In function 'fgets':
/usr/include/bits/stdio2.h:250: error: too many arguments to function
'__fgets_chk'
/usr/include/bits/stdio2.h:252: error: expected ')' before '__n'
/usr/include/bits/stdio2.h:253: error: too many arguments to function
'__fgets_chk_warn'
/usr/include/bits/stdio2.h: At top level:
/usr/include/bits/stdio2.h:258: error: expected '=', ',', ';', 'asm'
or '__attribute__' before '__fread_chk'
/usr/include/bits/stdio2.h:261: error: expected '=', ',', ';', 'asm'
or '__attribute__' before '__fread_alias'
/usr/include/bits/stdio2.h:265: error: expected '=', ',', ';', 'asm'
or '__attribute__' before '__fread_chk_warn'
/usr/include/bits/stdio2.h:274: error: expected '=', ',', ';', 'asm'
or '__attribute__' before 'fread'
/usr/include/bits/stdio2.h:291: error: expected declaration specifiers
or '...' before 'size_t'
/usr/include/bits/stdio2.h:296: error: expected declaration specifiers
or '...' before 'size_t'
/usr/include/bits/stdio2.h: In function 'fgets_unlocked':
/usr/include/bits/stdio2.h:308: error: too many arguments to function
'__fgets_unlocked_chk'
/usr/include/bits/stdio2.h:310: error: expected ')' before '__n'
/usr/include/bits/stdio2.h:311: error: too many arguments to function
'__fgets_unlocked_chk_warn'
/usr/include/bits/stdio2.h: At top level:
/usr/include/bits/stdio2.h:319: error: expected '=', ',', ';', 'asm'
or '__attribute__' before '__fread_unlocked_chk'
/usr/include/bits/stdio2.h:322: error: expected '=', ',', ';', 'asm'
or '__attribute__' before '__fread_unlocked_alias'
/usr/include/bits/stdio2.h:326: error: expected '=', ',', ';', 'asm'
or '__attribute__' before '__fread_unlocked_chk_warn'
/usr/include/bits/stdio2.h:335: error: expected '=', ',', ';', 'asm'
or '__attribute__' before 'fread_unlocked'
In file included from /usr/include/signal.h:356,
? ? ? ? ? ? ? ? from ../ncurses/curses.priv.h:115,
? ? ? ? ? ? ? ? from ./tinfo/comp_hash.c:42:
/usr/include/bits/sigstack.h:54: error: expected
specifier-qualifier-list before 'size_t'
In file included from ./tinfo/comp_hash.c:42:
../ncurses/curses.priv.h:177: error: expected declaration specifiers
or '...' before 'size_t'
In file included from ./tinfo/comp_hash.c:42:
../ncurses/curses.priv.h:544: error: expected specifier-qualifier-list
before 'size_t'
../ncurses/curses.priv.h:556: error: expected specifier-qualifier-list
before 'size_t'
../ncurses/curses.priv.h:584: error: expected specifier-qualifier-list
before 'SIG_ATOMIC_T'
../ncurses/curses.priv.h:930: error: expected '=', ',', ';', 'asm' or
'__attribute__' before '_nc_have_sigwinch'
In file included from /usr/include/bits/fcntl.h:27,
? ? ? ? ? ? ? ? from /usr/include/fcntl.h:34,
? ? ? ? ? ? ? ? from ../ncurses/curses.priv.h:1000,
? ? ? ? ? ? ? ? from ./tinfo/comp_hash.c:42:
/usr/include/bits/uio.h:47: error: expected specifier-qualifier-list
before 'size_t'
In file included from /usr/include/fcntl.h:34,
? ? ? ? ? ? ? ? from ../ncurses/curses.priv.h:1000,
? ? ? ? ? ? ? ? from ./tinfo/comp_hash.c:42:
/usr/include/bits/fcntl.h:240: error: expected declaration specifiers
or '...' before 'size_t'
/usr/include/bits/fcntl.h:251: error: expected declaration specifiers
or '...' before 'size_t'
/usr/include/bits/fcntl.h:255: error: expected declaration specifiers
or '...' before 'size_t'
/usr/include/bits/fcntl.h:259: error: expected declaration specifiers
or '...' before 'size_t'
In file included from ../ncurses/curses.priv.h:1194,
? ? ? ? ? ? ? ? from ./tinfo/comp_hash.c:42:
./../include/nc_alloc.h:89: error: expected declaration specifiers or
'...' before 'size_t'
In file included from ../ncurses/curses.priv.h:1194,
? ? ? ? ? ? ? ? from ./tinfo/comp_hash.c:42:
./../include/nc_alloc.h:91:1: warning: "strdup" redefined
In file included from /usr/include/string.h:637,
? ? ? ? ? ? ? ? from ../ncurses/curses.priv.h:64,
? ? ? ? ? ? ? ? from ./tinfo/comp_hash.c:42:
/usr/include/bits/string2.h:1316:1: warning: this is the location of
the previous definition
In file included from ./tinfo/comp_hash.c:42:
../ncurses/curses.priv.h:1553: error: expected
specifier-qualifier-list before 'size_t'
../ncurses/curses.priv.h:1558: error: expected declaration specifiers
or '...' before 'size_t'
../ncurses/curses.priv.h:1559: error: expected declaration specifiers
or '...' before 'size_t'
../ncurses/curses.priv.h:1574: error: expected declaration specifiers
or '...' before 'size_t'
../ncurses/curses.priv.h:1584: error: expected declaration specifiers
or '...' before 'size_t'
In file included from ./tinfo/comp_hash.c:70:
../ncurses/tinfo/doalloc.c:45: error: expected declaration specifiers
or '...' before 'size_t'
../ncurses/tinfo/doalloc.c: In function '_nc_doalloc':
../ncurses/tinfo/doalloc.c:50: error: 'amount' undeclared (first use
in this function)
../ncurses/tinfo/doalloc.c:50: error: too many arguments to function 'realloc'
../ncurses/tinfo/doalloc.c:55: warning: incompatible implicit
declaration of built-in function 'malloc'
../ncurses/tinfo/doalloc.c: In function '_nc_strdup':
../ncurses/tinfo/doalloc.c:66: warning: incompatible implicit
declaration of built-in function 'malloc'
../ncurses/tinfo/doalloc.c:66: warning: incompatible implicit
declaration of built-in function 'strlen'
./tinfo/comp_hash.c: In function 'parse_columns':
./tinfo/comp_hash.c:204: warning: incompatible implicit declaration of
built-in function 'calloc'
./tinfo/comp_hash.c: In function 'main':
./tinfo/comp_hash.c:239: warning: incompatible implicit declaration of
built-in function 'calloc'
./tinfo/comp_hash.c:281: error: expected ';' before '__s1_len'
./tinfo/comp_hash.c:281: error: '__s1_len' undeclared (first use in
this function)
./tinfo/comp_hash.c:281: warning: incompatible implicit declaration of
built-in function 'strlen'
./tinfo/comp_hash.c:281: error: '__s2_len' undeclared (first use in
this function)
./tinfo/comp_hash.c:281: error: expected expression before 'void'
./tinfo/comp_hash.c:281: error: called object 'size_t' is not a function
./tinfo/comp_hash.c:281: error: expected expression before 'void'
./tinfo/comp_hash.c:281: error: called object 'size_t' is not a function
./tinfo/comp_hash.c:281: error: expected expression before 'void'
./tinfo/comp_hash.c:281: error: called object 'size_t' is not a function
./tinfo/comp_hash.c:281: error: expected expression before 'void'
./tinfo/comp_hash.c:281: error: called object 'size_t' is not a function
./tinfo/comp_hash.c:281: error: expected expression before 'void'
./tinfo/comp_hash.c:281: error: called object 'size_t' is not a function
./tinfo/comp_hash.c:281: error: expected expression before 'void'
./tinfo/comp_hash.c:281: error: called object 'size_t' is not a function
./tinfo/comp_hash.c:281: error: expected expression before 'void'
./tinfo/comp_hash.c:281: error: called object 'size_t' is not a function
./tinfo/comp_hash.c:281: error: expected expression before 'void'
./tinfo/comp_hash.c:281: error: called object 'size_t' is not a function
./tinfo/comp_hash.c:281: error: expected expression before 'void'
./tinfo/comp_hash.c:281: error: called object 'size_t' is not a function
./tinfo/comp_hash.c:281: error: expected expression before 'void'
./tinfo/comp_hash.c:281: error: called object 'size_t' is not a function
./tinfo/comp_hash.c:281: error: expected expression before 'void'
./tinfo/comp_hash.c:281: error: called object 'size_t' is not a function
./tinfo/comp_hash.c:281: error: expected expression before 'void'
./tinfo/comp_hash.c:281: error: called object 'size_t' is not a function
./tinfo/comp_hash.c:284: error: expected ';' before '__s1_len'
./tinfo/comp_hash.c:284: warning: incompatible implicit declaration of
built-in function 'strlen'
./tinfo/comp_hash.c:284: error: expected expression before 'void'
./tinfo/comp_hash.c:284: error: called object 'size_t' is not a function
./tinfo/comp_hash.c:284: error: expected expression before 'void'
./tinfo/comp_hash.c:284: error: called object 'size_t' is not a function
./tinfo/comp_hash.c:284: error: expected expression before 'void'
./tinfo/comp_hash.c:284: error: called object 'size_t' is not a function
./tinfo/comp_hash.c:284: error: expected expression before 'void'
./tinfo/comp_hash.c:284: error: called object 'size_t' is not a function
./tinfo/comp_hash.c:284: error: expected expression before 'void'
./tinfo/comp_hash.c:284: error: called object 'size_t' is not a function
./tinfo/comp_hash.c:284: error: expected expression before 'void'
./tinfo/comp_hash.c:284: error: called object 'size_t' is not a function
./tinfo/comp_hash.c:284: error: expected expression before 'void'
./tinfo/comp_hash.c:284: error: called object 'size_t' is not a function
./tinfo/comp_hash.c:284: error: expected expression before 'void'
./tinfo/comp_hash.c:284: error: called object 'size_t' is not a function
./tinfo/comp_hash.c:284: error: expected expression before 'void'
./tinfo/comp_hash.c:284: error: called object 'size_t' is not a function
./tinfo/comp_hash.c:284: error: expected expression before 'void'
./tinfo/comp_hash.c:284: error: called object 'size_t' is not a function
./tinfo/comp_hash.c:284: error: expected expression before 'void'
./tinfo/comp_hash.c:284: error: called object 'size_t' is not a function
./tinfo/comp_hash.c:284: error: expected expression before 'void'
./tinfo/comp_hash.c:284: error: called object 'size_t' is not a function
./tinfo/comp_hash.c:287: error: expected ';' before '__s1_len'
./tinfo/comp_hash.c:287: warning: incompatible implicit declaration of
built-in function 'strlen'
./tinfo/comp_hash.c:287: error: expected expression before 'void'
./tinfo/comp_hash.c:287: error: called object 'size_t' is not a function
./tinfo/comp_hash.c:287: error: expected expression before 'void'
./tinfo/comp_hash.c:287: error: called object 'size_t' is not a function
./tinfo/comp_hash.c:287: error: expected expression before 'void'
./tinfo/comp_hash.c:287: error: called object 'size_t' is not a function
./tinfo/comp_hash.c:287: error: expected expression before 'void'
./tinfo/comp_hash.c:287: error: called object 'size_t' is not a function
./tinfo/comp_hash.c:287: error: expected expression before 'void'
./tinfo/comp_hash.c:287: error: called object 'size_t' is not a function
./tinfo/comp_hash.c:287: error: expected expression before 'void'
./tinfo/comp_hash.c:287: error: called object 'size_t' is not a function
./tinfo/comp_hash.c:287: error: expected expression before 'void'
./tinfo/comp_hash.c:287: error: called object 'size_t' is not a function
./tinfo/comp_hash.c:287: error: expected expression before 'void'
./tinfo/comp_hash.c:287: error: called object 'size_t' is not a function
./tinfo/comp_hash.c:287: error: expected expression before 'void'
./tinfo/comp_hash.c:287: error: called object 'size_t' is not a function
./tinfo/comp_hash.c:287: error: expected expression before 'void'
./tinfo/comp_hash.c:287: error: called object 'size_t' is not a function
./tinfo/comp_hash.c:287: error: expected expression before 'void'
./tinfo/comp_hash.c:287: error: called object 'size_t' is not a function
./tinfo/comp_hash.c:287: error: expected expression before 'void'
./tinfo/comp_hash.c:287: error: called object 'size_t' is not a function
./tinfo/comp_hash.c:307: warning: incompatible implicit declaration of
built-in function 'strlen'
./tinfo/comp_hash.c:328: warning: incompatible implicit declaration of
built-in function 'strlen'
make[2]: *** [make_hash] Error 1
make[2]: Leaving directory
`/home/anthony/work/virtex4linux/buildroot/output/build/host-ncurses-5.7/ncurses'
make[1]: *** [sources] Error 2
make[1]: Leaving directory
`/home/anthony/work/virtex4linux/buildroot/output/build/host-ncurses-5.7'
make: *** [/home/anthony/work/virtex4linux/buildroot/output/build/host-ncurses-5.7/.stamp_built]
Error 2
