From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 6 Aug 2015 10:45:13 +0200
Subject: [Buildroot] [RFC 00/37] efl bump to 1.14.2
In-Reply-To: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
References: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <55C31E99.8010002@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

Le 26/07/2015 20:55, Romain Naour a ?crit :
> This series bump the efl package to the latest release and also update all
> other packages which use efl.
> 
> The elf related packages are no longer in package/efl directory to
> follow the Buildroot recommendations.
> 
> This series has been tested under Qemu for x86 using the kernel based on
> linux config povided in board/qemu/x86. I've enabled CONFIG_FB_CIRRUS
> and some other video related options during testing.
> A example defconfig will be added in a followup patch.
> 
> It also been builded tested with a ARM toolchain.
> 
> The sdl2 support has been droped in this series since some libevas gl module
> still use sdl v1 headers.
> Also the new efl package is no longer available for other libc than glibc due
> to use of mkstemps() function.
> 
> Patches  1 to  3 add some new packages used by efl
> Patches  4 to  8 move existing efl packages outside or package/efl directory.
>                  There is no efl package at this point.
> Patches  9 to 20 add a new efl package updated to 1.14.2.
> Patches 21 to 26 update all other packages which use efl.
> Patches 27 to 36 remove old efl packages.
> Patch 37 add a new package libemotion-generic-players
> 
> This is a first part, other packages which use efl are ready and will be
> sent in a followup series:
> 
> * rage
> * terminology
> * empc
> * ecrire
> * python-efl
> * econnman
> * libetrophy
> * elemines
> * libcanberra
> * e-cho

This series is superseded since efl 1.15 is out.
Also, efl can be build with a musl toolchain if pulseaudio is fixed for musl.

I've pushed an updated version on github for testing and review.
https://github.com/RomainNaour/buildroot/tree/efl-1.15.0-v1

I'll wait for the 2015.08 release before sending an updated version.

Best regards,
Romain
> 
> Best regards,
> Romain Naour
> 
