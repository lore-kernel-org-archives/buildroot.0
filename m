From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 04 Nov 2012 19:19:42 +0100
Subject: [Buildroot] [PATCHv2 02/10] target/generic: add filesystem
 overlay option
In-Reply-To: <1351063027-13800-3-git-send-email-arnout@mind.be>
References: <1351063027-13800-1-git-send-email-arnout@mind.be>
 <1351063027-13800-3-git-send-email-arnout@mind.be>
Message-ID: <5096B1BE.7010802@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout Vandecappelle (Essensium/Mind) wrote:
> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
>
> The filesystem overlay is a tree that is copied over the target fs
> after building everything - which is currently usually done in the
> post-build script.
>
> Also replace the documentation for a custom skeleton with the
> filesystem overlay and deprecate the custom skeleton.
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

This is definitely something we should have in Buildroot!

With the fixes below,
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

> --- a/target/generic/Config.in
> +++ b/target/generic/Config.in
> @@ -166,6 +166,17 @@ config BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
>
>   endif # BR2_ROOTFS_SKELETON_DEFAULT
>
> +config BR2_ROOTFS_OVERLAY
> +	string "Root filesystem overlay"

s/overlay/overlays/
or, even better: string "Root filesystem overlay directories"


> +	default ""
> +	help
> +	  Specify a list of directories that are copied over the target
> +	  root filesystem after the build has finished and before it is
> +	  packed into the selected filesystem images.
> +
> +	  It is copied as-is into the rootfs, excluding files ending with

s/It is/They are/

Luca
