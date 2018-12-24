From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Dec 2018 17:45:09 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/brcm-patchram-plus: Add new
 package
In-Reply-To: <20181224161235.1747-1-vadim4j@gmail.com>
References: <20181224161235.1747-1-vadim4j@gmail.com>
Message-ID: <20181224164509.GE2703@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vadim, All,

On 2018-12-24 18:12 +0200, Vadim Kochan spake thusly:
> Add tool which allows to setup broadcom bluetooth
> device via UART.
> 
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[--SNIP--]
> diff --git a/package/brcm-patchram-plus/brcm-patchram-plus.mk b/package/brcm-patchram-plus/brcm-patchram-plus.mk
> new file mode 100644
> index 0000000000..9f2f8d33ea
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
> +BRCM_PATCHRAM_PLUS_LICENSE = src/main.c

No, you read me wrong; I wrote:
    BRCM_PATCHRAM_PLUS_LICENSE_FILES = src/main.c

The license line was OK as it was in your previous iteration (except it
should have been Apache-2.0, not APACHE-2.0).

Maybe I was not clear enough, sorry... So to be sure there is no
confusion, you want to have both lines:

    BRCM_PATCHRAM_PLUS_LICENSE = Apache-2.0
    BRCM_PATCHRAM_PLUS_LICENSE_FILES = src/main.c

And by the way, you will also need to add a line for src/main.c in the
brcm-patchram-plus.has file as well. Run 'make legal-info' to check.

See package/libfm/ for an example.

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
