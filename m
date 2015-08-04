From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Aug 2015 11:28:04 +0200
Subject: [Buildroot] [PATCH] webkitgtk24: depend on x11 backend for gtk3
In-Reply-To: <1438599982-27100-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438599982-27100-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150804112804.0e709e3f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon,  3 Aug 2015 08:06:22 -0300, Gustavo Zacarias wrote:
> The other rendering backends aren't supported right now, so depend on
> the X11 one to avoid build breakage. Fixes:
> http://autobuild.buildroot.net/results/1b3/1b372dd04eaccd8a9d24390d509b0a49f692746c/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/webkitgtk24/webkitgtk24.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/webkitgtk24/webkitgtk24.mk b/package/webkitgtk24/webkitgtk24.mk
> index 5c1bb5b..a58fed3 100644
> --- a/package/webkitgtk24/webkitgtk24.mk
> +++ b/package/webkitgtk24/webkitgtk24.mk
> @@ -101,7 +101,7 @@ endif
>  # webkit1 (old API) uses gtk2, webkit2 (new API) uses gtk3
>  # Both can be built simultaneously, prefer "newer" for size/time savings
>  # gtk2 is mandatory for plugin support
> -ifeq ($(BR2_PACKAGE_LIBGTK3),y)
> +ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
>  WEBKITGTK24_CONF_OPTS += \
>  	--with-gtk=3.0 \
>  	--disable-webkit1



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
