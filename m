From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Oct 2019 00:10:15 +0100
Subject: [Buildroot] [PATCH 2/5] package/openvpn: add libselinux support
In-Reply-To: <20191028212414.123964-2-aduskett@gmail.com>
References: <20191028212414.123964-1-aduskett@gmail.com>
 <20191028212414.123964-2-aduskett@gmail.com>
Message-ID: <f92b30b2-8fb8-9571-b052-3bfaa801f929@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/10/2019 22:24, aduskett at gmail.com wrote:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> If the libselinux package is selected, add the package to the
> dependency list and explicitly set --enable-selinux.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/openvpn/openvpn.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
> index 75dde04493..277b072deb 100644
> --- a/package/openvpn/openvpn.mk
> +++ b/package/openvpn/openvpn.mk
> @@ -38,6 +38,13 @@ else
>  OPENVPN_CONF_OPTS += --disable-lzo
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
> +OPENVPN_DEPENDENCIES += libselinux
> +OPENVPN_CONF_OPTS += --enable-selinux
> +else
> +OPENVPN_CONF_OPTS += --disable-selinux
> +endif
> +
>  ifeq ($(BR2_PACKAGE_SYSTEMD),y)
>  OPENVPN_DEPENDENCIES += systemd
>  OPENVPN_CONF_OPTS += --enable-systemd
> 
