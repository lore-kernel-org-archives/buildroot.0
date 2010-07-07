From: Mitch Davis <mjd+buildroot@afork.com>
Date: Wed, 7 Jul 2010 10:35:58 +1000
Subject: [Buildroot] init: I won't write compressed data to a terminal.
In-Reply-To: <4C33AB4E.9050604@gmx.net>
References: <4C33AB4E.9050604@gmx.net>
Message-ID: <AANLkTimdJ34gAH-YTjfOkW_iEsKZyRvBVnbLIS55oMdd@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 7, 2010 at 8:16 AM, Ossy <ossy1980@gmx.net> wrote:
> Hi buildroot mailinglist,

Hey Ossy!

> After successfully compiling a whole rootfs and mounting it via loop on some
> nfs export I started my arm ebedded device and ran into tho following error
> after booting the image via tftp.
>
> "init: I won't write compressed data to a terminal."
>
> The bootargs include a console=ttyS0,115200 and rootfs over nfs options.
> I guess there is is an issue with the built in zip/bzip compression.
> But why is the init process not able to output to the terminal?

I would suspect that it's not init as-such, but rather there is a
startup script that is not working properly.

What happens if you also include "init=/bin/sh" on your kernel boot
line, then boot?
What happens if you rename /etc/inittab to have a different name (so
init won't find /etc/inittab) then boot?

Mitch.
