From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 17 Sep 2007 15:41:17 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target/device
In-Reply-To: <1190040978.8052.20.camel@elrond.sweden.atmel.com>
References: <20070917075500.052F2A4692@busybox.net>
	<1190025802.8052.4.camel@elrond.sweden.atmel.com>
	<20070917092735.GA18888@aon.at>
	<1190031404.8052.9.camel@elrond.sweden.atmel.com>
	<20070917111024.GB22104@aon.at>
	<1190040978.8052.20.camel@elrond.sweden.atmel.com>
Message-ID: <20070917134117.GC24993@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 17, 2007 at 04:56:18PM +0200, Ulf Samuelsson wrote:
>m?n 2007-09-17 klockan 13:10 +0200 skrev Bernhard Fischer:
>> On Mon, Sep 17, 2007 at 02:16:44PM +0200, Ulf Samuelsson wrote:
>> >m?n 2007-09-17 klockan 11:27 +0200 skrev Bernhard Fischer:
>> >> On Mon, Sep 17, 2007 at 12:43:22PM +0200, Ulf Samuelsson wrote:
>> >> >m?n 2007-09-17 klockan 00:55 -0700 skrev aldot at uclibc.org:
>> >> >> Author: aldot
>> >> >> Date: 2007-09-17 00:54:52 -0700 (Mon, 17 Sep 2007)
>> >> >> New Revision: 19862
>> >> >> 
>> >> >> Log:
>> >> >> - Atmel mirrors are only of interrest for atmel
>> >> >> 
>> >> >> 
>> >> >> Modified:
>> >> >>    trunk/buildroot/target/device/Mirrors.in
>> >> >> 
>> >> >> 
>> >> >
>> >> >And making it depending on BR2_ATMEL or similar makes it impossible to 
>> >> >put package support on that ftp site, so don't create any dependency
>> >> >at all.
>> >> 
>> >> This can depend on BR2_TARGET_ATMEL or some at91 config symbol.
>> >> Depending on BR2_arm is wrong since i want to build arm toolchains but
>> >> use upstream sources, not some vendor supplied tarballs.
>> >> 
>> >You asssume that there is never going to be something on the ftp site
>> >which is interesting to x86/ppc etc. users.
>> >That assumption is wrong, so therefore the dependency is wrong
>> 
>> You seem to be assuming that there is or will be something on that ftp
>> site that is interresting. What would that be?
>
>There are a couple of packages, that I plan to add at a later stage.

I will revert the wrong include until then, so you can fix that if it's
needed. Whether it is BR2_avr32||BR2_at91 or BR2_TARGET_ATMEL is
something that i leave up to you.
>
>>
>>  I don't miss alot of
>> stuff and if so, I somehow doubt that the missing bits would live on
>> an atmel tfp-server.
>> 
>> I ask you to fix the mirror-selection to reflect that a vendor may
>> provide additional patches on their site for their specific products for
>> a short period of time -- i.e. until the fixes are applied to upstream
>> sources -- but _not_ to pollute the rest.
>> 
>
>Exactly what problem are you trying to resolve?

There is no point in having any atmel mirror in my .config unless i
build for at91 or avr32 and choose to use an atmel toolchain or atmel
patches.
