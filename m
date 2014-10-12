From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Oct 2014 18:48:45 +0200
Subject: [Buildroot] [PATCH] wpa_supplicant: uses fork(),
 not available on no-MMU platforms
In-Reply-To: <1413131995-28658-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413131995-28658-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141012164845.GC27528@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-10-12 18:39 +0200, Thomas Petazzoni spake thusly:
> The only package selecting wpa_supplicant is connman, and it is
> already depends on BR2_USE_MMU.

Indeed.

> Fixes:
> 
>   http://autobuild.buildroot.org/results/9ac/9ac3c0de573f5266a889f1ceb6d43aa92f715c55/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/wpa_supplicant/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
> index 6b1c492..6ebd2fe 100644
> --- a/package/wpa_supplicant/Config.in
> +++ b/package/wpa_supplicant/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_WPA_SUPPLICANT
>  	bool "wpa_supplicant"
> +	depends on BR2_USE_MMU # fork()
>  	depends on !BR2_avr32 # no epoll_create1
>  	help
>  	  WPA supplicant for secure wireless networks
> -- 
> 2.0.0
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
