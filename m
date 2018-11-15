From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 15 Nov 2018 17:35:20 +0100
Subject: [Buildroot] [PATCH 1/1] fs/common.mk: Fix show-build-order
In-Reply-To: <20181115152541.27596-1-serj.kalichev@gmail.com>
References: <20181115152541.27596-1-serj.kalichev@gmail.com>
Message-ID: <20181115163520.GJ10271@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Serj, All,

On 2018-11-15 18:25 +0300, Serj Kalichev spake thusly:
> The command "make show-build-order" doesn't show dependencies of rootfs-common target.
> 
> This patch adds $(ROOTFS_COMMON_DEPENDENCIES) to PACKAGES variable.
> 
> Signed-off-by: Serj Kalichev <serj.kalichev@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

(I would still have preferred they be added to the _DEPENDENCIES list,
but others disagreed, so...)

Regards,
Yann E. MORIN.

> ---
>  fs/common.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/common.mk b/fs/common.mk
> index 358801d44f..e4a6a4897b 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -148,7 +148,7 @@ rootfs-$(1): $$(BINARIES_DIR)/rootfs.$(1)
>  
>  ifeq ($$(BR2_TARGET_ROOTFS_$(2)),y)
>  TARGETS_ROOTFS += rootfs-$(1)
> -PACKAGES += $$(filter-out rootfs-%,$$(ROOTFS_$(2)_DEPENDENCIES))
> +PACKAGES += $$(filter-out rootfs-%,$$(ROOTFS_$(2)_DEPENDENCIES) $$(ROOTFS_COMMON_DEPENDENCIES))
>  endif
>  
>  # Check for legacy POST_TARGETS rules
> -- 
> 2.17.1
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
