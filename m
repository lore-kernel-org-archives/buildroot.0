From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 15 Nov 2010 15:59:38 -0300
Subject: [Buildroot] unimplemented: -mfloat-abi=hard and VFP
In-Reply-To: <AANLkTinu2QqNjFG0cV-DEA9-osUDUmve=J7D9-VBfU=q@mail.gmail.com>
References: <AANLkTinu2QqNjFG0cV-DEA9-osUDUmve=J7D9-VBfU=q@mail.gmail.com>
Message-ID: <4CE1831A.4000205@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/15/10 02:30, Kelvin Cheung wrote:

> Hello all,
> 
> *I want to generate a toolchain with hard float support.*
> So I set two options as follows:
> BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-float=hard"
> BR2_TARGET_OPTIMIZATION="-pipe -mhard-float"
> 
> and I got this error message:
> make[1]:?????? `/opt/buildroot/output/toolchain/uClibc-0.9.31'
> touch /opt/buildroot/output/toolchain/uClibc-0.9.31/.config
> /usr/bin/make -j1 -C /opt/buildroot/output/toolchain/uClibc-0.9.31 \
>                 ARCH="arm" \
>                 PREFIX=/opt/buildroot/output/toolchain/uClibc_dev/ \
>                 DEVEL_PREFIX=/usr/ \
>                 RUNTIME_PREFIX=/opt/buildroot/output/toolchain/uClibc_dev/ \
>                 HOSTCC="/usr/bin/gcc" headers \
>                 lib/crt1.o lib/crti.o lib/crtn.o \
>                 install_headers
> make[1]: ?????? `/opt/buildroot/output/toolchain/uClibc-0.9.31'
>   MKDIR include/bits
>   GEN include/bits/uClibc_config.h
>   LN include/pthread.h
>   ...
>   LN include/sys/ucontext.h
>   LN include/sys/user.h
>   AS lib/crt1.o
> *cc1: sorry, unimplemented: -mfloat-abi=hard and VFP*`
> make[1]: *** [lib/crt1.o] ?? 1
> make[1]:?????? `/opt/buildroot/output/toolchain/uClibc-0.9.31'
> make: *** [/opt/buildroot/output/toolchain/uClibc-0.9.31/.configured] ?? 2
> 
> Dose anyone have an idea?
> Any suggestions would be appreciated.

Yes, "man gcc" and "/VFP" snip...
"Using -mfloat-abi=hard with VFP coprocessors is not supported.  Use
-mfloat-abi=softfp with the appropriate -mfpu option to allow the
compiler to generate code that makes use of the hardware floating-point
capabilities for these CPUs."
How about that?
Regards.
