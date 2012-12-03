From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Dec 2012 14:07:58 +0100
Subject: [Buildroot] [PATCH] [RFC] new target: live filesystem
In-Reply-To: <1354531204-17481-1-git-send-email-jeremy.rosen@openwide.fr>
References: <1354003953-10875-1-git-send-email-jeremy.rosen@openwide.fr>
 <1354531204-17481-1-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <20121203140758.25732492@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?my Rosen,

On Mon,  3 Dec 2012 11:40:03 +0100, J?r?my Rosen wrote:

> diff --git a/fs/live/live.mk b/fs/live/live.mk
> new file mode 100644
> index 0000000..33fe515
> --- /dev/null
> +++ b/fs/live/live.mk
> @@ -0,0 +1,20 @@
> +#############################################################
> +#
> +# Build the live root filesystem directory
> +#
> +#############################################################
> +
> +
> +define ROOTFS_LIVE_CMD
> + sudo rsync -a --no-o --no-g --delete-during $(TARGET_DIR)/ $(BR2_TARGET_ROOTFS_LIVE_DEST)/
> +endef

Do we really want to include sudo commands in Buildroot? I'm not sure
we want.

What about instead a post-image script hook, that users can use to
extract automatically the tarball image somewhere?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
