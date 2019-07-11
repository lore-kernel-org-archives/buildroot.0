From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 11 Jul 2019 16:01:52 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/hostapd: add debug
 information options
In-Reply-To: <20190708200754.20272-1-jared.bents@rockwellcollins.com>
References: <20190708200754.20272-1-jared.bents@rockwellcollins.com>
Message-ID: <d21df375-afab-daa8-00bc-1fdbab42d823@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08/07/2019 22:07, jared.bents at rockwellcollins.com wrote:
> From: Jared Bents <jared.bents@rockwellcollins.com>
> 
> hostapd 2.7 added compile time options to include
> redirecting the output from stdout to a file or syslog
> like wpa_supplicant
> 
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>

 Applied to master, thanks.

 Regards,
 Arnout

> --
> v1->v2: Updated to move reposition the debug syslog option
> v2->v3: Updated to turn both options on unconditionally
> ---
>  package/hostapd/hostapd.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
> index 550f887206..e6542c879c 100644
> --- a/package/hostapd/hostapd.mk
> +++ b/package/hostapd/hostapd.mk
> @@ -31,7 +31,10 @@ HOSTAPD_LICENSE = BSD-3-Clause
>  HOSTAPD_LICENSE_FILES = README
>  HOSTAPD_CONFIG_SET =
>  
> -HOSTAPD_CONFIG_ENABLE = CONFIG_INTERNAL_LIBTOMMATH
> +HOSTAPD_CONFIG_ENABLE = \
> +	CONFIG_INTERNAL_LIBTOMMATH \
> +	CONFIG_DEBUG_FILE \
> +	CONFIG_DEBUG_SYSLOG
>  
>  HOSTAPD_CONFIG_DISABLE =
>  
> 
