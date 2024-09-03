Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66363CD342E
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 13:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B55BE4042E;
	Tue,  3 Sep 2024 13:10:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vC8nzffJ7ypB; Tue,  3 Sep 2024 13:10:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F14F403EC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F14F403EC;
	Tue,  3 Sep 2024 13:10:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 559121BF4E4
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 13:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50213405A9
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 13:10:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x6Bx-q1KdAYk for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 13:10:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0E54F40399
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E54F40399
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E54F40399
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 13:10:26 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.113.24]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MIMbO-1sopKq27PQ-002KSp; Tue, 03
 Sep 2024 15:10:20 +0200
Message-ID: <98537c50-9e0c-4bee-97af-4e4815c310e4@gmx.de>
Date: Tue, 3 Sep 2024 15:10:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Niklas Cassel <Niklas.Cassel@wdc.com>
References: <20240831190126.366600-1-fiona.klute@gmx.de>
 <20240831190126.366600-4-fiona.klute@gmx.de> <ZtbuP9we0h8B9YE0@ryzen.lan>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 xsFNBFrLsicBEADA7Px5KipL9zM7AVkZ6/U4QaWQyxhqim6MX88TxZ6KnqFiTSmevecEWbls
 ppqPES8FiSl+M00Xe5icsLsi4mkBujgbuSDiugjNyqeOH5iqtg69xTd/r5DRMqt0K93GzmIj
 7ipWA+fomAMyX9FK3cHLBgoSLeb+Qj28W1cH94NGmpKtBxCkKfT+mjWvYUEwVdviMymdCAJj
 Iabr/QJ3KVZ7UPWr29IJ9Dv+SwW7VRjhXVQ5IwSBMDaTnzDOUILTxnHptB9ojn7t6bFhub9w
 xWXJQCsNkp+nUDESRwBeNLm4G5D3NFYVTg4qOQYLI/k/H1N3NEgaDuZ81NfhQJTIFVx+h0eT
 pjuQ4vATShJWea6N7ilLlyw7K81uuQoFB6VcG5hlAQWMejuHI4UBb+35r7fIFsy95ZwjxKqE
 QVS8P7lBKoihXpjcxRZiynx/Gm2nXm9ZmY3fG0fuLp9PQK9SpM9gQr/nbqguBoRoiBzONM9H
 pnxibwqgskVKzunZOXZeqyPNTC63wYcQXhidWxB9s+pBHP9FR+qht//8ivI29aTukrj3WWSU
 Q2S9ejpSyELLhPT9/gbeDzP0dYdSBiQjfd5AYHcMYQ0fSG9Tb1GyMsvh4OhTY7QwDz+1zT3x
 EzB0I1wpKu6m20C7nriWnJTCwXE6XMX7xViv6h8ev+uUHLoMEwARAQABzSBGaW9uYSBLbHV0
 ZSA8ZmlvbmEua2x1dGVAZ214LmRlPsLBlAQTAQgAPgIbIwULCQgHAwUVCgkICwUWAgMBAAIe
 AQIXgBYhBOTTE4/i2fL6gVL9ke6nJs4hI1pYBQJkNTaZBQkNK+tyAAoJEO6nJs4hI1pY3qwQ
 AKdoJJHZpRu+C0hd10k6bcn5dr8ibqgsMHBJtFJuGylEsgF9ipWz1rMDWDbGVrL1jXywfwpR
 WSeFzCleJq4D0hZ5n+u+zb3Gy8fj/o3K/bXriam9kR4GfMVUATG5m9lBudrrWAdI1qlWxnmP
 WUvRSlAlA++de7mw15guDiYlIl0QvWWFgY+vf0lR2bQirmra645CDlnkrEVJ3K/UZGB0Yx67
 DfIGQswEQhnKlyv0t2VAXj96MeYmz5a7WxHqw+/8+ppuT6hfNnO6p8dUCJGx7sGGN0hcO0jN
 kDmX7NvGTEpGAbSQuN2YxtjYppKQYF/macmcwm6q17QzXyoQahhevntklUsXH9VWX3Q7mIli
 jMivx6gEa5s9PsXSYkh9e6LhRIAUpnlqGtedpozaAdfzUWPz2qkMSdaRwvsQ27z5oFZ0dCOV
 Od39G1/bWlY+104Dt7zECn3NBewzJvhHAqmAoIRKbYqRGkwTTAVNzAgx+u72PoO5/SaOrTqd
 PIsW5+d/qlrQ49LwwxG8YYdynNZfqlgc90jls+n+l3tf35OQiehVYvXFqbY7RffUk39JtjwC
 MfKqZgBTjNAHYgb+dSa7oWI8q6l26hdjtqZG+OmOZEQIZp+qLNnb0j781S59NhEVBYwZAujL
 hLJgYGgcQ/06orkrVJl7DICPoCU/bLUO8dbfzsFNBGQ1Nr0BEADTlcWyLC5GoRfQoYsgyPgO
 Z4ANz31xoQf4IU4i24b9oC7BBFDE+WzfsK5hNUqLADeSJo5cdTCXw5Vw3eSSBSoDP0Q9OUdi
 PNEbbblZ/tSaLadCm4pyh1e+/lHI4j2TjKmIO4vw0K59Kmyv44mW38KJkLmGuZDg5fHQrA9G
 4oZLnBUBhBQkPQvcbwImzWWuyGA+jDEoE2ncmpWnMHoc4Lzpn1zxGNQlDVRUNnRCwkeclm55
 Dz4juffDWqWcC2NrY5KkjZ1+UtPjWMzRKlmItYlHF1vMqdWAskA6QOJNE//8TGsBGAPrwD7G
 cv4RIesk3Vl2IClyZWgJ67pOKbLhu/jz5x6wshFhB0yleOp94I/MY8OmbgdyVpnO7F5vqzb1
 LRmfSPHu0D8zwDQyg3WhUHVaKQ54TOmZ0Sjl0cTJRZMyOmwRZUEawel6ITgO+QQS147IE7uh
 Wa6IdWKNQ+LGLocAlTAi5VpMv+ne15JUsMQrHTd03OySOqtEstZz2FQV5jSS1JHivAmfH0xG
 fwxY6aWLK2PIFgyQkdwWJHIaacj0Vg6Kc1/IWIrM0m3yKQLJEaL5WsCv7BRfEtd5SEkl9wDI
 pExHHdTplCI9qoCmiQPYaZM5uPuirA5taUCJEmW9moVszl6nCdBesG2rgH5mvgPCMAwsPOz9
 7n+uBiMk0ZSyTQARAQABwsF8BBgBCAAmFiEE5NMTj+LZ8vqBUv2R7qcmziEjWlgFAmQ1Nr0C
 GwwFCQPCZwAACgkQ7qcmziEjWlgY/w//Y4TYQCWQ5eWuIbGCekeXFy8dSuP+lhhvDRpOCqKt
 Wd9ywr4j6rhxdS7FIcaSLZa6IKrpypcURLXRG++bfqm9K+0HDnDHEVpaVOn7SfLaPUZLD288
 y8rOce3+iW3x50qtC7KCS+7mFaWN+2hrAFkLSkHWIywiNfkys0QQ+4pZxKovIORun+HtsZFr
 pBfZzHtXx1K9KsPq9qVjRbKdCQliRvAukIeTXxajOKHloi8yJosVMBWoIloXALjwCJPR1pBK
 E9lDhI5F5y0YEd1E8Hamjsj35yS44zCd/NMnYUMUm+3IGvX1GT23si0H9wI/e4p3iNU7n0MM
 r9aISP5j5U+qUz+HRrLLJR7pGut/kprDe2r3b00/nttlWyuRSm+8+4+pErj8l7moAMNtKbIX
 RQTOT31dfRQRDQM2E35nXMh0Muw2uUJrldrBBPwjK2YQKklpTPTomxPAnYRY8LVVCwwPy8Xx
 MCTaUC2HWAAsiG90beT7JkkKKgMLS9DxmX9BN5Cm18Azckexy+vMg79LCcfw/gocQ4+lQn4/
 3BjqSuHfj+dXG+qcQ9pgB5+4/812hHog78dKT2r8l3ax3mHZCDTAC9Ks3LQU9/pMBm6K6nnL
 a4ASpGZSg2zLGIT0gnzi5h8EcIu9J1BFq6zRPZIjxBlhswF6J0BXjlDVe/3JzmeTTts=
In-Reply-To: <ZtbuP9we0h8B9YE0@ryzen.lan>
X-Provags-ID: V03:K1:6VZftK46eolg6Pzfqv+moDJx5jLxYvey/qsp8BdC5IgZEqR9/WQ
 lMyvh3TnqabWV+d3YP5TiwVy11JxO5jKPNksQvaKc8elncXRQ6BZ1N8Dm9KsHwTzT5xafhY
 lZgn/YIY0zzTFiVGG67ctWoBawqWO0vHIwqwS1NS4NamPmcujlYLPhGfLQgc3rY7JO/7TyC
 VlP1VtYta9u3HCiaHf6mg==
UI-OutboundReport: notjunk:1;M01:P0:n0n+jUs3P1c=;OjXlC8dsTFQIVlU82J5o2zQlPa2
 x69c/f/SPETmLnxdb0n+cP4CVnQReEdmE7H5aBGnGYbcq2V1temPjnn8IzDvvYFNFN4qurgyj
 7VoOOkUDyrrpugzId3CVlAWyP6kgoguda9Zbkwpo0R4WDVNi11qfBkE1T/kxAufUq+kO7bX/4
 oagkC9Et33uU1OELHfaSzxNpq6p4RUCq29a24BjmKg+/x/WX2nE6TKYAhblaX9n06JmXi27Nc
 rMya6rmLrETkJKiiVLq+klQip8ANKgSyAxUXPLszMklERDK7506cazCqRRmzn/KyDs+4l9gLp
 4Ng/kbw0TGrDLIbL2zlcsoMtWjHI00y+NAx31r64icR0FpwwP3KRW4Q+h3zs4xWsFUhYOAB29
 j+vL3DITSQU7Scg8s66jM8MX9Ghcj75Xf1u3/cuPYD4U65hzGYPe2iFyvHV3cne9hTScjgaFL
 BDDmJhCcEYkTbKqKCNQMOPhEahnR/8m83+rUkBTbiHj1YGw/tzIVy9vcAuwOeD0A9yUQU9pv3
 jdmEFc64r/sjysMFx2a2RjYAjK64OpFfC7rw01vBT3P2A8Fic5IRCIyee8Urtv2zuDA/wH7fZ
 PZXR71HNPTaoPjNXKDONkgz1ePVU5/A2fCheOktJ9modGn2Z5CS/sLXkGGugnOK2AdskMgi6g
 aS/LX8Zrq+WQciHG7ASJknBtQ2E3Bo4iRNonPxOsydBuyXI2TKMIEFo+R4fjgfbaHSgeq2IoH
 jheEIHe+bH8IkLy/96eTIRwA4VUCW4IMRR12ubTLXGhGaAeuw1KKbf6I50C6x2J9i2bPCi6+n
 efbA+giybTdpcCb/Xw5TGAPQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1725369020; x=1725973820; i=fiona.klute@gmx.de;
 bh=Pozaaq2P6H+BA1ezj7jon7p2WfqDsVAtW8kMDZYDBqg=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=eS8Ng8ufmLNsvCYroQJEd8C4IQKHk+ql3L6LlsuQ7QnRZdDst+x0V9BBjCchUHgq
 dWBieXu1Gmc+t3ieovgRU2MHkJD/m7OnOmFv/O1Gkx6g7c8jKW3h4xqg6FbmIQ4mD
 /sLYZvmK8K0JqltkOYxt8V6IHnfD1gDnyro0U3PstupuXfVGFJS+9nu4aTLCXSrnS
 8xqgzPphTmmkegMoRkCifMistVgTL1LpgkyeZ8M5sAhvWYxpStPhj40Lwychw1+my
 9WLfSwYXm0Tu7V+wdgjwpjLAa6VcE74S6yhj7qpQp9DoGDeZrCl/9oWjS0Vl2h+DY
 mwLtGulHEkAC9VA54w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=eS8Ng8uf
Subject: Re: [Buildroot] [PATCH next v2 3/3]
 configs/raspberrypicm4io_64_uboot_defconfig: new defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 =?UTF-8?Q?Jos=C3=A9_Mendes?= <jp.baltazar.mendes@gmail.com>,
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 03.09.24 um 13:08 schrieb Niklas Cassel:
> On Sat, Aug 31, 2024 at 09:01:26PM +0200, Fiona Klute via buildroot wrote:
>> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
>>
>> The new config deviates from the existing
>> configs/raspberrypicm4io_64_defconfig only as far as necessary to
>> demonstrate booting through U-Boot instead of having the firmware load
>> the kernel directly. The sample boot script loads the kernel from the
>> rootfs and uses the device tree provided by the firmware.
>>
>> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
>> ---
>> The config I'm usually using is a bit different, including using a
>> mainline kernel (which seems strongly preferable to me), but for
>> defconfig maintenance staying close to the other RPi defconfigs is
>> probably easiest.
>>
>>   board/raspberrypi/boot.scr.in                 |  9 +++
>>   .../raspberrypi/config_cm4io_64bit_uboot.txt  | 23 +++++++
>>   board/raspberrypi/readme.txt                  |  4 ++
>>   configs/raspberrypicm4io_64_uboot_defconfig   | 60 +++++++++++++++++++
>>   4 files changed, 96 insertions(+)
>>   create mode 100644 board/raspberrypi/boot.scr.in
>>   create mode 100644 board/raspberrypi/config_cm4io_64bit_uboot.txt
>>   create mode 100644 configs/raspberrypicm4io_64_uboot_defconfig
>>
>> diff --git a/board/raspberrypi/boot.scr.in b/board/raspberrypi/boot.scr.in
>> new file mode 100644
>> index 0000000000..a5c986ef99
>> --- /dev/null
>> +++ b/board/raspberrypi/boot.scr.in
>> @@ -0,0 +1,9 @@
>> +# Please note that this is only a sample, we recommend you to change
>> +# it to fit your needs. You should override this file using
>> +# BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE.
>> +
>> +# load kernel from the root partition
>> +load mmc 0:2 ${kernel_addr_r} boot/Image
>> +env set bootargs "root=/dev/mmcblk0p2 rootwait console=tty1 console=ttyAMA0,115200"
>> +# boot using the FDT provided by firmware
>> +booti ${kernel_addr_r} - ${fdt_addr}
>
> Hello Fiona,
>
> While I'm not a u-boot expert, I am slightly surprised to see a new
> buildroot defconfig use boot.scr instead of extlinux.conf.
>
> extlinux.conf is the default configuration format in u-boot:
> https://github.com/u-boot/u-boot/blob/v2024.10-rc4/doc/develop/distro.rst?plain=1#L69-L71
>
> Even though boot.scr still seems to be supported for backwards-compatibility:
> https://github.com/u-boot/u-boot/blob/v2024.10-rc4/doc/develop/distro.rst?plain=1#L367-L368
>
> See e.g. this buildroot commit that converted rock5b from boot.scr to
> extlinux.conf:
> https://github.com/buildroot/buildroot/commit/b7dbdd3d775b8e94664c6f37b11afc8a6a352e35
>
> I don't see anthing exotic in your boot.scr that wouldn't work with
> extlinux.conf.

Hi Niklas!

Someone who just wants to load a certain kernel will probably stick with
the non-U-Boot variant (raspberrypicm4io_64_defconfig) anyway. ;-) The
point of this defconfig is to be a minimal example that shows the moving
parts for booting an RPi aarch64 device with U-Boot (including a boot
script), so someone who needs the additional flexibility can use it as a
starting point to implement whatever it is they need.

AFAIK things like configuring watchdogs and handling A/B boot slot
selection (with RAUC integration) aren't possible with extlinux.conf,
and a menu isn't going to be much help in a headless system. If there is
a better way than boot.scr to handle those I'd very much like to read
about it.

If there is a way to combine a boot script with extlinux.conf (e.g. set
up a watchdog in the script and set the kernel in extlinux.conf) that
might be interesting and a good addition to this defconfig, too, but I
haven't looked into whether that's possible, and if yes, how.

> Although I am I but confused why you set:
> BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-cm4"
> but then you do not use this device tree, but rather some
> device tree provided by firmware.
>
> What is the point of setting BR2_LINUX_KERNEL_INTREE_DTS_NAME if you
> are not using this device tree?
>
> I would strongly suggest to use the device tree that comes with the
> kernel version that you are using, as the changes to the device tree
> (to enable support for additional hardware in an existing SoC) might
> often look different once upstreamed (compared to the downstream device
> tree).

That's an oddity of the RPi boot process: The firmware bootloader
expects to find a DTB in the boot partition. By default it'll try
certain names based on the device type, though you can override it in
config.txt. That's why the DTB needs to be built and installed to the
boot partition, but doesn't show up in the U-Boot config.

So what happens with the DT on boot with this defconfig:

1. Firmware loads bcm2711-rpi-cm4.dtb and sets per-device values (e.g.
serial number)
2. Firmware adds overlays if configured to do so (in config.txt)
3. Firmware starts U-Boot, and provides it with the prepared FDT
(flattened device tree)
4. U-Boot uses the FDT for its own setup, this makes it possible to have
a U-Boot build that works on all aarch64 RPi devices, including those
which don't have a dedicated defconfig (like CM4) [1]
5. U-Boot runs the boot script, which tells it to load and boot the
kernel, and provide it with the same FDT U-Boot uses

So the kernel actually gets the DT that was built with it (possibly with
overlays added), just via the firmware. :-)

Sure, you might want to be able to update the DT used for U-Boot
separately from that for the kernel, or separately for different kernel
versions. U-Boot will fill in the per-device values from the FDT
provided by the firmware if you have it load a different DTB.

There's an RPi-specific catch though: The RPi bootloader supports
overlay *parameters*, U-Boot and Linux [2] do not, and overlays with
parameters (like most of those provided by rpi-firmware) will fail to
load. If you need overlays with parameters, you have to load the DT via
the firmware. Or you can rewrite them with the parameter values folded
in, and add them to your build (I've actually done that).

I think that's a bit beyond a simple example, though. If the maintainers
disagree I could add another snippet from my setup to create a FIT image
that includes a DTB to be used by the kernel. Or maybe a comment/readme
section that points out the options a bit more explicitly than just "we
recommend you to change it to fit your needs".

Best regards,
Fiona

[1] https://docs.u-boot.org/en/latest/board/broadcom/raspberrypi.html
[2] I haven't checked if that may be patched in RPi kernels, I mostly
work with mainline, I just use an RPi kernel here to stay close to the
existing RPi defconfigs.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
