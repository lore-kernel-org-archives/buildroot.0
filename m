From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 26 Apr 2015 15:59:51 +0300
Subject: [Buildroot] [PATCH 1/2] libnfs: Without native RPC use libtirpc
In-Reply-To: <1430052871-6235-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1430052871-6235-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20150426125951.GL2258@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime,

On Sun, Apr 26, 2015 at 02:54:30PM +0200, Maxime Hadjinlian wrote:
> As it's done with nfs-utils, use libtirpc when no native rpc support
> exists in the toolchain.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/libnfs/Config.in | 5 +----
>  package/libnfs/libnfs.mk | 4 ++++
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libnfs/Config.in b/package/libnfs/Config.in
> index 6642fe4..e9b939f 100644
> --- a/package/libnfs/Config.in
> +++ b/package/libnfs/Config.in
> @@ -1,10 +1,7 @@
>  config BR2_PACKAGE_LIBNFS
>  	bool "libnfs"
> -	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
> +	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC

What about libtirpc dependencies?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
