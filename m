From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Nov 2016 21:15:28 +0100
Subject: [Buildroot] [PATCH] fs/ext2: fix double quoted label
In-Reply-To: <20161121161529.10366-1-gael.portay@savoirfairelinux.com>
References: <20161121161529.10366-1-gael.portay@savoirfairelinux.com>
Message-ID: <20161121211528.0c4a9928@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 Nov 2016 11:15:29 -0500, Ga?l PORTAY wrote:
> Since the commit 6dd7bbb59134799ed3d7343f238b3b02592faebf, the label does
> not need anymore to be quoted. Even worse it *must* not be simple-quoted,
> unless the label will contain the double-quotes from the config variable
> BR2_TARGET_ROOTFS_EXT2_LABEL.
> 
> The commit mentionned above has replaced echo by printf:
> -	echo "$$(ROOTFS_$(2)_CMD)" >> $$(FAKEROOT_SCRIPT)
> +	$$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)
> 
> Since this commit the rootfs label contains extra double-quotes.
> $ blkid
> /dev/mmcblk0: LABEL=""BR 2016.08"" UUID="xxx"
>                      ^          ^
> 
> With this fix, the extra double-quotes have disappeared:
> /dev/mmcblk0: LABEL="BR 2016.11-rc2" UUID="yyy"
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  fs/ext2/ext2.mk | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
