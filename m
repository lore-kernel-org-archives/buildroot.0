From: GAYE Abdoulaye Walsimou <walsimou@walsimou.com>
Date: Fri, 27 Mar 2009 11:54:34 +0100
Subject: [Buildroot] stack size
In-Reply-To: <OF550F5D38.9329BA67-ONC1257586.003798D4-C1257586.0038C0EB@gidi.it>
References: <OF550F5D38.9329BA67-ONC1257586.003798D4-C1257586.0038C0EB@gidi.it>
Message-ID: <49CCB06A.3@walsimou.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alessio.Stella at gidi.it wrote:
> Excuse me
>
> I am cross compiling for an embedded system that my colleague has build up
> using buildroot and uclibc
>
> I have a strange behaviour of my code so i asked him how much is the stack
> size (per thread) but he doesn't know
> How to check it?
>
>
> Alessio Stella
> (+39)051 642 3319
> R&D / Machine SW
> G.D
> Via Emilia Ponente 49 - 40011 Anzola Emilia - Bologna - Italy
> Headquarters: Via Battindarno 91 - 40133 Bologna Italy
> www.gidi.it
>
>
>
>   
Hello,
I use a mipsel toolchain and a grep on INITIAL_STACK_SIZE gives:

toolchain_build_mipsel/uClibc-0.9.30/libpthread/linuxthreads/internals.h:#ifndef
INITIAL_STACK_SIZE
toolchain_build_mipsel/uClibc-0.9.30/libpthread/linuxthreads/internals.h:#define
INITIAL_STACK_SIZE  (4 * PAGE_SIZE)
...
...
toolchain_build_mipsel/uClibc-0.9.30/libpthread/linuxthreads.old/internals.h:#ifndef
INITIAL_STACK_SIZE
toolchain_build_mipsel/uClibc-0.9.30/libpthread/linuxthreads.old/internals.h:#define
INITIAL_STACK_SIZE  (4 * __pagesize)

I think you better ask to uclibc list for this kind of questions.

regards
