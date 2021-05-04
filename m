From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 May 2021 22:36:03 +0200
Subject: [Buildroot] [PATCH 1/1] Config.in: put back legacy comment for
 BR2_ENABLE_SSP
In-Reply-To: <20210504200911.1074021-1-fontaine.fabrice@gmail.com>
References: <20210504200911.1074021-1-fontaine.fabrice@gmail.com>
Message-ID: <20210504203603.GS2137340@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-04 22:09 +0200, Fabrice Fontaine spake thusly:
> Put back legacy comment for BR2_ENABLE_SSP which was dropped with commit
> 810ba387bec3c5b6904e8893fb4cb6f9d3717466
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Good catch! Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Config.in b/Config.in
> index 51fd9dfcd7..c65e34bd5e 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -728,7 +728,7 @@ comment "PIC/PIE needs a toolchain w/ PIE"
>  
>  choice
>  	bool "Stack Smashing Protection"
> -	default BR2_SSP_ALL if BR2_ENABLE_SSP
> +	default BR2_SSP_ALL if BR2_ENABLE_SSP # legacy
>  	default BR2_SSP_STRONG if BR2_TOOLCHAIN_HAS_SSP_STRONG
>  	default BR2_SSP_REGULAR
>  	depends on BR2_TOOLCHAIN_HAS_SSP
> -- 
> 2.30.2
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
