From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Thu, 10 Jun 2021 01:03:56 +0300
Subject: [Buildroot] [PATCH v2 01/28] boot/arm-trusted-firmware: option
 to disable stack protection
In-Reply-To: <20210609234015.1de2583f@windsurf>
References: <20210609200003.2866122-1-geomatsi@gmail.com>
 <20210609200003.2866122-2-geomatsi@gmail.com>
 <20210609234015.1de2583f@windsurf>
Message-ID: <YME6zLv85ivVOkpi@curiosity>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

> > +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_DISABLE_SSP
> > +	bool "Disable stack protection"
> > +	help
> > +	  Select this option to explicitly disable stack protection checks in GCC.
> > +	  Such checks need to be disabled if ATF platform port does not implement
> > +	  plat_get_stack_protector_canary() hook.
> 
> It's a bit annoying that we have to tell TF-A about this. If TF-A
> doesn't implement plat_get_stack_protector_canary() for a certain
> platform, why does it try to enable SSP ? It feels like something that
> should be fixed in TF-A.

TF-A does not attempt to enable those protection checks. This is
controlled by its ENABLE_STACK_PROTECTOR build flag, which default
value is 'none'. This is Buildroot who tries to enable TF-A stack
protection checks depending on BR2_SSP_* toolchain features only:
see arm-trusted-firmware.mk.

Regards,
Sergey
