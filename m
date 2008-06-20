From: Fathi Boudra <fboudra@gmail.com>
Date: Fri, 20 Jun 2008 18:06:17 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc: 4.3.1
In-Reply-To: <20080620155605.GA15710@mx.loc>
References: <20080619190606.260DD3C67C@busybox.net>
	<6a2e33620806200850p4835102as74efd47c020f36e4@mail.gmail.com>
	<20080620155605.GA15710@mx.loc>
Message-ID: <6a2e33620806200906h5b27d157s551782a16eb00a36@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
> If there are problems then it would make more sense to fixup 4.3.1, really.
>

I agree but there's no clue so far:

/opt/trunk/powerpc/gcc-4.3-4.3.1-2/build/./gcc/xgcc
-B/opt/trunk/powerpc/gcc-4.3-4.3.1-2/build/./gcc/
-B/usr/powerpc-linux-gnu/bin/ -B/usr/powerpc-linux-gnu/lib/ -isystem
/usr/powerpc-linux-gnu/include -isystem
/usr/powerpc-linux-gnu/sys-include -O2  -O2 -g -g -O2   -DIN_GCC
-DCROSS_DIRECTORY_STRUCTURE   -W -Wall -Wwrite-strings
-Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition
-isystem ./include  -fPIC -mno-minimal-toc -g -DHAVE_GTHR_DEFAULT
-DIN_LIBGCC2 -D__GCC_FLOAT_NOT_NEEDED -Dinhibit_libc -shared
-nodefaultlibs -Wl,--soname=libgcc_s.so.1
-Wl,--version-script=libgcc.map -o 64/libgcc_s.so.1.tmp -O2 -g -g -O2
-m64 -fPIC -mstrict-align -B./ _muldi3_s.o _negdi2_s.o _lshrdi3_s.o
_ashldi3_s.o _ashrdi3_s.o _cmpdi2_s.o _ucmpdi2_s.o _clear_cache_s.o
_enable_execute_stack_s.o _trampoline_s.o __main_s.o _absvsi2_s.o
_absvdi2_s.o _addvsi3_s.o _addvdi3_s.o _subvsi3_s.o _subvdi3_s.o
_mulvsi3_s.o _mulvdi3_s.o _negvsi2_s.o _negvdi2_s.o _ctors_s.o
_ffssi2_s.o _ffsdi2_s.o _clz_s.o _clzsi2_s.o _clzdi2_s.o _ctzsi2_s.o
_ctzdi2_s.o _popcount_tab_s.o _popcountsi2_s.o _popcountdi2_s.o
_paritysi2_s.o _paritydi2_s.o _powisf2_s.o _powidf2_s.o _powixf2_s.o
_powitf2_s.o _mulsc3_s.o _muldc3_s.o _mulxc3_s.o _multc3_s.o
_divsc3_s.o _divdc3_s.o _divxc3_s.o _divtc3_s.o _bswapsi2_s.o
_bswapdi2_s.o _fixunssfsi_s.o _fixunsdfsi_s.o _fixunsxfsi_s.o
_fixsfdi_s.o _fixdfdi_s.o _fixxfdi_s.o _fixtfdi_s.o _fixunssfdi_s.o
_fixunsdfdi_s.o _fixunsxfdi_s.o _fixunstfdi_s.o _floatdisf_s.o
_floatdidf_s.o _floatdixf_s.o _floatditf_s.o _floatundisf_s.o
_floatundidf_s.o _floatundixf_s.o _floatunditf_s.o _divdi3_s.o
_moddi3_s.o _udivdi3_s.o _umoddi3_s.o _udiv_w_sdiv_s.o _udivmoddi4_s.o
darwin-ldouble_s.o ppc64-fp_s.o adddf3_s.o addsf3_s.o divdf3_s.o
divsf3_s.o eqdf2_s.o eqsf2_s.o extendsfdf2_s.o fixdfsi_s.o fixsfsi_s.o
floatsidf_s.o floatsisf_s.o floatunsidf_s.o floatunsisf_s.o gedf2_s.o
gesf2_s.o ledf2_s.o lesf2_s.o muldf3_s.o mulsf3_s.o negdf2_s.o
negsf2_s.o subdf3_s.o subsf3_s.o truncdfsf2_s.o unorddf2_s.o
unordsf2_s.o tramp_s.o unwind-dw2_s.o unwind-dw2-fde-glibc_s.o
unwind-sjlj_s.o gthr-gnat_s.o unwind-c_s.o emutls_s.o -lc && rm -f
64/libgcc_s.so && if [ -f 64/libgcc_s.so.1 ]; then mv -f
64/libgcc_s.so.1 64/libgcc_s.so.1.backup; else true; fi && mv
64/libgcc_s.so.1.tmp 64/libgcc_s.so.1 && ln -s libgcc_s.so.1
64/libgcc_s.so
/usr/powerpc-linux-gnu/bin/ld: skipping incompatible
/usr/powerpc-linux-gnu/lib/libc.so when searching for -lc
/usr/powerpc-linux-gnu/bin/ld: skipping incompatible
/usr/powerpc-linux-gnu/lib/libc.a when searching for -lc
/usr/powerpc-linux-gnu/bin/ld: skipping incompatible
/usr/powerpc-linux-gnu/bin/../../lib/libc.so when searching for -lc
/usr/powerpc-linux-gnu/bin/ld: skipping incompatible
/usr/powerpc-linux-gnu/bin/../../lib/libc.a when searching for -lc
/usr/powerpc-linux-gnu/bin/ld: cannot find -lc
collect2: ld returned 1 exit status

btw, it's against libc and not uclibc. I tried against uclibc but I
have another build failure.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080620/e6a39ab6/attachment.htm 
