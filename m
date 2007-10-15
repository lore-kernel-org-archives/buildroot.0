From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 15 Oct 2007 22:48:18 +0200
Subject: [Buildroot] buildroot for armeb, gcc-4.2.1 fails to build
References: <20071015054821.GA5245@cloud.net.au>
	<d83696340710150806x33bc3b44ofe8d5cd349220e4@mail.gmail.com>
Message-ID: <024701c80f6d$3b703380$01c4af0a@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>I have seen the exact same problem.  It doesn't matter if you select EABI 
>or
> not (the build doesn't complete either way).  I have been unable to build
> when selecting "armeb" regardless of what other options I choose.  Little
> Endian "arm" builds fine.  I have been trying to look into what might be
> going wrong with little success.  I added "--disable-libmudflap" to the 
> GCC
> options, and that got me a little further in the build but it still failed
> building gcc-final.
>
> As I said, I have built the little endian toolchain with no issues at all.
> I have used the little endian toolchain to build a kernel and u-boot
> 1.2.0which are both big endian.
>
> One idea I had to simplify things is to modify the buildroot so that it
> ALWAYS builds the little endian toolchain, but passes -mbig-endian when 
> the
> user selects "armeb".  This should greatly reduce the effort required to
> test both "arm" and "armeb" since the same method/patches would be used 
> for
> both.  Thoughts?
>

I think this is possible to do this already,
select small endian, and make -mbig-endian an
extra TARGET_CFLAGS parameter.

This of course does not have the benefit of reducing the complexity of the 
toolchain.

Best Regards
Ulf Samuelsson
