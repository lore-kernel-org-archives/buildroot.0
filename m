From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2015 00:38:02 +0200
Subject: [Buildroot] [PATCH] mosh: don't show dependencies comment on
 unsupported arches
In-Reply-To: <b994c845f6e1f42f7a88e70dfffb4b00ce6d134e.1437949287.git.baruch@tkos.co.il>
References: <b994c845f6e1f42f7a88e70dfffb4b00ce6d134e.1437949287.git.baruch@tkos.co.il>
Message-ID: <20150726223802.GP3770@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2015-07-27 01:21 +0300, Baruch Siach spake thusly:
> Cc: Christian Stewart <christian@paral.in>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Thanks for spotting that! :-)

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/mosh/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/mosh/Config.in b/package/mosh/Config.in
> index 2f5214cd3c88..4ad7d61023b6 100644
> --- a/package/mosh/Config.in
> +++ b/package/mosh/Config.in
> @@ -1,5 +1,6 @@
>  comment "mosh needs a toolchain w/ threads"
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !(BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64)
>  
>  config BR2_PACKAGE_MOSH
>  	bool "mosh"
> -- 
> 2.1.4
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
