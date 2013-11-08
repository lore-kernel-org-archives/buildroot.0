From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 08 Nov 2013 01:25:57 +0100
Subject: [Buildroot] [PATCH 3 of 3] infra: clean up 'Patching' message
In-Reply-To: <0f8364943e3955dbed38.1383841613@argentina>
References: <patchbomb.1383841610@argentina>
 <0f8364943e3955dbed38.1383841613@argentina>
Message-ID: <527C2F95.5080305@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/11/13 17:26, Thomas De Schampheleire wrote:
> The 'Patching' message in the generic infrastructure prints not only the
> package name, but also a reference to the assumed package directory, based
> on FOO_DIR_PREFIX/FOO_RAWNAME. This doesn't really add value, as the name
> of the package is already apparent from the message and its location should
> be obvious. Hence, this patch simply reduces the print to "Patching".
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

>
> ---
>   package/pkg-generic.mk |  2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -90,7 +90,7 @@ endif
>   $(BUILD_DIR)/%/.stamp_patched: NAMEVER = $(RAWNAME)-$($(PKG)_VERSION)
>   $(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS = $($(PKG)_DIR_PREFIX)/$(RAWNAME) $(call qstrip,$(BR2_GLOBAL_PATCH_DIR))/$(RAWNAME)
>   $(BUILD_DIR)/%/.stamp_patched:
> -	@$(call MESSAGE,"Patching $($(PKG)_DIR_PREFIX)/$(RAWNAME)")
> +	@$(call MESSAGE,"Patching")
>   	$(foreach hook,$($(PKG)_PRE_PATCH_HOOKS),$(call $(hook))$(sep))
>   	$(foreach p,$($(PKG)_PATCH),support/scripts/apply-patches.sh $(@D) $(DL_DIR) $(notdir $(p))$(sep))
>   	$(Q)( \
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
