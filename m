From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 26 Jun 2018 21:41:44 +0300
Subject: [Buildroot] [PATCH] package/dhcp: copy dhcpctl and omapi
 libraries and headers into staging
In-Reply-To: <20180626154145.27019-1-daniel@0x0f.com>
References: <20180626154145.27019-1-daniel@0x0f.com>
Message-ID: <20180626184144.lao2t7bes4tt5pfb@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Daniel,

Thanks for your contribution. A few comment on your patch below.

On Wed, Jun 27, 2018 at 12:41:45AM +0900, Daniel Palmer wrote:

Please explain in the commit log why you need this change.

You also need to sign-off your patch.

baruch

> ---
>  package/dhcp/dhcp.mk | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
> index a1285184d3..dac7235f08 100644
> --- a/package/dhcp/dhcp.mk
> +++ b/package/dhcp/dhcp.mk
> @@ -118,4 +118,25 @@ define DHCP_INSTALL_TARGET_CMDS
>  	$(DHCP_INSTALL_CLIENT)
>  endef
>  
> +define DHCP_INSTALL_STAGING_CMDS
> +	$(INSTALL) -D -m 644 $(@D)/dhcpctl/dhcpctl.h \
> +		$(HOST_DIR)/usr/include/dhcpctl/dhcpctl.h
> +	$(INSTALL) -D -m 644 $(@D)/includes/isc-dhcp/dst.h \
> +		$(HOST_DIR)/usr/include/isc-dhcp/dst.h
> +	$(INSTALL) -D -m 644 -t $(HOST_DIR)/usr/include/omapip/ \
> +		$(@D)/includes/omapip/alloc.h \
> +		$(@D)/includes/omapip/buffer.h \
> +		$(@D)/includes/omapip/convert.h \
> +		$(@D)/includes/omapip/hash.h \
> +		$(@D)/includes/omapip/isclib.h \
> +		$(@D)/includes/omapip/omapip.h \
> +		$(@D)/includes/omapip/omapip_p.h \
> +		$(@D)/includes/omapip/result.h \
> +		$(@D)/includes/omapip/trace.h
> +	$(INSTALL) -D -m 644 $(@D)/dhcpctl/libdhcpctl.a \
> +		$(HOST_DIR)/usr/lib/libdhcpctl.a
> +	$(INSTALL) -D -m 644 $(@D)/omapip/libomapi.a \
> +		$(HOST_DIR)/usr/lib/libomapi.a
> +endef
> +
>  $(eval $(autotools-package))

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
