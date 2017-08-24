From: Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>
Date: Thu, 24 Aug 2017 17:27:01 -0400 (EDT)
Subject: [Buildroot] [PATCH v3] configs: add defconfig for TS-7680
In-Reply-To: <20170824231804.0d1bc20a@windsurf>
References: <20170824210700.26877-1-julien.grossholtz@savoirfairelinux.com>
 <20170824231804.0d1bc20a@windsurf>
Message-ID: <200148308.340820.1503610021432.JavaMail.zimbra@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

----- Original Message -----
> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: "Julien Grossholtz" <julien.grossholtz@gmail.com>
> Cc: "Julien Grossholtz" <julien.grossholtz@savoirfairelinux.com>, "Mark Featherston" <mark@embeddedarm.com>,
> buildroot at buildroot.org
> Sent: Thursday, August 24, 2017 5:18:04 PM
> Subject: Re: [Buildroot] [PATCH v3] configs: add defconfig for TS-7680

> Hello,
> 
> On Thu, 24 Aug 2017 17:07:00 -0400, Julien Grossholtz wrote:
>> The TS-7680 is an i.MX286 ARM ARM926EJ-S board with 10/100 Ethernet,
>> USB port, eMMC and CAN ports.
>> 
>> The TS-7680 uses a 3.14.28 Linux kernel provided by Technologic Systems:
>> https://github.com/embeddedarm/linux-3.14.28-imx28
>> 
>> U-Boot is not provided as the manufacturer recommends not to update the
>> built-in bootloader.
>> 
>> For more informations please see:
>> https://wiki.embeddedarm.com/wiki/TS-7680
>> 
>> Signed-off-by: Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>
> 
> Thanks for this new version, much better! I've applied to the next
> branch, with just one change (see below).
> 
> 
>> +++ b/configs/ts7680_defconfig
>> @@ -0,0 +1,19 @@
>> +BR2_arm=y
>> +BR2_KERNEL_HEADERS_VERSION=y
>> +BR2_DEFAULT_KERNEL_VERSION="3.14.28"
> 
> Those two lines were not needed: indeed we prefer to use the option
> "Same as kernel being built" (BR2_KERNEL_HEADERS_AS_KERNEL) when the
> kernel is also built as part of the defconfig. Since
> BR2_KERNEL_HEADERS_AS_KERNEL is the default, it doesn't need to be
> specified in the defconfig.
> 
> One neat side effect is that it will avoid a double download of the
> kernel: with your defconfig, Buildroot was downloading the vanilla
> 3.14.28 for the kernel headers, and then Git cloning the
> vendor-specific kernel tree. With the change I've made, it will use the
> vendor-specific Git tree for the kernel headers as well, avoiding the
> 3.14.28 vanilla kernel download.

This is great, thank you!

> 
> Thanks!
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Julien
