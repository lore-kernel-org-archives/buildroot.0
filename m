From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 Feb 2014 18:59:29 +0100
Subject: [Buildroot] [PATCH v2 3/5] gummiboot: new package
In-Reply-To: <1392766441-2160-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1392766441-2160-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1392766441-2160-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140219175929.GB3400@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-02-19 00:33 +0100, Thomas Petazzoni spake thusly:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Christophe Vu-Brugier <cvubrugier@yahoo.fr>
[--SNIP--]
> --- /dev/null
> +++ b/boot/gummiboot/gummiboot.mk
> @@ -0,0 +1,42 @@
> +################################################################################
> +#
> +# gummiboot
> +#
> +################################################################################
> +
> +GUMMIBOOT_SITE = git://anongit.freedesktop.org/gummiboot
> +GUMMIBOOT_VERSION = 43
> +GUMMIBOOT_LICENSE = LGPLv2.1+
> +GUMMIBOOT_LICENSE_FILES = LICENSE
> +
> +# The git archive does not have the autoconf/automake stuff generated.
> +GUMMIBOOT_AUTORECONF = YES
> +GUMMIBOOT_DEPENDENCIES = gnu-efi host-pkgconf util-linux

Ah, gnu-efi is used here. That's why we need to install it in staging/
and target/, right?

Still, since this is a boot-related stuff, do we really need to have
gnu-efi installed in target/ ?

> +GUMMIBOOT_INSTALL_TARGET = NO
> +GUMMIBOOT_INSTALL_IMAGES = YES
> +
> +ifeq ($(BR2_i386),y)
> +GUMMIBOOT_IMGARCH = ia32
> +else ifeq ($(BR2_x86_64),y)
> +GUMMIBOOT_IMGARCH = x64
> +endif

Ditto: what about 32-bit EFI-BIOS on a 64-bit machine?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
