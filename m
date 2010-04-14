From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 14 Apr 2010 13:42:18 +0000 (UTC)
Subject: [Buildroot] external toolchain and sysroot
References: <1272730299.20100325182803@ya.ru> <hog24r$1nu$1@dough.gmane.org>
	<93399903.20100325201240@ya.ru> <44830928.20100325201616@ya.ru>
	<hog8rg$sis$1@dough.gmane.org> <20100325233452.3794166b@surf>
Message-ID: <hq4gnq$pd0$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-03-25, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> On Thu, 25 Mar 2010 18:08:49 +0000 (UTC)
> Grant Edwards <grant.b.edwards@gmail.com> wrote:
>
>> Based on my sample of three packages (two had the problem), I'm
>> guessing it's a very common problem.  It looks like the buildroot
>> developers use external toolchains that don't require a --sysroot
>> option. 
>
> They do. What we do to support external toolchains is :

Recent testing has confirmed that relocated toolchains built by
crosstool-NG can find library files without a --sysroot option.
Toolchains built by buildroot can't.  This explains the spate of
"missing --sysroot" bugs that affect people using relocated buildroot
toolchains and not people using relocated crosstool-NG toolchains.

-- 
Grant Edwards               grant.b.edwards        Yow! You can't hurt me!!
                                  at               I have an ASSUMABLE
                              gmail.com            MORTGAGE!!
