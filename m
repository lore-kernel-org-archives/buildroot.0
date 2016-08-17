From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 17 Aug 2016 08:57:08 +0300
Subject: [Buildroot] [PATCH] m68k: flat one memory region works with
 small kernel patch
In-Reply-To: <20160817054959.GA20899@waldemar-brodkorb.de>
References: <20160817054959.GA20899@waldemar-brodkorb.de>
Message-ID: <20160817055708.GI3368@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

On Wed, Aug 17, 2016 at 07:49:59AM +0200, Waldemar Brodkorb wrote:
> Greg Ungerer fixed recently a bug in the Linux kernel, which
> allows to use one memory region again.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  arch/Config.in                                     |  2 +-
>  .../patches/linux/m68knommu-fix-signal.patch       | 45 ++++++++++++++++++++++
>  configs/qemu_m68k_mcf5208_defconfig                |  2 +
>  3 files changed, 48 insertions(+), 1 deletion(-)
>  create mode 100644 board/qemu/m68k-mcf5208/patches/linux/m68knommu-fix-signal.patch
> 
> diff --git a/arch/Config.in b/arch/Config.in
> index b980e05..73d240f 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -331,7 +331,7 @@ choice
>  
>  config BR2_BINFMT_FLAT_ONE
>  	bool "One memory region"
> -	depends on !BR2_m68k
> +	depends on BR2_m68k || BR2_bfin

This change excludes other noMMU arches (e.g. ARM). Is that intended?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
