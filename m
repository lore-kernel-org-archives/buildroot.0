From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Oct 2020 14:10:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-devtools:
 install to staging
In-Reply-To: <20201017101703.3044360-1-fontaine.fabrice@gmail.com>
References: <20201017101703.3044360-1-fontaine.fabrice@gmail.com>
Message-ID: <20201017121009.GJ3466@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-10-17 12:17 +0200, Fabrice Fontaine spake thusly:
> This will fix the following build failure with
> gstreamer1-editing-services which optionally depends on gst1-devtools
> since commit 08a213c1a532de783a7cedaa29088ffb736827bd:
> 
> Run-time dependency gst-validate-1.0 found: NO (tried pkgconfig and cmake)
> Looking for a fallback subproject for the dependency gst-validate-1.0
> 
> ../output-1/build/gstreamer1-editing-services-1.18.0/meson.build:101:0: ERROR: Subproject directory not found and gst-devtools.wrap file not found
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e9d96a63861737d82734559db5e5ffbf5996ffde
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gstreamer1/gst1-devtools/gst1-devtools.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.mk b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
> index 23b4d5ab8f..c88d4c0378 100644
> --- a/package/gstreamer1/gst1-devtools/gst1-devtools.mk
> +++ b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
> @@ -9,6 +9,7 @@ GST1_DEVTOOLS_SOURCE = gst-devtools-$(GST1_DEVTOOLS_VERSION).tar.xz
>  GST1_DEVTOOLS_SITE = https://gstreamer.freedesktop.org/src/gst-devtools
>  GST1_DEVTOOLS_LICENSE = LGPL-2.1+
>  GST1_DEVTOOLS_LICENSE_FILES = validate/COPYING
> +GST1_DEVTOOLS_INSTALL_STAGING = YES
>  
>  GST1_DEVTOOLS_DEPENDENCIES = \
>  	gstreamer1 \
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
