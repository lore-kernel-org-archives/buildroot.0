From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Apr 2017 19:14:25 +0200
Subject: [Buildroot] [PATCH 1/1] ext2.mk: ensure -b option is always set
 for mke2img and genext2fs
In-Reply-To: <1493555747-27289-1-git-send-email-g4@novadsp.com>
References: <1493555747-27289-1-git-send-email-g4@novadsp.com>
Message-ID: <20170430171425.GC12749@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J, All,

On 2017-04-30 13:35 +0100, J Evans spake thusly:
> Signed-off-by: J Evans <g4@novadsp.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Thanks! :-)

Regards,
Yann E. MORIN.

> ---
>  fs/ext2/ext2.mk | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
> index 30f1d17..9d3e8fd 100644
> --- a/fs/ext2/ext2.mk
> +++ b/fs/ext2/ext2.mk
> @@ -6,9 +6,7 @@
>  
>  EXT2_OPTS = -G $(BR2_TARGET_ROOTFS_EXT2_GEN) -R $(BR2_TARGET_ROOTFS_EXT2_REV)
>  
> -ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)),0)
>  EXT2_OPTS += -b $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)
> -endif
>  
>  ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_INODES)),0)
>  EXT2_OPTS += -i $(BR2_TARGET_ROOTFS_EXT2_INODES)
> -- 
> 2.7.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
