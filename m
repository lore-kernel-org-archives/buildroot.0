From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 17 Jun 2012 19:45:28 +0200
Subject: [Buildroot] [Buildroot patch] Add package nss-mdns.
In-Reply-To: <1338927777-10637-1-git-send-email-marek.belisko@gmail.com>
 (Marek Belisko's message of "Tue, 5 Jun 2012 22:22:57 +0200")
References: <1338927777-10637-1-git-send-email-marek.belisko@gmail.com>
Message-ID: <87fw9tg7d3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marek" == Marek Belisko <marek.belisko@gmail.com> writes:

 Marek> Signed-off-by: Marek Belisko <marek.belisko@gmail.com>
 Marek> ---
 Marek>  package/Config.in            |    1 +
 Marek>  package/nss-mdns/Config.in   |   11 +++++++++++
 Marek>  package/nss-mdns/nss-mdns.mk |   10 ++++++++++
 Marek>  3 files changed, 22 insertions(+)
 Marek>  create mode 100644 package/nss-mdns/Config.in
 Marek>  create mode 100644 package/nss-mdns/nss-mdns.mk

 Marek> diff --git a/package/Config.in b/package/Config.in
 Marek> index dde5800..e9c8a6b 100644
 Marek> --- a/package/Config.in
 Marek> +++ b/package/Config.in
 Marek> @@ -419,6 +419,7 @@ source "package/libsoup/Config.in"
 Marek>  source "package/libtorrent/Config.in"
 Marek>  source "package/libupnp/Config.in"
 Marek>  source "package/libvncserver/Config.in"
 Marek> +source "package/nss-mdns/Config.in"
 Marek>  source "package/ortp/Config.in"
 Marek>  source "package/zeromq/Config.in"
 Marek>  endmenu
 Marek> diff --git a/package/nss-mdns/Config.in b/package/nss-mdns/Config.in
 Marek> new file mode 100644
 Marek> index 0000000..7a17b4e
 Marek> --- /dev/null
 Marek> +++ b/package/nss-mdns/Config.in
 Marek> @@ -0,0 +1,11 @@
 Marek> +config BR2_PACKAGE_NSS_MDNS
 Marek> +	bool "nss-mdns"
 Marek> +	help
 Marek> +	  nss-mdns is a plugin for the GNU Name Service Switch (NSS)
 Marek> +	  functionality of the GNU C Library (glibc) providing host
 Marek> +	  name resolution via Multicast DNS (aka Zeroconf, aka Apple
 Marek> +	  Rendezvous, aka Apple Bonjour), effectively allowing name
 Marek> +	  resolution by common Unix/Linux programs in the ad-hoc
 Marek> +	  mDNS domain .local.
 Marek> +
 Marek> +	  http://0pointer.de/lennart/projects/nss-mdns/

I guess this should depend on a (e)glibc toolchain, E.G.:

BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_eglibc || BR2_TOOLCHAIN_CTNG_glibc

This also only makes sense if you enable avaihi-daemon, so it should
also depend on BR2_PACKAGE_AVAHI_DAEMON.


 Marek> diff --git a/package/nss-mdns/nss-mdns.mk b/package/nss-mdns/nss-mdns.mk
 Marek> new file mode 100644
 Marek> index 0000000..a0d80d1
 Marek> --- /dev/null
 Marek> +++ b/package/nss-mdns/nss-mdns.mk
 Marek> @@ -0,0 +1,10 @@
 Marek> +#############################################################
 Marek> +#
 Marek> +# nss_mdns
 Marek> +#
 Marek> +#############################################################
 Marek> +NSS_MDNS_VERSION:=0.10
 Marek> +NSS_MDNS_SOURCE:=nss-mdns-$(NSS_MDNS_VERSION).tar.gz
 Marek> +NSS_MDNS_SITE:=http://0pointer.de/lennart/projects/nss-mdns

Minor nit, we normally use ' = ' rather than ':='.

Care to fix this and resubmit?

-- 
Bye, Peter Korsgaard
