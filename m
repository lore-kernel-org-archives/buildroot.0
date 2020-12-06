From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 06 Dec 2020 15:57:19 +0200
Subject: [Buildroot] [PATCH 2/2] package/bind: bump version to 9.16.9
In-Reply-To: <20201206134321.3881426-2-bernd.kuhls@t-online.de>
References: <20201206134321.3881426-1-bernd.kuhls@t-online.de>
 <20201206134321.3881426-2-bernd.kuhls@t-online.de>
Message-ID: <87pn3nt4u8.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Sun, Dec 06 2020, Bernd Kuhls wrote:
> diff --git a/package/bind/Config.in b/package/bind/Config.in
> index db10ceb304..59c4f05a54 100644
> --- a/package/bind/Config.in
> +++ b/package/bind/Config.in
> @@ -1,6 +1,11 @@
>  config BR2_PACKAGE_BIND
>  	bool "bind"
>  	depends on BR2_USE_MMU # fork()
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
> +	depends on BR2_USE_MMU # libuv

Duplicate dependency.

baruch

> +	depends on !BR2_STATIC_LIBS # libuv
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
> +	select BR2_PACKAGE_LIBUV
>  	help
>  	  BIND (Berkeley Internet Name Domain) is an
>  	  implementation of the Domain Name System (DNS) protocols

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
