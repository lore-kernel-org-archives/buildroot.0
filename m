From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Apr 2020 22:12:02 +0200
Subject: [Buildroot] [PATCH 1/2] package/libva-utils: switch back to
 upstream-provided tarball
In-Reply-To: <20200413134713.1120377-1-bernd.kuhls@t-online.de>
References: <20200413134713.1120377-1-bernd.kuhls@t-online.de>
Message-ID: <20200413201202.GY29898@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2020-04-13 15:47 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Both patches applied to master. I just reordred them so the lib comes
first, no particualr reasons, it jsut seems more logical in my twisted
head. Tanks!

Regards,
Yann E. MORIN.

> ---
>  package/libva-utils/libva-utils.hash | 2 +-
>  package/libva-utils/libva-utils.mk   | 5 ++---
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libva-utils/libva-utils.hash b/package/libva-utils/libva-utils.hash
> index 4addb7be3a..f6b10f84fb 100644
> --- a/package/libva-utils/libva-utils.hash
> +++ b/package/libva-utils/libva-utils.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256 9cf35b971001e7143dda14207b6891c12619a72a2ab99a9133b3da5b9c4d97dd  libva-utils-2.7.1.tar.gz
> +sha256 ffcd698a7d4312750d7c9338ba6b26774c7028ee6f9f3cbbf34c122c05bcea9a  libva-utils-2.7.1.tar.bz2
>  sha256 c6220c9f87832c27abcb8a32eafdd2823e13ce146b3ea63d5deae2a76798ef50  COPYING
> diff --git a/package/libva-utils/libva-utils.mk b/package/libva-utils/libva-utils.mk
> index dee29c9891..cb1df66459 100644
> --- a/package/libva-utils/libva-utils.mk
> +++ b/package/libva-utils/libva-utils.mk
> @@ -5,11 +5,10 @@
>  ################################################################################
>  
>  LIBVA_UTILS_VERSION = 2.7.1
> -LIBVA_UTILS_SITE = $(call github,intel,libva-utils,$(LIBVA_UTILS_VERSION))
> +LIBVA_UTILS_SOURCE = libva-utils-$(LIBVA_UTILS_VERSION).tar.bz2
> +LIBVA_UTILS_SITE = https://github.com/intel/libva-utils/releases/download/$(LIBVA_UTILS_VERSION)
>  LIBVA_UTILS_LICENSE = MIT
>  LIBVA_UTILS_LICENSE_FILES = COPYING
> -# github tarball does not include configure
> -LIBVA_UTILS_AUTORECONF = YES
>  LIBVA_UTILS_DEPENDENCIES = host-pkgconf libva
>  
>  $(eval $(autotools-package))
> -- 
> 2.25.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
