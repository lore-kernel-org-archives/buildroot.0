From: Oleksandr G Zhadan <oleks@arcturusnetworks.com>
Date: Mon, 18 Jul 2016 09:43:57 -0400
Subject: [Buildroot] [PATCH] Arcturus uCP1020 BSP support.
In-Reply-To: <20160715193007.6440d7ae@free-electrons.com>
References: <1468595175-6303-1-git-send-email-oleks@arcturusnetworks.com>
 <20160715193007.6440d7ae@free-electrons.com>
Message-ID: <4c5b625f-3a50-2e2d-7273-eca4ea4ac063@arcturusnetworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 07/15/2016 01:30 PM, Thomas Petazzoni wrote:

>> +++ b/board/arcturus/ppc-ucp1020/patches/linux/0001-Arcturus-uCP1020-BSP-support.patch
>> @@ -0,0 +1,469 @@
>> +From c27eeadb6c6cecbc07b330030c494c226643dcd1 Mon Sep 17 00:00:00 2001
>> +From: Oleksandr G Zhadan <arcsupport@arcturusnetworks.com>
>> +Date: Fri, 8 Jul 2016 11:02:59 -0400
>> +Subject: [PATCH] Arcturus uCP1020 BSP support
>> +
>> +The uCP1020 product family (ucp1020) is an Arcturus Networks Inc.
>> +System on Modules product featuring a NXP QorIQ P1020 CPU,
>> +optionally populated with 1 or 2 Gig-Ethernet PHYs,
>> +DDR3, NOR Flash, eMMC NAND Flash and/or SPI Flash.
>> +
>> +Signed-off-by: Oleksandr G Zhadan <arcsupport@arcturusnetworks.com>
>> +Signed-off-by: Michael Durrant <arcsupport@arcturusnetworks.com>
> Has this support been submitted to the upstream Linux kernel?
Not yet. It's in our plans.
>
>
>> ++/**********
>> ++	sdhc at 2e000 {
>> ++		cd-gpios = <&gpio0 8 0>;	* card detect *
>> ++		wp-gpios = <&gpio0 9 0>;	* write protect *
>> ++		wp-inverted;			* WP active high *
>> ++	};
>> ++***********/
> It would be better to not keep commented code in the Device Tree.
Thanks - forgot to remove.
>
>
>> +# U-boot
>> +BR2_TARGET_UBOOT=y
>> +BR2_TARGET_UBOOT_BOARDNAME="UCP1020"
> Please use a specific U-Boot version.
Our u-boot patches already accepted by denx while ago - they always in 
the latest version and we keep supporting it.
BTW, after I run `make savedefconfig` in buildroot it updates 
arcturus_ucp1020_defconfig with only these two lines.
For sure I can add version, but it's not a CUSTOM version.
Please be more specific why I should do it.

> Thanks!
>
> Thomas


-- 
Oleksandr Zhadan
Arcturus Networks
T 416 621-0125 x235
F 416 621-0190
