From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Jan 2013 21:42:30 +0100
Subject: [Buildroot] configure buildroot to patch at91bootstrap
In-Reply-To: <1359491391.7974.190.camel@genx>
References: <1359491391.7974.190.camel@genx>
Message-ID: <20130129214230.699afd2e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear John Stile,

On Tue, 29 Jan 2013 12:29:51 -0800, John Stile wrote:
> I have modified output/build/at91bootstrap-1.16, and now I would like
> to save the patch set and have it applied when I rebuild
> at91bootstrap-1.16 from scratch.
> 
> To my buildroot .conf file, I added:
> BR2_TARGET_AT91BOOTSTRAP_PATCH="$(TOPDIR)/board/atmel/at91sam9g20ek/at91bootstrap-patch"
> but it is erased from .config after running make.

Never edit your .config file manually. There is no way it can work
properly, unless you know precisely what you're doing.

The reason why a BR2_TARGET_AT91BOOTSTRAP_PATCH line gets removed is
because this option simply doesn't exist.

Simply go in:

 Bootloaders
  -> at91bootstrap
    -> custom patch dir

And set your patch directory here.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
