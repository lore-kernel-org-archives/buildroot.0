From: massimeddu <massimeddu@gmail.com>
Date: Wed, 21 Mar 2007 17:00:24 +0100
Subject: [Buildroot] Problems with gmp
Message-ID: <ed5eec790703210900m5781184eu893292fc7cc9b349@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I'm trying to make a image for the Soekris net4801 with buildroot.
I do use a Ubuntu edgy with Linux Kernel 2.6.17 and gcc 4.1.2, lic6 2.4 and
libgmp3c2 4.2.1.
In the make menuconfig script i have set the linux kernel 2.6.20, gcc
4.1.2and i have selected the gmp package too but the make failed with
these
errors:

checking whether the
/home/wire/Desktop/buildroot/build_i586/staging_dir/bin/i586-linux-uclibc-gcc
linker
(/home/wire/Desktop/buildroot/build_i586/staging_dir/bin/i586-linux-uclibc-ld)
supports shared libraries... yes
checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... cat: /etc/ld.so.conf.d/*.conf: No
such file or directory
GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... yes
configure: creating libtool
checking whether gcc __attribute__ ((mode (XX))) works... yes
checking for recent GMP... yes
checking for gmp internal files... no
checking for working alloca.h... yes
checking for alloca... yes
checking for __gmpz_init in -lgmp... no
configure: error: libgmp not found
make: *** [/home/wire/Desktop/buildroot/build_i586/mpfr-2.2.1/.configured]
Error 1

______________________________________________________________________________________________

I tried to launch make check in ./build_i586/gmp-4.2.1/ but that failed with
errors too:

wire at wire-desktop:~/Desktop/buildroot/build_i586/gmp-4.2.1$ make checkmake
check-recursive
make[1]: Entering directory `/home/wire/Desktop/buildroot/build_i586/gmp-
4.2.1'
Making check in tests
make[2]: Entering directory `/home/wire/Desktop/buildroot/build_i586/gmp-
4.2.1/tests'
Making check in .
make[3]: Entering directory `/home/wire/Desktop/buildroot/build_i586/gmp-
4.2.1/tests'
make  libtests.la t-bswap t-constants t-count_zeros t-gmpmax t-hightomask
t-modlinv t-popc t-parity t-sub
make[4]: Entering directory `/home/wire/Desktop/buildroot/build_i586/gmp-
4.2.1/tests'
make[4]: `libtests.la' is up to date.
/bin/bash ../libtool --mode=link
/home/wire/Desktop/buildroot/build_i586/staging_dir/bin/i586-linux-uclibc-gcc
-Os -pipe    -o t-bswap  t-bswap.o libtests.la ../libgmp.la
/home/wire/Desktop/buildroot/build_i586/staging_dir/bin/i586-linux-uclibc-gcc
-Os -pipe -o .libs/t-bswap t-bswap.o  ./.libs/libtests.a
/home/wire/Desktop/buildroot/build_i586/gmp-4.2.1/.libs/libgmp.so
../.libs/libgmp.so -Wl,--rpath
-Wl,/home/wire/Desktop/buildroot/build_i586/staging_dir/lib
/home/wire/Desktop/buildroot/build_i586/staging_dir/lib/gcc/i586-linux-uclibc/4.1.2/../../../../i586-linux-uclibc/bin/ld:
warning: cannot find entry symbol _start; defaulting to 080495b8
t-bswap.o: In function `main':
t-bswap.c:(.text+0x2d): undefined reference to `__gmpn_random'
./.libs/libtests.a(misc.o): In function `__gmp_allocate_func_aligned':
misc.c:(.text+0x39): undefined reference to `__gmp_allocate_func'
./.libs/libtests.a(misc.o): In function `__gmp_allocate_or_reallocate':
misc.c:(.text+0x72): undefined reference to `__gmp_allocate_func'
misc.c:(.text+0x7f): undefined reference to `__gmp_reallocate_func'
./.libs/libtests.a(misc.o): In function `tests_rand_end':
misc.c:(.text+0x3c8): undefined reference to `__gmp_rands_initialized'
misc.c:(.text+0x3d9): undefined reference to `__gmp_rands'
misc.c:(.text+0x3de): undefined reference to `__gmp_randclear'
./.libs/libtests.a(misc.o): In function `call_rand_algs':
misc.c:(.text+0x40d): undefined reference to `__gmpz_init'
misc.c:(.text+0x415): undefined reference to `__gmp_randinit_default'
misc.c:(.text+0x429): undefined reference to `__gmp_randclear'
misc.c:(.text+0x431): undefined reference to `__gmp_randinit_mt'
misc.c:(.text+0x445): undefined reference to `__gmp_randclear'
misc.c:(.text+0x44f): undefined reference to `__gmp_randinit_lc_2exp_size'
misc.c:(.text+0x463): undefined reference to `__gmp_randclear'
misc.c:(.text+0x46d): undefined reference to `__gmp_randinit_lc_2exp_size'
misc.c:(.text+0x481): undefined reference to `__gmp_randclear'
misc.c:(.text+0x48e): undefined reference to `__gmp_randinit_lc_2exp_size'
misc.c:(.text+0x4a2): undefined reference to `__gmp_randclear'
misc.c:(.text+0x4ae): undefined reference to `__gmpz_set_ui'
misc.c:(.text+0x4bb): undefined reference to `__gmp_randinit_lc_2exp'
misc.c:(.text+0x4d0): undefined reference to `__gmp_randclear'
misc.c:(.text+0x4dc): undefined reference to `__gmpz_set_ui'
misc.c:(.text+0x4ec): undefined reference to `__gmp_randinit_lc_2exp'
misc.c:(.text+0x501): undefined reference to `__gmp_randclear'
misc.c:(.text+0x50a): undefined reference to `__gmpz_clear'
./.libs/libtests.a(misc.o): In function `urandom':
misc.c:(.text+0x52e): undefined reference to `__gmp_rands_initialized'
misc.c:(.text+0x53f): undefined reference to `__gmp_rands'
misc.c:(.text+0x544): undefined reference to `__gmp_randinit_mt_noseed'
misc.c:(.text+0x54d): undefined reference to `__gmp_rands'
./.libs/libtests.a(misc.o): In function `mpz_errandomb':
misc.c:(.text+0x5ad): undefined reference to `__gmp_urandomm_ui'
misc.c:(.text+0x5ba): undefined reference to `__gmpz_rrandomb'
./.libs/libtests.a(misc.o): In function `mpz_errandomb_nonzero':
misc.c:(.text+0x5f8): undefined reference to `__gmpz_set_ui'
./.libs/libtests.a(misc.o): In function `mpz_erandomb':
misc.c:(.text+0x621): undefined reference to `__gmp_urandomm_ui'
misc.c:(.text+0x62e): undefined reference to `__gmpz_urandomb'
./.libs/libtests.a(misc.o): In function `mpz_erandomb_nonzero':
misc.c:(.text+0x66c): undefined reference to `__gmpz_set_ui'
./.libs/libtests.a(misc.o): In function `mpf_set_str_or_abort':
misc.c:(.text+0x69a): undefined reference to `__gmpf_set_str'
./.libs/libtests.a(misc.o): In function `mpq_set_str_or_abort':
misc.c:(.text+0x70e): undefined reference to `__gmpq_set_str'
./.libs/libtests.a(misc.o): In function `mpz_set_str_or_abort':
misc.c:(.text+0x782): undefined reference to `__gmpz_set_str'
./.libs/libtests.a(misc.o): In function `mpz_init_set_n':
misc.c:(.text+0x81e): undefined reference to `__gmp_allocate_func'
misc.c:(.text+0x833): undefined reference to `__gmpn_copyi'
./.libs/libtests.a(misc.o): In function `mpz_set_n':
misc.c:(.text+0x87d): undefined reference to `__gmpz_realloc'
misc.c:(.text+0x88d): undefined reference to `__gmpn_copyi'
./.libs/libtests.a(misc.o): In function `__gmp_allocate_strdup':
misc.c:(.text+0x8c1): undefined reference to `__gmp_allocate_func'
./.libs/libtests.a(misc.o): In function `tests_rand_start':
misc.c:(.text+0x8fc): undefined reference to `__gmp_rands_initialized'
misc.c:(.text+0x92c): undefined reference to `__gmp_rands'
misc.c:(.text+0x932): undefined reference to `__gmp_randinit_default'
misc.c:(.text+0x977): undefined reference to `__gmp_randseed_ui'
misc.c:(.text+0x998): undefined reference to `__gmp_randseed_ui'
./.libs/libtests.a(refmpn.o): In function `refmpn_popcount':
refmpn.c:(.text+0x286): undefined reference to `__gmp_assert_fail'
./.libs/libtests.a(refmpn.o): In function `refmpn_count_trailing_zeros':
refmpn.c:(.text+0x2de): undefined reference to `__gmp_assert_fail'
./.libs/libtests.a(refmpn.o): In function `refmpn_count_leading_zeros':
refmpn.c:(.text+0x320): undefined reference to `__gmp_assert_fail'
./.libs/libtests.a(refmpn.o): In function `refmpn_udiv_qrnnd':
refmpn.c:(.text+0x377): undefined reference to `__gmp_assert_fail'
./.libs/libtests.a(refmpn.o): In function `refmpn_invert_limb':
refmpn.c:(.text+0x4a4): undefined reference to `__gmp_assert_fail'
./.libs/libtests.a(refmpn.o):refmpn.c:(.text+0x519): more undefined
references to `__gmp_assert_fail' follow
./.libs/libtests.a(refmpn.o): In function `refmpn_random2':
refmpn.c:(.text+0x1d88): undefined reference to `__gmpn_random2'
./.libs/libtests.a(refmpn.o): In function `refmpn_random':
refmpn.c:(.text+0x1dae): undefined reference to `__gmpn_random'
./.libs/libtests.a(refmpn.o): In function `refmpn_mod_34lsub1':
refmpn.c:(.text+0x1dd9): undefined reference to `__gmpn_mod_1'
./.libs/libtests.a(refmpn.o): In function `refmpn_rsh1sub_n':
refmpn.c:(.text+0x1e3c): undefined reference to `__gmp_assert_fail'
refmpn.c:(.text+0x1e49): undefined reference to `__gmpn_sub_n'
refmpn.c:(.text+0x1e5c): undefined reference to `__gmpn_rshift'
./.libs/libtests.a(refmpn.o): In function `refmpn_rsh1add_n':
refmpn.c:(.text+0x1ec9): undefined reference to `__gmp_assert_fail'
refmpn.c:(.text+0x1ed6): undefined reference to `__gmpn_add_n'
refmpn.c:(.text+0x1ee9): undefined reference to `__gmpn_rshift'
./.libs/libtests.a(refmpn.o): In function `refmpn_malloc_limbs':
refmpn.c:(.text+0x1f52): undefined reference to `__gmp_assert_fail'
./.libs/libtests.a(refmpn.o): In function `refmpn_hamdist':
refmpn.c:(.text+0x1f8d): undefined reference to `__gmp_assert_fail'
./.libs/libtests.a(refmpn.o): In function `refmpn_addsub_nc':
refmpn.c:(.text+0x2039): undefined reference to `__gmp_assert_fail'
./.libs/libtests.a(refmpn.o): In function `refmpn_submul_1c':
refmpn.c:(.text+0x2154): undefined reference to `__gmp_assert_fail'
./.libs/libtests.a(refmpn.o): In function `refmpn_addmul_1c':
refmpn.c:(.text+0x2210): undefined reference to `__gmp_assert_fail'
./.libs/libtests.a(refmpn.o):refmpn.c:(.text+0x22f7): more undefined
references to `__gmp_assert_fail' follow
./.libs/libtests.a(refmpn.o): In function `refmpn_sublsh1_n':
refmpn.c:(.text+0x28d6): undefined reference to `__gmpn_lshift'
refmpn.c:(.text+0x28eb): undefined reference to `__gmpn_sub_n'
./.libs/libtests.a(refmpn.o): In function `refmpn_addlsh1_n':
refmpn.c:(.text+0x2961): undefined reference to `__gmp_assert_fail'
./.libs/libtests.a(refmpn.o): In function `refmpn_sqrtrem':
refmpn.c:(.text+0x2a75): undefined reference to `__gmp_assert_fail'
./.libs/libtests.a(refmpn.o): In function `refmpn_sb_divrem_mn':
refmpn.c:(.text+0x2d7e): undefined reference to `__gmp_assert_fail'
./.libs/libtests.a(refmpn.o): In function `refmpn_divmod_1c':
refmpn.c:(.text+0x3077): undefined reference to `__gmp_assert_fail'
./.libs/libtests.a(refmpn.o): In function `refmpn_divexact_by3c':
refmpn.c:(.text+0x31d9): undefined reference to `__gmp_assert_fail'
./.libs/libtests.a(refmpn.o):refmpn.c:(.text+0x3375): more undefined
references to `__gmp_assert_fail' follow
./.libs/libtests.a(trace.o): In function `mpn_trace_file':
trace.c:(.text+0x2f0): undefined reference to `__gmpz_out_str'
./.libs/libtests.a(trace.o): In function `mpn_tracea_file':
trace.c:(.text+0x387): undefined reference to `__gmp_tmp_reentrant_alloc'
trace.c:(.text+0x3cc): undefined reference to `__gmp_tmp_reentrant_free'
./.libs/libtests.a(trace.o): In function `mpf_trace':
trace.c:(.text+0x430): undefined reference to `__gmpf_out_str'
./.libs/libtests.a(trace.o): In function `mpq_trace':
trace.c:(.text+0x494): undefined reference to `__gmpq_out_str'
./.libs/libtests.a(memory.o): In function `tests_memory_start':
memory.c:(.text+0x114): undefined reference to `__gmp_set_memory_functions'
./.libs/libtests.a(memory.o): In function `tests_free_nosize':
memory.c:(.text+0x14c): undefined reference to `__gmp_default_free'
memory.c:(.text+0x156): undefined reference to `__gmp_default_free'
./.libs/libtests.a(memory.o): In function `tests_reallocate':
memory.c:(.text+0x22c): undefined reference to `__gmp_default_reallocate'
./.libs/libtests.a(memory.o): In function `tests_allocate':
memory.c:(.text+0x270): undefined reference to `__gmp_default_allocate'
memory.c:(.text+0x28a): undefined reference to `__gmp_default_allocate'
collect2: ld returned 1 exit status
make[4]: *** [t-bswap] Error 1
make[4]: Leaving directory `/home/wire/Desktop/buildroot/build_i586/gmp-
4.2.1/tests'
make[3]: *** [check-am] Error 2
make[3]: Leaving directory `/home/wire/Desktop/buildroot/build_i586/gmp-
4.2.1/tests'
make[2]: *** [check-recursive] Error 1
make[2]: Leaving directory `/home/wire/Desktop/buildroot/build_i586/gmp-
4.2.1/tests'
make[1]: *** [check-recursive] Error 1
make[1]: Leaving directory `/home/wire/Desktop/buildroot/build_i586/gmp-
4.2.1'
make: *** [check] Error 2

__________________________________________________________________________________

Do you have any idea to solve it?
Thanks.

-- 
Massimeddu.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070321/7731163f/attachment-0001.htm 
