From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Wed, 23 Jun 2010 12:54:42 -0300
Subject: [Buildroot] [PATCH] Fix u-boot 2010.03 build for AVR32
In-Reply-To: <87iq59698j.fsf@macbook.be.48ers.dk>
References: <AANLkTinrP9FwGkXeMMHMhI4Z2Y6bmS3kv9EOJm6nBtPH@mail.gmail.com>
	<87iq59698j.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTilBhzUQDRiViIy_OQmMTb4dH7-1HCRHlnXLU5Kw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

2010/6/23 Peter Korsgaard <jacmet@uclibc.org>:
> Thanks. Did you intend to make those changes in
> target/device/Atmel/Makefile.in? If so, please describe in the commit
> message why.
>

Yes, it is intentional. It simply breaks the value of
$(U_BOOT_VERSION) at the boot/u-boot/u-boot.mk, and prevents the patch
from applying. I grep'ed the whole source and there were no mention of
$(BR2_UBOOT_VERSION), this is probably an old Config.in variable name.
Also, UBOOT_CONFIG and UBOOT_CONFIG_FILE are not used (anymore?)

I think the entiere target/deviceAtmel/Makefile.in is broken. It also
prevents me from specifying my own custom linux .config, as it
overrides the value I set in Kconfig with it's own.

Kind Regards,
    Thiago A. Correa
