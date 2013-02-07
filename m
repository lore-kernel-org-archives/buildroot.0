From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 7 Feb 2013 15:26:24 +0100
Subject: [Buildroot] [PATCH v2 2/5] docs/manual: mention the new
 post-image mechanism
In-Reply-To: <1360187346-30258-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1360187346-30258-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1360187346-30258-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHXCMM+DVbQp1370_mqt9QbU=TVGEneuwbN7XdTE-XTkLm8BLQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

2013/2/6 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
> v1->v2:
>  * Fix typos noticed by Yann.
> ---
>  docs/manual/customize-rootfs.txt |   15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
> index fa04d85..f1d336a 100644
> --- a/docs/manual/customize-rootfs.txt
> +++ b/docs/manual/customize-rootfs.txt
> @@ -55,3 +55,18 @@ there are a few ways to customize the resulting target filesystem.
>    target root filesystem in +package/customize/source+, and then
>    enable this special package in the configuration system. _This
>    method is marked as deprecated_.
> +
> +Note also that if you want to perform some specific actions *after*
> +all filesystem images have been created (for example to automatically
> +extract your root filesystem tarball in a location exported by your
> +NFS server, or to create a special firmware image that bundles your
> +root filesystem and kernel image, or any other custom action), you can
> +specify a space-separated list of scripts in the
> ++BR2_ROOTFS_POST_IMAGE_SCRIPT+ configuration option. Each of those
> +scripts will be called, with the path to the +images+ output directory
> +as first and unique argument, and will be executed with the main
> +Buildroot source directory as the current directory. Also, just like
> +for the _post-build scripts_ mentionned above, you also have access to
> +the following environment variables from your _post-image scripts_:
> ++BUILDROOT_CONFIG+, +HOST_DIR+, +STAGING_DIR+, +TARGET_DIR+,
> ++BINARIES_DIR+ and +BASE_DIR+.

Nothing about how these post-image scripts are run (no fakeroot, and so on).

Regards,

-- 
Samuel
