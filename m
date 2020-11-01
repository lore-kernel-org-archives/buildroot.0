From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Nov 2020 16:01:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/wireshark: add zstd optional
 dependency
In-Reply-To: <20201101120558.1083803-1-fontaine.fabrice@gmail.com>
References: <20201101120558.1083803-1-fontaine.fabrice@gmail.com>
Message-ID: <20201101150114.GF2887157@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-11-01 13:05 +0100, Fabrice Fontaine spake thusly:
> zstd is available since version 3.1.1 and is enabled by default:
> https://github.com/wireshark/wireshark/commit/ad94c4d459d243c0cbbb9b222d5f7cdf8189ab86
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, tahnks.

Regards,
Yann E. MORIN.

> ---
>  package/wireshark/wireshark.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
> index 0bcb97606a..0d4fedb3f0 100644
> --- a/package/wireshark/wireshark.mk
> +++ b/package/wireshark/wireshark.mk
> @@ -155,6 +155,13 @@ else
>  WIRESHARK_CONF_OPTS += -DBUILD_sdjournal=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_ZSTD),y)
> +WIRESHARK_CONF_OPTS += -DENABLE_ZSTD=ON
> +WIRESHARK_DEPENDENCIES += zstd
> +else
> +WIRESHARK_CONF_OPTS += -DENABLE_ZSTD=OFF
> +endif
> +
>  # Disable plugins as some of them (like l16mono) can't be built
>  # statically. ENABLE_STATIC=ON actually means "disable shared library"
>  # and ENABLE_STATIC=OFF means "enable shared library". So for the
> -- 
> 2.28.0
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
