From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Nov 2014 22:01:48 +0100
Subject: [Buildroot] [PATCH 3/3] package/tvheadend: Remove tabs
In-Reply-To: <1416140787-18038-3-git-send-email-bernd.kuhls@t-online.de>
References: <1416140787-18038-1-git-send-email-bernd.kuhls@t-online.de>
 <1416140787-18038-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <546BB3BC.50002@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/11/14 13:26, Bernd Kuhls wrote:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 This looks more like adding tabs than removing them...

 But actually:

> ---
>  package/tvheadend/tvheadend.mk |   24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
> index b0038c8..ac3a557 100644
> --- a/package/tvheadend/tvheadend.mk
> +++ b/package/tvheadend/tvheadend.mk
> @@ -35,18 +35,18 @@ endif
>  TVHEADEND_DEPENDENCIES += dtv-scan-tables
>  
>  define TVHEADEND_CONFIGURE_CMDS
> -	(cd $(@D);				\
> -	 $(TARGET_CONFIGURE_OPTS)		\
> -	 $(TARGET_CONFIGURE_ARGS)		\
> -	 ./configure				\
> -	 --prefix=/usr				\
> -	 --arch="$(ARCH)"			\
> -	 --cpu="$(BR2_GCC_TARGET_CPU)"		\
> -	 --python="$(HOST_DIR)/usr/bin/python"	\
> -	 --disable-dvbscan			\
> -	 --enable-bundle			\
> -	 --disable-libffmpeg_static		\
> -	 $(TVHEADEND_CONF_OPTS)			\
> +	(cd $(@D); \

 Why don't you remove the redundant parenthesis and avoid one indent level?

> +		$(TARGET_CONFIGURE_OPTS) \
> +		$(TARGET_CONFIGURE_ARGS) \
> +		./configure \

 IMHO it would be nicer if everything below would get an additional indent level.


 Regards,
 Arnout

> +		--prefix=/usr \
> +		--arch="$(ARCH)" \
> +		--cpu="$(BR2_GCC_TARGET_CPU)" \
> +		--python="$(HOST_DIR)/usr/bin/python" \
> +		--disable-dvbscan \
> +		--enable-bundle \
> +		--disable-libffmpeg_static \
> +		$(TVHEADEND_CONF_OPTS) \
>  	)
>  endef
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
