From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 6 Feb 2017 20:07:09 +0200
Subject: [Buildroot] [git commit] system(d): allow auto net
 configuration with networkd
In-Reply-To: <20170206174814.32BF581F79@busybox.osuosl.org>
References: <20170206174814.32BF581F79@busybox.osuosl.org>
Message-ID: <20170206180709.xhsttul3nq7vgtya@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Feb 06, 2017 at 05:56:14PM +0100, Thomas Petazzoni wrote:
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 278c8e9..fce5d84 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -281,6 +281,14 @@ define SYSTEMD_INSTALL_RESOLVCONF_HOOK
>  	ln -sf ../run/systemd/resolve/resolv.conf \
>  		$(TARGET_DIR)/etc/resolv.conf
>  endef
> +SYSTEMD_NETWORKD_DHCP_IFACE = $(call qstrip,$(BR2_SYSTEM_DHCP))
> +ifneq ($(SYSTEMD_NETWORKD_DHCP_IFACE),)
> +define SYSTEMD_INSTALL_NETWORK_CONFS
> +	sed s/SYSTEMD_NETWORKD_DHCP_IFACE/$(SYSTEMD_NETWORKD_DHCP_IFACE)/ \
> +		package/systemd/dhcp.network > \

Where is this file?

> +		$(TARGET_DIR)/etc/systemd/network/dhcp.network
> +endef
> +endif

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
