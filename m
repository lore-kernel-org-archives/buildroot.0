From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 1 May 2017 15:13:41 +0200
Subject: [Buildroot] [PATCH 1/1] ext2: add help text for
 BR2_TARGET_ROOTFS_EXT2_BLOCKS
In-Reply-To: <1493640463-59836-1-git-send-email-g4@novadsp.com>
References: <1493640463-59836-1-git-send-email-g4@novadsp.com>
Message-ID: <20170501131341.GD3118@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J, All,

On 2017-05-01 13:07 +0100, J Evans spake thusly:
> Signed-off-by: J Evans <g4@novadsp.com>
> ---
>  fs/ext2/Config.in | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
> index 19ed140..e7cded5 100644
> --- a/fs/ext2/Config.in
> +++ b/fs/ext2/Config.in
> @@ -48,6 +48,9 @@ config BR2_TARGET_ROOTFS_EXT2_LABEL
>  config BR2_TARGET_ROOTFS_EXT2_BLOCKS
>  	int "exact size in blocks"
>  	default 61440
> +    help
> +      Determines the final size of your file system. The default
> +      value of 61440 creates a 60MB filesystem. 

The 'help' keywird should be idnented by 1 TAB; the help text it self
should be indented by 1 tab and 2 spaces.

Furthermore, a "block" is not an absolute and perfectly-defined unit of
size. Under some conditions, a block may be 512 bytes, while under other
conditions it might be 4096 bytes; whatever, depending on the context,
and users are not really used to calculate in terms of blocks.

In this case, a block is 1024 bytes.

Also, we do not usually reference the default value, unless it is very
important.

Also, 'MB' refers to power-of-ten, while here we are mostly speaking 'MiB',
which is about powers-of-two:

    https://en.wikipedia.org/wiki/Binary_prefix

What about:

    Specify the requested size for the filesystem, as a number of
    1024-byte blocks. The default, 61440, is worth a 60MiB filesystem
    (a little over 61MB).

Regards,
Yann E. MORIN.

>  
>  config BR2_TARGET_ROOTFS_EXT2_INODES
>  	int "exact number of inodes (leave at 0 for auto calculation)"
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
