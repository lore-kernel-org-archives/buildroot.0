From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Jun 2019 19:41:21 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/hostapd: add debug
 information options
In-Reply-To: <20190617153533.26255-1-jared.bents@rockwellcollins.com>
References: <20190617153533.26255-1-jared.bents@rockwellcollins.com>
Message-ID: <20190617194121.64c14291@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Jun 2019 10:35:33 -0500
jared.bents at rockwellcollins.com wrote:

> From: Jared Bents <jared.bents@rockwellcollins.com>
> 
> hostapd 2.7 added compile time options to include
> redirecting the output from stdout to a file or syslog
> like wpa_supplicant
> 
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
> ---
>  package/hostapd/Config.in  | 5 +++++
>  package/hostapd/hostapd.mk | 8 +++++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
> index 37c1126859..00a9ade95f 100644
> --- a/package/hostapd/Config.in
> +++ b/package/hostapd/Config.in
> @@ -81,6 +81,11 @@ config BR2_PACKAGE_HOSTAPD_WPS
>  	help
>  	  Enable support for Wi-Fi Protected Setup.
>  
> +config BR2_PACKAGE_HOSTAPD_DEBUG_SYSLOG
> +	bool "Enable syslog support"
> +	help
> +	  Enable support for sending debug messages to syslog.
> +
>  config BR2_PACKAGE_HOSTAPD_VLAN
>  	bool "Enable VLAN support"
>  	default y
> diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
> index 550f887206..abc9fc97ad 100644
> --- a/package/hostapd/hostapd.mk
> +++ b/package/hostapd/hostapd.mk
> @@ -31,7 +31,9 @@ HOSTAPD_LICENSE = BSD-3-Clause
>  HOSTAPD_LICENSE_FILES = README
>  HOSTAPD_CONFIG_SET =
>  
> -HOSTAPD_CONFIG_ENABLE = CONFIG_INTERNAL_LIBTOMMATH
> +HOSTAPD_CONFIG_ENABLE = \
> +	CONFIG_INTERNAL_LIBTOMMATH \
> +	CONFIG_DEBUG_FILE

So you're now enabling this unconditionally, while syslog logging is
conditional.

Could you explain what CONFIG_DEBUG_FILE is doing compared to
CONFIG_DEBUG_SYSLOG, and why one is conditional and not the other ? Do
we really want CONFIG_DEBUG_FILE unconditionally ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
