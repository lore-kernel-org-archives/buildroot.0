From: Romain Naour <romain.naour@smile.fr>
Date: Tue, 4 Feb 2020 22:14:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/gcc: pass -Wno-error to debug
 builds
In-Reply-To: <20200204001027.126863-1-james.hilliard1@gmail.com>
References: <20200204001027.126863-1-james.hilliard1@gmail.com>
Message-ID: <7b8ffab6-a31d-6bf7-f3c7-706fb0845ba0@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi James,

Le 04/02/2020 ? 01:10, James Hilliard a ?crit?:
> Fixes:
> ../../../../libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: ?st.st_mode? may be used uninitialized in this function [-Werror=maybe-uninitialized]
>    return S_ISLNK (st.st_mode);
>                      ^
> 

Can you provide a defconfig that allow to reproduce the issue.

Thanks!

Best regards,
Romain


> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/gcc/gcc.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index 527f30bf22..badf358707 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -103,6 +103,10 @@ HOST_GCC_COMMON_CONF_ENV = \
>  GCC_COMMON_TARGET_CFLAGS = $(TARGET_CFLAGS)
>  GCC_COMMON_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
>  
> +ifeq ($(BR2_ENABLE_DEBUG),y)
> +GCC_COMMON_TARGET_CFLAGS += -Wno-error
> +endif
> +
>  # Propagate options used for target software building to GCC target libs
>  HOST_GCC_COMMON_CONF_ENV += CFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CFLAGS)"
>  HOST_GCC_COMMON_CONF_ENV += CXXFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CXXFLAGS)"
> 
