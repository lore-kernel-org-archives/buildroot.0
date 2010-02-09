From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Feb 2010 12:32:29 +0100
Subject: [Buildroot] [PATCH 02/14] package: added pre-configure hooks
In-Reply-To: <1265566076-10628-3-git-send-email-llandwerlin@gmail.com>
References: <1265566076-10628-1-git-send-email-llandwerlin@gmail.com>
	<1265566076-10628-3-git-send-email-llandwerlin@gmail.com>
Message-ID: <20100209123229.7ebf86e0@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Lionel,

Aren't POST_PATCH hooks sufficient ?

Thomas

On Sun,  7 Feb 2010 19:07:44 +0100
llandwerlin at gmail.com wrote:

> From: Lionel Landwerlin <llandwerlin@gmail.com>
> 
> Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
> ---
>  package/Makefile.package.in |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/package/Makefile.package.in b/package/Makefile.package.in
> index d02706d..79d3a13 100644
> --- a/package/Makefile.package.in
> +++ b/package/Makefile.package.in
> @@ -141,6 +141,7 @@ $(BUILD_DIR)/%/.stamp_patched:
>  # Configure
>  $(BUILD_DIR)/%/.stamp_configured:
>  	@$(call MESSAGE,"Configuring")
> +	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call
> $(hook))$(sep)) $($(PKG)_CONFIGURE_CMDS)
>  	$(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call
> $(hook))$(sep)) $(Q)touch $@
> @@ -281,6 +282,7 @@ $(2)_TARGET_DIRCLEAN =
> $$($(2)_DIR)/.stamp_dircleaned # new-style hooks
>  $(2)_POST_EXTRACT_HOOKS           ?=
>  $(2)_POST_PATCH_HOOKS             ?=
> +$(2)_PRE_CONFIGURE_HOOKS          ?=
>  $(2)_POST_CONFIGURE_HOOKS         ?=
>  $(2)_POST_BUILD_HOOKS             ?=
>  $(2)_POST_INSTALL_HOOKS           ?=


-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
