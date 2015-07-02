From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 2 Jul 2015 23:02:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/gcc: fix ARC failure to build
 in 2 phases.
In-Reply-To: <1435848294-5891-1-git-send-email-talz@ezchip.com>
References: <1435848294-5891-1-git-send-email-talz@ezchip.com>
Message-ID: <20150702210212.GG3838@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tal, All,

On 2015-07-02 17:44 +0300, Tal Zilcer spake thusly:
> From: Tal Zilcer <talz@ezchip.com>
> 
> When working with GCC initial at override source dir mode the
> HOST_GCC_INITIAL_POST_PATCH_HOOKS is not called and compilation failes.
> The solution is to use HOST_GCC_INITIAL_POST_RSYNC_HOOKS since this hook
> is being called at override source dir mode.
> 
> Signed-off-by: Tal Zilcer <talz@ezchip.com>

Based on the feedback from Alexey:
    http://lists.busybox.net/pipermail/buildroot/2015-July/131358.html

a post-rsync hook seems the most appropriate solution short- and
mid-term, so:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/gcc/gcc-initial/gcc-initial.mk |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
> index 0fa2353..6bb7997 100644
> --- a/package/gcc/gcc-initial/gcc-initial.mk
> +++ b/package/gcc/gcc-initial/gcc-initial.mk
> @@ -34,6 +34,7 @@ define HOST_GCC_INITIAL_DISABLE_LIBGMON
>  		$(@D)/libgcc/config.host
>  endef
>  HOST_GCC_INITIAL_POST_PATCH_HOOKS += HOST_GCC_INITIAL_DISABLE_LIBGMON
> +HOST_GCC_INITIAL_POST_RSYNC_HOOKS += HOST_GCC_INITIAL_DISABLE_LIBGMON
>  endif
>  
>  HOST_GCC_INITIAL_CONF_OPTS = \
> -- 
> 1.7.1
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
