From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Feb 2015 15:13:13 +0100
Subject: [Buildroot] [PATCH v4 2/3] system: Defaulting TZ_LOCALTIME to
	UTC
In-Reply-To: <1423748972-17471-3-git-send-email-angelo.compagnucci@gmail.com>
References: <1423748972-17471-1-git-send-email-angelo.compagnucci@gmail.com>
 <1423748972-17471-3-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20150215141313.GA4211@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo, All,

On 2015-02-12 14:49 +0100, Angelo Compagnucci spake thusly:
> This patch sets the default timezone to UTC if not overwritten.
> Some packages need a configured system timezone for properly
> operating like mono based software.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

I was at first a bit sceptic about the "Etc/" prefix, but indeed, UTC is
not a "top-level" timezone; I was confusing it with GMT, which is a
"top-level" timezone. So:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  system/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/system/Config.in b/system/Config.in
> index 95e10ab..d967002 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -371,6 +371,7 @@ config BR2_TARGET_TZ_ZONELIST
>  
>  config BR2_TARGET_LOCALTIME
>  	string "default local time"
> +	default "Etc/UTC"
>  	help
>  	  The time zone to install as the default local time, expressed as a
>  	  tzdata location, such as:
> -- 
> 1.9.1
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
