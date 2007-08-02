From: Paul Barrette <r01325@freescale.com>
Date: Thu, 02 Aug 2007 13:16:55 -0400
Subject: [Buildroot] why is /usr/lib/libgmp.so linked in a cross compile?
Message-ID: <46B21187.901@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I am running a snap shot from Aug 1, building for powerpc.  I can see 
that there is a problem trying to link /usr/lib/libgmp.so during the 
toolchain build, which is not surprising, since I am on an i686 
crosscompiling for powerpc.

/localdisk/pb/latest_buildroot/new.broken.buildroot/build_powerpc_nofpu/staging_dir/usr/bin/powerpc-linux-uclibc-gcc 
-Os -pipe  
-I/localdisk/pb/latest_buildroot/new.broken.buildroot/build_powerpc_nofpu/staging_dir/usr/include 
-I/localdisk/pb/latest_buildroot/new.broken.buildroot/build_powerpc_nofpu/staging_dir/include 
-msoft-float -shared  .libs/exceptions.o .libs/extract.o 
.libs/uceil_exp2.o .libs/uceil_log2.o .libs/ufloor_log2.o .libs/add.o 
.libs/add1.o .libs/add_ui.o .libs/agm.o .libs/clear.o .libs/cmp.o 
.libs/cmp_abs.o .libs/cmp_si.o .libs/cmp_ui.o .libs/comparisons.o 
.libs/div_2exp.o .libs/div_2si.o .libs/div_2ui.o .libs/div.o 
.libs/div_ui.o .libs/dump.o .libs/eq.o .libs/exp10.o .libs/exp2.o 
.libs/exp3.o .libs/exp.o .libs/frac.o .libs/get_d.o .libs/get_exp.o 
.libs/get_str.o .libs/init.o .libs/inp_str.o .libs/isinteger.o 
.libs/isinf.o .libs/isnan.o .libs/isnum.o .libs/const_log2.o .libs/log.o 
.libs/mul_2exp.o .libs/mul_2si.o .libs/mul_2ui.o .libs/mul.o 
.libs/mul_ui.o .libs/neg.o .libs/next.o .libs/out_str.o .libs/const_pi.o 
.libs/pow.o .libs/pow_si.o .libs/pow_ui.o .libs/print_raw.o 
.libs/print_rnd_mode.o .libs/random2.o .libs/random.o .libs/reldiff.o 
.libs/round_prec.o .libs/set.o .libs/setmax.o .libs/setmin.o 
.libs/set_d.o .libs/set_dfl_prec.o .libs/set_exp.o .libs/set_rnd.o 
.libs/set_f.o .libs/set_prc_raw.o .libs/set_prec.o .libs/set_q.o 
.libs/set_si.o .libs/set_str.o .libs/set_str_raw.o .libs/set_ui.o 
.libs/set_z.o .libs/sqrt.o .libs/sqrt_ui.o .libs/sub.o .libs/sub1.o 
.libs/sub_ui.o .libs/rint.o .libs/ui_div.o .libs/ui_sub.o 
.libs/urandomb.o .libs/get_z_exp.o .libs/swap.o .libs/factorial.o 
.libs/cosh.o .libs/sinh.o .libs/tanh.o .libs/acosh.o .libs/asinh.o 
.libs/atanh.o .libs/atan.o .libs/cmp2.o .libs/exp_2.o .libs/asin.o 
.libs/const_euler.o .libs/cos.o .libs/sin.o .libs/tan.o .libs/fma.o 
.libs/hypot.o .libs/log1p.o .libs/expm1.o .libs/log2.o .libs/log10.o 
.libs/ui_pow.o .libs/ui_pow_ui.o .libs/minmax.o .libs/dim.o 
.libs/copysign.o .libs/gmp_op.o .libs/init2.o .libs/acos.o 
.libs/sin_cos.o .libs/set_nan.o .libs/set_inf.o .libs/powerof2.o 
.libs/gamma.o .libs/set_ld.o .libs/get_ld.o .libs/cbrt.o 
.libs/volatile.o .libs/fits_sshort.o .libs/fits_sint.o 
.libs/fits_slong.o .libs/fits_ushort.o .libs/fits_uint.o 
.libs/fits_ulong.o .libs/fits_uintmax.o .libs/fits_intmax.o 
.libs/get_si.o .libs/get_ui.o .libs/zeta.o .libs/cmp_d.o .libs/erf.o 
.libs/inits.o .libs/inits2.o .libs/clears.o .libs/sgn.o .libs/check.o 
.libs/sub1sp.o .libs/version.o .libs/mpn_exp.o .libs/mpfr-gmp.o 
.libs/mp_clz_tab.o .libs/sum.o .libs/add1sp.o .libs/free_cache.o 
.libs/si_op.o .libs/cmp_ld.o .libs/set_ui_2exp.o .libs/set_si_2exp.o 
.libs/set_uj.o .libs/set_sj.o .libs/get_sj.o .libs/get_uj.o 
.libs/get_z.o .libs/iszero.o .libs/cache.o .libs/sqr.o 
.libs/int_ceil_log2.o .libs/isqrt.o .libs/strtofr.o .libs/pow_z.o 
.libs/logging.o .libs/mulders.o .libs/get_f.o .libs/round_p.o 
.libs/erfc.o .libs/atan2.o .libs/subnormal.o .libs/const_catalan.o 
.libs/root.o .libs/sec.o .libs/csc.o .libs/cot.o .libs/eint.o 
.libs/sech.o .libs/csch.o .libs/coth.o .libs/round_near_x.o 
.libs/constant.o .libs/abort_prec_max.o .libs/stack_interface.o 
.libs/lngamma.o  
-L/localdisk/pb/latest_buildroot/new.broken.buildroot/build_powerpc_nofpu/gmp-4.2.1/lib 
/usr/lib/libgmp.so  -msoft-float -Wl,-soname -Wl,libmpfr.so.1 -o 
.libs/libmpfr.so.1.0.1
/usr/lib/libgmp.so: could not read symbols: File in wrong format
collect2: ld returned 1 exit status
make[2]: *** [libmpfr.la] Error 1
make[2]: Leaving directory 
`/localdisk/pb/latest_buildroot/new.broken.buildroot/build_powerpc_nofpu/mpfr-2.2.1'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory 
`/localdisk/pb/latest_buildroot/new.broken.buildroot/build_powerpc_nofpu/mpfr-2.2.1'
make: *** 
[/localdisk/pb/latest_buildroot/new.broken.buildroot/build_powerpc_nofpu/mpfr-2.2.1/.libs/libmpfr.a] 
Error 2

-- 
Paul Barrette 
Freescale Semiconductor
paul.barrette at freescale.com
(613) 723-9161 x4034

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070802/4dbe5741/attachment.htm 
