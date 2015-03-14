From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Mar 2015 23:34:23 +0100
Subject: [Buildroot] [PATCH 03/15] toolchain-common: default to Y for
 LARGEFILE
In-Reply-To: <1426270934-15499-4-git-send-email-gustavo@zacarias.com.ar>
References: <1426270934-15499-1-git-send-email-gustavo@zacarias.com.ar>
 <1426270934-15499-4-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150314223423.GH4009@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-03-13 15:22 -0300, Gustavo Zacarias spake thusly:
> This will allow us to remove largefile handling in the tree without
> breaking things while doing so.

This means that, with this patch applied, it is still possible to build
an internal uClibc toolchain without LFS, and packages would believe LFS
is available...

Please add a patch just before this one, that turns
BR2_TOOLCHAIN_BUILDROOT_LARGEFILE into a promptless option that defaults
to 'y'.

Afterward, you can add my:

    Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  toolchain/toolchain-common.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
> index 304afe4..7eb22ce 100644
> --- a/toolchain/toolchain-common.in
> +++ b/toolchain/toolchain-common.in
> @@ -7,6 +7,7 @@ source "package/gdb/Config.in.host"
>  
>  config BR2_LARGEFILE
>  	bool
> +	default y
>  
>  config BR2_INET_IPV6
>  	bool
> -- 
> 2.0.5
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
