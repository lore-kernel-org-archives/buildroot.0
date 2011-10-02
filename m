From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 02 Oct 2011 20:59:40 +0200
Subject: [Buildroot] [PATCHv2] package: add the poco C++ libraries
	collection
In-Reply-To: <20111002064107.GB14908@tarshish> (Baruch Siach's message of
 "Sun, 2 Oct 2011 08:41:07 +0200")
References: <bc337c3bfe93b6d50d40f042d53480f38a8dd0b8.1314792605.git.baruch@tkos.co.il>
 <87mxdsxpe8.fsf@macbook.be.48ers.dk>
 <20110926064459.GB28996@sapphire.tkos.co.il>
 <87pqinvyci.fsf@macbook.be.48ers.dk>
 <20110927162627.GB5437@sapphire.tkos.co.il>
 <87sjnhvlne.fsf@macbook.be.48ers.dk> <20111002064107.GB14908@tarshish>
Message-ID: <87zkhjkyn7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 >> ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_CTNG_uClibc),y)
 >> POCO_CONF_OPT += --no-fpenvironment
 >> endif

 Baruch> Can't we just use $(LIBC) that is set in package/Makefile.in? Hence:

 Baruch> ifeq ($(LIBC),uclibc)
 Baruch> POCO_CONF_OPT += --no-fpenvironment
 Baruch> endif

Yes, that's fine as well - That one handles the 3 variants.

-- 
Bye, Peter Korsgaard
