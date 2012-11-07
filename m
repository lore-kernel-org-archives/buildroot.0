From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 07 Nov 2012 09:14:42 +0100
Subject: [Buildroot] [PATCHv2 10/10] Make savedefconfig save to a
 configured file.
In-Reply-To: <1351063027-13800-11-git-send-email-arnout@mind.be>
References: <1351063027-13800-1-git-send-email-arnout@mind.be>
 <1351063027-13800-11-git-send-email-arnout@mind.be>
Message-ID: <509A1872.1040108@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout Vandecappelle (Essensium/Mind) wrote:
> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
>
> Store BR2_DEFCONFIG in .config, and use it to update the original input
> defconfig file after updating the configuration.  When a config is
> created by using the BR2_DEFCONFIG=... option, this is saved in the
> .config file; later runs of savedefconfig will update that same location.
> It is also possible to configure this place in the interactive
> configuration.
>
> The BR2_DEFCONFIG value itself is not saved into the generated
> defconfig, since Kconfig considers it at its default. This is
> intentional, to avoid hard-coding an absolute path in the defconfig.
> It will anyway be set again when the defconfig is used with the
> 'make BR2_DEFCONFIG=... defconfig' command.
>
> As a side-effect of this change, the *config options have been moved out
> of the BR2_HAVE_DOT_CONFIG condition.  This doesn't make any functional
> difference, because the .config is still not read for the *config targets.
> However, the defconfig and savedefconfig targets do need to include
> .config now, which makes them slightly slower.
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

...snip...

> diff --git a/docs/manual/customize-store.txt b/docs/manual/customize-store.txt
> index 05d1061..77b079c 100644
> --- a/docs/manual/customize-store.txt
> +++ b/docs/manual/customize-store.txt
> @@ -163,6 +163,7 @@ the buildroot tree).
>      * +BR2_TOOLCHAIN_CTNG_CONFIG+
>      * +BR2_UCLIBC_CONFIG+
>      * +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE+
> +1. Set +BR2_DEFCONFIG+ to +<path-to-board-directory>/buildroot.config+

I've always been saving my Buildroot board config in configs/, to allow
me to startup from a clean working copy with a simple:
   make myboard_defconfig

The location you suggest requires a bit more typing, but it is probably
cleaner, and it does not prevent me to continue my way... so:

Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

Luca
