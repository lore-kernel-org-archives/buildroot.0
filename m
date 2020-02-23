From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2020 09:32:27 +0100
Subject: [Buildroot] [PATCH] docs/manual: clarify the
 <PKG>_PATCH_DEPENDENCIES guarantee
In-Reply-To: <0129871638f614e8794dcf2576131d41bf64986d.1582263282.git.baruch@tkos.co.il>
References: <0129871638f614e8794dcf2576131d41bf64986d.1582263282.git.baruch@tkos.co.il>
Message-ID: <20200223083227.GH8743@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2020-02-21 07:34 +0200, Baruch Siach spake thusly:
> Unlike <PKG>_DEPENDENCIES, <PKG>_PATCH_DEPENDENCIES only guarantees
> extract and patch of listed dependencies, not build. Make this subtlety
> more explicit in the documentation.
> 
> Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  docs/manual/adding-packages-generic.txt | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
> index 59cdb7ffd72d..82d97854dde4 100644
> --- a/docs/manual/adding-packages-generic.txt
> +++ b/docs/manual/adding-packages-generic.txt
> @@ -374,9 +374,9 @@ not and can not work as people would expect it should:
>  * +LIBFOO_PATCH_DEPENDENCIES+ lists the dependencies (in terms of
>    package name) that are required for the current package to be
>    patched. These dependencies are guaranteed to be extracted and
> -  patched before the current package is patched. In a similar way,
> -  +HOST_LIBFOO_PATCH_DEPENDENCIES+ lists the dependencies for the
> -  current host package.
> +  patched (but not necessarily be built) before the current package

Here I dropped the 'be' in front of 'built'.

Applied to master, thanks! :-)

Regards,
Yann E. MORIN.

> +  is patched. In a similar way, +HOST_LIBFOO_PATCH_DEPENDENCIES+ lists
> +  the dependencies for the current host package.
>    This is seldom used; usually, +LIBFOO_DEPENDENCIES+ is what you
>    really want to use.
>  
> -- 
> 2.25.0
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
