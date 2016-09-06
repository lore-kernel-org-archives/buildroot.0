From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 6 Sep 2016 16:52:33 -0300
Subject: [Buildroot] [PATCH RESEND v2] configs: Add support for warp7
	board
In-Reply-To: <20160906213234.71b8b1ef@free-electrons.com>
References: <1472850510-31135-1-git-send-email-festevam@gmail.com>
 <20160906213234.71b8b1ef@free-electrons.com>
Message-ID: <CAOMZO5BL3=Yt6Y+iaOYJHw7YUJTernsVqkvNjz2z73Nf_=CqcA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Sep 6, 2016 at 4:32 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

>> +Create a bootable SD card
>> +=========================
>
> So here you say that you explain how to create a bootable SD card...

Should be eMMC instead. We can only boot via eMMC on warp7.

>> +sudo dd if=output/images/sdcard.img of=/dev/<your-sd-device>
>
> ... but in fact you explain how to flash the internal eMMC.
>
> I am missing something?
>
>> +*** WARNING! This will destroy all the card content. Use with care! ***
>
> You are again talking about "card".

Will fix it.

>
> Just for my understanding: with this mechanism, you rely on U-Boot to
> provide a mass-storage access to the internal eMMC. So if you reflash a
> non-working U-Boot, you are not able to reflash the system again. Is
> this correct? Is there a recovery process available (booting over SD
> card? something else?).

Yes, we can load u-boot.imx via USB in the case of a non-working U-Boot.

I can explain that process in v2.

> If the image file produced by Buildroot is to be flashed on the eMMC, I
> think naming it sdcard.img is a bit confusing. Maybe emmc.img is a
> better name?

Yes, emmc.img is better.

Thanks for your review.
