From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Apr 2015 21:44:33 +0200
Subject: [Buildroot] [PATCHv2 03/21] Makefile: targets are now declared
 phony by the appropriate infrastructures
In-Reply-To: <1428856685-4403-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1428856685-4403-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150413194433.GC29025@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-04-12 18:37 +0200, Thomas Petazzoni spake thusly:
> The main Makefile was declaring a subset of the per-package targets as
> being PHONY, but not all of them. Now that the pkg-generic package
> infrastructure is taking care of that in a much more systematic
> fashion, this commit gets rid of the unneeded code from the main
> Makefile.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

I'll have to withdraw that tag of mine, see below...

> ---
>  Makefile | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index f011918..fee2551 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -390,7 +390,6 @@ include fs/common.mk
>  include $(BR2_EXTERNAL)/external.mk
>  
>  TARGETS_SOURCE := $(patsubst %,%-source,$(TARGETS))
> -TARGETS_DIRCLEAN := $(patsubst %,%-dirclean,$(TARGETS))
>  
>  # host-* dependencies have to be handled specially, as those aren't
>  # visible in Kconfig and hence not added to a variable like TARGETS.
> @@ -426,9 +425,7 @@ world: target-post-image
>  
>  .PHONY: all world toolchain dirs clean distclean source outputmakefile \
>  	legal-info legal-info-prepare legal-info-clean printvars help \
> -	list-defconfigs target-finalize target-post-image \

Since you first posted that series, the 'list-defconfig' was introduced
by Arnout, and your patch removes it from being a PHONY target, which it
should be...

> -	$(TARGETS) $(TARGETS_ROOTFS) \
> -	$(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO)
> +	target-finalize target-post-image

... so should be kept in there.

When you fix that, you can keep my reviewd-by tag.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
