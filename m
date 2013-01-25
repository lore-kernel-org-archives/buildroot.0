From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Jan 2013 19:50:19 +0100
Subject: [Buildroot] [PATCH 2/5] docs/manual: mention the new post-image
	mechanism
In-Reply-To: <1358363393-29977-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1358363393-29977-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1358363393-29977-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <201301251950.19250.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 16 January 2013 Thomas Petazzoni wrote:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  docs/manual/customize-rootfs.txt |   15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
> index 6399699..66e38dc 100644
> --- a/docs/manual/customize-rootfs.txt
> +++ b/docs/manual/customize-rootfs.txt
> @@ -50,3 +50,18 @@ there are a few ways to customize the resulting target filesystem.
>    target root filesystem in +package/customize/source+, and then
>    enable this special package in the configuration system. _This
>    method is marked as deprecated_.
> +
> +Note also that if want to perform some specific actions *after* all

...if you want...

> +filesystem images have been created (for example to automatically
> +extract your root filesystem tarball in a location exported by your
> +NFS server, or to create a special firmware image that bundles your
> +root filesystem and kernel image, or any other custom action), you can
> +specify a list of scripts in the +BR2_ROOTFS_POST_IMAGE_SCRIPT+

... a space-separated list...

> +configuration option. Each of those scripts will be called, with the
> +path to the +images+ output directory as first and unique argument,
> +and will be executed with the main Buildroot source directory as the
> +current directory. Also, just like for the _post-build scripts_
> +mentionned above, you also have access to the following environment
> +variables from your _post-image scripts_: +BUILDROOT_CONFIG+,
> ++HOST_DIR+, +STAGING_DIR+, +TARGET_DIR+, +BINARIES_DIR+ and
> ++BASE_DIR+.

With those changes:
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
