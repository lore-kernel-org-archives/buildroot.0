From: rechid miloi <in.hiring@gmail.com>
Date: Sat, 25 Aug 2012 20:27:27 +0100
Subject: [Buildroot] The TARGET TOOLCHAIN wan't work
In-Reply-To: <CAD4nNjUzE2Oekt4huyF1KBSaweOwRzn+Gh9HiAXLFWRVxxcoYA@mail.gmail.com>
References: <CAD4nNjUzE2Oekt4huyF1KBSaweOwRzn+Gh9HiAXLFWRVxxcoYA@mail.gmail.com>
Message-ID: <CAD4nNjWJbZsCkYeFduVEvrfT8eAhd1V5b3-6Eg3Cvx_MGGByEQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I was working around the problem and figured out that when I use
"-static" with the linker,
everything works well.

Could someone tell me Why ? And how to fix that without using "-static" ?

Samy FODIL.

2012/8/24, rechid miloi <in.hiring@gmail.com>:
> Hi,
>
> I've made a buildroot based system for x86_64 to which I've
> successfully added PAM, MINGETTY, ...etc. But some of packages I've to
> add can't be cross compiled. So I decided
> to use the target gcc/binutils by activating
> BR2_TARGET_GCC,BR2_TARTGET_BINUTILS,
> BR2_TARGET_DEVFILE and I've deactivated uClibc striping.
>
> When I try to compile a simple program :
> #include <stdio.h>
> main () {
>  printf("Hello %s","samy");
> }
>
> It works !
>
> But when trying to compile for example the "file" package I got this message
> :
>
> .../bin/ld: ..../libc.a(libc-cancellation.os): realocation
> R_X86_64_PC32 against undefined symbol '__pthread_unwind' can not be
> used when making a shared object; recompile with fPIC
>
> So I've recompiled the entire system with '-fPIC -DPIC" without success.
>
> NOTA :
>    - The problem occurs with other packages on other library and other
> symbols.
>    - The R_X86_64_PC32 is present when using readelf on the "libc_pic.a".
>
> Samy FODIL,
>
