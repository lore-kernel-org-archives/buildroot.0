From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Apr 2021 11:02:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/modem-manager: enable qcom-soc
 if libqrtr-glib enabled
In-Reply-To: <20210404184126.974098-1-petr.vorel@gmail.com>
References: <20210404184126.974098-1-petr.vorel@gmail.com>
Message-ID: <20210405110250.1e48e10f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  4 Apr 2021 20:41:26 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> This plugin makes sense only for Qualcomm MSM phone.
> Although there is currently no such device defconfig in Buildroot yet,
> it makes sense to prepare modem-manager for it.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  package/modem-manager/modem-manager.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
> index 2cc45d266b..d62d13cf45 100644
> --- a/package/modem-manager/modem-manager.mk
> +++ b/package/modem-manager/modem-manager.mk
> @@ -34,6 +34,12 @@ else
>  MODEM_MANAGER_CONF_OPTS += --without-mbim
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBQRTR_GLIB),y)
> +MODEM_MANAGER_CONF_OPTS += --enable-plugin-qcom-soc

Isn't that missing a MODEM_MANAGER_DEPENDENCIES += libqrtr-glib line ?
Or is it really a runtime dependency ?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
