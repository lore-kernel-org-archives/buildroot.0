From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Sun, 04 Sep 2011 22:25:38 +0200
Subject: [Buildroot] [PATCH 2/3] new package: transmission
In-Reply-To: <20110904120835.3974.93412.stgit@darius-desktop>
References: <20110904120835.3974.93412.stgit@darius-desktop>
Message-ID: <4E63DEC2.7000906@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

There is already in the bug tracker an opened bug with a patch to add 
transmission :

https://bugs.busybox.net/show_bug.cgi?id=743

Even though the version is quite outdated and the patch needs a little 
refresh, it could be a good idea to base your patch on this work. 
Moreover, this patch seems a lot more complete than yours with regard to 
the options available, the init script, the dependencies, etc.

Regards,
Maxime

Le 04/09/2011 14:08, Darius Augulis a ?crit :
> Add support for new bittorrent client - transmission.
> Currently only cli and web interfaces (no GUI) are
> supported in buildroot.
>
> Signed-off-by: Darius Augulis<augulis.darius@gmail.com>
> ---
>   package/Config.in                    |    1 +
>   package/transmission/Config.in       |    4 ++++
>   package/transmission/transmission.mk |   19 +++++++++++++++++++
>   3 files changed, 24 insertions(+), 0 deletions(-)
>   create mode 100644 package/transmission/Config.in
>   create mode 100644 package/transmission/transmission.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 7112e05..c058f52 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -394,6 +394,7 @@ source "package/bridge-utils/Config.in"
>   source "package/bwm-ng/Config.in"
>   source "package/can-utils/Config.in"
>   source "package/ctorrent/Config.in"
> +source "package/transmission/Config.in"
>   source "package/cups/Config.in"
>   if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>   source "package/dhcp/Config.in"
> diff --git a/package/transmission/Config.in b/package/transmission/Config.in
> new file mode 100644
> index 0000000..30ceef4
> --- /dev/null
> +++ b/package/transmission/Config.in
> @@ -0,0 +1,4 @@
> +config BR2_PACKAGE_TRANSMISSION
> +	bool "transmission"
> +	help
> +	  Bittorrent client
> diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
> new file mode 100644
> index 0000000..488cf07
> --- /dev/null
> +++ b/package/transmission/transmission.mk
> @@ -0,0 +1,19 @@
> +#############################################################
> +#
> +# transmission
> +#
> +#############################################################
> +TRANSMISSION_VERSION = 2.33
> +TRANSMISSION_SOURCE = transmission-${TRANSMISSION_VERSION}.tar.bz2
> +TRANSMISSION_SITE = http://download.m0k.org/transmission/files/
> +
> +TRANSMISSION_CONF_OPT = \
> +	--disable-gtk \
> +	--disable-libappindicator \
> +	--disable-libcanberra \
> +	--disable-libnotify \
> +	--enable-lightweight \
> +	--enable-cli \
> +	--enable-daemon
> +
> +$(eval $(call AUTOTARGETS,package,transmission))
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
