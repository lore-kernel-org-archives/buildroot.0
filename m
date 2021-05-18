From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 21:07:23 +0200
Subject: [Buildroot] [PATCH 1/3] support/scripts/pkg-stats: fix flake8
 E741 ambiguous variable name
In-Reply-To: <20210518182155.47055-1-matthew.weber@collins.com>
References: <20210518182155.47055-1-matthew.weber@collins.com>
Message-ID: <20210518190723.GX2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matthew, All,

On 2021-05-18 13:21 -0500, Matthew Weber via buildroot spake thusly:
> Signed-off-by: Matthew Weber <matthew.weber@collins.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/scripts/pkg-stats | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index c7e30dfd2b..0cd3674c52 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -375,9 +375,9 @@ def package_init_make_info():
>      variable_list = [x[5:] for x in variable_list if x.startswith("HOST_")] + \
>                      [x for x in variable_list if not x.startswith("HOST_")]
>  
> -    for l in variable_list:
> +    for item in variable_list:
>          # Get variable name and value
> -        pkgvar, value = l.split("=")
> +        pkgvar, value = item.split("=")
>  
>          # Strip the suffix according to the variable
>          if pkgvar.endswith("_LICENSE"):
> -- 
> 2.17.1
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
