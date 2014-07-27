From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 27 Jul 2014 15:29:08 +0200
Subject: [Buildroot] [PATCH 20/20 v3] package/xserver_xorg-server: needs
 libudev, not a udev daemon
In-Reply-To: <XnsA37794FEB18FDberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <cover.1405777634.git.yann.morin.1998@free.fr>
 <7964be0c75358121baa69301d23eb93d72a64db9.1405777634.git.yann.morin.1998@free.fr>
 <XnsA3777C2F4BB23berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <20140727143111.7f5091a0@free-electrons.com>
 <XnsA37794FEB18FDberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20140727132908.GD3895@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-07-27 14:38 +0200, Bernd Kuhls spake thusly:
> Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
> @public.gmane.org> wrote in news:20140727143111.7f5091a0 at free-electrons.com:
> 
> > That's the kind of thing that worries me about the idea of allowing
> > only libudev to be installed without the udev daemon running. I believe
> > libudev and the udev daemon are meant to be used together, and we're
> > likely to fall into various issues by allowing libudev to be installed
> > separately from the udev daemon.
> 
> and thats exactly the reason why I suggest to switch only those packages over 
> to libudev which are proven to work without the udev daemon. This is true for 
> mesa3d/libcec/xbmc/libdrm/xdriver_xf86-video-intel, the packages I am using 
> on my non-udev-daemon system.

I can see the reasonning. But if we do not convert those packages, they
will never be. If we do convert them. we can be sure to get complains by
angry users! Adn we can then revert broken packages.

What I would suggest is the following plan:

  - for the next release (-rc1 due shortly), only convert packages known
    to work with only libudev, that is the list provided by Bernd:
        mesa3d  libcec  xbmc  libdrm  xdriver_xf86-video-intel
    so we have a sane situation for the release, and not too much burden
    during the stabilisation phase.

  - when -rc1 is out, or early after -next is merged back in master,
    convert the remaining packages in -next, after _testing_ the
    packages are still working. Unfortunately, I won't be able to test
    all such packages (e.g. xserver_xorg-server) as I do not use Xorg;
    but Bernd uses it, so he may be able to give a hand at it, correct?

How do you feel with this plan?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
