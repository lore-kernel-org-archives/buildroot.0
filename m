From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Dec 2018 16:54:14 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/brcm-patchram-plus: Add new
 package
In-Reply-To: <20181224130852.28685-1-vadim4j@gmail.com>
References: <20181224130852.28685-1-vadim4j@gmail.com>
Message-ID: <20181224155414.GD2703@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vadim, All,

On 2018-12-24 15:08 +0200, Vadim Kochan spake thusly:
> Add tool which allows to setup broadcom bluetooth
> device via UART.
> 
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/brcm-patchram-plus/brcm-patchram-plus.hash b/package/brcm-patchram-plus/brcm-patchram-plus.hash
> new file mode 100644
> index 0000000000..59263f23d4
> --- /dev/null
> +++ b/package/brcm-patchram-plus/brcm-patchram-plus.hash
> @@ -0,0 +1,2 @@
> +# locally computed
> +sha256  7d63f3a0c79cb5d187a0f2647734601f9c97d4eb8e545ce9ace7653c1f3f9a58  brcm-patchram-plus-94fb127e614b19a9a95561b8c1a0716e2e1e6293.tar.gz
> diff --git a/package/brcm-patchram-plus/brcm-patchram-plus.mk b/package/brcm-patchram-plus/brcm-patchram-plus.mk
> new file mode 100644
> index 0000000000..7ef82f2b15
> --- /dev/null
> +++ b/package/brcm-patchram-plus/brcm-patchram-plus.mk
> @@ -0,0 +1,12 @@
> +################################################################################
> +#
> +# brcm-patchram-plus
> +#
> +################################################################################
> +
> +BRCM_PATCHRAM_PLUS_VERSION = 94fb127e614b19a9a95561b8c1a0716e2e1e6293
> +BRCM_PATCHRAM_PLUS_SITE = $(call github,AsteroidOS,brcm-patchram-plus,$(BRCM_PATCHRAM_PLUS_VERSION))
> +BRCM_PATCHRAM_PLUS_LICENSE = APACHE-2.0

OK, so I was a bit puzzled by the license. The top-level COPYING file is
clearly a BSD-3c, but indeed src/main.c (the only actual source file) is
Apache-2.0.

So, there is no license file we can refer to. In this situation, we
usually add the single source file as license file:

    BRCM_PATCHRAM_PLUS_LICENSE_FILES = src/main.c

Otherwise:

    Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> +BRCM_PATCHRAM_PLUS_AUTORECONF = YES
> +
> +$(eval $(autotools-package))
> -- 
> 2.14.1
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
