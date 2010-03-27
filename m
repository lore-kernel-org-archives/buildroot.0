From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Sat, 27 Mar 2010 15:05:40 +0000 (UTC)
Subject: [Buildroot] external toolchain and sysroot
References: <1272730299.20100325182803@ya.ru> <hog24r$1nu$1@dough.gmane.org>
	<93399903.20100325201240@ya.ru> <44830928.20100325201616@ya.ru>
	<hog8rg$sis$1@dough.gmane.org> <20100325233452.3794166b@surf>
	<hoh171$jf0$1@dough.gmane.org> <20100326202442.7ef0e1ae@surf>
	<hojlto$f4c$1@dough.gmane.org> <20100327092219.0489cc08@surf>
Message-ID: <hol6s4$66h$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-03-27, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Oh, yes, sorry, my wording was maybe confusing (english is not my
> native language). To make external toolchain work, --sysroot *must* be
> passed to every gcc/ld invocation, but it's clearly not the case in
> many non-autotools packages.
>
>> What I'm still puzzled about out is why builds fail for some external
>> toolchains and not others.  I'm pretty sure that I wasn't the first
>> person to attempt to build 2010.02 busybox with an external toolchain,
>> yet nobody else seems to have had the link failure due to the missing
>> --sysroot.  OTOH, --sysroot was clearly not present in the link flags.
>
> I'm also a bit puzzled by the problem you had on Busybox, since I'm
> definitely able to build it with 2010.02, as it is, with a Crosstool-NG
> external toolchain (but not with a Buildroot external toolchain). I'll
> try to reproduce.

The other odd thing is that _I_ didn't used to have that problem, yet
it seems obvious that --sysroot was being passed. When I was using a
git snapshot from sometime in November/December which used gcc 4.3,
both busybox and mtd-utils built fine.  The external toolchain in both
cases was built by buildroot using exactly the same shell-script. 
AFAICT, the .mk files didn't change with respect to the --sysroot
option.  The only significant thing that seems to have changed was the
gcc version. I haven't had a chance to dig out a copy of my gcc 4.3
toolchain and verify that the toolchain change caused the problem in
my case.

-- 
Grant
