From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 10 Sep 2014 22:14:51 +0200
Subject: [Buildroot] [PATCH V3 1/4] ltrace: Removes the libelf dependency
In-Reply-To: <1409228494-19492-2-git-send-email-gregory.clement@free-electrons.com>
References: <1409228494-19492-1-git-send-email-gregory.clement@free-electrons.com>
 <1409228494-19492-2-git-send-email-gregory.clement@free-electrons.com>
Message-ID: <20140910201451.GF23947@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gregory, All,

On 2014-08-28 14:21 +0200, Gregory CLEMENT spake thusly:
> The libelf is currently provided by 2 packages libelf and
> elfutils. The first package provides an old version of the libelf
> which is no more compatible with a recent version of ltrace. This
> patch removes the dependency on the libelf package and only keep the
> elfuils package which provides the accurate version of libelf for
> ltrace.
> 
> It will also allow to remove the libelf package and to avoid conflicts
> with two packages providing the same library.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/ltrace/Config.in | 1 -
>  package/ltrace/ltrace.mk | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/ltrace/Config.in b/package/ltrace/Config.in
> index 8cabfa2..dc759d8 100644
> --- a/package/ltrace/Config.in
> +++ b/package/ltrace/Config.in
> @@ -6,7 +6,6 @@ config BR2_PACKAGE_LTRACE
>  	# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=756764.
>  	depends on (BR2_i386 || BR2_arm \
>  		|| BR2_powerpc || BR2_sparc || BR2_x86_64)
> -	select BR2_PACKAGE_LIBELF
>  	select BR2_PACKAGE_ELFUTILS
>  	depends on BR2_LARGEFILE # elfutils
>  	depends on BR2_USE_WCHAR # elfutils
> diff --git a/package/ltrace/ltrace.mk b/package/ltrace/ltrace.mk
> index 0a3a90c..48bf7bd 100644
> --- a/package/ltrace/ltrace.mk
> +++ b/package/ltrace/ltrace.mk
> @@ -6,7 +6,7 @@
>  
>  LTRACE_VERSION = 0896ce554f80afdcba81d9754f6104f863dea803
>  LTRACE_SITE = git://anonscm.debian.org/collab-maint/ltrace.git
> -LTRACE_DEPENDENCIES = libelf elfutils
> +LTRACE_DEPENDENCIES = elfutils
>  LTRACE_CONF_OPT = --disable-werror
>  LTRACE_LICENSE = GPLv2
>  LTRACE_LICENSE_FILES = COPYING
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
