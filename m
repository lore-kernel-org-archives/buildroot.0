From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 7 Feb 2018 11:10:34 +0100
Subject: [Buildroot] [PATCH v2 3/5] package/gdb: switch to 8.0 as the
 default version
In-Reply-To: <20180205211015.26819-4-thomas.petazzoni@bootlin.com>
References: <20180205211015.26819-1-thomas.petazzoni@bootlin.com>
 <20180205211015.26819-4-thomas.petazzoni@bootlin.com>
Message-ID: <20180207101034.GC2464@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Romain, All,

On 2018-02-05 22:10 +0100, Thomas Petazzoni spake thusly:
> From: Romain Naour <romain.naour@gmail.com>
> 
> 8.1 is around, 8.0 has already seen a point release, so it's time to
> make 8.0 the default version for gdb.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/gdb/Config.in.host | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
> index ae9a7257dd..8324271283 100644
> --- a/package/gdb/Config.in.host
> +++ b/package/gdb/Config.in.host
> @@ -45,7 +45,7 @@ config BR2_PACKAGE_HOST_GDB_SIM
>  
>  choice
>  	prompt "GDB debugger Version"
> -	default BR2_GDB_VERSION_7_11
> +	default BR2_GDB_VERSION_8_0
>  	depends on !BR2_arc
>  	help
>  	  Select the version of gdb you wish to use.
> @@ -78,8 +78,8 @@ config BR2_GDB_VERSION
>  	string
>  	default "arc-2017.09-release-gdb" if BR2_arc
>  	default "7.10.1"   if BR2_GDB_VERSION_7_10
> -	default "7.11.1"   if BR2_GDB_VERSION_7_11 || !BR2_PACKAGE_HOST_GDB
> +	default "7.11.1"   if BR2_GDB_VERSION_7_11
>  	default "7.12.1"   if BR2_GDB_VERSION_7_12
> -	default "8.0.1"    if BR2_GDB_VERSION_8_0
> +	default "8.0.1"    if BR2_GDB_VERSION_8_0 || !BR2_PACKAGE_HOST_GDB
>  	default "8.1"      if BR2_GDB_VERSION_8_1
>  	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
> -- 
> 2.14.3
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
