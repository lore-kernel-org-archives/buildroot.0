From: =?windows-1252?Q?Peter_K=FCmmel?= <syntheticpp@gmx.net>
Date: Tue, 24 Feb 2015 10:44:40 +0100
Subject: [Buildroot] FFTW optimized for ARM and NEON FPU
In-Reply-To: <54EBF694.6090705@gmail.com>
References: <54EBF694.6090705@gmail.com>
Message-ID: <54EC4808.3040209@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

+FFTW_CONF_OPTS+= ARM_FLOAT_ABI=softfp

Shouldn't it use hardfp?
https://wiki.debian.org/ArmHardFloatPort/VfpComparison

Am 24.02.2015 um 04:57 schrieb guillaume william brs:
> Hello,
>
> I am working on a cortex-a9 (zynq SoC, mainly zc706)
> I faced fairly slow computations of FFT using this library
> with the default configuration (20MFlops).
>
> I modified package/fftw.mk to optimize the library
> compilation as long as an FPU is available,
> NEON in this case: this increased the number of MFlops to
> 500-600.
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
