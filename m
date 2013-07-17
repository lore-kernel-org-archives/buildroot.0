From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 17 Jul 2013 07:27:42 +0200
Subject: [Buildroot] [PATCH] toolchain: check ARM EABI vs. EABIhf for
	external toolchains
In-Reply-To: <20130716223952.GB7947@free.fr> (Yann E. MORIN's message of "Wed, 
 17 Jul 2013 00:39:53 +0200")
References: <1374012366-27612-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20130716223952.GB7947@free.fr>
Message-ID: <87y595ycvl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> +	else \
 >> +		echo "Unsupported ABI of the external toolchain" ; \
 >> +		exit 1 ; \
 >> +	fi ; \
 >> +	if [ x$(BR2_ARM_EABI) = x"y" -a $${EXT_TOOLCHAIN_ABI} = "eabihf" ] ; then \

 Yann> Using this 'x$(VAR) = xy' construct is ugly. Just quote the variables,
 Yann> it is easier to read:
 Yann>     if [ "$(BR2_ARM_EABI)" = "y" ... ]

 Yann> The x$VAR construct was from a time when some shells where failing to
 Yann> test against an empty string. That time is long gone. Virtaully all
 Yann> shells can compare to empty strings, nowadays.

And we have SHELL=bash

-- 
Bye, Peter Korsgaard
