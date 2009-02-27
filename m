From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 27 Feb 2009 11:37:25 +0100
Subject: [Buildroot] gcc compilation issues on AT91SAM9G20
In-Reply-To: <20090227190710.83ff1d6d.william@brodie-tyrrell.org> (William
	Brodie-Tyrrell's message of "Fri\, 27 Feb 2009 19\:07\:10 +0900")
References: <20090225174424.09d0badc.william@brodie-tyrrell.org>
	<87iqmyoogi.fsf@macbook.be.48ers.dk>
	<20090225191212.c5a31f46.william@brodie-tyrrell.org>
	<8763iyom4z.fsf@macbook.be.48ers.dk>
	<20090226151511.da1c9b65.william@brodie-tyrrell.org>
	<87hc2gmea8.fsf@macbook.be.48ers.dk>
	<20090227190710.83ff1d6d.william@brodie-tyrrell.org>
Message-ID: <878wnsmahm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "William" == William Brodie-Tyrrell <william@brodie-tyrrell.org> writes:
 >> Are you trying an EABI or OABI build? The aapcs-linux stuff is for
 >> EABI.

Hi,

 William> EABI, though not for any particular reason other than that's
 William> what the linux4sam-provided .config does. The gcc configure
 William> only works if I leave the BR2_GCC_TARGET_ABI line out of the
 William> .config. The cross compiler (when it's working) is called
 William> arm-linux-uclibcgnueabi-gcc so perhaps I should put
 William> linux-uclibcgnueabi in the BR2_GCC_TARGET_ABI?

OK, the other at91sam* defconfigs in BR all seems to use OABI. I'll
check EABI.

 >> Could you post your .config?

 William> It's attached.  It's entirely possible there's something
 William> that the linux4sam patches do that is missing from this
 William> fresh build I'm doing, but I don't know nearly enough about
 William> buildroot to spot it.  I copied in my old/working .config
 William> and local/AT91 directory and ran 'make oldconfig' to update
 William> the .config.

OK, I'll take a look at it.

 William> PS: when one gets a fresh copy of HEAD from SVN, the scripts/wget.sh
 William> file is missing.

Ehh, that's because we don't have a wget.sh (and never had) - Where do
you see any references to a wget.sh?

-- 
Bye, Peter Korsgaard
