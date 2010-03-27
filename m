From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Mar 2010 09:22:19 +0100
Subject: [Buildroot] external toolchain and sysroot
In-Reply-To: <hojlto$f4c$1@dough.gmane.org>
References: <1272730299.20100325182803@ya.ru> <hog24r$1nu$1@dough.gmane.org>
	<93399903.20100325201240@ya.ru> <44830928.20100325201616@ya.ru>
	<hog8rg$sis$1@dough.gmane.org> <20100325233452.3794166b@surf>
	<hoh171$jf0$1@dough.gmane.org> <20100326202442.7ef0e1ae@surf>
	<hojlto$f4c$1@dough.gmane.org>
Message-ID: <20100327092219.0489cc08@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 27 Mar 2010 01:10:16 +0000 (UTC)
Grant Edwards <grant.b.edwards@gmail.com> wrote:

> Sorry, I guess I got confused by the contradiction.  Stating that
> --sysroot is passed to every gcc/ld invocation meant to me that you
> believed there were no packages that are broken with regard to
> --sysroot.

Oh, yes, sorry, my wording was maybe confusing (english is not my
native language). To make external toolchain work, --sysroot *must* be
passed to every gcc/ld invocation, but it's clearly not the case in
many non-autotools packages.

> What I'm still puzzled about out is why builds fail for some external
> toolchains and not others.  I'm pretty sure that I wasn't the first
> person to attempt to build 2010.02 busybox with an external toolchain,
> yet nobody else seems to have had the link failure due to the missing
> --sysroot.  OTOH, --sysroot was clearly not present in the link flags.

I'm also a bit puzzled by the problem you had on Busybox, since I'm
definitely able to build it with 2010.02, as it is, with a Crosstool-NG
external toolchain (but not with a Buildroot external toolchain). I'll
try to reproduce.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
