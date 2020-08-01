From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Sat, 01 Aug 2020 10:12:09 +0200
Subject: [Buildroot] [PATCH 00/15] Improve SELinux support
In-Reply-To: <CAFSsvmpUWps7DezP0L2-TH1DHZTzVqP8n+nfZyum88n-BbX-mg@mail.gmail.com>
References: <20200731101040.1723047-1-antoine.tenart@bootlin.com>
 <CAFSsvmrU12Q9p=A0MmAWeK3dScyn4RSQY=69MJD1GcCZ0Bb_tA@mail.gmail.com>
 <CAFSsvmpUWps7DezP0L2-TH1DHZTzVqP8n+nfZyum88n-BbX-mg@mail.gmail.com>
Message-ID: <159626952921.1725162.3902239621146438561@kwain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam,

Quoting Adam Duskett (2020-07-31 22:48:13)
> 
> After some testing I figured I would give my thoughts:
> 
> 1) with this patch series it seems like host-systemd breaks with several
> "src/shared/libsystemd-shared-245.so: undefined reference to
> `$SELINUX_MODULE'" errors.
> 
> The easy fix is to explicitly set -Dselinux=disabled in the
> HOST_SYSTEMD_CONF_OPTS.

I didn't run into this one, but I'll try reproducing it.

> 2) As I thought, there are several packages that are broken when
> selinux is enabled still. I know the original goal of this project is
> not to fix these packages, but if you are interested, here is a quick
> .te output I made from audit2allow on my Fedora32 system (which is why
> there are several "allowed in the current policy" warnings.

Thanks! I also have made such a module on my side, to test images in
enforcing mode. I'm trying to see what could go in the upstream
refpolicy and what would need to be in "out-of-tree" modules.

In any case, fixing all of those denied actions would be really nice.

Thanks!
Antoine

-- 
Antoine T?nart, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
