From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 26 Jun 2021 22:23:49 +0200
Subject: [Buildroot] [PATCH 1/4] support/testing/tests/fs/test_ext:
 specify 16 MB as ext filesystem size
In-Reply-To: <20210621202547.360391-1-thomas.petazzoni@bootlin.com>
References: <20210621202547.360391-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210626202349.GA2582576@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-06-21 22:25 +0200, Thomas Petazzoni spake thusly:
> Since Qemu 5.1, the SD card size must be a power of two, so the
> default size for ext2/3/4 filesystem images of 60 MB is not
> suitable. Since 16 MB is used for the Ext4 test, let's use the same
> value for the other tests as well (ext2, ext2r1, ext3). Without this
> change, the ext2, ext2r1 and ext3 simply fail to run under Qemu >=
> 5.1.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/testing/tests/fs/test_ext.py | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/support/testing/tests/fs/test_ext.py b/support/testing/tests/fs/test_ext.py
> index 16b308cf6d..0fe8af7e6d 100644
> --- a/support/testing/tests/fs/test_ext.py
> +++ b/support/testing/tests/fs/test_ext.py
> @@ -43,6 +43,7 @@ class TestExt2(infra.basetest.BRTest):
>          BR2_TARGET_ROOTFS_EXT2=y
>          BR2_TARGET_ROOTFS_EXT2_2r0=y
>          BR2_TARGET_ROOTFS_EXT2_LABEL="foobaz"
> +        BR2_TARGET_ROOTFS_EXT2_SIZE="16384"
>          # BR2_TARGET_ROOTFS_TAR is not set
>          """
>  
> @@ -62,6 +63,7 @@ class TestExt2r1(infra.basetest.BRTest):
>          BR2_TARGET_ROOTFS_EXT2=y
>          BR2_TARGET_ROOTFS_EXT2_2r1=y
>          BR2_TARGET_ROOTFS_EXT2_LABEL="foobar"
> +        BR2_TARGET_ROOTFS_EXT2_SIZE="16384"
>          # BR2_TARGET_ROOTFS_TAR is not set
>          """
>  
> @@ -81,6 +83,7 @@ class TestExt3(infra.basetest.BRTest):
>          """
>          BR2_TARGET_ROOTFS_EXT2=y
>          BR2_TARGET_ROOTFS_EXT2_3=y
> +        BR2_TARGET_ROOTFS_EXT2_SIZE="16384"
>          # BR2_TARGET_ROOTFS_TAR is not set
>          """
>  
> -- 
> 2.31.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
