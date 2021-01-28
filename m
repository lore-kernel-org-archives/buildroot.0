From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 28 Jan 2021 17:45:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: add CPE variables
In-Reply-To: <20210126210845.2497502-1-fontaine.fabrice@gmail.com>
References: <20210126210845.2497502-1-fontaine.fabrice@gmail.com>
Message-ID: <20210128164509.GO2325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2021-01-26 22:08 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:wpewebkit:wpe_webkit is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Awpewebkit%3Awpe_webkit
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

But what about the other webkit-like packages we have:

    package/qt5/qt5webkit
    package/qt-webkit-kiosk
    package/webkitgtk

Regards,
Yann E. MORIN.

> ---
>  package/wpewebkit/wpewebkit.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
> index d3afdf0094..91f137d96f 100644
> --- a/package/wpewebkit/wpewebkit.mk
> +++ b/package/wpewebkit/wpewebkit.mk
> @@ -12,6 +12,8 @@ WPEWEBKIT_LICENSE = LGPL-2.1+, BSD-2-Clause
>  WPEWEBKIT_LICENSE_FILES = \
>  	Source/WebCore/LICENSE-APPLE \
>  	Source/WebCore/LICENSE-LGPL-2.1
> +WPEWEBKIT_CPE_ID_VENDOR = wpewebkit
> +WPEWEBKIT_CPE_ID_PRODUCT = wpe_webkit
>  WPEWEBKIT_DEPENDENCIES = host-gperf host-python host-ruby \
>  	harfbuzz cairo icu jpeg libepoxy libgcrypt libgles libsoup libtasn1 \
>  	libpng libxslt openjpeg wayland-protocols webp wpebackend-fdo
> -- 
> 2.29.2
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
