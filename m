From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Nov 2016 16:56:03 +0100
Subject: [Buildroot] [PATCH] legacy: add entries for renamed MIPS CPU
	cores
In-Reply-To: <1479052161-23379-1-git-send-email-yann.morin.1998@free.fr>
References: <1479052161-23379-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20161113155603.GD3580@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2016-11-13 16:49 +0100, Yann E. MORIN spake thusly:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  Config.in.legacy | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 8c41b05..f8f826d 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -145,6 +145,26 @@ endif
>  ###############################################################################
>  comment "Legacy options removed in 2016.11"
>  
> +config BR2_mips_m6250
> +	bool "MIPS M6201 core option has been renamed"
> +	select BR2_LEGACY
> +	help
> +	  The option has been renamed to BR2_mips_m6250, which is
> +	  the real name for that core.
> +
> +	  Please verify that the correct core is selected in the
> +	  architecture variant choice.
> +
> +config BR2_mips_m5101
> +	bool "MIPS M5101 core option has been renamed"
> +	select BR2_LEGACY
> +	help
> +	  The option has been renamed to BR2_mips_m5150, which is
> +	  the real name for that core.
> +
> +	  Please verify that the correct core is selected in the
> +	  architecture variant choice.

Missing entry for removed m5100; patch updated and resent.

Regards,
Yann E. MORIN.

>  config BR2_PACKAGE_PHP_SAPI_CLI_CGI
>  	bool "PHP CGI and CLI options are now seperate"
>  	select BR2_PACKAGE_PHP_SAPI_CLI
> -- 
> 2.7.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
