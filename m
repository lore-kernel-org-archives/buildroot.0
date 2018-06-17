From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 15:43:41 +0200
Subject: [Buildroot] [PATCH v2 2/3] shadowsocks-libev: Adding the
 pthreads dependency
In-Reply-To: <20180611181823.2722-2-xuminready@gmail.com>
References: <20180611181823.2722-1-xuminready@gmail.com>
 <20180611181823.2722-2-xuminready@gmail.com>
Message-ID: <20180617154341.29dba5b2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 11 Jun 2018 11:18:22 -0700, Min Xu wrote:
> Signed-off-by: Min Xu <xuminready@gmail.com>

Here again, the commit log was empty, which is not good. It should have
explained *why* you did this change.

> ---
>  package/shadowsocks-libev/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/shadowsocks-libev/Config.in b/package/shadowsocks-libev/Config.in
> index d02e5a9..82c88e9 100644
> --- a/package/shadowsocks-libev/Config.in
> +++ b/package/shadowsocks-libev/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_SHADOWSOCKS_LIBEV
>  	bool "shadowsocks-libev"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # require pthreads
>  	depends on BR2_USE_MMU # fork()
>  	select BR2_PACKAGE_C_ARES
>  	select BR2_PACKAGE_LIBEV

When you add a dependency on a toolchain option, you need to add the
corresponding Config.in comment:

+comment "shadowsocks-libev needs a toolchain w/ threads"
+       depends on BR2_USE_MMU
+       depends on !BR2_TOOLCHAIN_HAS_THREADS

I've added that, extended the commit log and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
