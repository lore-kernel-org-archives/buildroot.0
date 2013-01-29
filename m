From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 29 Jan 2013 17:27:14 +0100
Subject: [Buildroot] [PATCH 2/5] docs/manual: mention the new post-image
 mechanism
In-Reply-To: <1358363393-29977-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1358363393-29977-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1358363393-29977-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <5107F862.1080101@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>   docs/manual/customize-rootfs.txt |   15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>
> diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
> index 6399699..66e38dc 100644
> --- a/docs/manual/customize-rootfs.txt
> +++ b/docs/manual/customize-rootfs.txt
> @@ -50,3 +50,18 @@ there are a few ways to customize the resulting target filesystem.
>     target root filesystem in +package/customize/source+, and then
>     enable this special package in the configuration system. _This
>     method is marked as deprecated_.
> +
> +Note also that if want to perform some specific actions *after* all
> +filesystem images have been created (for example to automatically
> +extract your root filesystem tarball in a location exported by your
> +NFS server, or to create a special firmware image that bundles your
> +root filesystem and kernel image, or any other custom action), you can
> +specify a list of scripts in the +BR2_ROOTFS_POST_IMAGE_SCRIPT+
> +configuration option. Each of those scripts will be called, with the
> +path to the +images+ output directory as first and unique argument,
> +and will be executed with the main Buildroot source directory as the
> +current directory. Also, just like for the _post-build scripts_
> +mentionned above, you also have access to the following environment

s/mentionned/mentioned/

With that fix:
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
