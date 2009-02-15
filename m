From: Shinya Kuribayashi <skuribay@ruby.dti.ne.jp>
Date: Sun, 15 Feb 2009 11:20:32 +0900
Subject: [Buildroot] {buildroot 0004384]: GCC 4.3.1 fails with cannot
 compute suffix of object files
In-Reply-To: <49891355.70207@hq.tensilica.com>
References: <4983870C.6010607@hq.tensilica.com>	<4985F291.5010002@hq.tensilica.com>
	<20090203233438.203590@gmx.net>	<4988D874.6010305@hq.tensilica.com>
	<49891355.70207@hq.tensilica.com>
Message-ID: <49977BF0.8020508@ruby.dti.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi maxim and jacmet,

Maxim Grigoriev wrote:
> diff -u package/gmp/gmp.mk.orig package/gmp/gmp.mk
> --- package/gmp/gmp.mk.orig     2009-01-21 15:43:41.788558000 -0800
> +++ package/gmp/gmp.mk  2009-02-03 18:07:44.643402000 -0800
> @@ -83,7 +83,7 @@
>                 --prefix="$(GMP_HOST_DIR)" \
>                 --build=$(GNU_HOST_NAME) \
>                 --host=$(GNU_HOST_NAME) \
> -               --enable-shared \
> +               --disable-shared \
>                 --enable-static \
>                 $(DISABLE_NLS) \
>         )
> diff -u package/mpfr/mpfr.mk.orig package/mpfr/mpfr.mk
> --- package/mpfr/mpfr.mk.orig   2009-01-21 15:43:42.259089000 -0800
> +++ package/mpfr/mpfr.mk        2009-02-03 17:58:09.369092000 -0800
> @@ -97,7 +97,7 @@
>                 --prefix="$(MPFR_HOST_DIR)" \
>                 --build=$(GNU_HOST_NAME) \
>                 --host=$(GNU_HOST_NAME) \
> -               --enable-shared \
> +               --disable-shared \
>                 --enable-static \
>                 --with-gmp=$(GMP_HOST_DIR) \
>                 $(DISABLE_NLS) \
> 
> -- Maxim

I've confirmed this patch (and related changes) work for me with GCC
4.3.2 for MIPS and Ubuntu 8.04.01.  Thanks for your work and for taking
care of them before 2009.02 is out, Maxim and Peter!

  Shinya
