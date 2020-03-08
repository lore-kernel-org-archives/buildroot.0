From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Mar 2020 14:47:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/connman: enable wireguard
In-Reply-To: <20200308070741.42542-1-james.hilliard1@gmail.com>
References: <20200308070741.42542-1-james.hilliard1@gmail.com>
Message-ID: <20200308144746.6cbfbd8f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  8 Mar 2020 00:07:41 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> We also need to select libmnl when building with wireguard support or
> with nftables.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/connman/Config.in  | 5 +++++
>  package/connman/connman.mk | 9 ++++++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/package/connman/Config.in b/package/connman/Config.in
> index ac012dda54..614b826f96 100644
> --- a/package/connman/Config.in
> +++ b/package/connman/Config.in
> @@ -33,6 +33,7 @@ config BR2_PACKAGE_CONNMAN_NFTABLES
>  	bool "nftables"
>  	depends on BR2_USE_WCHAR
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
> +	select BR2_PACKAGE_LIBMNL

How is this related to wireguard support ?

>  	select BR2_PACKAGE_NFTABLES
>  	help
>  	  Use nftables as firewall.
> @@ -51,6 +52,10 @@ config BR2_PACKAGE_CONNMAN_WIFI
>  	  setup). ConnMan detects the start of wpa_supplicant
>  	  automatically.
>  
> +config BR2_PACKAGE_CONNMAN_WIREGUARD
> +	bool "enable wireguard support"
> +	select BR2_PACKAGE_LIBMNL

We already had a patch from Petr at
http://patchwork.ozlabs.org/patch/1246181/ to add Wireguard support,
but he was also selecting BR2_PACKAGE_WIREGUARD_TOOLS.

Could you or Petr clarify this ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
