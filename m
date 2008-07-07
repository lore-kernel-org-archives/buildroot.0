From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 Jul 2008 16:47:30 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <487212CC.7020303@atmel.com> (Ulf Samuelsson's message of "Mon\,
	07 Jul 2008 14\:57\:48 +0200")
References: <20080704222950.E76B63C61F@busybox.net>
	<87fxqmg53j.fsf@macbook.be.48ers.dk> <48720878.3070602@atmel.com>
	<20080707123642.GA15840@mx.loc> <487212CC.7020303@atmel.com>
Message-ID: <87abgt4upp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 Ulf> Bernhard Fischer skrev:
 >> On Mon, Jul 07, 2008 at 02:13:44PM +0200, Ulf Samuelsson wrote:
 >>> -----BEGIN PGP SIGNED MESSAGE-----
 >>> Hash: SHA1
 >>> 
 >>> Peter Korsgaard skrev:
 >> 
 >>>> That breaks the source-check/external-deps check in
 >>>> Makefile.autotools.in (r22607).
 >>>> 
 >>> Is not something like the following to be preferred?

 Ulf> Previously the special make targets to check availability
 Ulf> of packages on internet would download each target
 Ulf> even if the target existed in $(DL_DIR) creating
 Ulf> <package>.tar.bz2.<n>, or it would not check
 Ulf> the package at all.

Only if you're using your new make log target.

 Ulf> Peter introduced a fix where he will treat the download
 Ulf> differently if the MAKELEVEL=0 (normal) or if the
 Ulf> MAKELEVEL=1 which is the case for make source-check
 Ulf> and make external-deps.

Exactly. Makefile.autootols.in has always been broken for source-check
/ external-deps. My change was a very small and low impact fix. The
proper fix would be to restructure Makefile.autootols.in to use make
to decide if targets are out of date and not shell checks.

 Ulf> I do not think that MAKELEVEL is a good variable
 Ulf> to detect if someone wants to do source-check
 Ulf> or external-deps.

Good or not - It worked where it didn't before.

-- 
Bye, Peter Korsgaard
