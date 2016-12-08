From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Dec 2016 22:06:02 +0100
Subject: [Buildroot] [PATCH v2] sdl_mixer: fix static linking issue
In-Reply-To: <20161208172331.GA13013@waldemar-brodkorb.de>
References: <20161208172331.GA13013@waldemar-brodkorb.de>
Message-ID: <20161208220602.37cfb553@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 8 Dec 2016 18:23:31 +0100, Waldemar Brodkorb wrote:

> +Pass LDFLAGS while creating binaries.
> +
> +Fixes following linking error with uClibc-ng:
> +br/output/host/usr/lib/gcc/powerpc-buildroot-linux-uclibc/5.4.0/libgcc.a(unwind-dw2-fde-dip.o): In function `_Unwind_Find_FDE':
> +br/output/build/host-gcc-final-5.4.0/build/powerpc-buildroot-linux-uclibc/libgcc/../../../libgcc/unwind-dw2-fde-dip.c:465: undefined reference to `dl_iterate_phdr'
> +collect2: error: ld returned 1 exit status
> +
> +Since uClibc-ng 1.0.18 a circular dependency between libc and libgcc
> +exist, when static linking is used. It can be resolved by the compiler
> +when -static is correctly passed in the linking step.

musl is also using a "everything in libc" policy. Does this problem
also occurs with musl? If not, why?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
