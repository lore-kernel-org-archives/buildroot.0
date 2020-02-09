From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 9 Feb 2020 09:49:37 +0100
Subject: [Buildroot] [PATCH v2 2/3] package/qemu: do not support
 x86_steamroller or x86_core_avx2
In-Reply-To: <20200208211512.994361-2-aduskett@gmail.com>
References: <20200208211512.994361-1-aduskett@gmail.com>
 <20200208211512.994361-2-aduskett@gmail.com>
Message-ID: <20200209084937.GF23769@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2020-02-08 13:15 -0800, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> These CPU's cause segfaults with qemu.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/qemu/Config.in.host | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
> index d6b4bf6dd4..ea9281c5fb 100644
> --- a/package/qemu/Config.in.host
> +++ b/package/qemu/Config.in.host
> @@ -20,6 +20,7 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
>  	default y if BR2_sparc64
>  	default y if BR2_xtensa
>  	default y if BR2_x86_64
> +	depends on !BR2_x86_steamroller && !BR2_x86_core_avx2
>  	depends on !BR2_powerpc_620 && !BR2_powerpc_630 && !BR2_powerpc_970
>  
>  config BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS
> -- 
> 2.24.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
