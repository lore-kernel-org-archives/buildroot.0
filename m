From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Jun 2015 12:16:02 +0200
Subject: [Buildroot] [PATCH 4/4] firmware file for wifi
In-Reply-To: <20150621004956.GB23827@arthur-debian>
References: <1434727794-9419-1-git-send-email-lambertarthur22@gmail.com>
 <1434727794-9419-4-git-send-email-lambertarthur22@gmail.com>
 <20150619172017.GA3638@free.fr>
 <20150621004956.GB23827@arthur-debian>
Message-ID: <20150621101602.GA3625@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arthur, All,

On 2015-06-21 02:49 +0200, Arthur LAMBERT spake thusly:
> Le Friday 19 Jun 2015 ?? 19:20:17 (+0200), Yann E. MORIN a ?crit :
> > On 2015-06-19 17:29 +0200, Arthur LAMBERT spake thusly:
> > > diff --git a/board/freescale/warpboard/rootfs_overlay/lib/firmware/brcm/brcmfmac4330-sdio.txt b/board/freescale/warpboard/rootfs_overlay/lib/firmware/brcm/brcmfmac4330-sdio.txt
> > > new file mode 100644
> > > index 0000000..9546246
> > > --- /dev/null
> > > +++ b/board/freescale/warpboard/rootfs_overlay/lib/firmware/brcm/brcmfmac4330-sdio.txt
> >
> > What is the purpose of this file?
> >
> > Is it really specific to the warpboard, or can it be used on other
> > boards? I mean, why do we need this file specifically on the warpboard?
> >
> > How is this file used by the firmware?
> >
> 
> This file is requested by the brcmfmac driver. It is not specific to warpboard, but specific to brcm4330.
> This txt file is also present in BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX so I can also remove it from the patch

No, this file is not present in linux-firmware, and is not installed by
Buildroot in any way.

Also, I had a look at the driver, and indeed it requests this file
unconditionally. I wonder what would be the best solution to provide
this file, since it is not installed by linux-firmware.

I'm a bit wary to provide a generic one, since I can see it contains:
  - vendor/product/etc.. IDs, not too problematic
  - macaddr, not too problematic; still...
  - a lot of magic numbers in platform-specific variables.

So, I think the best solution for now would be to keep that file in the
board directory, like you have for now.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
