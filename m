From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 2 Feb 2015 10:56:41 +0100
Subject: [Buildroot] [RFC 8/8] docs/manual: update manual about
 <pkg>-help tagret
In-Reply-To: <1422394913-13257-9-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1422394913-13257-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1422394913-13257-9-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150202095641.GB3501@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-01-27 22:41 +0100, Thomas Petazzoni spake thusly:
> This commit updates the manual to:
> 
>  * Indicate the existence of the <pkg>-help target;
> 
>  * Remove the explanation about certain targets in "make help" not
>    being always visible, since this is no longer true.

That's unfortunate that we can see such help text even when the packag
is not enabled. But OK...

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  docs/manual/make-tips.txt           | 11 -----------
>  docs/manual/package-make-target.txt |  2 ++
>  2 files changed, 2 insertions(+), 11 deletions(-)
> 
> diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
> index 027eddf..2ad4dbd 100644
> --- a/docs/manual/make-tips.txt
> +++ b/docs/manual/make-tips.txt
> @@ -18,17 +18,6 @@ This is a collection of tips that help you make the most of Buildroot.
>   $ make help
>  --------------------
>  
> -Not all targets are always available,
> -some settings in the +.config+ file may hide some targets:
> -
> -* +busybox-menuconfig+ only works when +busybox+ is enabled;
> -* +linux-menuconfig+ and +linux-savedefconfig+ only work when
> -  +linux+ is enabled;
> -* +uclibc-menuconfig+ is only available when the uClibc C library is
> -  selected in the internal toolchain backend;
> -* +barebox-menuconfig+ and +barebox-savedefconfig+ only work when the
> -  +barebox+ bootloader is enabled.
> -
>  .Cleaning:
>  
>  Explicit cleaning is required when any of the architecture or toolchain
> diff --git a/docs/manual/package-make-target.txt b/docs/manual/package-make-target.txt
> index 25d3f44..4426e5f 100644
> --- a/docs/manual/package-make-target.txt
> +++ b/docs/manual/package-make-target.txt
> @@ -59,6 +59,8 @@ Additionally, there are some other useful make targets:
>  |===================================================
>  | command/target    | Description
>  
> +| +help+            | Show the available targets for this package
> +
>  | +show-depends+    | Displays the dependencies required to build the
>  package
>  
> -- 
> 2.1.0
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
