From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 Mar 2008 12:11:21 +0100
Subject: [Buildroot] build problems
In-Reply-To: <034f01c88ece$ef015bf0$040514ac@atmel.com> (Ulf Samuelsson's
	message of "Tue\, 25 Mar 2008 23\:41\:41 +0100")
References: <1CD05B980C94AC408B37C82BBABAA3E60ACA8184@mtsexchange.dc.multitech.prv>
	<034f01c88ece$ef015bf0$040514ac@atmel.com>
Message-ID: <87ve39buzq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 >> Also, when I run it right now and try to do a "make configured", I get
 >> an error because it can't copy busybox-1.9.2.config. It looks like
 >> busybox has been updated, but a new config file has not been put into
 >> the target/device/atmel/at91sam9260dfc directory. So do I rename the
 >> busybox-1.9.1.config file to busybox-1.9.2.config? 

 Ulf> I think this will work.
 Ulf> The problem is that people updating the busybox support,
 Ulf> disables the use of older busybox, which will force the 
 Ulf> saved config to update the version.
 Ulf> I am not sure that this is a good idea.

I'll be the first to admit to not knowing anything about that 11MB
blob under target/device/Atmel  - Why make it so fragile to begin with?

By now all the avr/atmel stuff takes up around half the buildroot size
- I don't have access to any of that hardware, so I won't test it.

I see that the directory only has a busybox config for 1.6.1 and
1.9.1, so it's broken anyway if the user selects anything else than
that.

To me it doesn't make sense to keep earlier versions than the latest
stable release of a given major version (E.G. 1.9.2 instead of 1.9.1)
- Otherwise it'll get too hard to handle. I think it's also soon time
to retire some of the really ancient versions like 1.2.x - 1.6.x.

 >> Also, if I run "make
 >> menuconfig" from the buildroot directory and look at the package
 >> selection, busybox-1.9.x is selected. But the parameter 'busybox
 >> configuration file to use' has '/package/busybox/busybox-1.6.0.config"
 >> in it. Really confusing.
 >> 

 Ulf> Not sure, but I think this is overridden in the Atmel makefile.

Yes, the target/device/Atmel hardcodes it to

BR2_PACKAGE_BUSYBOX_CONFIG:=$(BR2_BOARD_PATH)/busybox-$(BR2_BUSYBOX_VERSION).config

Which is bad.

-- 
Bye, Peter Korsgaard
