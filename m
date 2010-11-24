From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 24 Nov 2010 14:43:27 +0100
Subject: [Buildroot] Report from the Buildroot Developer Day,
	29th October 2010
In-Reply-To: <201011232302.19225.yann.morin.1998@anciens.enib.fr> (Yann
	E. MORIN's message of "Tue, 23 Nov 2010 23:02:19 +0100")
References: <20101123221417.0d6867c6@surf>
	<201011232302.19225.yann.morin.1998@anciens.enib.fr>
Message-ID: <871v6a7s74.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

Hi,

 >> This is a personal report from Thomas Petazzoni. It hasn't been 
 >> reviewed by the other participants, so they are kindly invited to
 >> share their thoughts and corrections.

 Yann> Thank you Thomas, it's all good from my PoV.

Here as well.

 Yann> So there are to possibilities:
 Yann> 1) add those options to crosstool-NG
 Yann> 2) have dedicated code in Buildroot to munge crosstool-NG's uClibc's .config
 Yann>    (yes, the .config for uClibc used by crosstool-NG)

2 is fine by me (we do the same thing for the internal
toolchain). Perhaps we could even reuse the config handling in
toolchain/uClibc/uclibc.mk ?

 >> Peter's goal is to gradually replace the Buildroot internal process to
 >> build toolchains by Crosstool-NG. He currently imagines a one-year
 >> timeframe before phasing out the Buildroot internal process.

 Yann> I believe this is a little bit optimistic. What I would say is that in
 Yann> a year time, we can switch the _default_ to being to use crosstool-NG,
 Yann> but still have the internal mechanism as a backup. Then, I think that
 Yann> another 6 months will be needed before we can decide to get rid of the
 Yann> internal mechanism altogether.

True.

 Yann> Do not forget that for now, crosstool-NG does not support the same set
 Yann> of architectures Buildroot does. Also, Buildroot has per-arch patchsets
 Yann> which is (for now at least) a no-no in crosstool-NG.

Do you refer to the avr32 stuff or something else?

 >> The next Buildroot Developer Day will happen on Monday, 7th February
 >> 2011 in Brussels, Belgium. This is just after the FOSDEM conference
 >> (http://www.fosdem.org). Interested participants are invited to
 >> contact Peter Korsgaard and Thomas Petazzoni.

 Yann> Hehe. FOSDEM `11 is coming fast... I'll sure be there!

Great!

-- 
Bye, Peter Korsgaard
