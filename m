From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 4 Mar 2015 22:54:14 +0100
Subject: [Buildroot] [git commit] package/kodi: Use i.MX VPU (video
 codec) when available
In-Reply-To: <20150304215037.AFB9E80F41@busybox.osuosl.org>
References: <20150304215037.AFB9E80F41@busybox.osuosl.org>
Message-ID: <20150304215413.GA3937@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

does the openswan commit belong to this commit?

best regards
 Waldemar

Thomas Petazzoni wrote,

> commit: http://git.buildroot.net/buildroot/commit/?id=5287358ff33ec4920a677a58152ad040151b843f
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Tested on i.MX6.
> 
> [Thomas: drop comment in Config.in help text, hard to maintain for all
> platforms.]
> 
> Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/kodi/kodi.mk         |    5 +++++
>  package/openswan/openswan.mk |    2 +-
>  2 files changed, 6 insertions(+), 1 deletions(-)
> 
> diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
> index 0a6fe7c..f40fc31 100644
> --- a/package/kodi/kodi.mk
> +++ b/package/kodi/kodi.mk
> @@ -61,6 +61,11 @@ KODI_CONF_ENV += INCLUDES="-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads
>  	LIBS="-lvcos -lvchostif"
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBFSLVPUWRAP),y)
> +KODI_DEPENDENCIES += libfslvpuwrap
> +KODI_CONF_OPTS += --enable-codec=imxvpu
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBCAP),y)
>  KODI_CONF_OPTS += --enable-libcap
>  KODI_DEPENDENCIES += libcap
> diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
> index ba36f7c..3c878c9 100644
> --- a/package/openswan/openswan.mk
> +++ b/package/openswan/openswan.mk
> @@ -11,7 +11,7 @@ OPENSWAN_LICENSE_FILES = COPYING LICENSE
>  
>  OPENSWAN_DEPENDENCIES = host-bison host-flex gmp iproute2
>  OPENSWAN_MAKE_OPTS = ARCH=$(BR2_ARCH) CC="$(TARGET_CC)" \
> -	USERCOMPILE="$(TARGET_CFLAGS) -fPIE" INC_USRLOCAL=/usr \
> +	USERCOMPILE="$(TARGET_CFLAGS)" INC_USRLOCAL=/usr \
>  	USE_KLIPS=false USE_MAST=false USE_NM=false
>  
>  ifeq ($(BR2_PACKAGE_LIBCURL),y)
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
