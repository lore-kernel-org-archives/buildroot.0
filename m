From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Sat, 27 Mar 2010 01:10:16 +0000 (UTC)
Subject: [Buildroot] external toolchain and sysroot
References: <1272730299.20100325182803@ya.ru> <hog24r$1nu$1@dough.gmane.org>
	<93399903.20100325201240@ya.ru> <44830928.20100325201616@ya.ru>
	<hog8rg$sis$1@dough.gmane.org> <20100325233452.3794166b@surf>
	<hoh171$jf0$1@dough.gmane.org> <20100326202442.7ef0e1ae@surf>
Message-ID: <hojlto$f4c$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-03-26, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> On Fri, 26 Mar 2010 01:04:33 +0000 (UTC)
> Grant Edwards <grant.b.edwards@gmail.com> wrote:
>
>> >  * We pass --sysroot $(STAGING_DIR) to every gcc/ld invocation, so that
>> >    gcc/ld find the libraries and header files correctly.
>> 
>> Perhaps that's what's supposed to happen, but there appear to be a lot
>> of packages where it doesn't happen (at least for some of us).
>
> As I said in my other mail in this thread, yes, there are many packages
> that are broken with regard to --sysroot.

Sorry, I guess I got confused by the contradiction.  Stating that
--sysroot is passed to every gcc/ld invocation meant to me that you
believed there were no packages that are broken with regard to
--sysroot.

> Packages that use the Makefile.autotools.in infrastructure should all
> work, but for all the other packages, they should be fixed one by
> one.

OK, that's all I was trying to establish: that some/many packages are
broken when used with external toolchains and not every gcc/ld
invocation is being passed --sysroot.

What I'm still puzzled about out is why builds fail for some external
toolchains and not others.  I'm pretty sure that I wasn't the first
person to attempt to build 2010.02 busybox with an external toolchain,
yet nobody else seems to have had the link failure due to the missing
--sysroot.  OTOH, --sysroot was clearly not present in the link flags.

I can't find any gcc/binutils config options that should cause a
difference like that.

-- 
Grant
