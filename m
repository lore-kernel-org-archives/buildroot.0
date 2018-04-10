From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Apr 2018 23:26:29 +0200
Subject: [Buildroot] [PATCH v6 4/4] configs/freescale_imx8mqevk: new
 defconfig
In-Reply-To: <CAPP7BN2uRzk-8z-NTNpPe3uiEGUxU6ooKP2gDu0eQQ5eRGtebg@mail.gmail.com>
References: <1520682702-10035-1-git-send-email-karl.erik.larsson@gmail.com>
 <1520682702-10035-5-git-send-email-karl.erik.larsson@gmail.com>
 <20180409224224.7ba2379a@windsurf>
 <CAPP7BN2uRzk-8z-NTNpPe3uiEGUxU6ooKP2gDu0eQQ5eRGtebg@mail.gmail.com>
Message-ID: <20180410232629.1951a7e9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 Apr 2018 19:31:51 +0200, Erik Larsson wrote:

> > Also, could you split the i.MX8 stuff from the support of the i.MX8 EVK board itself ?
> >
> > I.e adding the genimage.cfg file, and adding imx8-bootloader.prepare.sh
> > should be one patch, and then adding the i.MX8 EVK defconfig and
> > readme.txt should be another patch.
> >
> > Could you rework the last two patches according to those comments ?  
> 
> I've started to rework this and have something that at least works.
> I've moved the generation of imx-boot-imx8mqevk-sd.bin to a separate
> prepare script and tried to separate what is iMX8 general and what is
> imx8mqevk specific in that script. So the gen_imx8_boot() function can
> be removed from post-script.sh. I still need to keep the selection of
> genimage.cfg.template in post-script.sh but instead of checking for
> IMX8M it can check if it's a IMX8 platform. Is it something like that
> you hade in mind?

How are you going to check if it's an IMX8 platform ? For me, the test
on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M to decide which genimage
file to use was fine. What I wanted is:

 (1) Split in different commits the introduction of i.MX8 support and
     the addition of the i.MX8 EVK support. A first commit should
     change the post-image.sh script to add i.MX8 stuff, and separate
     commit should add the defconfig and board/ stuff related to the
     i.MX8 EVK board.

 (2) Split the i.MX8 specific bootloader preparation logic outside of
     the common post-image into a separate script called as a
     post-image script.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
