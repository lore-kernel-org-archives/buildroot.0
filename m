From: Teemu Keskinarkaus <Teemu.Keskinarkaus@cc-systems.com>
Date: Fri, 11 Sep 2009 12:49:31 +0200
Subject: [Buildroot] External Toolchain in latest stable buildroot
In-Reply-To: <330EC2471BF24E48B513AF1A6975EB69AD8816@MAIL-UA.ccs.local>
References: <330EC2471BF24E48B513AF1A6975EB69AD87F9@MAIL-UA.ccs.local><20090911091415.19422fbb@surf>
	<330EC2471BF24E48B513AF1A6975EB69AD8816@MAIL-UA.ccs.local>
Message-ID: <330EC2471BF24E48B513AF1A6975EB69AD887B@MAIL-UA.ccs.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

So I was able to get some of the stuff compile and some not. The
external toolchain I'm using is Codesourcery's toolchain for arm.
Version is(Sourcery G++ Lite 2009q1-203) (gcc version 4.3.3)

I'm quite sure that this is not 100% buildroot problem, but I ask
anyway.

I hit problems when compiling bootstrap for AT91.

Get few of these errors:

build/at91sam9263ek/main.o:(.ARM.exidx+0x0): undefined reference to
`__aeabi_unwind_cpp_pr1'
build/at91sam9263ek/at91sam9263ek.o:(.ARM.exidx+0x0): undefined
reference to `__aeabi_unwind_cpp_pr0'

I did some digging and it seems that the problem might be in the
toolchain, but it might also need some work in buildroot side.

Has anyone been able to use CodeSourcerys toolchain to compile buildroot
for ARM? Or is anyone even using CodeSourcerys toolchain for ARM?

Teemu Keskinarkaus


> -----Original Message-----
> From: buildroot-bounces at busybox.net
[mailto:buildroot-bounces at busybox.net]
> On Behalf Of Teemu Keskinarkaus
> Sent: 11. syyskuuta 2009 10:27
> To: buildroot at busybox.net
> Subject: Re: [Buildroot] External Toolchain in latest stable buildroot
> 
> Hi,
> 
> Thanks for the fast reply.
> 
> > -----Original Message-----
> > What does the following command returns ?
> >
> >  LANG=C $(TARGET_CC) -v
> >
> > If you see a --with-sysroot thing in the result, could you look in
> this
> > directory, and then in /lib/ to see if there is any ld-linux.* file
?
> This was the case. I was installed the toolchain in the wrong
directory
> at first. I'll see what happens now that I have the toolchain in the
> right place.
> 
> Teemu Keskinarkaus
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
