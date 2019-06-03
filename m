From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Mon, 3 Jun 2019 22:11:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/libubootenv: needs threads
In-Reply-To: <20190603195926.3684-1-fontaine.fabrice@gmail.com>
References: <20190603195926.3684-1-fontaine.fabrice@gmail.com>
Message-ID: <5feaeb87-2451-8bcc-d13f-b72256039bbd@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

Le 03/06/2019 ? 21:59, Fabrice Fontaine a ?crit?:
> Fixes:
>   - http://autobuild.buildroot.org/results/813e8951530c093f46b38bf8c3b467ab6535c95b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Acked-by: Pierre-Jean Texier <pjtexier@koncepto.io>

Thanks for the fix !

> ---
>   package/libubootenv/Config.in | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/libubootenv/Config.in b/package/libubootenv/Config.in
> index 9be52c4522..016497abbb 100644
> --- a/package/libubootenv/Config.in
> +++ b/package/libubootenv/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_PACKAGE_LIBUBOOTENV
>   	bool "libubootenv"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>   	select BR2_PACKAGE_ZLIB
>   	help
>   	  libubootenv is a library that provides a hardware independent
> @@ -9,3 +10,6 @@ config BR2_PACKAGE_LIBUBOOTENV
>   	  new tools build from the library and not from U-Boot.
>   
>   	  https://github.com/sbabic/libubootenv/
> +
> +comment "libubootenv needs a toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> 

-- 
Best regards,
Pierre-Jean Texier
