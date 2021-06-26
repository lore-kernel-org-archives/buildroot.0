From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 26 Jun 2021 22:27:37 +0200
Subject: [Buildroot] [PATCH 4/4] support/testing/tests/fs/test_ext: add
 missing "format" option for Qemu
In-Reply-To: <20210621202547.360391-4-thomas.petazzoni@bootlin.com>
References: <20210621202547.360391-1-thomas.petazzoni@bootlin.com>
 <20210621202547.360391-4-thomas.petazzoni@bootlin.com>
Message-ID: <20210626202737.GD2582576@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-06-21 22:25 +0200, Thomas Petazzoni spake thusly:
> Will avoid the following warning:
> 
>    WARNING: Image format was not specified for
>    '/home/thomas/projets/outputs/TestExt3/images/rootfs.ext3' and
>    probing guessed raw. Automatically detecting the format is
>    dangerous for raw images, write operations on block 0 will be
>    restricted. Specify the 'raw' format explicitly to remove the
>    restrictions.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/testing/tests/fs/test_ext.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/fs/test_ext.py b/support/testing/tests/fs/test_ext.py
> index 0fe8af7e6d..2a6e0c4274 100644
> --- a/support/testing/tests/fs/test_ext.py
> +++ b/support/testing/tests/fs/test_ext.py
> @@ -31,7 +31,7 @@ def boot_img_and_check_fs_type(emulator, builddir, fs_type):
>                    kernel="builtin",
>                    kernel_cmdline=["root=/dev/mmcblk0",
>                                    "rootfstype={}".format(fs_type)],
> -                  options=["-drive", "file={},if=sd".format(img)])
> +                  options=["-drive", "file={},if=sd,format=raw".format(img)])
>      emulator.login()
>      _, exit_code = emulator.run(CHECK_FS_TYPE_CMD.format(fs_type))
>      return exit_code
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
