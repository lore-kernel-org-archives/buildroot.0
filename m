From: Gary Bisson <bisson.gary@gmail.com>
Date: Tue, 11 Jun 2019 10:15:59 +0200
Subject: [Buildroot] [PATCH v3] mfgtools: bump revision to latest uuu
 version
In-Reply-To: <cfe0721d-fbce-bb84-cf59-6353d7348ab8@mind.be>
References: <20190608105337.19879-1-bisson.gary@gmail.com>
 <cfe0721d-fbce-bb84-cf59-6353d7348ab8@mind.be>
Message-ID: <20190611081559.GA24465@t450s.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Sat, Jun 08, 2019 at 10:28:09PM +0200, Arnout Vandecappelle wrote:
>  Hi Gary,
> 
> On 08/06/2019 12:53, Gary Bisson wrote:
> > NXP deprecated the old mfgtools code, also called mfgtools v2 although
> > the releases were named v0.xx.
> > 
> > It has been replaced by the Universal Update Utility (uuu), also called
> > mfgtools v3.0 although the releases are named v1.x.yy.
> > 
> > This new tool actually resides in the same repository in the master
> > branch whereas the old one is now in a 'linux' branch.
> > 
> > Since the old tool has issues building lately, let's switch to the new
> > one. Note that uuu seems to be cleaner, supports much more features
> > (i.MX8/8M/8QXP boot, fastboot etc..) and has a better documentation:
> > https://github.com/NXPmicro/mfgtools/wiki
> 
>  Does it also offer the same API? If you have some scripts using mfgtools, will
> they work unchanged with uuu?
> 
>  If not, then I think uuu should be an entirely new package. We could choose to
> deprecate mfgtools immediately, but we'd need a legacy entry if the API has changed.

No the API has changed as the tool was apparently re-developed from the
ground up.

The idea of keeping the same package name although it broke the API is
that:
1- it's still in the same repository
2- NXP still mentions it as mfgtools (although sometimes calling it uuu)
  -> all new NXP releases will use that new tool

> [snip]
> > +2. Run the MfgTools (now called uuu) client to boot the board from USB:
> >  
> > +$ ./output/host/bin/uuu output/images/u-boot.imx
> [snip]
> > -$ ./host/bin/mfgtoolcli -l mmc -s uboot_defconfig=imx \
> > -  -s dtbname=imx6q-sabrelite.dtb -s initramfs=rootfs.cpio.uboot \
> > -  -s mmc=1 -p 1
> 
>  Yup, the API has definitely changed...
> 
>  So, I'm in favour of creating BR2_PACKAGE_HOST_UUU and killing
> BR2_PACKAGE_HOST_MFGTOOLS.
> 
>  I marked the patch as Not Applicable in patchwork. If you convince me to do it
> this way after all, we can fish it up again.

Ok I can do that. I'll offer another series that deprecates mfgtools and creates
a new uuu package.

Regards,
Gary
