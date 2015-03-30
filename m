From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Mar 2015 18:33:36 +0200
Subject: [Buildroot] [PATCH 19/35] fs: add rootfs dependencies to
	PACKAGES
In-Reply-To: <1427650429-9293-20-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1427650429-9293-20-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150330163336.GC4318@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-03-29 19:33 +0200, Thomas Petazzoni spake thusly:
> The logic for creating most of the filesystem images requires a
> certain number of host packages to be built. However, those packages
> are not currently listed in the global PACKAGES variables, and they
> are not dependencies of any other package listed in the PACKAGES
> variable.
> 
> While it does not have any practical implications, it makes sense to
> have those packages listed in the global PACKAGES variable, which this
> commit implements.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  fs/common.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/common.mk b/fs/common.mk
> index cac127f..41ee86d 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -106,6 +106,7 @@ rootfs-$(1): $$(BINARIES_DIR)/rootfs.$(1) $$(ROOTFS_$(2)_POST_TARGETS)
>  
>  ifeq ($$(BR2_TARGET_ROOTFS_$(2)),y)
>  TARGETS_ROOTFS += rootfs-$(1)
> +PACKAGES += $$(ROOTFS_$(2)_DEPENDENCIES)
>  endif
>  endef
>  
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
