From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Mar 2016 23:56:29 +0100
Subject: [Buildroot] [PATCH 2/2] Revert "gcc/gcc-final: pass TARGET_ABI
 flags to configure with --enable-cxx-flags"
In-Reply-To: <1457657122-7283-3-git-send-email-jcmvbkbc@gmail.com>
References: <1457657122-7283-1-git-send-email-jcmvbkbc@gmail.com>
 <1457657122-7283-3-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20160312225629.GI3745@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Max, All,

On 2016-03-11 03:45 +0300, Max Filippov spake thusly:
> This reverts commit 2dcab526a97d1dbcb73c3cd578e5bf2853853a10.
> 
> Now that gcc correctly propagates CXXFLAGS_FOR_TARGET for libstdc++
> build this is no longer needed.
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/gcc/gcc-final/gcc-final.mk | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
> index dbdb615..69fdc0c 100644
> --- a/package/gcc/gcc-final/gcc-final.mk
> +++ b/package/gcc/gcc-final/gcc-final.mk
> @@ -195,8 +195,4 @@ endef
>  HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_INSTALL_USR_LIBS
>  endif
>  
> -ifeq ($(BR2_xtensa),y)
> -HOST_GCC_FINAL_CONF_OPTS += --enable-cxx-flags="$(TARGET_ABI)"
> -endif
> -
>  $(eval $(host-autotools-package))
> -- 
> 2.1.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
