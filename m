From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Mar 2014 00:18:05 +0100
Subject: [Buildroot] [PATCH v6 5/6] pkg-cmake.mk: add PATH in the
 configure command environment
In-Reply-To: <1394373623-10650-6-git-send-email-s.martin49@gmail.com>
References: <1394373623-10650-1-git-send-email-s.martin49@gmail.com>
 <1394373623-10650-6-git-send-email-s.martin49@gmail.com>
Message-ID: <20140309231805.GF3194@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-03-09 15:00 +0100, Samuel Martin spake thusly:
> Because BR_PATH is not exported in the environment beforehand running
> cmake, it is necessary to add it on the cmake configure command.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> changes v4 -> v6:
> - rebase
> 
> changes v3 -> v4:
> - rebase
> - rename BR2_PATH -> BR_PATH
> 
> changes v2 -> v3:
> - rebase
> - no one-line commit log (ThomasP)
> 
> changes v1 -> v2:
> - remove explicit PATH=... in configure commands in pkg-autotools.mk
>   because it is already added via *_CONFIGURE_OPTS (ThomasP), and
>   reword the commit message.
> ---
>  package/pkg-cmake.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index f7e454b..bf3db90 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -60,6 +60,7 @@ ifeq ($(4),target)
>  define $(2)_CONFIGURE_CMDS
>  	(cd $$($$(PKG)_BUILDDIR) && \
>  	rm -f CMakeCache.txt && \
> +	PATH=$(BR_PATH) \
>  	$$($$(PKG)_CONF_ENV) $(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
>  		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
>  		-DCMAKE_INSTALL_PREFIX="/usr" \
> @@ -74,6 +75,7 @@ else
>  define $(2)_CONFIGURE_CMDS
>  	(cd $$($$(PKG)_BUILDDIR) && \
>  	rm -f CMakeCache.txt && \
> +	PATH=$(BR_PATH) \
>  	$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
>  		-DCMAKE_INSTALL_SO_NO_EXE=0 \
>  		-DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
> -- 
> 1.9.0
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
