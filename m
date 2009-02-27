From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 27 Feb 2009 12:35:59 +0100
Subject: [Buildroot] gcc compilation issues on AT91SAM9G20
In-Reply-To: <20090227194950.a345c8d5.william@brodie-tyrrell.org> (William
	Brodie-Tyrrell's message of "Fri\, 27 Feb 2009 19\:49\:50 +0900")
References: <20090225174424.09d0badc.william@brodie-tyrrell.org>
	<87iqmyoogi.fsf@macbook.be.48ers.dk>
	<20090225191212.c5a31f46.william@brodie-tyrrell.org>
	<8763iyom4z.fsf@macbook.be.48ers.dk>
	<20090226151511.da1c9b65.william@brodie-tyrrell.org>
	<87hc2gmea8.fsf@macbook.be.48ers.dk>
	<20090227190710.83ff1d6d.william@brodie-tyrrell.org>
	<878wnsmahm.fsf@macbook.be.48ers.dk>
	<20090227194950.a345c8d5.william@brodie-tyrrell.org>
Message-ID: <874oygm7s0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "William" == William Brodie-Tyrrell <william@brodie-tyrrell.org> writes:

 >> Ehh, that's because we don't have a wget.sh (and never had) - Where do
 >> you see any references to a wget.sh?

 William> When I run make, it seems to use that to download the sources.  If it's not there, make fails while trying to download sources.  On second-look, it seems that the .config file provided by linux4sam has this line in it:

 William> BR2_WGET="$(TOPDIR)/scripts/wget.sh $(BR2_WGET_MIRROR) --passive-ftp --retry-connrefused --waitretry=10"

Ahh, that must be from the atmel patch. I think I remember something
about a wget.sh in HcE's avr32 tree.

delete the BR2_WGET line in your .config and run make oldconfig and it
should be fixed.

-- 
Bye, Peter Korsgaard
