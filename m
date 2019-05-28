From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 May 2019 23:09:54 +0200
Subject: [Buildroot] [PATCH 2/2] package/mender: install additional
 inventory scripts
In-Reply-To: <20190514090450.20142-3-mirza.krak@northern.tech>
References: <20190514090450.20142-1-mirza.krak@northern.tech>
 <20190514090450.20142-3-mirza.krak@northern.tech>
Message-ID: <7911a62b-e8b8-d8c9-7149-695c27d5c010@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14/05/2019 11:04, Mirza Krak wrote:
> There are two additional inventory scripts provided in
> the Mender client repository, lets install them.
> 
> - mender-inventory-os
>     - will push content of /etc/os-release
> - mender-inventory-rootfs-type
>     - will push filesystem type of rootfs
> 
> Signed-off-by: Mirza Krak <mirza.krak@northern.tech>

 Looks like a fix, is definitely not going to break the build, so applied to
master, thanks.

 Regards,
 Arnout

> ---
>  package/mender/mender.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/mender/mender.mk b/package/mender/mender.mk
> index 07f6e5e5f9..d56b634713 100644
> --- a/package/mender/mender.mk
> +++ b/package/mender/mender.mk
> @@ -46,7 +46,7 @@ define MENDER_INSTALL_CONFIG_FILES
>  
>  	$(INSTALL) -D -m 0755 $(@D)/support/mender-device-identity \
>  		$(TARGET_DIR)/usr/share/mender/identity/mender-device-identity
> -	$(foreach f,hostinfo network, \
> +	$(foreach f,hostinfo network os rootfs-type, \
>  		$(INSTALL) -D -m 0755 $(@D)/support/mender-inventory-$(f) \
>  			$(TARGET_DIR)/usr/share/mender/inventory/mender-inventory-$(f)
>  	)
> 
