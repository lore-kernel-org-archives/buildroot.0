From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 13 May 2014 12:46:47 +0300
Subject: [Buildroot] [PATCH] btrfs-progs: disable for avr32
In-Reply-To: <1399972577-10048-1-git-send-email-gustavo@zacarias.com.ar>
References: <1399972577-10048-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140513094647.GB4096@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Tue, May 13, 2014 at 06:16:17AM -0300, Gustavo Zacarias wrote:
> Toolchain issues prevent it from being built, also there's no AVR32 with
> proper storage ports for such a filesystem. Fixes:
> http://autobuild.buildroot.net/results/06501fd32c30549810c12f0ad50f510c4b74ee63/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/btrfs-progs/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/btrfs-progs/Config.in b/package/btrfs-progs/Config.in
> index dcd2ec5..1ef2b6b 100644
> --- a/package/btrfs-progs/Config.in
> +++ b/package/btrfs-progs/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_BTRFS_PROGS
>  	depends on BR2_USE_WCHAR # util-linux
>  	depends on BR2_USE_MMU # util-linux
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_avr32 # toolchain issues

Please update the dependencies comment as well.

baruch

>  	select BR2_PACKAGE_ACL
>  	select BR2_PACKAGE_ATTR
>  	select BR2_PACKAGE_E2FSPROGS
> -- 

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
