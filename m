From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 8 Jun 2019 22:28:09 +0200
Subject: [Buildroot] [PATCH v3] mfgtools: bump revision to latest uuu
 version
In-Reply-To: <20190608105337.19879-1-bisson.gary@gmail.com>
References: <20190608105337.19879-1-bisson.gary@gmail.com>
Message-ID: <cfe0721d-fbce-bb84-cf59-6353d7348ab8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Gary,

On 08/06/2019 12:53, Gary Bisson wrote:
> NXP deprecated the old mfgtools code, also called mfgtools v2 although
> the releases were named v0.xx.
> 
> It has been replaced by the Universal Update Utility (uuu), also called
> mfgtools v3.0 although the releases are named v1.x.yy.
> 
> This new tool actually resides in the same repository in the master
> branch whereas the old one is now in a 'linux' branch.
> 
> Since the old tool has issues building lately, let's switch to the new
> one. Note that uuu seems to be cleaner, supports much more features
> (i.MX8/8M/8QXP boot, fastboot etc..) and has a better documentation:
> https://github.com/NXPmicro/mfgtools/wiki

 Does it also offer the same API? If you have some scripts using mfgtools, will
they work unchanged with uuu?

 If not, then I think uuu should be an entirely new package. We could choose to
deprecate mfgtools immediately, but we'd need a legacy entry if the API has changed.

[snip]
> +2. Run the MfgTools (now called uuu) client to boot the board from USB:
>  
> +$ ./output/host/bin/uuu output/images/u-boot.imx
[snip]
> -$ ./host/bin/mfgtoolcli -l mmc -s uboot_defconfig=imx \
> -  -s dtbname=imx6q-sabrelite.dtb -s initramfs=rootfs.cpio.uboot \
> -  -s mmc=1 -p 1

 Yup, the API has definitely changed...

 So, I'm in favour of creating BR2_PACKAGE_HOST_UUU and killing
BR2_PACKAGE_HOST_MFGTOOLS.

 I marked the patch as Not Applicable in patchwork. If you convince me to do it
this way after all, we can fish it up again.

 Regards,
 Arnout
