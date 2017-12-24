From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun, 24 Dec 2017 23:49:20 +0300
Subject: [Buildroot] [PATCH 2/4] hostapd: select driver support
In-Reply-To: <20171223190617.3981-3-alexander.i.mukhin@gmail.com>
References: <20171223190617.3981-1-alexander.i.mukhin@gmail.com>
 <20171223190617.3981-3-alexander.i.mukhin@gmail.com>
Message-ID: <20171224204920.uwyafn63a6lyyqan@speedy.hunter>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alexander,

> Add configuration options for hostapd to select which
> drivers to build.
> 
> Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>

[...]

> +comment "at least one driver must be selected"
> +	depends on !BR2_PACKAGE_HOSTAPD_DRIVER_HOSTAP
> +	depends on !BR2_PACKAGE_HOSTAPD_DRIVER_NL80211
> +	depends on !BR2_PACKAGE_HOSTAPD_DRIVER_RTW
> +

Does it makes sense to enforce enablement of at least one driver ?

Another option would be to add DRIVER_NONE to the list of drivers,
and enable it by default if no other actual wired/wireless driver
has been selected. According to example hostapd.conf only 'none'
driver is needed if hostapd is built as a standalone RADIUS server.

Regards,
Sergey
