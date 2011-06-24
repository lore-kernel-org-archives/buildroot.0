From: raymond zhao <raymond.zhao.ml@gmail.com>
Date: Fri, 24 Jun 2011 17:12:30 -0400
Subject: [Buildroot] Is this a bug? libm in uclibc 0.9.32
In-Reply-To: <BANLkTinjm+-sO4jPHckVJg1VH2__Ejii+A@mail.gmail.com>
References: <BANLkTimqhX+pHGkSHQMpTX=n82_eHmj0tA@mail.gmail.com>
 <BANLkTinjm+-sO4jPHckVJg1VH2__Ejii+A@mail.gmail.com>
Message-ID: <BANLkTikFc-OSQ+jyrDB9C8L5DwKvF-qi=w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I agree.
But does anyone have a better solution to fix this bug?

Also, how about the first one? Does anyone have same experience as me?

thanks,

raymond

On Fri, Jun 24, 2011 at 4:50 PM, Mike Frysinger <vapier@gentoo.org> wrote:
> On Fri, Jun 24, 2011 at 15:52, raymond zhao wrote:
>> 1. No one defines libm_ARCH_fpu_OUT in make files, so the files under
>> directory toolchain\uClibc-0.9.32\libm\powerpc\e500\fpu will nor be
>> build at all. then there will be a link error for unsolved functions.
>> 2. Somehow the NOT_IN_lic is not passed to the build command line for
>> libm/powerpc/e500/fpu/fe_nomask.c, then the ?__libc_errno ?in this
>> files will compain.
>
> random .c files should not be touched as this is a build file bug.
> see libm/Makefile:CFLAGS-libm ... those should be applied when
> building all files under libm/.
> -mike
>
