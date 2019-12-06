From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Dec 2019 09:03:49 +0100
Subject: [Buildroot] [EXT] Re: [PATCH v3 8/9] board/nxp/common/ls: Add
 standard post image script for Layerscape processors
In-Reply-To: <VI1PR04MB51364FD5ED1B5C4A749AF1EDFE5F0@VI1PR04MB5136.eurprd04.prod.outlook.com>
References: <20191127073028.34651-1-jerry.huang@nxp.com>
 <20191127073028.34651-2-jerry.huang@nxp.com>
 <CA+h21hqg2eEg6pDthun89J76z90KD_qrMBtdj94cPZUhjrq16A@mail.gmail.com>
 <VI1PR04MB51364FD5ED1B5C4A749AF1EDFE5F0@VI1PR04MB5136.eurprd04.prod.outlook.com>
Message-ID: <20191206090349.21ee534f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 6 Dec 2019 07:23:17 +0000
Jerry Huang <jerry.huang@nxp.com> wrote:

> > > +       # build the itb image
> > > +       cp board/nxp/$(plat_name)/kernel.its ${BINARIES_DIR}/kernel.its
> > > +       cd ${BINARIES_DIR}/
> > > +       /usr/bin/mkimage -f kernel.its kernel.itb  
> > 
> > Why does mkimage have the full path specified here?  
> Use the mkimage at host machine.

And that is not correct because nothing guarantees you that there is an
mkimage installed in /usr/bin/mkimage. You can only rely on the mkimage
built by Buildroot.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
