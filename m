From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Mar 2021 14:04:21 +0100
Subject: [Buildroot] [PATCH 1/3] Revert "package/janet: add -std=c99 to
 CFLAGS"
In-Reply-To: <20210313095909.93871-1-fontaine.fabrice@gmail.com>
References: <20210313095909.93871-1-fontaine.fabrice@gmail.com>
Message-ID: <20210314130421.GY2737665@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-03-13 10:59 +0100, Fabrice Fontaine spake thusly:
> This reverts commit b5e8f1c1475b46c8d9b7159aafe983e72d329d29. Indeed,
> this commit does not fix the build failure as c_std=c99 is already set
> in default_options in meson.build.
> 
> The issue is that this parameter is not used for native executables
> since meson 0.51.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Series applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/janet/janet.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/janet/janet.mk b/package/janet/janet.mk
> index ea042221d8..7243d60c01 100644
> --- a/package/janet/janet.mk
> +++ b/package/janet/janet.mk
> @@ -8,8 +8,8 @@ JANET_VERSION = 1.15.0
>  JANET_SITE = $(call github,janet-lang,janet,v$(JANET_VERSION))
>  JANET_LICENSE = MIT
>  JANET_LICENSE_FILES = LICENSE
> +
>  JANET_INSTALL_STAGING = YES
> -JANET_CFLAGS = $(TARGET_CFLAGS) -std=c99
>  
>  ifeq ($(BR2_STATIC_LIBS),y)
>  JANET_CONF_OPTS += -Ddynamic_modules=false
> -- 
> 2.30.0
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
