From: Arthur LAMBERT <lambertarthur22@gmail.com>
Date: Sun, 21 Jun 2015 02:49:56 +0200
Subject: [Buildroot] [PATCH 4/4] firmware file for wifi
In-Reply-To: <20150619172017.GA3638@free.fr>
References: <1434727794-9419-1-git-send-email-lambertarthur22@gmail.com>
 <1434727794-9419-4-git-send-email-lambertarthur22@gmail.com>
 <20150619172017.GA3638@free.fr>
Message-ID: <20150621004956.GB23827@arthur-debian>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Friday 19 Jun 2015 ?? 19:20:17 (+0200), Yann E. MORIN a ??crit :
> Arthur, All,
>
> On 2015-06-19 17:29 +0200, Arthur LAMBERT spake thusly:
> > Signed-off-by: Arthur LAMBERT <lambertarthur22@gmail.com>
> > ---
> >  .../lib/firmware/brcm/brcmfmac4330-sdio.bin        | Bin 0 -> 222126 bytes
> >  .../lib/firmware/brcm/brcmfmac4330-sdio.txt        |  40 +++++++++++++++++++++
> >  2 files changed, 40 insertions(+)
> >  create mode 100644 board/freescale/warpboard/rootfs_overlay/lib/firmware/brcm/brcmfmac4330-sdio.bin
> >  create mode 100644 board/freescale/warpboard/rootfs_overlay/lib/firmware/brcm/brcmfmac4330-sdio.txt
> >
> > diff --git a/board/freescale/warpboard/rootfs_overlay/lib/firmware/brcm/brcmfmac4330-sdio.bin b/board/freescale/warpboard/rootfs_overlay/lib/firmware/brcm/brcmfmac4330-sdio.bin
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..e3bc355467de633b9717ba1c2a7411ac4c4a8b6c
>
> This firmware file is available in linux-firmware, and it is installed
> if you choose BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX.

Ok I will add this package to defconfig and will remove txt/bin firmware file from patch

>
> > diff --git a/board/freescale/warpboard/rootfs_overlay/lib/firmware/brcm/brcmfmac4330-sdio.txt b/board/freescale/warpboard/rootfs_overlay/lib/firmware/brcm/brcmfmac4330-sdio.txt
> > new file mode 100644
> > index 0000000..9546246
> > --- /dev/null
> > +++ b/board/freescale/warpboard/rootfs_overlay/lib/firmware/brcm/brcmfmac4330-sdio.txt
>
> What is the purpose of this file?
>
> Is it really specific to the warpboard, or can it be used on other
> boards? I mean, why do we need this file specifically on the warpboard?
>
> How is this file used by the firmware?
>

This file is requested by the brcmfmac driver. It is not specific to warpboard, but specific to brcm4330.
This txt file is also present in BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX so I can also remove it from the patch

> Regards,
> Yann E. MORIN.
>

Regards,
Arthur.

> > @@ -0,0 +1,40 @@
> > +# bcm94330wlsdgb.txt
> > +manfid=0x2d0
> > +prodid=0x0552
> > +vendid=0x14e4
> > +devid=0x4360
> > +boardtype=0x0552
> > +boardrev=0x11
> > +# this design has 2.4GHz SP3T switch
> > +boardflags=0x00080200
> > +nocrc=1
> > +xtalfreq=37400
> > +boardnum=22
> > +macaddr=00:90:4c:c5:12:38
> > +ag0=255
> > +aa2g=1
> > +ccode=CN
> > +pa0b0=0x14d0
> > +pa0b1=0xfd98
> > +pa0b2=0xff78
> > +rssismf2g=0xa
> > +rssismc2g=0x3
> > +rssisav2g=0x7
> > +maxp2ga0=0x50
> > +sromrev=3
> > +il0macaddr=00:90:4c:c5:12:38
> > +wl0id=0x431b
> > +cckPwrOffset=5
> > +ofdm2gpo=0x66666666
> > +mcs2gpo0=0x6666
> > +mcs2gpo1=0x6666
> > +swctrlmap_2g=0x04040404,0x02020202,0x02020404,0x10202,0x1ff
> > +swctrlmap_5g=0x00100010,0x00280020,0x00200010,0x14202,0x2f8
> > +rfreg033=0x19
> > +rfreg033_cck=0x1f
> > +dacrate2g=160
> > +txalpfbyp2g=1
> > +bphyscale=17
> > +cckPwrIdxCorr=-15
> > +pacalidx2g=45
> > +txgaintbl=1
> > --
> > 1.9.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
