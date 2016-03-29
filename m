From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 00:11:29 +0200
Subject: [Buildroot] [PATCH] linux: Introduce DTB's bootargs fixup
 feature
In-Reply-To: <CALszF6CqGMakciwieEsxXnBDPN=bhq_2KsLcQSwv-NwW-2Y0mQ@mail.gmail.com>
References: <1458558329-19210-1-git-send-email-mcoquelin.stm32@gmail.com>
 <20160321131206.1d3b29c7@free-electrons.com>
 <CALszF6CqGMakciwieEsxXnBDPN=bhq_2KsLcQSwv-NwW-2Y0mQ@mail.gmail.com>
Message-ID: <20160330001129.656b6151@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 Mar 2016 13:53:50 +0100, Maxime Coquelin wrote:

> > However, I am not entirely sure this is something we want to take in
> > Buildroot. Indeed, your patch only allows to customize
> > the /chosen/bootargs property, and not any other property of the Device
> > Tree. If we want to do that via Config.in options, it suddenly becomes
> > a lot more complicated.
> Indeed, it will be difficult to extend it further than bootargs.
> It works well for bootargs for two reasons:
>  1- It is a generic property
>  2- It is a string
> 
> There could be other uses for DTB patching, such as MAC address assignment.
> But I agree than doing this in Config.in makes no sense.

Right.

> > It is IMO even more important to do it this way since as of today, only
> > one platform/board needs to adjust its bootargs this way. All other
> > platforms have an ATAGs or DT compatible bootloader, where the bootargs
> > customization is done via the bootloader, not via patching the DTB.
> 
> Ok, For sure it can be done, but I wanted to propose a generic way of
> doing this.
> Indeed, this is something other platforms could potentially use, even
> if not the case today.
> 
> > Of course, let's see what others think.
> 
> Agree.
> If it is decided to do this as post-image script, I will be happy to
> implement it.

Nobody spoke up, so let's say we'll do it in a post-image script for
now. host-dtc is already visible in menuconfig, so it can be enabled in
a defconfig, and therefore it's just a matter of enabling it and write
the appropriate post-image script.

Do you want to write a patch on top of my series adding Cortex-M
support?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
