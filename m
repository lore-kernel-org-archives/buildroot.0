From: Thomas Moschny <thomas.moschny@gmx.de>
Date: Thu, 31 Aug 2006 09:05:18 +0200
Subject: [Buildroot] Exception support
In-Reply-To: <c1bf1cf0608301523u1970bd8en61c048b94e796167@mail.gmail.com>
References: <200608290041.27413.thomas.moschny@gmx.de>
	<c1bf1cf0608301523u1970bd8en61c048b94e796167@mail.gmail.com>
Message-ID: <200608310905.18546.thomas.moschny@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ON Thursday 31 August 2006 00:23 Ed Swierk wrote:
> On 8/28/06, Thomas Moschny <thomas.moschny@gmx.de> wrote:
> > is there a way to get a toolchain built for i686, that supports C++
> > exceptions?
>
> I've got C++ exceptions working with gcc 4.1.1 by enabling
> BR2_GCC_USE_SJLJ_EXCEPTIONS in my buildroot configuration,

This seems to work. Btw, it took me a while to find out what 'sjlj' stands 
for :)

> and changing --disable-__cxa_atexit to --enable-__cxa_atexit in
> gcc-uclibc-3.x.mk.

I tried setting --enable-__cxa_atexit as an extra gcc option, but got an 
undefined reference afterwards.

> Apparently it is even possible to get stack unwinding to work, but I
> have not tried it myself. See the thread beginning at
> http://uclibc.org/lists/uclibc/2006-August/016090.html .

I know this thread, but it is unclear to me how to force usage of stack 
unwinding. unwind-dw2-fde.o seems not to work (that's why I started this 
thread). Now, if I edit toolchain/gcc/4.1.1/100-uclibc-conf.patch to not 
change LIB2ADDEH, then unwind-dw2-fde-glibc.o is built (and would be used), 
but it contains an undefined reference to dl_iterate_phdr.

Thomas
