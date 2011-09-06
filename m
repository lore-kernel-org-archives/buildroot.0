From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Tue, 06 Sep 2011 14:44:12 +0200
Subject: [Buildroot] ncurses: build error
Message-ID: <4E66159C.5070309@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have following problems, when building ncurses:

/usr/bin/make -j1 -C /home/YegorYefremov/projects/versioned/tests/br/buildroot-2011.08/output/build/host-ncurses-5.7 sources
make[1]: Entering directory `/home/YegorYefremov/projects/versioned/tests/br/buildroot-2011.08/output/build/host-ncurses-5.7'
cd man && /usr/bin/make DESTDIR="" sources
make[2]: Entering directory `/home/YegorYefremov/projects/versioned/tests/br/buildroot-2011.08/output/build/host-ncurses-5.7/man'
sh ./MKterminfo.sh ./terminfo.head ./../include/Caps ./terminfo.tail >terminfo.5
make[2]: Leaving directory `/home/YegorYefremov/projects/versioned/tests/br/buildroot-2011.08/output/build/host-ncurses-5.7/man'
cd include && /usr/bin/make DESTDIR="" sources
make[2]: Entering directory `/home/YegorYefremov/projects/versioned/tests/br/buildroot-2011.08/output/build/host-ncurses-5.7/include'
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
make[2]: Leaving directory `/home/YegorYefremov/projects/versioned/tests/br/buildroot-2011.08/output/build/host-ncurses-5.7/include'
cd ncurses && /usr/bin/make DESTDIR="" sources
make[2]: Entering directory `/home/YegorYefremov/projects/versioned/tests/br/buildroot-2011.08/output/build/host-ncurses-5.7/ncurses'
gawk -f ./tinfo/MKcodes.awk bigstrings=1 ./../include/Caps >codes.c
/usr/local/bin/gcc -o make_hash -DHAVE_CONFIG_H -I../ncurses -I. -I./../include -I../include -DHAVE_CONFIG_H -I../ncurses -I. -I. -I../include  -D_GNU_SOURCE -DNDEBUG -I/home/YegorYefremov/projects/versioned/tests/br/buildroot-2011.08/output/host/usr/include/ncurses -O2 -I/home/YegorYefremov/projects/versioned/tests/br/buildroot-2011.08/output/host/include -I/home/YegorYefremov/projects/versioned/tests/br/buildroot-2011.08/output/host/usr/include -DMAIN_PROGRAM ./tinfo/comp_hash.c -L/home/YegorYefremov/projects/versioned/tests/br/buildroot-2011.08/output/host/lib -L/home/YegorYefremov/projects/versioned/tests/br/buildroot-2011.08/output/host/usr/lib -Wl,-rpath,/home/YegorYefremov/projects/versioned/tests/br/buildroot-2011.08/output/host/usr/lib  -ldl
In file included from ../ncurses/curses.priv.h:55,
                 from ./tinfo/comp_hash.c:42:
./../include/ncurses_cfg.h:58:23: warning: missing terminating " character
In file included from ../ncurses/curses.priv.h:55,
                 from ./tinfo/comp_hash.c:42:
./../include/ncurses_cfg.h:59: error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before ?.? token
./../include/ncurses_cfg.h:59:12: warning: missing terminating " character
./../include/ncurses_cfg.h:59: error: missing terminating " character
In file included from ../ncurses/curses.priv.h:63,
                 from ./tinfo/comp_hash.c:42:
/usr/include/stdlib.h:140: error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before ?__ctype_get_mb_cur_max?
In file included from ../ncurses/curses.priv.h:63,
                 from ./tinfo/comp_hash.c:42:
/usr/include/stdlib.h:455: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/stdlib.h:485: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/stdlib.h:487: error: nonnull argument with out-of-range operand number (argument 1, operand 4)
/usr/include/stdlib.h:589: error: expected ?)? before ?__size?
/usr/include/stdlib.h:591: error: expected ?)? before ?__nmemb?
/usr/include/stdlib.h:600: error: expected declaration specifiers or ?...? before ?size_t?
In file included from /usr/include/stdlib.h:612,
                 from ../ncurses/curses.priv.h:63,
                 from ./tinfo/comp_hash.c:42:
/usr/include/alloca.h:33: error: expected ?)? before ?__size?
In file included from ../ncurses/curses.priv.h:63,
                 from ./tinfo/comp_hash.c:42:
/usr/include/stdlib.h:617: error: expected ?)? before ?__size?
/usr/include/stdlib.h:622: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/stdlib.h:622: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/stdlib.h:774: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/stdlib.h:774: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/stdlib.h:775: error: nonnull argument with out-of-range operand number (argument 1, operand 5)
/usr/include/stdlib.h:779: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/stdlib.h:779: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/stdlib.h:780: error: nonnull argument with out-of-range operand number (argument 1, operand 4)
/usr/include/stdlib.h:852: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/stdlib.h:855: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/stdlib.h:859: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/stdlib.h:863: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/stdlib.h:872: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/stdlib.h:876: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/stdlib.h:883: error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before ?mbstowcs?
/usr/include/stdlib.h:886: error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before ?wcstombs?
/usr/include/stdlib.h:949: error: expected declaration specifiers or ?...? before ?size_t?
In file included from ../ncurses/curses.priv.h:64,
                 from ./tinfo/comp_hash.c:42:
/usr/include/string.h:39: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/string.h:43: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/string.h:52: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/string.h:59: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/string.h:62: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/string.h:66: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/string.h:77: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/string.h:88: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/string.h:96: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/string.h:102: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/string.h:109: error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before ?strxfrm?
/usr/include/string.h:124: error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before ?strxfrm_l?
/usr/include/string.h:138: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/string.h:184: error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before ?strcspn?
/usr/include/string.h:188: error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before ?strspn?
/usr/include/string.h:225: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/string.h:226: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/string.h:227: error: nonnull argument with out-of-range operand number (argument 1, operand 3)
/usr/include/string.h:232: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/string.h:235: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/string.h:242: error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before ?strlen?
/usr/include/string.h:249: error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before ?strnlen?
/usr/include/string.h:281: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/string.h:294: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/string.h:298: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/string.h:302: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/string.h:305: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/string.h:335: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/string.h:347: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/string.h:348: error: nonnull argument with out-of-range operand number (argument 1, operand 4)
/usr/include/string.h:376: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/string.h:379: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/string.h:386: error: expected declaration specifiers or ?...? before ?size_t?
In file included from /usr/include/string.h:423,
                 from ../ncurses/curses.priv.h:64,
                 from ./tinfo/comp_hash.c:42:
/usr/include/bits/string2.h:969: error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before ?__strcspn_c1?
/usr/include/bits/string2.h:971: error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before ?__strcspn_c1?
/usr/include/bits/string2.h:979: error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before ?__strcspn_c2?
/usr/include/bits/string2.h:982: error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before ?__strcspn_c2?
/usr/include/bits/string2.h:991: error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before ?__strcspn_c3?
/usr/include/bits/string2.h:994: error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before ?__strcspn_c3?
/usr/include/bits/string2.h:1045: error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before ?__strspn_c1?
/usr/include/bits/string2.h:1047: error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before ?__strspn_c1?
/usr/include/bits/string2.h:1056: error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before ?__strspn_c2?
/usr/include/bits/string2.h:1059: error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before ?__strspn_c2?
/usr/include/bits/string2.h:1068: error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before ?__strspn_c3?
/usr/include/bits/string2.h:1071: error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before ?__strspn_c3?
/usr/include/bits/string2.h: In function ?__strpbrk_c2?:
/usr/include/bits/string2.h:1129: error: ?size_t? undeclared (first use in this function)
/usr/include/bits/string2.h:1129: error: (Each undeclared identifier is reported only once
/usr/include/bits/string2.h:1129: error: for each function it appears in.)
/usr/include/bits/string2.h:1129: error: expected ?;? before ?__s?
/usr/include/bits/string2.h: In function ?__strpbrk_c3?:
/usr/include/bits/string2.h:1142: error: ?size_t? undeclared (first use in this function)
/usr/include/bits/string2.h:1142: error: expected ?;? before ?__s?
/usr/include/bits/string2.h: At top level:
/usr/include/bits/string2.h:1323: error: expected declaration specifiers or ?...? before ?size_t?
In file included from /usr/include/_G_config.h:44,
                 from /usr/include/libio.h:32,
                 from /usr/include/stdio.h:75,
                 from ../ncurses/curses.priv.h:82,
                 from ./tinfo/comp_hash.c:42:
/usr/include/gconv.h:72: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/gconv.h:88: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/gconv.h:97: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/gconv.h:174: error: expected specifier-qualifier-list before ?size_t?
In file included from /usr/include/stdio.h:75,
                 from ../ncurses/curses.priv.h:82,
                 from ./tinfo/comp_hash.c:42:
/usr/include/libio.h:329: error: expected specifier-qualifier-list before ?size_t?
/usr/include/libio.h:361: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/libio.h:370: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/libio.h:486: error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before ?_IO_sgetn?
In file included from ../ncurses/curses.priv.h:82,
                 from ./tinfo/comp_hash.c:42:
/usr/include/stdio.h:296: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/stdio.h:302: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/stdio.h:314: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/stdio.h:321: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/stdio.h:363: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/stdio.h:365: error: format string argument not a string type
/usr/include/stdio.h:367: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/stdio.h:369: error: format string argument not a string type
/usr/include/stdio.h:573: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/stdio.h:576: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/stdio.h:586: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/stdio.h:616: error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before ?fread?
/usr/include/stdio.h:622: error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before ?fwrite?
/usr/include/stdio.h:644: error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before ?fread_unlocked?
/usr/include/stdio.h:646: error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before ?fwrite_unlocked?
In file included from /usr/include/stdio.h:841,
                 from ../ncurses/curses.priv.h:82,
                 from ./tinfo/comp_hash.c:42:
/usr/include/bits/stdio.h:112: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/bits/stdio.h: In function ?getline?:
/usr/include/bits/stdio.h:114: error: ?__n? undeclared (first use in this function)
/usr/include/bits/stdio.h:114: error: too many arguments to function ?__getdelim?
In file included from /usr/include/signal.h:348,
                 from ../ncurses/curses.priv.h:115,
                 from ./tinfo/comp_hash.c:42:
/usr/include/bits/sigstack.h: At top level:
/usr/include/bits/sigstack.h:54: error: expected specifier-qualifier-list before ?size_t?
In file included from ./tinfo/comp_hash.c:42:
../ncurses/curses.priv.h:177: error: expected declaration specifiers or ?...? before ?size_t?
In file included from ./tinfo/comp_hash.c:42:
../ncurses/curses.priv.h:544: error: expected specifier-qualifier-list before ?size_t?
../ncurses/curses.priv.h:556: error: expected specifier-qualifier-list before ?size_t?
../ncurses/curses.priv.h:584: error: expected specifier-qualifier-list before ?SIG_ATOMIC_T?
../ncurses/curses.priv.h:930: error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before ?_nc_have_sigwinch?
In file included from /usr/include/bits/fcntl.h:27,
                 from /usr/include/fcntl.h:34,
                 from ../ncurses/curses.priv.h:1000,
                 from ./tinfo/comp_hash.c:42:
/usr/include/bits/uio.h:47: error: expected specifier-qualifier-list before ?size_t?
In file included from /usr/include/fcntl.h:34,
                 from ../ncurses/curses.priv.h:1000,
                 from ./tinfo/comp_hash.c:42:
/usr/include/bits/fcntl.h:227: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/bits/fcntl.h:237: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/bits/fcntl.h:242: error: expected declaration specifiers or ?...? before ?size_t?
/usr/include/bits/fcntl.h:246: error: expected declaration specifiers or ?...? before ?size_t?
In file included from ../ncurses/curses.priv.h:1194,
                 from ./tinfo/comp_hash.c:42:
./../include/nc_alloc.h:89: error: expected declaration specifiers or ?...? before ?size_t?
In file included from ../ncurses/curses.priv.h:1194,
                 from ./tinfo/comp_hash.c:42:
./../include/nc_alloc.h:91:1: warning: "strdup" redefined
In file included from /usr/include/string.h:423,
                 from ../ncurses/curses.priv.h:64,
                 from ./tinfo/comp_hash.c:42:
/usr/include/bits/string2.h:1317:1: warning: this is the location of the previous definition
In file included from ./tinfo/comp_hash.c:42:
../ncurses/curses.priv.h:1553: error: expected specifier-qualifier-list before ?size_t?
../ncurses/curses.priv.h:1558: error: expected declaration specifiers or ?...? before ?size_t?
../ncurses/curses.priv.h:1559: error: expected declaration specifiers or ?...? before ?size_t?
../ncurses/curses.priv.h:1574: error: expected declaration specifiers or ?...? before ?size_t?
../ncurses/curses.priv.h:1584: error: expected declaration specifiers or ?...? before ?size_t?
In file included from ./tinfo/comp_hash.c:70:
../ncurses/tinfo/doalloc.c:45: error: expected declaration specifiers or ?...? before ?size_t?
../ncurses/tinfo/doalloc.c: In function ?_nc_doalloc?:
../ncurses/tinfo/doalloc.c:50: error: ?amount? undeclared (first use in this function)
../ncurses/tinfo/doalloc.c:50: error: too many arguments to function ?realloc?
../ncurses/tinfo/doalloc.c:55: warning: incompatible implicit declaration of built-in function ?malloc?
../ncurses/tinfo/doalloc.c: In function ?_nc_strdup?:
../ncurses/tinfo/doalloc.c:66: warning: incompatible implicit declaration of built-in function ?malloc?
../ncurses/tinfo/doalloc.c:66: warning: incompatible implicit declaration of built-in function ?strlen?
./tinfo/comp_hash.c: In function ?parse_columns?:
./tinfo/comp_hash.c:204: warning: incompatible implicit declaration of built-in function ?calloc?
./tinfo/comp_hash.c: In function ?main?:
./tinfo/comp_hash.c:239: warning: incompatible implicit declaration of built-in function ?calloc?
./tinfo/comp_hash.c:281: error: ?size_t? undeclared (first use in this function)
./tinfo/comp_hash.c:281: error: expected ?;? before ?__s1_len?
./tinfo/comp_hash.c:281: error: ?__s1_len? undeclared (first use in this function)
./tinfo/comp_hash.c:281: warning: incompatible implicit declaration of built-in function ?strlen?
./tinfo/comp_hash.c:281: error: ?__s2_len? undeclared (first use in this function)
./tinfo/comp_hash.c:281: error: expected expression before ?void?
./tinfo/comp_hash.c:281: error: expected expression before ?void?
./tinfo/comp_hash.c:281: error: expected expression before ?void?
./tinfo/comp_hash.c:281: error: expected expression before ?void?
./tinfo/comp_hash.c:281: error: expected expression before ?void?
./tinfo/comp_hash.c:281: error: expected expression before ?void?
./tinfo/comp_hash.c:281: error: expected expression before ?void?
./tinfo/comp_hash.c:281: error: expected expression before ?void?
./tinfo/comp_hash.c:281: error: expected expression before ?void?
./tinfo/comp_hash.c:281: error: expected expression before ?void?
./tinfo/comp_hash.c:281: error: expected expression before ?void?
./tinfo/comp_hash.c:281: error: expected expression before ?void?
./tinfo/comp_hash.c:284: error: expected ?;? before ?__s1_len?
./tinfo/comp_hash.c:284: warning: incompatible implicit declaration of built-in function ?strlen?
./tinfo/comp_hash.c:284: error: expected expression before ?void?
./tinfo/comp_hash.c:284: error: expected expression before ?void?
./tinfo/comp_hash.c:284: error: expected expression before ?void?
./tinfo/comp_hash.c:284: error: expected expression before ?void?
./tinfo/comp_hash.c:284: error: expected expression before ?void?
./tinfo/comp_hash.c:284: error: expected expression before ?void?
./tinfo/comp_hash.c:284: error: expected expression before ?void?
./tinfo/comp_hash.c:284: error: expected expression before ?void?
./tinfo/comp_hash.c:284: error: expected expression before ?void?
./tinfo/comp_hash.c:284: error: expected expression before ?void?
./tinfo/comp_hash.c:284: error: expected expression before ?void?
./tinfo/comp_hash.c:284: error: expected expression before ?void?
./tinfo/comp_hash.c:287: error: expected ?;? before ?__s1_len?
./tinfo/comp_hash.c:287: warning: incompatible implicit declaration of built-in function ?strlen?
./tinfo/comp_hash.c:287: error: expected expression before ?void?
./tinfo/comp_hash.c:287: error: expected expression before ?void?
./tinfo/comp_hash.c:287: error: expected expression before ?void?
./tinfo/comp_hash.c:287: error: expected expression before ?void?
./tinfo/comp_hash.c:287: error: expected expression before ?void?
./tinfo/comp_hash.c:287: error: expected expression before ?void?
./tinfo/comp_hash.c:287: error: expected expression before ?void?
./tinfo/comp_hash.c:287: error: expected expression before ?void?
./tinfo/comp_hash.c:287: error: expected expression before ?void?
./tinfo/comp_hash.c:287: error: expected expression before ?void?
./tinfo/comp_hash.c:287: error: expected expression before ?void?
./tinfo/comp_hash.c:287: error: expected expression before ?void?
./tinfo/comp_hash.c:307: warning: incompatible implicit declaration of built-in function ?strlen?
./tinfo/comp_hash.c:328: warning: incompatible implicit declaration of built-in function ?strlen?

The most error are caused through this macro:

#define LIBGPM_SONAME "libgpm.so.1'
libgpm.so.1"

after fixing it I get only following errors:

/usr/local/bin/gcc -o make_hash -DHAVE_CONFIG_H -I../ncurses -I. -I./../include -I../include -DHAVE_CONFIG_H -I../ncurses -I. -I. -I../include  -D_GNU_SOURCE -DNDEBUG -I/home/YegorYefremov/projects/versioned/tests/br/buildroot-2011.08/output/host/usr/include/ncurses -O2 -I/home/YegorYefremov/projects/versioned/tests/br/buildroot-2011.08/output/host/include -I/home/YegorYefremov/projects/versioned/tests/br/buildroot-2011.08/output/host/usr/include -DMAIN_PROGRAM ./tinfo/comp_hash.c -L/home/YegorYefremov/projects/versioned/tests/br/buildroot-2011.08/output/host/lib -L/home/YegorYefremov/projects/versioned/tests/br/buildroot-2011.08/output/host/usr/lib -Wl,-rpath,/home/YegorYefremov/projects/versioned/tests/br/buildroot-2011.08/output/host/usr/lib  -ldl
In file included from ./tinfo/comp_hash.c:42:
../ncurses/curses.priv.h:584: error: expected specifier-qualifier-list before ?SIG_ATOMIC_T?
../ncurses/curses.priv.h:930: error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before ?_nc_have_sigwinch?
In file included from ../ncurses/curses.priv.h:1194,
                 from ./tinfo/comp_hash.c:42:
./../include/nc_alloc.h:91:1: warning: "strdup" redefined
In file included from /usr/include/string.h:423,
                 from ../ncurses/curses.priv.h:64,
                 from ./tinfo/comp_hash.c:42:
/usr/include/bits/string2.h:1317:1: warning: this is the location of the previous definition

Any idea?

Yegor
