From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Tue, 29 Dec 2015 15:14:27 -0200
Subject: [Buildroot] [PATCH] pandaboard_defconfig: bump u-boot to
 2015.10 and kernel to 4.3
In-Reply-To: <20151229140134.6dce652c@free-electrons.com>
References: <1450978394-822-1-git-send-email-sergio.prado@e-labworks.com>
 <20151227120631.78043b59@free-electrons.com>
 <CANu7NGsP5K4268wtVMAcvUD+OaTxdEUvnV8aaoVqFhY1X-oOfg@mail.gmail.com>
 <20151229140021.054e6740@free-electrons.com>
 <20151229140134.6dce652c@free-electrons.com>
Message-ID: <CANu7NGv=i4F+ZsDWLwu6L4RvtQTRgBKpjsup+6gn0LYJaPF3hw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

2015-12-29 11:01 GMT-02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:
>
> Hello,
>
> On Tue, 29 Dec 2015 14:00:21 +0100, Thomas Petazzoni wrote:
>
> > > That was my first attempt, but it didn't work. The ROM code from OMAP
> > > processors (and I think also Sitara processors) need the SD card to be
> > > formatted with a special geometry in the partition table. That's the
reason
> > > of the script above. I did not find any option in the genimage tool to
> > > configure thinks like sectors and cylinders. So I do not see an easy
way to
> > > generate a sdcard image in this case. What do you think?
> >
> > Ah ok. I don't know if genimage can handle such scenarios. I am Cc'ing
> > Vivien Didelot, who did quite a bit of work on genimage in Buildroot. I
> > think I remember he telling me that he had a working genimage
> > configuration for the BeagleBone, which has, AFAIK, the same
> > requirements as the PandaBoard in terms of geometry and all.
>
> I found Vivien's initial patch for the BeagleBone:
>
>   http://lists.busybox.net/pipermail/buildroot/2015-March/122406.html
>
> Though I don't see where it handles the specific geometry requirements.
> Maybe those requirements have been relaxed in the AM335x compared to
> the OMAP4 ?

I've just confirmed that the Beaglebone Black has the same geometry
requirements.

The generated sdcard image works in this case because the processor's ROM
code will by default load U-Boot from the internal eMMC, that will read the
images (kernel, dtb, rootfs) from the external sdcard. So if you have
U-Boot in the internal eMMC, it will work.

But if you try to boot U-Boot from external sdcard (holding S2) it won't
work.

Maybe we can think of trying to add in the genimage tool the feature of
configuring the geometry in the generated image. Any thoughts Vivien?

In the meantime, can we keep the previous approach of just documenting the
process of generating the image in the readme.txt?

>
> Best regards,

Thanks,

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com


Sergio Prado
Embedded Labworks
Office: +55 11 2628-3461
Mobile: +55 11 97123-3420
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151229/35669d65/attachment.html>
