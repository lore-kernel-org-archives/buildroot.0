From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Sat, 2 Dec 2017 16:15:01 +0100
Subject: [Buildroot] [PATCH 2/3] netcf: new package
In-Reply-To: <20171127104131.27975-3-casantos@datacom.ind.br>
References: <20171127104131.27975-1-casantos@datacom.ind.br>
 <20171127104131.27975-3-casantos@datacom.ind.br>
Message-ID: <20171202151501.GB31247@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Just a few remarks;

On Mon, Nov 27, 2017 at 08:41:30AM -0200, Carlos Santos wrote:
> 
> diff --git a/package/Config.in b/package/Config.in
> index 86acab6427..cdfb90151a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1710,6 +1710,7 @@ menu "Networking applications"
>  	source "package/nbd/Config.in"
>  	source "package/ncftp/Config.in"
>  	source "package/ndisc6/Config.in"
> +	source "package/netcf/Config.in"
>  	source "package/netatalk/Config.in"
>  	source "package/netcat/Config.in"
>  	source "package/netcat-openbsd/Config.in"

This does not follow the chronological order.

> diff --git a/package/netcf/Config.in b/package/netcf/Config.in
> new file mode 100644
> index 0000000000..d38c2dcef0
> --- /dev/null
> +++ b/package/netcf/Config.in
> @@ -0,0 +1,24 @@
> +config BR2_PACKAGE_NETCF
> +	bool "netcf"
> +	depends on !BR2_arc # augeas
> +	depends on !BR2_STATIC_LIBS # libnl
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
> +	depends on BR2_USE_MMU # fork()
> +	depends on BR2_USE_WCHAR # augeas
> +	select BR2_PACKAGE_AUGEAS
> +	select BR2_PACKAGE_LIBNL
> +	select BR2_PACKAGE_LIBXML2
> +	select BR2_PACKAGE_LIBXSLT
> +	select BR2_PACKAGE_READLINE
> +	help
> +	  netcf is a cross-platform network configuration library.
> +
> +	  It takes the description of a network interface in its own
> +	  platform-independent format and adapts the local system's
> +	  network configuration to provide that interface.
> +
> +	  Both the ncftool utility and libnetcf are installed.
> +
> +comment "netcf needs a toolchain w/ wchar"
> +	depends on !BR2_arc
> +	depends on !BR2_USE_WCHAR

	depends on !BR2_TOOLCHAIN_HAS_THREADS
	depends on BR2_STATIC_LIBS
	depends on BR2_USE_MMU

I think these could be good to include as well.k

> diff --git a/package/netcf/netcf.hash b/package/netcf/netcf.hash
> new file mode 100644
> index 0000000000..2ba2a5c204
> --- /dev/null
> +++ b/package/netcf/netcf.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256 fd81d607795547807150dfdb82bd164ab2569369ab48a30cb6b0d010d17b127c  netcf_0.2.8.orig.tar.gz

Please calculate hash for licence file as well.

Best regards
Marcus Folkesson
