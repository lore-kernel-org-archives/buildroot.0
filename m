From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 May 2014 16:12:38 +0200
Subject: [Buildroot] [PATCH v7 29/31] xbmc: Fix ffmpeg cross compile
In-Reply-To: <1400326806-16428-30-git-send-email-bernd.kuhls@t-online.de>
References: <1400326806-16428-1-git-send-email-bernd.kuhls@t-online.de>
 <1400326806-16428-30-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140517161238.40c04fc2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 17 May 2014 13:40:04 +0200, Bernd Kuhls wrote:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/xbmc/xbmc.mk |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
> index f564466..f537e92 100644
> --- a/package/xbmc/xbmc.mk
> +++ b/package/xbmc/xbmc.mk
> @@ -29,6 +29,7 @@ XBMC_CONF_ENV = \
>  	TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr"
>  
>  XBMC_CONF_OPT +=  \
> +	--with-arch=$(BR2_ARCH) \
>  	--disable-crystalhd \
>  	--disable-debug \
>  	--disable-dvdcss \

What is this fixing exactly? If it's needed for the bump to version
13.0, then it should be part of the commit doing the bump.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
