From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 Jan 2019 21:33:32 +0100
Subject: [Buildroot] [PATCH 1/2] xenomai: remove unnecessary autoreconf
In-Reply-To: <20190108203854.28015-1-patrickdepinguin@gmail.com>
References: <20190108203854.28015-1-patrickdepinguin@gmail.com>
Message-ID: <20190109203332.GM4022@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas DS, All,

On 2019-01-08 21:38 +0100, Thomas De Schampheleire spake thusly:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> As xenomai release tarballs ship with a configure script, there is only a
> need for autoreconfiguring when patches are applied.
> 
> The last patch was removed with git commit
> de993bc23aab100e16026cb4cabebed48b9e1989 but the AUTORECONF line remained.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  package/xenomai/xenomai.mk | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
> index 6bf08edfbc..d88e969adb 100644
> --- a/package/xenomai/xenomai.mk
> +++ b/package/xenomai/xenomai.mk
> @@ -24,8 +24,6 @@ XENOMAI_LICENSE_FILES = debian/copyright include/COPYING kernel/cobalt/COPYING \
>  
>  XENOMAI_DEPENDENCIES = host-pkgconf
>  
> -# 0002-boilerplate-build-obstack-support-conditionally.patch
> -XENOMAI_AUTORECONF = YES
>  

This is causing failures in the CI:

    https://gitlab.com/buildroot.org/buildroot/pipelines/42622285

because there are now two consecutive empty lines.

Regards,
Yann E. MORIN.

>  XENOMAI_INSTALL_STAGING = YES
>  XENOMAI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-user
> -- 
> 2.18.1
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
