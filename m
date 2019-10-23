From: Michael Walle <michael@walle.cc>
Date: Wed, 23 Oct 2019 18:39:42 +0200
Subject: [Buildroot] [PATCH v3 6/9] package/sysrepo: add package
In-Reply-To: <20191011124131.28246-7-heiko.thiery@gmail.com>
References: <20191011124131.28246-1-heiko.thiery@gmail.com>
 <20191011124131.28246-7-heiko.thiery@gmail.com>
Message-ID: <5e8d93e92af7e12da2c1bdecb3d75f11@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 2019-10-11 14:40, schrieb heiko.thiery at gmail.com:
> From: Heiko Thiery <heiko.thiery@kontron.com>
> 
> sysrepo is a YANG-based configuration and operational state
> data store for Unix/Linux applications. It is a dependency
> of Netopeer, a NETCONF server.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
> --- /dev/null
> +++ b/package/sysrepo/Config.in
> @@ -0,0 +1,26 @@
> +config BR2_PACKAGE_SYSREPO
> +	bool "sysrepo"
> +	depends on BR2_USE_MMU # libnetconf2
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" # 
> host-protbuf
> +	depends on BR2_HOST_GCC_AT_LEAST_4_8 # host-protobuf
> +	select BR2_PACKAGE_LIBEV
> +	select BR2_PACKAGE_LIBNETCONF2
> +	select BR2_PACKAGE_LIBAVL
> +	select BR2_PACKAGE_LIBYANG
> +	select BR2_PACKAGE_PROTOBUF_C
> +	select BR2_PACKAGE_PCRE
> +	select BR2_PACKAGE_PCRE_UCP
> +	help
> +	  Sysrepo is an YANG-based configuration and operational state
> +	  data store for Unix/Linux applications.
> +
> +	  https://github.com/sysrepo
> +
> +comment "sysrepo needs a toolchain w/ C++, threads, dynamic libraray,
> host gcc >= 4.8"
> +	depends on BR2_USE_MMU
> +	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP \
> +		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_HOST_GCC_AT_LEAST_4_8
> +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"

Sysrepo comes with examples ([1]), IMHO it would be useful to have a 
switch in Kconfig to automatically build and install these examples.

-michael

[1] 
https://github.com/sysrepo/sysrepo/blob/906927b4ee2dd0d5bd669d193fc851d14919fbd1/CMakeLists.txt#L267
