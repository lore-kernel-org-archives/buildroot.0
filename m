From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jan 2016 23:43:37 +0100
Subject: [Buildroot] [PATCH 1/8] libunwind: fix C library dependency
In-Reply-To: <56A6A29E.5040709@gmail.com>
References: <1453148701-10036-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453148701-10036-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <56A69ACC.1030505@gmail.com>
 <20160125232039.2ef30ef9@free-electrons.com>
 <56A6A29E.5040709@gmail.com>
Message-ID: <20160125234337.79474261@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Mon, 25 Jan 2016 23:33:02 +0100, Romain Naour wrote:

> > I don't get this sentence however. libunwind should build with
> > uClibc-ng on the architectures listed in
> > BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS, no?
> 
> Ha, sorry (missing some context).
> I build tested libunwind with uClibc-snapshot on powerpc with the master branch
> to verify that it doesn't build.
> Then, I switched to your series with a small modification to enable powerpc and
> verify that doesn't build as for uClibc-snapshot on the same architecture.
> 
> The build error look like:
> In file included from ../include/libunwind.h:15:0,
>                  from ppc32/Lglobal.c:2:
> ../include/libunwind-ppc32.h:182:9: erreur: unknown type name ?ucontext_t?
>  typedef ucontext_t unw_tdep_context_t;
> 
> So your BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS setting is correct.

Ok, thanks, understood!

In fact my BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS setting for uClibc is
simply based on:

$ find . | grep setcontext
./libc/sysdeps/linux/i386/setcontext.S
./libc/sysdeps/linux/arm/setcontext.S
./libc/sysdeps/linux/x86_64/setcontext.S
./libc/sysdeps/linux/mips/setcontext.S

In the uclibc-ng sources. I've done some build testing of course, but
clearly not all the combinations of architectures / C libraries.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
