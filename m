From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 3 Feb 2018 16:40:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/wf111: Fix manufacturer name
 and url
In-Reply-To: <20180129082819.13870-1-corjon.j@ecagroup.com>
References: <20180129082819.13870-1-corjon.j@ecagroup.com>
Message-ID: <20180203154015.GN2369@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien, All,

On 2018-01-29 09:28 +0100, Julien Corjon spake thusly:
> Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
> ---
>  package/wf111/Config.in | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/wf111/Config.in b/package/wf111/Config.in
> index 80109f1b88..081bd960cb 100644
> --- a/package/wf111/Config.in
> +++ b/package/wf111/Config.in
> @@ -6,7 +6,7 @@ config BR2_PACKAGE_WF111
>  	# dynamically linked against the glibc.
>  	depends on BR2_TOOLCHAIN_USES_GLIBC
>  	help
> -	  BlueGiga WF111 WiFi driver and utilities.
> +	  Silicon Labs WF111 WiFi driver and utilities.
>  
>  	  Warning: CONFIG_WIRELESS_EXT and CONFIG_WEXT_PRIV must be
>  	  selected in the Linux kernel configuration. These are blind
> @@ -17,16 +17,16 @@ config BR2_PACKAGE_WF111
>  	    configuration entry that selects them, for example.
>  	  - By enabling another random WiFi driver that select them.
>  
> -	  http://www.bluegiga.com/en-US/products/wifi-modules/wf111-wifi-module/
> +	  https://www.silabs.com/products/wireless/wi-fi/wf111-bluegiga-module
>  
>  if BR2_PACKAGE_WF111
>  
>  config BR2_PACKAGE_WF111_TARBALL_PATH
>  	string "Local tarball location"
>  	help
> -	  The WF111 tarball can be retrieved on the BlueGiga website
> -	  after registration. This option specifies the path where the
> -	  tarball is locally saved.
> +	  The WF111 tarball can be retrieved on the Silicon Labs
> +	  website after registration. This option specifies the path
> +	  where the tarball is locally saved.

As I just replied to your previous patch (but you were dropped from Cc
for whatever reason), this is no longer true: one can very well do the
download without registration nowdays: try to download the URLs from
command line:

    wget 'https://www.silabs.com/documents/login/software/wf111-linux-driver-5-2-2-r3-armv5te.tar.gz'

and it magically works now. So we can drop the special local tarball
path now. Care to send a patch?

Regards,
Yann E. MORIN.

>  endif
>  
> -- 
> 2.14.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
