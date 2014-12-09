From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Dec 2014 20:15:08 +0100
Subject: [Buildroot] [PATCH 5/6] package/mpd: enable neighbor discovery
 support
In-Reply-To: <1418078694-26331-5-git-send-email-jkrause@posteo.de>
References: <1418078694-26331-1-git-send-email-jkrause@posteo.de>
 <1418078694-26331-5-git-send-email-jkrause@posteo.de>
Message-ID: <20141209201508.0168241a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Mon,  8 Dec 2014 23:44:53 +0100, J?rg Krause wrote:
> Enable support for neighbor discovery useful in Samba and UPnP networks.
> 
> Signed-off-by: J?rg Krause <jkrause@posteo.de>
> ---
>  package/mpd/Config.in | 10 ++++++++++
>  package/mpd/mpd.mk    |  6 ++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/package/mpd/Config.in b/package/mpd/Config.in
> index 901902b..57ed434 100644
> --- a/package/mpd/Config.in
> +++ b/package/mpd/Config.in
> @@ -269,6 +269,16 @@ config BR2_PACKAGE_MPD_AVAHI_SUPPORT
>  comment "avahi support needs a toolchain w/ dynamic library"
>  	depends on BR2_PREFER_STATIC_LIB
>  
> +config BR2_PACKAGE_MPD_NEIGHBOR_DISCOVERY_SUPPORT
> +	bool "neighbor discovery support"
> +	help
> +	  Enable support for neighbor discovery.
> +	  This option may be used in conjunction with the plugin samba to
> +	  provide a list of SMB/CIFS servers or with the plugin UPnP to provide
> +	  a list of UPnP servers on the local network.
> +	  The neighbor plugin needs configuration in mpd.conf. For further
> +	  information take a look at the MPD documentation.

After looking a bit at the MPD configure.ac script and Makefile.am, it
appeared to me that this feature doesn't do anything useful if there
isn't either smbclient or upnp support enabled, so I made this option
depends on smbclient or upnp support.

Applied with this change, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
