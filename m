From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Mar 2015 00:22:41 +0200
Subject: [Buildroot] [PATCH 17/35] Makefile: targets are now declared
 phony by the appropriate infrastructures
In-Reply-To: <1427650429-9293-18-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1427650429-9293-18-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150329222241.GR4093@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-03-29 19:33 +0200, Thomas Petazzoni spake thusly:
> The main Makefile was declaring a subset of the per-package targets as
> being PHONY, but not all of them. Now that the pkg-generic package
> infrastructure is taking care of that in a much more systematic
> fashion, this commit gets rid of the unneeded code from the main
> Makefile.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  Makefile | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 56477bb..15341be 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -395,7 +395,6 @@ include fs/common.mk
>  include $(BR2_EXTERNAL)/external.mk
>  
>  TARGETS_SOURCE := $(patsubst %,%-source,$(TARGETS))
> -TARGETS_DIRCLEAN := $(patsubst %,%-dirclean,$(TARGETS))
>  
>  # host-* dependencies have to be handled specially, as those aren't
>  # visible in Kconfig and hence not added to a variable like TARGETS.
> @@ -431,9 +430,7 @@ world: target-post-image
>  
>  .PHONY: all world toolchain dirs clean distclean source outputmakefile \
>  	legal-info legal-info-prepare legal-info-clean printvars \
> -	target-finalize target-post-image \
> -	$(TARGETS) $(TARGETS_ROOTFS) \
> -	$(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO)

Not true, wince your previous patch forgot to add $(1)-legal-info as
.PHONY.

However, when that's fixed in the previous patch:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> +	target-finalize target-post-image
>  
>  ################################################################################
>  #
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
