From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Jul 2010 16:05:59 +0200
Subject: [Buildroot] ncurses: build freezes without error with v5.7
In-Reply-To: <1279535505.22010.3.camel@dubciaranr1.verifone.com>
References: <1279123755.7058.242.camel@cabbage.rehill.info>
	<4C3E102D.50105@zacarias.com.ar>
	<1279192188.6184.2.camel@dubciaranr1.verifone.com>
	<AANLkTinsUwFgYEaRhtAwzO2I5Y2frnUunmtzBKTSveF9@mail.gmail.com>
	<1279202763.3572.22.camel@dubciaranr1.verifone.com>
	<AANLkTiks30hgwzuxxsGuxSPsP2iO1S7b1avRHCV9JllD@mail.gmail.com>
	<1279205058.3572.29.camel@dubciaranr1.verifone.com>
	<AANLkTiknnWawF0mRHGu73MxCCuAcGpYWxK-i-uaUKXub@mail.gmail.com>
	<1279212734.3572.42.camel@dubciaranr1.verifone.com>
	<AANLkTikfJUKA0Y1Wv8iJ2Wa8w4IspA5wY-WkhBmkWueV@mail.gmail.com>
	<1279272306.3572.93.camel@dubciaranr1.verifone.com>
	<AANLkTim6BMXBWILqIwNMe02j3PDl9TAWhT1n_pkUdBBI@mail.gmail.com>
	<1279288154.15465.18.camel@dubciaranr1.verifone.com>
	<1279535505.22010.3.camel@dubciaranr1.verifone.com>
Message-ID: <20100719160559.2f7776ce@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 19 Jul 2010 11:31:45 +0100
Quotient Remainder <quotientvremainder@gmail.com> wrote:

> BTW, do you have any idea why, if I have a build that fails in ncurses
> and I just do "rm -rf output/build/ncurses-5.7" and "make", it fails
> making the static library because $(AR_FLAGS) is empty?

I could reproduce here two. I suspect that if you add

NCURSES_USE_CONFIG_CACHE=NO

into ncurses.mk, the problem should go away. However, this is just a
workaround, not a proper fix.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
