From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 23:24:23 +0100
Subject: [Buildroot] [PATCH 4/5] package/shairport-sync: add dbus option
In-Reply-To: <20191203105341.1232360-4-joerg.krause@embedded.rocks>
References: <20191203105341.1232360-1-joerg.krause@embedded.rocks>
 <20191203105341.1232360-4-joerg.krause@embedded.rocks>
Message-ID: <20191208232423.206f981a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  3 Dec 2019 11:53:40 +0100
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> Shairport Sync added DBus support in version 3.2.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/shairport-sync/Config.in         | 11 +++++++++++
>  package/shairport-sync/shairport-sync.mk |  5 +++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/package/shairport-sync/Config.in b/package/shairport-sync/Config.in
> index 87f38a940d..6325e9d30d 100644
> --- a/package/shairport-sync/Config.in
> +++ b/package/shairport-sync/Config.in
> @@ -26,6 +26,17 @@ config BR2_PACKAGE_SHAIRPORT_SYNC_CONVOLUTION
>  	help
>  	  Enable audio DSP convolution support.
>  
> +config BR2_PACKAGE_SHAIRPORT_SYNC_DBUS
> +	bool "dbus support"
> +	depends on BR2_USE_WCHAR # libglib2 -> gettext

No need to repeat the full comment, just "# libglib2" is sufficient.

However, you forgot the other dependencies from libglib2: yes the
thread dependency was already implied by the dependency of
shairport-sync on NPTL, but the BR2_USE_MMU dependency was missing. So
I've replicated both, to keep things simple.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
