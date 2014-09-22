From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 22 Sep 2014 20:58:26 +0200
Subject: [Buildroot] [PATCH 08/23 v5] docs/manual: manual-update-lists
 is not a generic GENDOC rule
In-Reply-To: <d64c6de38efa0d677787438bd0c9f94fdae2ae1d.1410692670.git.yann.morin.1998@free.fr>
References: <cover.1410692670.git.yann.morin.1998@free.fr>
 <d64c6de38efa0d677787438bd0c9f94fdae2ae1d.1410692670.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LXPqwpo90bC7hS9=axsef2xwhY4HXvdr+oucwA7CTq5Mg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 14, 2014 at 1:07 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Move the manual-update-lists .PHONY declaration out of GENDOC, since not
> all the documents may have an -update-lists rule.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> ---
>  docs/manual/manual.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
> index 135ab3d..08addd1 100644
> --- a/docs/manual/manual.mk
> +++ b/docs/manual/manual.mk
> @@ -1,5 +1,6 @@
>  # Packages included in BR2_EXTERNAL are not part of buildroot, so they
>  # should not be included in the manual.
> +.PHONY: manual-update-lists
>  manual-update-lists: manual-check-dependencies-lists $(BUILD_DIR)/$(pkgname)
>         $(Q)$(call MESSAGE,"Updating the manual lists...")
>         $(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) O=$(BUILD_DIR)/$(pkgname) \
> @@ -140,7 +141,7 @@ $(call GENDOC_INNER,$(pkgname),epub,epub,epub,ePUB)
>  clean: $(pkgname)-clean
>  $(pkgname)-clean:
>         $$(Q)$$(RM) -rf $$(BUILD_DIR)/$(pkgname)
> -.PHONY: $(pkgname) $(pkgname)-clean manual-update-lists
> +.PHONY: $(pkgname) $(pkgname)-clean
>  endef
>
>  MANUAL_SOURCES = $(sort $(wildcard docs/manual/*.txt) $(wildcard docs/images/*))


Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
