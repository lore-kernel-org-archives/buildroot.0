From: Julien Olivain <juju@cotds.org>
Date: Sat, 28 Dec 2019 18:45:54 +0100
Subject: [Buildroot] =?utf-8?q?Build_of_nitrogen8m=5Fdefconfig_broken?=
In-Reply-To: <20191228123341.27f8b251@windsurf>
References: <20191228123341.27f8b251@windsurf>
Message-ID: <be3d67b0dc8b66a331fa1bf4e92a3ab5@cotds.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 2019-12-28 12:33, Thomas Petazzoni wrote:
> Hello,
> 
> The build of nitrogen8m_defconfig is broken:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/389451762
> 
> I'm not sure since when. Maybe since some recent changes from Julien on
> i.MX8 support?
> 
> It fails like this:
> 
> 550 ERROR:
> /builds/buildroot.org/buildroot/output/images/u-boot-nodtb.bin file
> NOT found
> 551 Error:
> /builds/buildroot.org/buildroot/output/images/u-boot.its:0.0 syntax
> error
> 552 FATAL ERROR: Unable to parse input tree
> 553 /builds/buildroot.org/buildroot/output/host/bin/mkimage: Can't
> open /builds/buildroot.org/buildroot/output/images/u-boot.itb.tmp: No
> such file or directory
> 554 Platform:	i.MX8M (mScale)
> 555 Using FIT image
> 556 SIGNED HDMI
> FW:	/builds/buildroot.org/buildroot/output/images/signed_hdmi_imx8m.bin
> 557 LOADER
> IMAGE:	/builds/buildroot.org/buildroot/output/images/u-boot-spl-ddr.bin 
> start addr: 0x007e1000
> 558 SECOND LOADER
> IMAGE:	/builds/buildroot.org/buildroot/output/images/u-boot.itb start
> addr: 0x40200000 offset: 0x00060000
> 559 
> Output:		/builds/buildroot.org/buildroot/output/images/imx8-boot-sd.bin
> 560 /builds/buildroot.org/buildroot/output/images/u-boot.itb: Can't
> open: No such file or directory
> 561 Makefile:734: recipe for target 'target-finalize' failed
> 
> Could one of you have a look ?

It was, indeed, one of my recent change. I posted a patch to fix this 
issue:
https://patchwork.ozlabs.org/patch/1215852/

However, I don't have access to the nitrogen8m board. Can somebody test
this patch, to check it is still booting correctly?

Thanks,

Julien.
