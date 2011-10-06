From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 06 Oct 2011 10:47:36 +0200
Subject: [Buildroot] [PATCH 4/4] Add the libplayer package
In-Reply-To: <20111006101928.294b6580@skate> (Thomas Petazzoni's message of
 "Thu, 6 Oct 2011 10:19:28 +0200")
References: <cover.1317636624.git.maxime.ripard@free-electrons.com>
 <cover.1317636624.git.maxime.ripard@free-electrons.com>
 <d0ce7b4624a0a4fc886c8fcbc9c6730e7a931981.1317636624.git.maxime.ripard@free-electrons.com>
 <871uurnqhp.fsf@macbook.be.48ers.dk> <20111006101928.294b6580@skate>
Message-ID: <87r52q4ic7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Maxime> +comment "Libplayer requires a toolchain with LARGEFILE support"
 Maxime> +	depends on !BR2_LARGEFILE
 Maxime> +
 >> 
 >> This should go under the 'if BR2_PACKAGE_LIBPLAYER' conditional.

 Thomas> Hu ? We want this comment to be shown when libplayer is *not* enabled,
 Thomas> to let the user know that if (s)he doesn't see libplayer, it's because
 Thomas> largefile is not enabled. So definitely, we don't want this comment to
 Thomas> depend on BR2_PACKAGE_LIBPLAYER. Or am I missing something here ?

No, just me not thinking. Nothing to see here, move along .. ;)

 >> Does libplayer do anything sensible with both backends disabled or do we
 >> need to depend on BR2_PACKAGE_MPLAYER || BR2_PACKAGE_GSTREAMER?

 Thomas> I did ask the same question to Maxime, and libplayer builds fine with
 Thomas> neither backends enabled. It probably doesn't do anything useful, but I
 Thomas> would say that it's the user responsibility here.

Ok.

 >> So it seems you need to depend on BR2_LARGEFILE.

 Thomas> Which it does:

 Maxime> +config BR2_PACKAGE_LIBPLAYER
 Maxime> +	depends on BR2_LARGEFILE

Argh, you're right. I need some more sleep it seems (or atleast stop
trying to do 5 things at once). When testing, I didn't run menuconfig
but just 'make libplayer' and my toolchain didn't have largefile
support.

Sorry about the noise, will commit now - Thanks both.

-- 
Bye, Peter Korsgaard
