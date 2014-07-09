From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 Jul 2014 23:41:38 +0200
Subject: [Buildroot] [PATCH 3/3] lm-sensors: sensors-detect requires perl
In-Reply-To: <1404939033-32578-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1404939033-32578-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1404939033-32578-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140709214138.GE3652@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-09 22:50 +0200, Thomas Petazzoni spake thusly:
> The sensors-detect program is in fact a Perl script, so it won't run
> on the target unless Perl is enabled in the configuration.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/lm-sensors/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/lm-sensors/Config.in b/package/lm-sensors/Config.in
> index 33c59fd..7065c4c 100644
> --- a/package/lm-sensors/Config.in
> +++ b/package/lm-sensors/Config.in
> @@ -44,8 +44,12 @@ config BR2_PACKAGE_LM_SENSORS_PWMCONFIG
>  
>  config BR2_PACKAGE_LM_SENSORS_SENSORS_DETECT
>  	bool "sensors-detect"
> +	depends on BR2_PACKAGE_PERL
>  	help
>  	  Sensors-detect is an interactive program for detecting
>  	  available hardware monitoring chips.
>  
> +comment "sensors-detect needs perl"
> +	depends on !BR2_PACKAGE_PERL
> +
>  endif
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
