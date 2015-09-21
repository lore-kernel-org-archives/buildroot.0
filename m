From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 21 Sep 2015 18:19:03 +0200
Subject: [Buildroot] [PATCH] configs: add nitrogen6sx_defconfig for
 Boundary Devices SoloX board
In-Reply-To: <20150919153410.06fe7394@free-electrons.com>
References: <1441965609-4092-1-git-send-email-gary.bisson@boundarydevices.com>
 <20150919153410.06fe7394@free-electrons.com>
Message-ID: <CAAMH-yt8Y3GruOxEvw9op=-00op9pnVA_L0ddwi1XNT3b1qqwA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Sep 19, 2015 at 3:34 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Gary,
>
> On Fri, 11 Sep 2015 12:00:09 +0200, Gary Bisson wrote:
>> This board is using the exact same kernel and u-boot revision as the
>> Nitrogen6x. They also share the same u-boot "autoboot" script.
>>
>> The differences between the two configurations are:
>> - getty port is ttymxc0 instead of ttymxc1
>> - uImage load address is 0x80008000
>
> Do you have a reason to keep using uImage instead of using zImage?
> uImage are now a bit deprecated on ARM, and zImage is the modern way of
> booting the kernel even from U-Boot (using the bootz command).

Legacy I guess. I should look into it but the main advantage I see of
bootm/uImage is the CRC check. What is the story behind the switch to
bootz?

>> I didn't include this patch as part of the Freescale packages update
>> as it is an addition. However this patch depends on the updates to be
>> applied for graphics support and so on.
>> http://lists.busybox.net/pipermail/buildroot/2015-September/139278.html
>
> No problem, I applied them already.
>
>> I wish we could do an include of another defconfig, that'd simplify
>> future config updates as it could look like:
>>
>> include nitrogen6x_defconfig
>> BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
>> BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x80008000"
>> BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sx-nitrogen6sx"
>>
>> That would also be very useful for all the Freescale sabre boards
>> where every config is almost the same apart from uboot configuration
>> or device tree name.
>
> Indeed. We don't have a solution for this in the upstream Buildroot.
> However, people in this situation are encouraged to use the concept of
> "defconfig" fragments, which can be merged together to give the final
> defconfig.

Ok, I'll into the fragments concept.

Thanks,
Gary
