From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 18 Jan 2015 22:50:24 +0100
Subject: [Buildroot] [PATCH v3 0/7] dtc: update and add raspberry pi
 overlay support
In-Reply-To: <20150118164909.GS4275@free.fr>
References: <1421178007-11877-1-git-send-email-ps.report@gmx.net>,
 <20150118164909.GS4275@free.fr>
Message-ID: <trinity-0f11c97e-b1da-4aec-8c51-55ebc24e6ee2-1421617824701@3capp-gmx-bs51>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

> Gesendet: Sonntag, 18. Januar 2015 um 17:49 Uhr
> Von: "Yann E. MORIN" <yann.morin.1998@free.fr>
> An: "Peter Seiderer" <ps.report@gmx.net>
> Cc: buildroot at busybox.net, "Fabio Porcedda" <fabio.porcedda@gmail.com>, "Jeremy Kerr" <jk@ozlabs.org>, "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>, "Matthew Weber" <matthew.weber@rockwellcollins.com>
> Betreff: Re: [PATCH v3 0/7] dtc: update and add raspberry pi overlay support
>
> Peter, All,
> 
> On 2015-01-13 20:40 +0100, Peter Seiderer spake thusly:
> > There are two different dtb files used for raspberry pi booting:
> > - overwrite the firmware provided videocore dtb configuration ([1])
> > - linux kernel dtb configuration and dtb overlays ([2])
> 
> Well, I haven't yet tried to use overlays, but from what I understood,
> DTB overlays can be handled seamlessly from the RPi bootloader:
> 
>     device_tree_overlay=path/to-overlay.dtb
> 

Yes thats the way you 'activate' a given overlay...

> So, is it really required that we do patch dtc for overlay support?
> 

Yes, you have to patch the dtc tool to be able to generate a suitable overlay dtb file...

> Instead, I would very much prefer we stick to what upstream dtc provide,
> and when overlay support has been merged in there, we can bump our dtc
> version (or backport just the overlay support if bumping is not
> practical).

This means no overlay dtb file generation until 'official' support (do not know if
the patches where ever suggested upstream)?

> 
> It would be very unmaintainable to bundle overlay support in Buildroot,
> if upstream eventually decide to not support them, or decide to support
> them in a very different way. We can not afford this, I'm afraid.
> 

If this happens the 'patch' support could be dropped easily...

> In the meantime, and that's unfortunate, we won't support overlays in
> dtc... :-(
>

Though people have to find the right patches again and again...

But I understand the point that patch care in buildroot is not easy...

Regards,
Peter

> Regards,
> Yann E. MORIN.
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> 
