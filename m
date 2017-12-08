From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Dec 2017 13:46:23 +0100
Subject: [Buildroot] [PATCH 4/8] uboot: add support for bundling ATF
 BL31 into U-Boot
In-Reply-To: <87vahhz982.fsf@dell.be.48ers.dk>
References: <20171203214811.3124-1-thomas.petazzoni@free-electrons.com>
 <20171203214811.3124-5-thomas.petazzoni@free-electrons.com>
 <87vahhz982.fsf@dell.be.48ers.dk>
Message-ID: <20171208134623.47f95e6f@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 08 Dec 2017 13:37:33 +0100, Peter Korsgaard wrote:

>  > +config BR2_TARGET_UBOOT_NEEDS_ATF_BL31
>  > +	bool "U-Boot needs ATF BL31"
>  > +	depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31  
> 
> The fact that you need to enable this atf suboption before this option
> is even visible isn't very nice. We also need to ensure this option
> cannot be selected together with
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33 as that would cause
> circular dependencies, so I've changed it to:
> 
> 	depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE
> 	depend on !BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33
> 	select BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31
> 
> And committed, thanks.

Seems OK to me. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
