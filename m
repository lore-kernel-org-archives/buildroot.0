Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 575FBCD4847
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 18:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02995400D6;
	Wed,  4 Sep 2024 18:52:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3pOne3DSo8Ln; Wed,  4 Sep 2024 18:52:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A92FA40227
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A92FA40227;
	Wed,  4 Sep 2024 18:52:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8C26C1BF47F
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 18:52:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79AEB60882
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 18:52:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vVFmbDNp3Lu2 for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 18:52:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 82F1E606A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82F1E606A0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 82F1E606A0
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 18:52:19 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.126.159]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MqJmF-1sHnQX0wS3-00hTSZ; Wed, 04
 Sep 2024 20:52:10 +0200
Message-ID: <46bee1b0-2722-40d0-ab20-51fe5d1e1935@gmx.de>
Date: Wed, 4 Sep 2024 20:52:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Niklas Cassel <Niklas.Cassel@wdc.com>
References: <20240831190126.366600-1-fiona.klute@gmx.de>
 <20240831190126.366600-4-fiona.klute@gmx.de> <ZtbuP9we0h8B9YE0@ryzen.lan>
 <98537c50-9e0c-4bee-97af-4e4815c310e4@gmx.de> <ZtcPGjS9gktPuNNK@ryzen.lan>
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
In-Reply-To: <ZtcPGjS9gktPuNNK@ryzen.lan>
X-Provags-ID: V03:K1:J4Ui0dqGArraPAEahjyZ4ldERE2qR2ZMR9as1iIqYBYDuER9ogI
 BiwI25Z5IcPY0akLRxCQcZD4O29LM/MUp1ejYt6DvrqAg2qhwGgL0n3kDiYsqM80sZnnLC/
 xI2Ff9mB2fhSBnS9XxTXyU26o/Brfe1PqUby4qDXuzc7AAy5DY40W+5QwtVTtfb5VyBTDoa
 3jmNTIAy5O7n/arz0A8pQ==
UI-OutboundReport: notjunk:1;M01:P0:QgLz5DMDpY8=;o1U9+xDO/nqGgBZeyKHn0AkwiUK
 CLuj4C5o3ca1YtLEMtk9G49F/a3lzAcDBQZLY3ZotbDodwVCrh8AAc6WuZyqpVF/bPwoPDaYB
 ELzYN45mzf2ygtNIefdHKKf2o1xYNY+H8+NtZDv+t6TyiyIAIqQy/3chIXw/DXXJ9wnw44xMv
 ChBKMG9Vr8fCEyPkEUjZLmrUpZWwBB2VBNgrtkzabJtXYbJBI5HDH21duFwjkRW/yOJqKnEmo
 BoI0+QaLXGCk+BHDjxlMz1c1oq8KgnfjbYxnWSLAKZgmTycM3dR+tixDmm0TCFS48RxWaOF7O
 DfGX8fy3J+pmPyNXQ5dVI3aRI/EN692UxZQ7z/QzoAQzU155LmmMDQ41dR6YwE7b9qaqGxEgW
 8ZwM1aSCyjVmV6slB/Z2Suosa/U68sP0oWkLMqHpVHC4yWYcNhwUiI2V86YZMtR/1Oj9kHLR1
 sm/I3J9Nxoqny0pYQEOssAzrpeHTUzsh0s0KFjJCplBQ9LFc8bD7iKNmNdLf4MW84uiUd/vOa
 QZulDQVat8b01vgizFcAo72oar6CMzznyv7PRg7nOD5XDPFXWhoTQn0kcXPT0LJ+PnliybQVw
 kOvUk1KMVtfO8DMjaosLmHqWEpyTkcU9Sot3bqKXBt7YA7R+NMuXfYNtdmRIIBXWBITjmez9t
 dHErkcqoDGZwXY47HbH3Lwfvupk4Kd/ub6pp58VNpWKo7tbbibSzyQItInqNbly2rtRP0fHOP
 ENbifkS2bG1XwEOmjMQZZ8QR8CQv7BjvttquJqjI+28SOseHWGD/sg8xnFYXoDENzXM4kgw6t
 T4bavWzniQzSoFKUv8/bPbfw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1725475930; x=1726080730; i=fiona.klute@gmx.de;
 bh=3AiFMHhifZc4+7D0076Jb8UPSxL5o++010LAHiBrHFU=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=SbZvy3xWHZP3+8wKp08xSMUIt1n8h1KuWA8aAh4t43XvWYJ8p7UkvI8uaqqP4V8Y
 OMSf9FIYEPDb3dTJ96DyJcUyerJsG46JzE2MXg/N/oUviFFtWD77VzJy0zUAb1H/4
 BO2GACY9vtuPCqtoWpRAmkCT77va7GUaK0FmOKEcf3BdtaVsJ93F8yIQaht5Lc+U3
 zfHspYpoigHnp33XFcUN3F5EnyqIGouft0U8qH3VIIrEfhLoL/Vg/gWVv7Kmr3Ewf
 sb396TQCi8QVZT4QUjtQVxQMAOaFiZHyeMKBlnj7w+dyt4zCbbk7wcp5Ui9MDepxn
 Y7fhXJV65BKiWUJV8w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=SbZvy3xW
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

Am 03.09.24 um 15:29 schrieb Niklas Cassel:
> On Tue, Sep 03, 2024 at 03:10:19PM +0200, Fiona Klute wrote:
>> Am 03.09.24 um 13:08 schrieb Niklas Cassel:
>>> On Sat, Aug 31, 2024 at 09:01:26PM +0200, Fiona Klute via buildroot wrote:
>>>> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
>>>>
>>>> The new config deviates from the existing
>>>> configs/raspberrypicm4io_64_defconfig only as far as necessary to
>>>> demonstrate booting through U-Boot instead of having the firmware load
>>>> the kernel directly. The sample boot script loads the kernel from the
>>>> rootfs and uses the device tree provided by the firmware.
>>>>
>>>> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
>>>> ---
>>>> The config I'm usually using is a bit different, including using a
>>>> mainline kernel (which seems strongly preferable to me), but for
>>>> defconfig maintenance staying close to the other RPi defconfigs is
>>>> probably easiest.
>>>>
>>>>    board/raspberrypi/boot.scr.in                 |  9 +++
>>>>    .../raspberrypi/config_cm4io_64bit_uboot.txt  | 23 +++++++
>>>>    board/raspberrypi/readme.txt                  |  4 ++
>>>>    configs/raspberrypicm4io_64_uboot_defconfig   | 60 +++++++++++++++++++
>>>>    4 files changed, 96 insertions(+)
>>>>    create mode 100644 board/raspberrypi/boot.scr.in
>>>>    create mode 100644 board/raspberrypi/config_cm4io_64bit_uboot.txt
>>>>    create mode 100644 configs/raspberrypicm4io_64_uboot_defconfig
>>>>
>>>> diff --git a/board/raspberrypi/boot.scr.in b/board/raspberrypi/boot.scr.in
>>>> new file mode 100644
>>>> index 0000000000..a5c986ef99
>>>> --- /dev/null
>>>> +++ b/board/raspberrypi/boot.scr.in
>>>> @@ -0,0 +1,9 @@
>>>> +# Please note that this is only a sample, we recommend you to change
>>>> +# it to fit your needs. You should override this file using
>>>> +# BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE.
>>>> +
>>>> +# load kernel from the root partition
>>>> +load mmc 0:2 ${kernel_addr_r} boot/Image
>>>> +env set bootargs "root=/dev/mmcblk0p2 rootwait console=tty1 console=ttyAMA0,115200"
>>>> +# boot using the FDT provided by firmware
>>>> +booti ${kernel_addr_r} - ${fdt_addr}
>>>
>>> Hello Fiona,
>>>
>>> While I'm not a u-boot expert, I am slightly surprised to see a new
>>> buildroot defconfig use boot.scr instead of extlinux.conf.
>>>
>>> extlinux.conf is the default configuration format in u-boot:
>>> https://github.com/u-boot/u-boot/blob/v2024.10-rc4/doc/develop/distro.rst?plain=1#L69-L71
>>>
>>> Even though boot.scr still seems to be supported for backwards-compatibility:
>>> https://github.com/u-boot/u-boot/blob/v2024.10-rc4/doc/develop/distro.rst?plain=1#L367-L368
>>>
>>> See e.g. this buildroot commit that converted rock5b from boot.scr to
>>> extlinux.conf:
>>> https://github.com/buildroot/buildroot/commit/b7dbdd3d775b8e94664c6f37b11afc8a6a352e35
>>>
>>> I don't see anthing exotic in your boot.scr that wouldn't work with
>>> extlinux.conf.
>>
>> AFAIK things like configuring watchdogs and handling A/B boot slot
>> selection (with RAUC integration) aren't possible with extlinux.conf,
>> and a menu isn't going to be much help in a headless system. If there is
>> a better way than boot.scr to handle those I'd very much like to read
>> about it.
>
> My point was just that the boot.scr.in that you have above could easily be
> replaced by a extlinux.conf instead.

I checked the extlinux.conf docs since, and it actually can't be,
because the kernel isn't loaded from the boot partition.

> I hear your argument that certain features (like watchdog an A/B boot slot)
> is not possible with extlinux.conf.
>
> But if you want your example to be minimal... isn't extlinux.conf enough/
> exactly what you want? (extlinux.conf is definitely simpler for a beginner
> to understand, compared to a boot.scr or a .its file.)
>
> Your comment in boot.scr.in itself says that if you want something more fancy,
> you should provide your own config.

My primary goal is to make it easy to find the starting point for that. ;-)

> Anyway, I'm just providing a suggestion. Feel free to ignore :)
>
> Another suggestion is for your new defconfig to use the upstream kernel
> instead of the downstream kernel. A person running u-boot has already taken
> the step to use the "upstream" way of booting. It is far more likely that
> such a person also wants to use the upstream kernel (rather than the
> downstream kernel).
I agree, there are two reasons I didn't try that here:

a) This way it's almost the same as the other RPi defconfigs, makes it
easier to see what needs to be changed for U-Boot.

b) I don't have a working setup with U-Boot using DTBs from an
unmodified mainline kernel.

I'm working on b), though for a specific CM4-based system (RevPi Connect
4 [1]), not the IO-Board. U-Boot doesn't boot with the mainline
broadcom/bcm2711-rpi-cm4-io DTB, and I currently have a custom DTS based
on it (for the different hardware around the CM4), plus a custom overlay
for U-Boot because it fails to boot if the serial console isn't on UART0
(and most rpi-firmware overlays don't work with the upstream DTBs). If
one of the patch series to build extra overlays gets merged I might see
if adding that overlay is enough to switch this defconfig to mainline,
showing how to use a mainline kernel seems useful enough to justify
deviating from the other RPi defconfigs.

Or once I get the DTS I'm working on completed and hopefully upstreamed
I might see if a revpi4connect_uboot_defconfig could get merged. :-)

Best regards,
Fiona

[1] https://revolutionpi.com/en/download/7223/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
