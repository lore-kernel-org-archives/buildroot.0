From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Apr 2020 23:08:13 +0200
Subject: [Buildroot] [PATCH 1/2] package/mc: fix build with NLS
In-Reply-To: <20200420201644.1954370-1-fontaine.fabrice@gmail.com>
References: <20200420201644.1954370-1-fontaine.fabrice@gmail.com>
Message-ID: <20200420210813.GK5035@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-04-20 22:16 +0200, Fabrice Fontaine spake thusly:
> gettext is an optional dependency since version 4.8.24 and
> https://github.com/MidnightCommander/mc/commit/f30e6ff283f4bc86177e4360de94dad794678395
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/0e72b0b5b7d7009bd5ad5f15917e94c86e99131b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Both patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mc/mc.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/mc/mc.mk b/package/mc/mc.mk
> index f83905d89b..4e76b618d8 100644
> --- a/package/mc/mc.mk
> +++ b/package/mc/mc.mk
> @@ -9,7 +9,8 @@ MC_SOURCE = mc-$(MC_VERSION).tar.xz
>  MC_SITE = http://ftp.midnight-commander.org
>  MC_LICENSE = GPL-3.0+
>  MC_LICENSE_FILES = COPYING
> -MC_DEPENDENCIES = libglib2 host-pkgconf
> +MC_DEPENDENCIES = libglib2 host-pkgconf $(TARGET_NLS_DEPENDENCIES)
> +MC_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
>  
>  ifeq ($(BR2_PACKAGE_GPM),y)
>  MC_CONF_OPTS += --with-gpm-mouse
> -- 
> 2.25.1
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
