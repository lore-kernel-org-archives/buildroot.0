From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 18 Aug 2016 15:44:52 +0000
Subject: [Buildroot] [Bug 9166] Missing overlays directory in VFAT image for
 raspberry pi 3
In-Reply-To: <bug-9166-163@https.bugs.busybox.net/>
References: <bug-9166-163@https.bugs.busybox.net/>
Message-ID: <bug-9166-163-qy2gt2lES8@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9166

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|WORKSFORME                  |INVALID

--- Comment #2 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Diez,

If you found that your bug was in fact not resolved and still valid, you
should have reopenned it rather than sending an email to an individual.

So, you said:

> BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS=y does copy the overlays
> into output/images/rpi-firmware/overlays which is all fine and dandy -
> but does *not* include them then in the actual FAT boot image, which is
> controlled by: buildroot/board/raspberrypi/genimage-raspberrypi3.cfg

Indeed, that is not the case.

The defconfig files we provide in Buildroot are "minimalist" configs,
aimed at building the strict minimum to get a board to actually boot up
to a shell prompt, with wired networkingv (no wireless). No more.

This is because there are so many possibilities to use a board that we
will definitely never be able to cover all use cases. At least, a minimal
defconfig gets the board booting and ready to use in its basic setup. It
is a known-working starting point for further customisation by the user.

In your casse, edit (or copy then edit) the genimage-raspberrypi3.cfg to
suit your needs.

I'll keep this report closed, however, because I believe the behaviour
you reported is what is intended.

Feel free to comment, though. ;-)

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
