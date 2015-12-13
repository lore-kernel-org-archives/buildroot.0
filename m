From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Dec 2015 21:39:11 +0100
Subject: [Buildroot] [PATCH v2 4/4] libfslparser: add missing configure
 options
In-Reply-To: <1449755560-2911-5-git-send-email-gary.bisson@boundarydevices.com>
References: <1449755560-2911-1-git-send-email-gary.bisson@boundarydevices.com>
 <1449755560-2911-5-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <20151213203911.GB18449@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gary, All,

On 2015-12-10 14:52 +0100, Gary Bisson spake thusly:
> Enable hard float support when the proper configuration is setup.
> BR2_ARM_EABIHF=y
> 
> See Yocto equivalent:
> https://github.com/Freescale/meta-fsl-arm/blob/fido/recipes-
> multimedia/libfslparser/libfslparser.inc
> 
> Tested with Linaro ARM 2014.09 toolchain.
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
> 
> Thanks to those options, I could see that libraries from copied from
> release/lib/yocto/hw instead of release/lib/yocto/sw.
> 
> Regards,
> Gary
> 
> ---
>  package/libfslparser/libfslparser.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/libfslparser/libfslparser.mk b/package/libfslparser/libfslparser.mk
> index 221d5e4..c2b63ce 100644
> --- a/package/libfslparser/libfslparser.mk
> +++ b/package/libfslparser/libfslparser.mk
> @@ -13,6 +13,10 @@ LIBFSLPARSER_LICENSE = Freescale Semiconductor Software License Agreement
>  LIBFSLPARSER_LICENSE_FILES = EULA COPYING
>  LIBFSLPARSER_REDISTRIBUTE = NO
>  
> +ifeq ($(BR2_ARM_EABIHF),y)
> +LIBFSLPARSER_CONF_OPTS += --enable-fhw
> +endif

What about adding --disable-fhw when not EABIhf?

Regards,
Yann E. MORIN.

>  define LIBFSLPARSER_EXTRACT_CMDS
>  	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(LIBFSLPARSER_SOURCE))
>  endef
> -- 
> 2.6.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
