From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Sep 2020 21:38:30 +0200
Subject: [Buildroot] [PATCH] arch/Config.in.s390x: drop redundant
 depends on BR2_s390x
In-Reply-To: <20200930192958.239834-1-thomas.petazzoni@bootlin.com>
References: <20200930192958.239834-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200930193830.GS11621@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-09-30 21:29 +0200, Thomas Petazzoni spake thusly:
> The whole arch/Config.in.s390x file is only included by arch/Config.in
> if BR2_s390x=y, so having "depends on" conditions on each options of
> the choice doesn't make much sense.

I removed it from the choice itself, but forgot to remove it from the
individual entries in the choice. Sigh... Thanks for fixing it.

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  arch/Config.in.s390x | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/arch/Config.in.s390x b/arch/Config.in.s390x
> index 1d3079c942..fa893608a5 100644
> --- a/arch/Config.in.s390x
> +++ b/arch/Config.in.s390x
> @@ -6,15 +6,12 @@ choice
>  
>  config BR2_s390x_z13
>  	bool "z13"
> -	depends on BR2_s390x
>  
>  config BR2_s390x_z14
>  	bool "z14"
> -	depends on BR2_s390x
>  
>  config BR2_s390x_z15
>  	bool "z15"
> -	depends on BR2_s390x
>  
>  endchoice
>  
> -- 
> 2.26.2
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
