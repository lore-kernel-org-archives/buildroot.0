From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 25 Feb 2013 20:46:19 +0100
Subject: [Buildroot] [PATCH] nmap: new package
In-Reply-To: <1361803191-5120-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 25 Feb 2013 11:39:51 -0300")
References: <1361803191-5120-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <877glw9nxw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/Config.in      |  1 +
 Gustavo>  package/nmap/Config.in | 16 ++++++++++++++++
 Gustavo>  package/nmap/nmap.mk   | 24 ++++++++++++++++++++++++
 Gustavo>  3 files changed, 41 insertions(+)
 Gustavo>  create mode 100644 package/nmap/Config.in
 Gustavo>  create mode 100644 package/nmap/nmap.mk

 Gustavo> diff --git a/package/Config.in b/package/Config.in
 Gustavo> index f77911f..4defd72 100644
 Gustavo> --- a/package/Config.in
 Gustavo> +++ b/package/Config.in
 Gustavo> @@ -680,6 +680,7 @@ source "package/netsnmp/Config.in"
 Gustavo>  source "package/netstat-nat/Config.in"
 Gustavo>  source "package/network-manager/Config.in"
 Gustavo>  source "package/nfacct/Config.in"
 Gustavo> +source "package/nmap/Config.in"
 Gustavo>  source "package/noip/Config.in"
 Gustavo>  source "package/ngircd/Config.in"
 Gustavo>  source "package/ngrep/Config.in"
 Gustavo> diff --git a/package/nmap/Config.in b/package/nmap/Config.in
 Gustavo> new file mode 100644
 Gustavo> index 0000000..be1be33
 Gustavo> --- /dev/null
 Gustavo> +++ b/package/nmap/Config.in
 Gustavo> @@ -0,0 +1,16 @@
 Gustavo> +config BR2_PACKAGE_NMAP
 Gustavo> +	bool "nmap"
 Gustavo> +	depends on BR2_INET_IPV6
 Gustavo> +	depends on BR2_INSTALL_LIBSTDCPP
 Gustavo> +	depends on BR2_USE_MMU # fork()
 Gustavo> +	depends on BR2_TOOLCHAIN_HAS_THREADS
 Gustavo> +	select BR2_PACKAGE_LIBPCAP
 Gustavo> +	select BR2_PACKAGE_PCRE
 Gustavo> +	help
 Gustavo> +	  Nmap ("Network Mapper") is a free and open source (license)
 Gustavo> +	  utility for network discovery and security auditing.
 Gustavo> +
 Gustavo> +	  http://nmap.org
 Gustavo> +
 Gustavo> +comment "nmap requires a toolchain with C++, IPV6 and thread support"
 Gustavo> +	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_TOOLCHAIN_HAS_THREADS)
 Gustavo> diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
 Gustavo> new file mode 100644
 Gustavo> index 0000000..a5b085d
 Gustavo> --- /dev/null
 Gustavo> +++ b/package/nmap/nmap.mk
 Gustavo> @@ -0,0 +1,24 @@
 Gustavo> +#############################################################
 Gustavo> +#
 Gustavo> +# nmap
 Gustavo> +#
 Gustavo> +#############################################################
 Gustavo> +
 Gustavo> +NMAP_VERSION = 6.01
 Gustavo> +NMAP_SITE = http://nmap.org/dist
 Gustavo> +NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
 Gustavo> +NMAP_DEPENDENCIES = libpcap pcre
 Gustavo> +NMAP_CONF_OPT = --without-liblua --without-zenmap \
 Gustavo> +	--with-libdnet=included --with-liblinear=included \
 Gustavo> +	--with-libpcre="$(STAGING_DIR)/usr"

Committed to next, thanks. It would be good to see optional lua support
as a followup.

-- 
Bye, Peter Korsgaard
