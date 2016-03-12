From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Mar 2016 23:57:09 +0100
Subject: [Buildroot] [PATCH] Revert "package/gcc: fix libgcc build for
 xtensa"
In-Reply-To: <1457660040-13917-1-git-send-email-jcmvbkbc@gmail.com>
References: <1457660040-13917-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20160312225709.GJ3745@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Max, All,

On 2016-03-11 04:34 +0300, Max Filippov spake thusly:
> This reverts commit c44cf2cc97df1729577263d2b0cb5263e8cdc4c1.
> Now that xtensa gas don't move literals into .init and .fini this fix is
> no longer needed.

Do you have an upstream reference with that fix?

Regards,
Yann E. MORIN.

> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  package/gcc/gcc.mk | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index 0fb73c9..5646b66 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -97,13 +97,6 @@ HOST_GCC_COMMON_CONF_ENV = \
>  GCC_COMMON_TARGET_CFLAGS = $(TARGET_CFLAGS)
>  GCC_COMMON_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
>  
> -# Xtensa libgcc can't be built with -mauto-litpools
> -# because of the trick used to generate .init/.fini sections.
> -ifeq ($(BR2_xtensa),y)
> -GCC_COMMON_TARGET_CFLAGS = $(filter-out -mauto-litpools,$(TARGET_CFLAGS))
> -GCC_COMMON_TARGET_CXXFLAGS = $(filter-out -mauto-litpools,$(TARGET_CXXFLAGS))
> -endif
> -
>  # Propagate options used for target software building to GCC target libs
>  HOST_GCC_COMMON_CONF_ENV += CFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CFLAGS)"
>  HOST_GCC_COMMON_CONF_ENV += CXXFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CXXFLAGS)"
> -- 
> 2.1.4
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
