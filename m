From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 04 Mar 2009 14:34:19 +0100
Subject: [Buildroot] svn
	commit:	trunk/buildroot/package/multimedia/alsa-utils
In-Reply-To: <49AE81A9.2090605@atmel.com> (Hans-Christian Egtvedt's message of
	"Wed\, 04 Mar 2009 14\:27\:05 +0100")
References: <20090304132251.3B72D7626E@busybox.osuosl.org>
	<49AE81A9.2090605@atmel.com>
Message-ID: <87k575h0o4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hans-Christian" == Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> writes:

Hi,

 >> config BR2_PACKAGE_ALSA_UTILS_APLAY
 >> bool "aplay"
 >> -	select BR2_LARGEFILE
 >> +	depends on BR2_LARGEFILE
 >> depends on BR2_PACKAGE_ALSA_UTILS
 >> +comment "aplay requires a toolchain with LARGEFILE support"
 >> +	depends on !BR2_LARGEFILE
 >> +
 >> config BR2_PACKAGE_ALSA_UTILS_ARECORD
 >> bool "arecord"
 >> depends on BR2_PACKAGE_ALSA_UTILS
 >> 

 Hans-Christian> I guess this also depends on LARGEFILE, arecord is
 Hans-Christian> just a symlink to aplay.

Ok, but why do we have the config option if it's just a symlink?

.. checking the .mk - Ahh, we always build everything and the config
options is just to decide what gets copied to the target, so I guess
alsa-utils is broken on !BR2_LARGEFILE or the depends was wrong to
begin with.

-- 
Bye, Peter Korsgaard
