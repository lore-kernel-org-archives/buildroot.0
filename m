From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Fri, 17 Apr 2015 20:40:41 -0400 (EDT)
Subject: [Buildroot] [PATCH 1/3] uboot: add support for patch files and
 URLs
In-Reply-To: <1429302375-12275-1-git-send-email-fhunleth@troodon-software.com>
References: <1429302375-12275-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <877797848.435510.1429317641487.JavaMail.zimbra@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Sorry for showing up a bit late on this thread.

> +config BR2_TARGET_UBOOT_PATCHES
> +	string "custom patches"
[...]
> +UBOOT_PATCH += $(call qstrip,$(BR2_TARGET_UBOOT_PATCHES))
> +
>  define UBOOT_CONFIGURE_CMDS

While we are adding new U-Boot related symbols, I think it would be nice
to respect the project naming convention, which is described in the
"Names and Spelling" section [1] of the project README file.

So, I'd suggest these symbols to be named BR2_TARGET_U_BOOT_PATCHES and
U_BOOT_PATCH in respect to the official project name.

[1] http://git.denx.de/?p=u-boot.git;a=blob;f=README;h=9b748ccc34120b3c10dd8c33d84269bff6853b1b;hb=HEAD#l93

Best Regards,
-v
