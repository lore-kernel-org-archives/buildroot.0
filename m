From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 9 Oct 2007 09:08:16 +0200
Subject: [Buildroot] [MIPS] toolchain/gcc/Config.in broken
In-Reply-To: <470ADDA8.3080105@ruby.dti.ne.jp>
References: <470ADDA8.3080105@ruby.dti.ne.jp>
Message-ID: <20071009070816.GP20951@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 09, 2007 at 10:47:20AM +0900, Shinya Kuribayashi wrote:

> Although I specified O32 and mips32r2 in menuconfig, gcc-4.2.1-initial/

You probably mean OABI and not O32.

> config.status says --with-abi=o64.
>
> # /home/skuribay/devel/buildroot/toolchain_build_mips/gcc-4.2.1/configure   
> --prefix=/home/skuribay/devel/buildroot/build_mips/staging_dir/usr 
> --build=i386-pc-linux-gnu --host=i386-pc-linux-gnu 
> --target=mips-linux-uclibc 
> --with-sysroot=/home/skuribay/devel/buildroot/toolchain_build_mips/uClibc_dev/ 
> --disable-__cxa_atexit --enable-target-optspace --with-gnu-ld 
> --disable-shared 
> --with-gmp=/home/skuribay/devel/buildroot/toolchain_build_mips/gmp 
> --with-mpfr=/home/skuribay/devel/buildroot/toolchain_build_mips/mpfr 
> --disable-nls --enable-threads --disable-multilib --with-abi=o64 
> --with-tune=mips32r2 --enable-languages=c
>
> Is this right? I thought --with-abi=32 expected.

Look at target/Config.in.arch
I was under the impression that OABI was 32 for mipsel and o64 for mips,
no?

> I'm not familiar with buildroot so much. I might miss something.

I'm not too familiar with the mips matrix.. I will take a look how
mips32r2 should be configured (mips vs. mips64 vs. mipsel vs. ??; i.e.
both the endianess and the bit-depth have to be settable, AFAICS).

Thanks for the heads up.
cheers,
