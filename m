From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 17 Jul 2016 13:46:27 +0200
Subject: [Buildroot] [PATCH 1/6] package/busybox: add comment about
 BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
In-Reply-To: <ce037a071acb910af0b9b962885496169848718b.1468744792.git.yann.morin.1998@free.fr>
References: <cover.1468744792.git.yann.morin.1998@free.fr>
 <ce037a071acb910af0b9b962885496169848718b.1468744792.git.yann.morin.1998@free.fr>
Message-ID: <97dd0669-ee80-c512-8768-54ff4d2b1ed7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All,

Le 17/07/2016 ? 10:44, Yann E. MORIN a ?crit :
> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is a bit special. When Busybox is
> enabled, it is a Busybox option. When Busybox is not enabled, it is a
                                                       ^
s/enabled/disabled/

> stand-alone option, forcibly enabled.
> 
> So we can safely 'select' it without ensuring (via a 'depends on' or
> another 'select') that Busybox is enabled.
> 
> However, the name of this option does not express the fact that it is
> safe to select it without checking Busybox, which can lead to a bit of
> time-consuming head-scratching.
> 
> To avoid future puzzlement from an unsuspecting observer, adda a big fat
                                                               ^
add a

> comment that this option can be selected without any dependency on
> busybox.
  ^
Busybox

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Romain Naour <romain.naour@openwide.fr>
> 
> ---
> Changes v2 -> v3:
>   - add the comment  (Romain)
>   - drop the condition select  (Romain)
> 
> Changes v1 -> v2:
>   - only select if busybox is enabled  (Thomas)
> 
> ---
> Hopefully, this will avoid people to go hunting like I did, and loose a
> few precious minutes of hair-pulling... ;-]
> ---
>  package/busybox/Config.in | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/package/busybox/Config.in b/package/busybox/Config.in
> index 91c5d9e..8f84fc9 100644
> --- a/package/busybox/Config.in
> +++ b/package/busybox/Config.in
> @@ -26,6 +26,8 @@ config BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES
>  	  A space-separated list of configuration fragment files,
>  	  that will be merged to the main BusyBox configuration file.
>  
> +# This option is not an option of Busybox, it can be selected even
> +# if Busybox is not enabled.
>  config BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  	bool "Show packages that are also provided by busybox"
>  	help
> @@ -75,7 +77,9 @@ endif
>  
>  if !BR2_PACKAGE_BUSYBOX # kconfig doesn't support else
>  
> -# add dummy config so the stuff with busybox alternatives are shown
> +# This option is not an option of Busybox, it can be selected even
> +# if Busybox is not enabled.
> +# Add dummy config so the stuff with busybox alternatives are shown
                                        ^
>  # when busybox is disabled
          ^
While at it, add a capital letter to Busybox.

With the (very) small typos fixed:
Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain


>  config BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  	default y
> 
