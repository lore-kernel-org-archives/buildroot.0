From: Michael Burghart <mb@michaelburghart.de>
Date: Mon, 18 Apr 2011 17:17:11 +0200
Subject: [Buildroot] kernel and|or initrd
In-Reply-To: <LJUS2K$28351E41DE62C4240393CF6875FF3D6E@aruba.it>
References: <LJUS2K$28351E41DE62C4240393CF6875FF3D6E@aruba.it>
Message-ID: <4DAC55F7.30603@michaelburghart.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

I've got a simple question. I compiled my kernel without use of modules.
Is it necessary ot use an initrd?

This is my grub/menu.lst:

# Begin /boot/grub/menu.lst

default 0
timeout 30
geometry (hd0) 1974 16 63

color cyan/blue white/blue

# The first entry is for TaLux.
title Talux 1.0
        root (hd0,0)
        geometry (hd0) 1974 16 63
        kernel /boot/talux-2.6.24.7 root=/dev/sda1 rw console=tty0
console=ttyS0,38400n8


root and setup of grub work fine. While booting grub announces
"GRUB loading, please wait..." and thats it.

What's the best way to boot?


- -- 
- --
cheers
- -micha-
- --
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNrFX3AAoJEEMkp/gkis19HVYH/15ORDqNJhpfm0Qq85fUHgAN
rlP9loW0ARKv2EZIwM1OfH/MqNFpshYwmuK/c8vWRRQ6q4opSuW2l+UMXKOSUHuc
lj0vUt44Jrtbw316zGwx6i3rz/2As4i5kFymKPvsf4fSTOe+oAzSfEM2iLNw8YeT
U7mOH3XvrZELqUTTVprW0Tx2kPO/FSbvql0CIBLTqIs26NtAin1BiIWuVmSGL7Nt
tJdcwGeHKh7OgwFGYxFXA/axtAI/baLCwk770hkV7K8OQZvsZvR4jIuG6oCik6mg
HHgac1JVOYC0/rDZ8Uh3w71YbOUUJ70R/F6lh1UWvla5MOpWOxke21pibwtDNAk=
=FYr2
-----END PGP SIGNATURE-----
