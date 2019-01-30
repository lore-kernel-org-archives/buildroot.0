From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 30 Jan 2019 08:24:14 +0200
Subject: [Buildroot] [PATCH 1/2] libpcap: remove unrecognized canusb
 option
In-Reply-To: <20190129223355.30600-1-fontaine.fabrice@gmail.com>
References: <20190129223355.30600-1-fontaine.fabrice@gmail.com>
Message-ID: <20190130062414.2br2gudhp2vous2u@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

On Tue, Jan 29, 2019 at 11:33:54PM +0100, Fabrice Fontaine wrote:
> canusb has been removed since version 1.8.1 and
> https://github.com/the-tcpdump-group/libpcap/commit/93ca5ff7030aaf1219e1de05ec89a68384bfc50b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Baruch Siach <baruch@tkos.co.il>

baruch

> ---
>  package/libpcap/libpcap.mk | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
> index c4c5f31465..daa369f66c 100644
> --- a/package/libpcap/libpcap.mk
> +++ b/package/libpcap/libpcap.mk
> @@ -38,13 +38,6 @@ else
>  LIBPCAP_CONF_OPTS += --disable-dbus
>  endif
>  
> -ifeq ($(BR2_PACKAGE_LIBUSB),y)
> -LIBPCAP_CONF_OPTS += --enable-canusb
> -LIBPCAP_DEPENDENCIES += libusb
> -else
> -LIBPCAP_CONF_OPTS += --disable-canusb
> -endif
> -
>  ifeq ($(BR2_PACKAGE_LIBNL),y)
>  LIBPCAP_DEPENDENCIES += libnl
>  LIBPCAP_CFLAGS += "-I$(STAGING_DIR)/usr/include/libnl3"
> -- 
> 2.14.1
> 

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
