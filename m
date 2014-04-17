From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Apr 2014 23:37:57 +0200
Subject: [Buildroot] [PATCH v5 2/8] mesa3d: Explain dependency for i965
 DRI driver on xorg in Kconfig
In-Reply-To: <1396588694-6377-3-git-send-email-bernd.kuhls@t-online.de>
References: <1396588694-6377-1-git-send-email-bernd.kuhls@t-online.de>
 <1396588694-6377-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140417213757.GB3270@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-04-04 07:18 +0200, Bernd Kuhls spake thusly:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d/Config.in |    3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index f3d855b..12ec068 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -77,6 +77,9 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_I965
>  	help
>  	  Supports all Intel GPUs.  This version is most supported by Intel.
>  
> +comment "DRI i965 driver depends on X.org"
> +	depends on !BR2_PACKAGE_XORG7

This is oncorrect: the i965 driver does not have a "depends on XORG7",
so the comment is wrong.

Either the driver is missing such a "depends on XORG7", or we should not
add this comment.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
