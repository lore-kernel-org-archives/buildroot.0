From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 Mar 2013 14:55:01 +0100
Subject: [Buildroot] [PATCH 4/6] fs/ext2: use the ext2 variant to name
 the generated rootfs image
In-Reply-To: <1d86b1b76a2c56aaf0098ec389e570862e7aa3fb.1362693453.git.yann.morin.1998@free.fr>
References: <cover.1362693453.git.yann.morin.1998@free.fr>
 <1d86b1b76a2c56aaf0098ec389e570862e7aa3fb.1362693453.git.yann.morin.1998@free.fr>
Message-ID: <20130310145501.7e5dec1f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu,  7 Mar 2013 23:04:41 +0100, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  fs/ext2/ext2.mk |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
> index 1660d9c..57acad7 100644
> --- a/fs/ext2/ext2.mk
> +++ b/fs/ext2/ext2.mk
> @@ -29,4 +29,4 @@ define ROOTFS_EXT2_CMD
>  	PATH=$(TARGET_PATH) $(EXT2_ENV) fs/ext2/genext2fs.sh -d $(TARGET_DIR) $(EXT2_OPTS) $@
>  endef
>  
> -$(eval $(call ROOTFS_TARGET,ext2))
> +$(eval $(call ROOTFS_TARGET,ext2,ext$(BR2_TARGET_ROOTFS_EXT2_GEN)))

It is not a very strong opinion here, but I'm not sure I like this idea
of the file extension being dependent on BR2_TARGET_ROOTFS_EXT2_GEN.

I think I would have preferred something that renames the filesystem
to:

$(eval $(call ROOTFS_TARGET,ext))

which generates a rootfs.ext image, with a compatibility symbolic link
ext2 -> ext. This can for example be done in a
ROOTFS_EXT_POST_GEN_HOOKS.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
