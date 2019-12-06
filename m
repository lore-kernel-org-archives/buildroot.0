From: Jerry Huang <jerry.huang@nxp.com>
Date: Fri, 6 Dec 2019 12:34:42 +0000
Subject: [Buildroot] [EXT] Re: [PATCH v3 8/9] board/nxp/common/ls: Add
 standard post image script for Layerscape processors
In-Reply-To: <20191206090349.21ee534f@windsurf>
References: <20191127073028.34651-1-jerry.huang@nxp.com>
 <20191127073028.34651-2-jerry.huang@nxp.com>
 <CA+h21hqg2eEg6pDthun89J76z90KD_qrMBtdj94cPZUhjrq16A@mail.gmail.com>
 <VI1PR04MB51364FD5ED1B5C4A749AF1EDFE5F0@VI1PR04MB5136.eurprd04.prod.outlook.com>
 <20191206090349.21ee534f@windsurf>
Message-ID: <VI1PR04MB513626482CBF6C85D0771C4EFE5F0@VI1PR04MB5136.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Best Regards
Jerry Huang

> -----Original Message-----
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Sent: Friday, December 6, 2019 4:04 PM
> To: Jerry Huang <jerry.huang@nxp.com>
> Cc: Vladimir Oltean <olteanv@gmail.com>; buildroot at busybox.net; Michael
> Walle <michael@walle.cc>; geomatsi at gmail.com;
> matthew.weber at collins.com
> Subject: Re: [EXT] Re: [Buildroot] [PATCH v3 8/9] board/nxp/common/ls: Add
> standard post image script for Layerscape processors
> 
> Caution: EXT Email
> 
> On Fri, 6 Dec 2019 07:23:17 +0000
> Jerry Huang <jerry.huang@nxp.com> wrote:
> 
> > > > +       # build the itb image
> > > > +       cp board/nxp/$(plat_name)/kernel.its
> ${BINARIES_DIR}/kernel.its
> > > > +       cd ${BINARIES_DIR}/
> > > > +       /usr/bin/mkimage -f kernel.its kernel.itb
> > >
> > > Why does mkimage have the full path specified here?
> > Use the mkimage at host machine.
> 
> And that is not correct because nothing guarantees you that there is an
> mkimage installed in /usr/bin/mkimage. You can only rely on the mkimage built
> by Buildroot.
I want to use the mkimage built by buildroot from uboot-tools, but I got this error when handling DTB file:
mkimage: unsupported type Flat Device Tree

the DTB file is create with command "make" during building Linux kernel.

When I use mkimage from ubuntu system, it is no any problem.

So ,how to handle it?

> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbootlin.c
> om&amp;data=02%7C01%7Cjerry.huang%40nxp.com%7Cc0a9dbf3584742076d
> c608d77a22d5f2%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6371
> 12162347177474&amp;sdata=iAhqJ45WKxYlgdrbEd8DISqFyKX4t3nfm8jNN6BEl
> ZQ%3D&amp;reserved=0
