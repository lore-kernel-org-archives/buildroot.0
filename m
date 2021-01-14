From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Thu, 14 Jan 2021 18:26:15 +0100
Subject: [Buildroot] Support for BCM953012HR board?
In-Reply-To: <CAGF7ZoaOOw11phUqWcn0YsygywLOiFGE_6Oo=zFWBTw9-nrqkA@mail.gmail.com>
References: <1610587332564-0.post@n4.nabble.com>
 <CACna6rzFC7jbmSasCMfRPsCaqjmHgDexBL8VvvCx_Mq7TPjaqQ@mail.gmail.com>
 <CAGF7ZoaOOw11phUqWcn0YsygywLOiFGE_6Oo=zFWBTw9-nrqkA@mail.gmail.com>
Message-ID: <CACna6rwf6riTvyWW1EnSD-AOb=kt1nLE9KfujESeGzohx_WPTA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 14 Jan 2021 at 18:17, scd rjcom <scdrjcom@gmail.com> wrote:
> On Thu, Jan 14, 2021 at 5:54 AM Rafa? Mi?ecki <zajec5@gmail.com> wrote:
>> On Thu, 14 Jan 2021 at 02:22, scdrj <scdrjcom@gmail.com> wrote:
>> > How do I build the images for BCM953012HR (Broadcom Northstar Reference
>> > board)?
>>
>> I took care of adding upstream Linux support for a few Northstar hw
>> components. Current support is quite complete except for:
>> 1. Hardware NAT acceleration
>> 2. Broadcom SoftMAC wireless chipsets
>>
>> I planned to add buildroot support for Northstar boards but it takes
>> many months to get my patches reviewed.
>>
>> My initial WiFi firmware patch was accepted after 5 months:
>> [PATCH] package/linux-firmware: add options for Broadcom BCM4366
>> Currently I'm waiting for lzma-alone decision:
>> [PATCH] package/lzma-alone: new package
>>
>> Once I get lzma-alone somehow merged I'm planning to add Northstar
>> boards support.
>>
>> Until that you can check OpenWrt project. It has target called
>> "bcm53xx" that handles Northstar devices. There are only few
>> downstream patches needed to get those devices running:
>> https://git.openwrt.org/?p=openwrt/openwrt.git;a=tree;f=target/linux/bcm53xx/patches-5.4;hb=HEAD
>>
>> --
>> Rafa?
>
>
> Thanks for your valuable suggestion. I have checked the targets supported by openwrt for Northstar processors. It provides kernel and rootfs builds for Northstar based boards. (tried MR32)
> I am unable to find the u-boot build for the Northstar based SoCs. How do I enable the u-boot build as well for any of these boards?

I've never seen Northstar device using u-boot. I heard about some
rough plans for porting u-boot to it, but I thought they got abonded.

Can you provide bootloader log from your board?


> It would be great to see the support for Northstar boards in the buildroot as well.

-- 
Rafa?
