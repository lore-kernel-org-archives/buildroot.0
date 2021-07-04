From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Jul 2021 21:54:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/qemu: disable NDEBUG
In-Reply-To: <20210624141023.61171-1-caseorum@gmail.com>
References: <20210624141023.61171-1-caseorum@gmail.com>
Message-ID: <20210704195445.GG2521@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joseph, All,

On 2021-06-24 14:10 +0000, Joseph Burt spake thusly:
> QEMU cannot build with NDEBUG defined.
> 
> Signed-off-by: Joseph Burt <caseorum@gmail.com>

We are now no longer setting NDEBUG in the infra; see a1c7cff1a081.

So this patch is no longer needed; I've marked it as rejected.

Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/qemu/qemu.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index 470c285f16..c397b8883b 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -160,7 +160,7 @@ define QEMU_CONFIGURE_CMDS
>  	unset TARGET_DIR; \
>  	cd $(@D); \
>  		LIBS='$(QEMU_LIBS)' \
> -		$(TARGET_CONFIGURE_OPTS) \
> +		$(filter-out -DNDEBUG,$(TARGET_CONFIGURE_OPTS)) \
>  		$(TARGET_CONFIGURE_ARGS) \
>  		CPP="$(TARGET_CC) -E" \
>  		$(QEMU_VARS) \
> @@ -327,7 +327,7 @@ endif
>  # call the compiler.
>  define HOST_QEMU_CONFIGURE_CMDS
>  	unset TARGET_DIR; \
> -	cd $(@D); $(HOST_CONFIGURE_OPTS) CPP="$(HOSTCC) -E" \
> +	cd $(@D); $(filter-out -DNDEBUG,$(HOST_CONFIGURE_OPTS)) CPP="$(HOSTCC) -E" \
>  		./configure \
>  		--target-list="$(HOST_QEMU_TARGETS)" \
>  		--prefix="$(HOST_DIR)" \
> -- 
> 2.32.0
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
