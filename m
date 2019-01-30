From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 30 Jan 2019 08:29:16 +0200
Subject: [Buildroot] [PATCH 2/2] libpcap: add support for bluez5_utils
In-Reply-To: <20190129223355.30600-2-fontaine.fabrice@gmail.com>
References: <20190129223355.30600-1-fontaine.fabrice@gmail.com>
 <20190129223355.30600-2-fontaine.fabrice@gmail.com>
Message-ID: <20190130062916.hdho4dgqpw2s35fm@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 29, 2019 at 11:33:55PM +0100, Fabrice Fontaine wrote:
> bluez5_utils support has been added since version 1.8.0 and
> https://github.com/the-tcpdump-group/libpcap/commit/b3776f3d50df9de9fcf702bd21a3ecb2539ffef4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Baruch Siach <baruch@tkos.co.il>

baruch

> ---
>  package/libpcap/libpcap.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
> index daa369f66c..8cc444e7af 100644
> --- a/package/libpcap/libpcap.mk
> +++ b/package/libpcap/libpcap.mk
> @@ -24,9 +24,10 @@ define LIBPCAP_CONFIG_REMOVE_RPATH
>  endef
>  LIBPCAP_POST_BUILD_HOOKS = LIBPCAP_CONFIG_REMOVE_RPATH
>  
> -# On purpose, not compatible with bluez5
>  ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
>  LIBPCAP_DEPENDENCIES += bluez_utils
> +else ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
> +LIBPCAP_DEPENDENCIES += bluez5_utils
>  else
>  LIBPCAP_CONF_OPTS += --disable-bluetooth
>  endif
> -- 
> 2.14.1
> 

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
