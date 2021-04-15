From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 15 Apr 2021 12:52:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/freescale-imx/imx-vpu-hantro:
 fix build with gcc 10
In-Reply-To: <20210412120533.8930-1-sebastien.szymanski@armadeus.com>
References: <20210412120533.8930-1-sebastien.szymanski@armadeus.com>
Message-ID: <YHga/xaUQhThmbHG@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi S?bastien,

Thanks for your contribution.

On Mon, Apr 12, 2021 at 02:05:33PM +0200, S?bastien Szymanski wrote:
> imx-vpu-hantro build with gcc 10 fails with the following errors:
> 
> decoder_sw/software/linux/dwl/dwl_linux_hw.o:(.bss+0x44): multiple
> definition of `DWLInitParam';
> decoder_sw/software/linux/dwl/dwl_linux.o:(.bss+0x1200): first defined
> here
> 
> decoder_sw/software/linux/dwl/dwl_linux_hw.o:(.bss+0x48): multiple
> definition of `DecPicCodingType';
> decoder_sw/software/linux/dwl/dwl_linux.o:(.bss+0x1204): first defined
> here
> 
> Add a patch found at https://github.com/Freescale/meta-freescale to fix
> this issue.

However in the latest release from NXP those issues have been fixed.
Would you mind offering another patch that bumps to latest version [1]
instead? Making sure your app still works but the new version also
includes several buffer checks that could be useful anyway.

Regards,
Gary

[1] https://source.codeaurora.org/external/imx/meta-imx/tree/meta-bsp/recipes-bsp/imx-vpu-hantro?h=gatesgarth-5.10.9-1.0.0
