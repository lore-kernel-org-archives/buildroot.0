From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Apr 2018 13:28:47 +0200
Subject: [Buildroot] [PATCH] package/kmod: enable compression in host
 variant
In-Reply-To: <20180408081231.24250-1-yann.morin.1998@free.fr>
References: <20180408081231.24250-1-yann.morin.1998@free.fr>
Message-ID: <20180408132847.095b0d27@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  8 Apr 2018 10:12:31 +0200, Yann E. MORIN wrote:
> When the modules are compressed by the kernel at install, it needs a
> depmod with compression support to br able to generate the modules.dep
> and associated files.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/kmod/kmod.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
> index e1149b7b65..c6264e16ab 100644
> --- a/package/kmod/kmod.mk
> +++ b/package/kmod/kmod.mk
> @@ -9,7 +9,7 @@ KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
>  KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod
>  KMOD_INSTALL_STAGING = YES
>  KMOD_DEPENDENCIES = host-pkgconf
> -HOST_KMOD_DEPENDENCIES = host-pkgconf
> +HOST_KMOD_DEPENDENCIES = host-pkgconf host-xz host-zlib

It is a bit annoying to add those dependencies unconditionally :-/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
