From: Maxime Petazzoni <maxime.petazzoni@bulix.org>
Date: Wed, 1 Sep 2010 10:57:21 +0200
Subject: [Buildroot] make source: missing dir and incorrect dependency
 with external toolchain
In-Reply-To: <1283330943.5097.6.camel@dubciaranr1.verifone.com>
References: <1281631732.14333.88.camel@cabbage.rehill.info>
	<1283330943.5097.6.camel@dubciaranr1.verifone.com>
Message-ID: <20100901085720.GE11476@bulix.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

* Quotient Remainder <quotientvremainder@gmail.com> [2010-09-01 09:49:03]:

> Ar D?ar, 2010-08-12 ag 17:48 +0100, scr?obh Quotient Remainder:
> > Hello,
> > having done "make distclean", followed by "make ..._defconfig", I did
> > "make source".  The toolchain is external, ARM glibc (gcc 4.4.1).  Host
> > gcc is 4.4.4.
> > 
> > The first problem is that $(DL_DIR) does not get created so there is a
> > failure when it is needed.
> > 
> > Secondly when I do "mkdir dl" and "make source" again I get an error
> > when an attempt is made to download gcc because GCC_VERSION is empty (it
> > should not be downloading this at all since the toolchain is external):

I noticed the problem with GCC_VERSION too when working on source-check
and friends. But honestly, I forgot the exact reason why is doing that
although Thomas explained it to me.

Thomas, could you enlighten us (again) on why it's doing this? IIRC,
GCC_VERSION is only defined when you're using an internal toolchain,
although it is used straight up in toolchain/gcc-uclibc-4.x.mk with no
check on whether you're using an internal or external toolchain. This
.mk file is not used when using an external toolchain, but it is when
you're calling make source.

I'm not sure how to make it not use it when using an external toolchain
though, a big if/endif on the whole file seems dirty-ish, at best.

- Maxime
-- 
Maxime Petazzoni <http://www.bulix.org>
 ``One by one, the penguins took away my sanity.''
Linux kernel and software developer at MontaVista Software
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 198 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100901/306d0e45/attachment.pgp>
