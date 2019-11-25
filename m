From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Nov 2019 15:30:52 +0100
Subject: [Buildroot] [PATCH/next v2 4/4] package/polkit: enable systemd
 login support
In-Reply-To: <20191124214823.2570598-5-aduskett@gmail.com>
References: <20191124214823.2570598-1-aduskett@gmail.com>
 <20191124214823.2570598-5-aduskett@gmail.com>
Message-ID: <20191125153052.7d572940@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 24 Nov 2019 13:48:23 -0800
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> If systemd-logind is selected, enable libsystemd-login support.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/polkit/polkit.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
> index 4135a64d6b..5e04c0908c 100644
> --- a/package/polkit/polkit.mk
> +++ b/package/polkit/polkit.mk
> @@ -26,4 +26,10 @@ else
>  POLKIT_CONF_OPTS += --with-authfw=shadow
>  endif
>  
> +ifeq ($(BR2_PACKAGE_SYSTEMD_LOGIND),y)
> +POLKIT_DEPENDENCIES += systemd
> +POLKIT_CONF_OPTS += \
> +	--enable-libsystemd-login=yes

Just --enable-libsystemd-login, and then have an else clause with
--disable-libsystemd-login (and drop if from the unconditional
POLKIT_CONF_OPTS assignment).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
