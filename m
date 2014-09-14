From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Sep 2014 18:19:22 +0200
Subject: [Buildroot] [PATCH v2 1/5] package/pkg-cmake.mk: remove the
 USE_CCACHE CMake flag for host-package
In-Reply-To: <1408653920-18954-2-git-send-email-s.martin49@gmail.com>
References: <1408653920-18954-1-git-send-email-s.martin49@gmail.com>
 <1408653920-18954-2-git-send-email-s.martin49@gmail.com>
Message-ID: <20140914161922.GR3917@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-08-21 22:45 +0200, Samuel Martin spake thusly:
> The USE_CCACHE CMake flag is only useful when building target package
> (only the toolchainfile.cmake uses it).
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> changes v1 -> v2:
> - no change
> ---
>  package/pkg-cmake.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index 30198a9..f5aefae 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -86,7 +86,6 @@ define $(2)_CONFIGURE_CMDS
>  		-DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY="BOTH" \
>  		-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE="BOTH" \
>  		-DCMAKE_INSTALL_PREFIX="$$(HOST_DIR)/usr" \
> -		-DUSE_CCACHE=$$(if $$(BR2_CCACHE),ON,OFF) \
>  		-DBUILD_TESTING=OFF \
>  		$$($$(PKG)_CONF_OPT) \
>  	)
> -- 
> 2.1.0
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
