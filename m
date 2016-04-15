From: Julien Boibessot <julien.boibessot@free.fr>
Date: Fri, 15 Apr 2016 17:45:37 +0200
Subject: [Buildroot] [PATCH] configs: add Armadeus Systems APF6 SOM
 basic support
In-Reply-To: <20160415171741.0f2f29cc@free-electrons.com>
References: <1460641197-12610-1-git-send-email-julien.boibessot@free.fr>	<20160415095435.7ac98177@free-electrons.com>	<5710FB65.6080403@free.fr>
 <20160415171741.0f2f29cc@free-electrons.com>
Message-ID: <57110CA1.3050101@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On 15/04/2016 17:17, Thomas Petazzoni wrote:
> Hello,
>
> On Fri, 15 Apr 2016 16:32:05 +0200, Julien Boibessot wrote:
>
>>> Is it expected that you're not building any bootloader here?
>> yes. it doesn't work for the moment with latest BR.
> It works with an older Buildroot? What is the problem you encounter?

cf my previous RFC/PATCH commented by Arnout yesterday evening
(https://patchwork.ozlabs.org/patch/610481/):
we need to download patches to build U-Boot and BR dl infra complains
about missing hash.

>
>>> Also, this needs a readme.txt to explain how to use this defconfig. If
>>> you're putting off SD card, then please use genimage to generate a
>>> complete SD card image. If you're booting out of NAND, please include
>>> instructions on how to flash the resulting system.
>> Yes you're right I was a little short on comments.
>> APF6 has an onboard eMMC, so no need for genimage to build basic rootfs.
> Hm, isn't genimage capable of building a complete image for an eMMC ?

Well for me no. eMMC are physically partionned and I don't think you can
flash a big file with everything inside.
I don't remember with who I had this discussion during BRDD on February :-)
Internally we use genimage to build a kernel+rootfs image for "user
dat"a partition of our eMMC but it's only for factory purpose and I'm
not sure I have to complicate the defconfig for something no one uses.
Should I ?
(http://www.armadeus.com/wiki/index.php?title=EMMC)

>
> In any case, you should include a readme.txt that documents how to
> flash the resulting system on the board.

yeap that's the goal of the patch I sent this afternoon:
https://patchwork.ozlabs.org/patch/610964/
Once accepted, I will update it in next version on my APF6 patch.

Thanks !

Regards,
Julien

>
>>> But does it make sense to have a defconfig for a SOM ? A SOM as-is
>>> generally can't be booted, it needs to be put on some base-board,
>>> right ?
>> Nop, of course support includes development boards and it will be more
>> explicit in my next patch.
> Thanks.
>
> Thomas
