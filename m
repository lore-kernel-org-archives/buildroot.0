From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 Nov 2019 22:00:23 +0100
Subject: [Buildroot] [PATCH 07/11] package/lvm2: drop optional readline
 dependency
In-Reply-To: <20191113151724.12155-8-peter@korsgaard.com>
References: <20191113151724.12155-1-peter@korsgaard.com>
 <20191113151724.12155-8-peter@korsgaard.com>
Message-ID: <20191113210023.GP3419@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2019-11-13 16:17 +0100, Peter Korsgaard spake thusly:
> lvm2 is licensed under GPL-2.0, which is not license compatible with
> readline (GPL-3.0+), so drop the optional dependency and add a comment
> explaining why.
> 
> Notice: The readline support is only used when the raw lvm tool is called
> without arguments.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/lvm2/lvm2.mk | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
> index 7fdb9a7e30..14575668a5 100644
> --- a/package/lvm2/lvm2.mk
> +++ b/package/lvm2/lvm2.mk
> @@ -28,13 +28,8 @@ LVM2_DEPENDENCIES += host-pkgconf libaio
>  # take into account the toolchain passed at configure time.
>  LVM2_MAKE_ENV = $(TARGET_CONFIGURE_OPTS)
>  
> -ifeq ($(BR2_PACKAGE_READLINE),y)
> -LVM2_DEPENDENCIES += readline
> -else
> -# v2.02.44: disable readline usage, or binaries are linked against provider
> -# of "tgetent" (=> ncurses) even if it's not used..
> +# package/readline is GPL-3.0+, so not license compatible
>  LVM2_CONF_OPTS += --disable-readline
> -endif
>  
>  ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
>  LVM2_CONF_OPTS += --enable-selinux
> -- 
> 2.20.1
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
