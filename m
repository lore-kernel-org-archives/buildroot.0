From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Jul 2021 10:19:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/mpg123: Remove disable-lfs-alias
In-Reply-To: <YJvT8OBjdRJGM_NIy1jk4OLrxzBuhRAPbcJUM28fU3mjJoMmVKMiV4qQIMsCejUhiNT5o5yL_G-k-GF81J1_H4FSm7n6Pv1EgaIr4sdXXIo=@protonmail.com>
References: <YJvT8OBjdRJGM_NIy1jk4OLrxzBuhRAPbcJUM28fU3mjJoMmVKMiV4qQIMsCejUhiNT5o5yL_G-k-GF81J1_H4FSm7n6Pv1EgaIr4sdXXIo=@protonmail.com>
Message-ID: <20210717081957.GG12203@scaer>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Bruno, All,

On 2021-07-12 18:30 +0000, gameblabla via buildroot spake thusly:
> From 81b245ab8b14126a1726154542bcef5e56863649 Mon Sep 17 00:00:00 2001
> From: Bruno Marie <gameblabla@protonmail.com>
> Date: Mon, 12 Jul 2021 20:22:35 +0200
> Subject: [PATCH 1/1] package/mpg123: Remove disable-lfs-alias

Not sure how you sent your patch, but the mail was completely mangled,
and the patch did not apply.

Please, ue 'git send-email' next time, as this sends proper mails that
can be applied without error.

> disable-lfs-alias causes undefined references for apps that want to link against mpg123.

I expanded the commit log with the reference to the commit that
introduced that option, and added an excerpt for the help entry of that
option too, to exp[lain that we should not use it.

However, I don't recall having seen any build issue in the autobuilders.
What application is failing to link?

> Signed-off-by: Bruno Marie <gameblabla@protonmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mpg123/mpg123.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
> index 9aa9cd1c10..7362db2138 100644
> --- a/package/mpg123/mpg123.mk
> +++ b/package/mpg123/mpg123.mk
> @@ -7,7 +7,7 @@
>  MPG123_VERSION = 1.25.15
>  MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
>  MPG123_SITE = http://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
> -MPG123_CONF_OPTS = --disable-lfs-alias
> +MPG123_CONF_OPTS =
>  MPG123_INSTALL_STAGING = YES
>  MPG123_LICENSE = LGPL-2.1
>  MPG123_LICENSE_FILES = COPYING
> --
> 2.32.0
> 
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
