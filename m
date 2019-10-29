From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Oct 2019 00:09:59 +0100
Subject: [Buildroot] [PATCH 1/5] package/openvpn: add systemd support
In-Reply-To: <20191028212414.123964-1-aduskett@gmail.com>
References: <20191028212414.123964-1-aduskett@gmail.com>
Message-ID: <84fa05a0-0adf-a7f6-640d-31bb29f9ba83@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/10/2019 22:24, aduskett at gmail.com wrote:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> If the systemd package is selected, add the package to the
> dependency list and explicitly set --enable-systemd.
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
> index 4c6956fe12..75dde04493 100644
> --- a/package/openvpn/openvpn.mk
> +++ b/package/openvpn/openvpn.mk
> @@ -38,6 +38,13 @@ else
>  OPENVPN_CONF_OPTS += --disable-lzo
>  endif
>  
> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> +OPENVPN_DEPENDENCIES += systemd
> +OPENVPN_CONF_OPTS += --enable-systemd
> +else
> +OPENVPN_CONF_OPTS += --disable-systemd
> +endif
> +
>  define OPENVPN_INSTALL_TARGET_CMDS
>  	$(INSTALL) -m 755 $(@D)/src/openvpn/openvpn \
>  		$(TARGET_DIR)/usr/sbin/openvpn
> 
