From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 23:24:47 +0100
Subject: [Buildroot] [PATCH 5/5] package/shairport-sync: add mqtt option
In-Reply-To: <20191203105341.1232360-5-joerg.krause@embedded.rocks>
References: <20191203105341.1232360-1-joerg.krause@embedded.rocks>
 <20191203105341.1232360-5-joerg.krause@embedded.rocks>
Message-ID: <20191208232447.362391c7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  3 Dec 2019 11:53:41 +0100
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> Shairport Sync added support for the MQTT protocol in version 3.2. For
> full MQTT support Avahi and DBus support are required.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/shairport-sync/Config.in         | 11 +++++++++++
>  package/shairport-sync/shairport-sync.mk |  5 +++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/package/shairport-sync/Config.in b/package/shairport-sync/Config.in
> index 6325e9d30d..185fb3cff1 100644
> --- a/package/shairport-sync/Config.in
> +++ b/package/shairport-sync/Config.in
> @@ -49,6 +49,17 @@ config BR2_PACKAGE_SHAIRPORT_SYNC_LIBSOXR
>  	  can be heard in some circumstances. Libsoxr allows this
>  	  interpolation to be done much more smoothly and subtly.
>  
> +config BR2_PACKAGE_SHAIRPORT_SYNC_MQTT
> +	bool "mqtt support"
> +	depends on !BR2_STATIC_LIBS # avahi

Ditto, some dependencies from avahi were missing, such as the
BR2_USE_MMU dependency.

Applied after fixing this. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
