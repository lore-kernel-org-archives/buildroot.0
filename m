From: Gervais, Francois <FGervais@distech-controls.com>
Date: Mon, 24 Feb 2020 15:50:01 +0000
Subject: [Buildroot] [EXT] Re: [v5,
 3/9] package/qoriq-rcw: bump to version LSDK-19.09
In-Reply-To: <VI1PR04MB5136F11FD4D66183033821DFFEEC0@VI1PR04MB5136.eurprd04.prod.outlook.com>
References: <DM6PR01MB58498E8B6D7E4DFB76C2F121F3120@DM6PR01MB5849.prod.exchangelabs.com>
 <VI1PR04MB5136F11FD4D66183033821DFFEEC0@VI1PR04MB5136.eurprd04.prod.outlook.com>
Message-ID: <DM6PR01MB58493BFD2C2487BC6AD7AE6EF3EC0@DM6PR01MB5849.prod.exchangelabs.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: Jerry Huang <jerry.huang@nxp.com>
> Sent: February 24, 2020 9:44 AM
> To: Gervais, Francois <FGervais@distech-controls.com>; buildroot at buildroot.org
> Subject: RE: [EXT] Re: [v5,3/9] package/qoriq-rcw: bump to version LSDK-19.09
> 
> 
> 
> Best Regards
> Jerry Huang
> 
> > -----Original Message-----
> > From: Gervais, Francois <FGervais@distech-controls.com>
> > Sent: Saturday, February 22, 2020 6:10 AM
> > To: buildroot at buildroot.org
> > Cc: Jerry Huang <jerry.huang@nxp.com>
> > Subject: [EXT] Re: [v5,3/9] package/qoriq-rcw: bump to version
> > LSDK-19.09
> >
> > Caution: EXT Email
> >
> > Hi Jerry,
> >
> > I think this patch breaks:
> >
> > define HOST_QORIQ_RCW_BUILD_CMDS
> >         python $(@D)/rcw.py -i
> > $(@D)/custom_board/rcw/$(QORIQ_RCW_PROJECT) -I $(@D)/custom_board -o
> > $(@D)/PBL.bin endef
> >
> > host-qoriq-rcw-LSDK-19.09/rcw.py fails with:
> >
> > "Only Python versions 3.0+ are supported."
> Python3 is the future ?.

I agree.

Would simply calling "python3" instead of "python" be a good fix in this case?

I'm not really sure which python is used, is it a buildroot built python or a buildroot
dependency python? If it's the dependency python then the buildroot manual still
calls for 2.7+ so calling simply calling python3 might not be an acceptable fix.
