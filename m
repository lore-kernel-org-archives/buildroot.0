From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 13 May 2014 07:21:18 +0300
Subject: [Buildroot] [PATCH v4 1/9] package/gdb: add gdb 7.7.x (7.7.1)
 and 7.6.x (7.6.2)
In-Reply-To: <1399953799-32054-2-git-send-email-cody@linux.vnet.ibm.com>
References: <1399953799-32054-1-git-send-email-cody@linux.vnet.ibm.com>
 <1399953799-32054-2-git-send-email-cody@linux.vnet.ibm.com>
Message-ID: <20140513042118.GV4096@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Cody,

On Mon, May 12, 2014 at 09:03:11PM -0700, Cody P Schafer wrote:
> To prep for powerpc64le, we also disable gdb prior to 7.7.1 on
> powerpc64le.
> 
> The default gdb on powerpc64le is set to 7.7.
> 7.6.

Seems like a leftover.

baruch

> 
> Signed-off-by: Cody P Schafer <cody@linux.vnet.ibm.com>
> ---
>  package/gdb/Config.in.host | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
> index e853469..9f6b880 100644
> --- a/package/gdb/Config.in.host
> +++ b/package/gdb/Config.in.host
> @@ -19,6 +19,7 @@ choice
>  	depends on !BR2_microblaze
>  	default BR2_GDB_VERSION_6_6 if BR2_bfin
>  	default BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 if BR2_avr32
> +	default BR2_GDB_VERSION_7_7 if BR2_powerpc64le
>  	default BR2_GDB_VERSION_7_5
>  	help
>  	  Select the version of gdb you wish to use.
> @@ -33,10 +34,18 @@ choice
>  
>  	config BR2_GDB_VERSION_7_4
>  		bool "gdb 7.4.x"
> -		depends on !BR2_bfin
> +		depends on !BR2_bfin && !BR2_powerpc64le
>  
>  	config BR2_GDB_VERSION_7_5
>  		bool "gdb 7.5.x"
> +		depends on !BR2_bfin && !BR2_powerpc64le
> +
> +	config BR2_GDB_VERSION_7_6
> +		bool "gdb 7.6.x"
> +		depends on !BR2_bfin && !BR2_powerpc64le
> +
> +	config BR2_GDB_VERSION_7_7
> +		bool "gdb 7.7.x"
>  		depends on !BR2_bfin
>  
>  endchoice
> @@ -54,4 +63,6 @@ config BR2_GDB_VERSION
>  	default "arc-4.8-R3" if BR2_arc
>  	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
>  	default "7.4.1"    if BR2_GDB_VERSION_7_4
> -	default "7.5.1"    if BR2_GDB_VERSION_7_5 || !BR2_PACKAGE_HOST_GDB
> +	default "7.5.1"    if BR2_GDB_VERSION_7_5
> +	default "7.6.2"    if BR2_GDB_VERSION_7_6 || !BR2_PACKAGE_HOST_GDB
> +	default "7.7.1"    if BR2_GDB_VERSION_7_7 || BR2_powerpc64le
> -- 
> 1.9.3

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
