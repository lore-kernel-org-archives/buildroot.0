From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Sep 2012 19:47:31 +0200
Subject: [Buildroot] [PATCH] Add package raspberrypi-firmware.
In-Reply-To: <20120918070934.2e3182bf@skate>
References: <1347914057-20287-1-git-send-email-marek.belisko@open-nandra.com>
 <201209172350.27316.yann.morin.1998@free.fr> <20120918070934.2e3182bf@skate>
Message-ID: <201209181947.32049.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Marek, All,

On Tuesday 18 September 2012 07:09:34 Thomas Petazzoni wrote:
> On Mon, 17 Sep 2012 23:50:27 +0200, Yann E. MORIN wrote:
> > What would be the interest to install the GPU boot files, but not install
> > the VideoCore libraries? Or the other way around, what would be the intrest
> > to install the VidoeCore library without the GPU boot files?

> The GPU boot files are needed to actually boot the ARM processor. So
> technically speaking, they are some kind of first-stage bootloader for
> the ARM processor, even if they get executed on the GPU.
> 
> So, if you want to use the RasberryPi, you *must* install those GPU
> boot files. However, if you're not using the RasberryPi for a 3D
> graphical application, you don't necessarily need the VideoCore library
> files. So I think it makes sense to be able to install the GPU boot
> files separately from the VideoCore library.

Ah, OK, that's one more thing I learned, so I won;t have to discover the
hard way when plugging my RPI first (later tonight! :-) )

So, basically, the initial interest for this package is to provide the
bootloader files, hence I believe the package should go in the bootloader
sub-menu.

Then we can add a VideoCoreIV package in one of the "packages on target"
sub-menu ("libs -> hardware handling" sounds the most adequate AFAICS).

> The underlying problem here is a fundamental weakness in Buildroot
> design: the absence of separation between source packages and binary
> packages. We have the same situation quite often for other things. For
> example the "curl" package. It provides both a library "libcurl", and a
> program "curl" that relies on that library. Should this package be
> under "Libraries -> Networking" or under "Networking applications" ?
> Ditto for many, many of our packages.

Ok, so I'll prepare that patch of mine to add this package, so we can
compare with Marek's solution.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
