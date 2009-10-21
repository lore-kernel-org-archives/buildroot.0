From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Oct 2009 20:31:28 +0200
Subject: [Buildroot] building toolchain fails - more details
In-Reply-To: <1531E53627F1F749B4FE809BF2A4EB67013CED64@WETMEX10.loepfe.com>
	(Noel Vellemans's message of "Wed\, 21 Oct 2009 16\:31\:19 +0200")
References: <mailman.7.1256126402.21246.buildroot@busybox.net>
	<1531E53627F1F749B4FE809BF2A4EB67013CED64@WETMEX10.loepfe.com>
Message-ID: <87tyxsppj3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Noel" == Vellemans, Noel <Noel.Vellemans@visionBMS.com> writes:

Hi,

 Noel> While looking to the the output/build directory it seems that it
 Noel> is -> autoconf-2.64-host.

Ok, that's a different issue than Johan's then - The snippet he posted
was about autoconf for the target.

 Noel> Looking into the config.log into this directory gives me.

 Noel> << autoconf-2.64-host - config.log snip >>

 Noel> configure:2356: checking for GNU M4 that supports accurate traces
 Noel> configure:2391: error: no acceptable m4 could be found in $PATH.
 Noel> GNU M4 1.4.6 or later is required; 1.4.13 is recommended

Strange as the host-autoconf package depends on host-m4. Don't you have
a build/m4-1.4.9-host directory? On my system I get:

configure:2356: checking for GNU M4 that supports accurate traces
configure:2398: result: /tmp/br/host/usr/bin/m4
configure:2401: checking whether /tmp/br/host/usr/bin/m4 accepts --gnu
configure:2411: result: no
configure:2422: WARNING: The version of M4 that was found does not support -g.
configure:2424: WARNING: Using it with POSIXLY_CORRECT set may cause problems.
configure:2428: checking how m4 supports trace files
configure:2438: result: --debugfile

 Noel> A) 'make at91sam9g20dfc_defconfig' (press enter a couple of times....) {

I don't see why it shouldn't work, but I've just started such a build
anyway.

-- 
Bye, Peter Korsgaard
