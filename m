From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 04 Jun 2009 12:22:23 +0200
Subject: [Buildroot] uclibc locale
In-Reply-To: <NDBBKLDECLOIHFJKBINAGEBOEIAA.Berns@BEKA-Elektronik.de>
	(Berns@beka-elektronik.de's message of "Thu\,
	4 Jun 2009 09\:34\:08 +0200")
References: <NDBBKLDECLOIHFJKBINAGEBOEIAA.Berns@BEKA-Elektronik.de>
Message-ID: <87iqjcz4bk.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Berns" == Berns  <Berns@BEKA-Elektronik.de> writes:

 Berns> Hi,
 Berns> i try to build buildoot with the latest git revision. My configuration based
 Berns> on at91sam9263ek_defconfig and I have added X11.
 Berns> When i activate "use pregenerated locale data" the build process trys to
 Berns> load a file "uClibc-locale-20081111-32-el.tgz" which doesn't exist at
 Berns> www.uclibc.org.
 Berns> After changing the entry in ../uClibc-0-9.30.1/extra/localMakefile.in to
 Berns> uClibc-locale-030818.tgz, i'am able to build the root file
 Berns> system.

Yes, the uclibc people still don't seem to have fixed that. I would
recommend that you don't use the 'use pregenerated locale data'
option.

Have you tried if the locales from the old 030818 tarball actually work?

 Berns> The additional items "Purge unwanted locale data" and "Locales
 Berns> to keep" should only appear when "Use pregenerated locale
 Berns> data" is activated or ?

No, actually they should only appear if you use an internal BR
toolchain and have locale enabled. Pregenerated or not shouldn't
matter.

-- 
Bye, Peter Korsgaard
