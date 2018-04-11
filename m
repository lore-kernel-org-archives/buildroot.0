From: Erik Larsson <karl.erik.larsson@gmail.com>
Date: Wed, 11 Apr 2018 07:23:27 +0200
Subject: [Buildroot] [PATCH v6 4/4] configs/freescale_imx8mqevk: new
 defconfig
In-Reply-To: <20180410232629.1951a7e9@windsurf>
References: <1520682702-10035-1-git-send-email-karl.erik.larsson@gmail.com>
 <1520682702-10035-5-git-send-email-karl.erik.larsson@gmail.com>
 <20180409224224.7ba2379a@windsurf>
 <CAPP7BN2uRzk-8z-NTNpPe3uiEGUxU6ooKP2gDu0eQQ5eRGtebg@mail.gmail.com>
 <20180410232629.1951a7e9@windsurf>
Message-ID: <CAPP7BN0YSrmF7DPxwg+HrY+8v2t+8vbEZ2K4LPSYaKq_cORNmA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

2018-04-10 23:26 GMT+02:00 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:
> Hello,
>
> On Tue, 10 Apr 2018 19:31:51 +0200, Erik Larsson wrote:
>
>> > Also, could you split the i.MX8 stuff from the support of the i.MX8 EVK board itself ?
>> >
>> > I.e adding the genimage.cfg file, and adding imx8-bootloader.prepare.sh
>> > should be one patch, and then adding the i.MX8 EVK defconfig and
>> > readme.txt should be another patch.
>> >
>> > Could you rework the last two patches according to those comments ?
>>
>> I've started to rework this and have something that at least works.
>> I've moved the generation of imx-boot-imx8mqevk-sd.bin to a separate
>> prepare script and tried to separate what is iMX8 general and what is
>> imx8mqevk specific in that script. So the gen_imx8_boot() function can
>> be removed from post-script.sh. I still need to keep the selection of
>> genimage.cfg.template in post-script.sh but instead of checking for
>> IMX8M it can check if it's a IMX8 platform. Is it something like that
>> you hade in mind?
>
> How are you going to check if it's an IMX8 platform ? For me, the test
> on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M to decide which genimage
> file to use was fine. What I wanted is:

Okay, maybe I over complicated it a bit then. I used
BR2_PACKAGE_FREESCALE_IMX_PLATFORM to check if it's equal to "IMX8"
when selecting genimage file to use. But if you are okay with
BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M then I think it will be much
more clearer. I'll look this over one more time.

>
>  (1) Split in different commits the introduction of i.MX8 support and
>      the addition of the i.MX8 EVK support. A first commit should
>      change the post-image.sh script to add i.MX8 stuff, and separate
>      commit should add the defconfig and board/ stuff related to the
>      i.MX8 EVK board.
>
>  (2) Split the i.MX8 specific bootloader preparation logic outside of
>      the common post-image into a separate script called as a
>      post-image script.

Okay, thanks!

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com

Best regards,
Erik
