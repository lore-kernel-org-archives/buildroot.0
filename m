From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 28 Dec 2017 23:56:39 +0100
Subject: [Buildroot] [RFC 1/2] busybox: avoid conflict with other
 packages
In-Reply-To: <20171228162307.GD3428@scaer>
References: <20171213130131.15744-1-thomas.petazzoni@free-electrons.com>
 <20171213130131.15744-2-thomas.petazzoni@free-electrons.com>
 <20171213144305.zs2iowvzy4n5xzqj@sapphire.tkos.co.il>
 <20171214061850.62bb4ae9@windsurf.png.is.keysight.com>
 <20171214065807.74cqtgpex5oldpx3@sapphire.tkos.co.il>
 <20171228162307.GD3428@scaer>
Message-ID: <20171228225639.GK3428@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, Thomas, All,

On 2017-12-28 17:23 +0100, Yann E. MORIN spake thusly:
> On 2017-12-14 08:58 +0200, Baruch Siach spake thusly:
[--SNIP--]
> > Quoting busybox.mk:
> > 
> > # Enable "noclobber" in install.sh, to prevent BusyBox from overwriting any
> > # full-blown versions of apps installed by other packages with sym/hard links.
> > 
> > Unfortunately, the noclobber implementation is racy.
> 
> How is it racy?
> 
> At the moment we're gonna call it, no other package will be installing
> at the same time (in the location seen by busybox at least), so there
> should be no race.

Yet there were some issues with that part, so I've sent a small
patch-series to busybox to fix the noclobber stuff:
    http://lists.busybox.net/pipermail/busybox/2017-December/086039.html

So, with this, we should be able to:

  - invert the dependency chain, so thatr busybox now depends on all
    otehr packages that it may install applets of;

  - drop the big list of applets-to-disable in busybox, and rely on the
    install-noclobber install rule

If upstream accepts that series, of course...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
