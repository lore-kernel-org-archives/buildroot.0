From: Carlos Santos <unixmania@gmail.com>
Date: Mon, 20 Jan 2020 11:33:26 -0300
Subject: [Buildroot] Problem generating rootfs for ci20 defconfig
In-Reply-To: <87muaimcqg.fsf@igalia.com>
References: <87muaimcqg.fsf@igalia.com>
Message-ID: <CAJ4jsafbQ9GBLYd=x95B7QZ=AAd2AdLH-+iuPNnEqhkGfKZ1uw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 20, 2020 at 11:20 AM Paulo Matos <pmatos@igalia.com> wrote:
>
> While trying to generate an image using the ci20_defconfig (on
> git 84d471a0b1) with a few
> extra libraries added I am getting the following error:
>
> >>>   Executing post-image script support/scripts/genimage.sh
> INFO: cmd: "mkdir -p "/home/pmatos/roots/br-root.jsc32-mips/build/genimage.tmp"" (stderr):
> INFO: cmd: "rm -rf "/home/pmatos/roots/br-root.jsc32-mips/build/genimage.tmp"/*" (stderr):
> INFO: cmd: "mkdir -p "/home/pmatos/roots/br-root.jsc32-mips/build/genimage.tmp"" (stderr):
> INFO: cmd: "cp -a "/tmp/tmp.ymKkcnSKic" "/home/pmatos/roots/br-root.jsc32-mips/build/genimage.tmp/root"" (stderr):
> INFO: cmd: "find '/home/pmatos/roots/br-root.jsc32-mips/build/genimage.tmp/root' -depth -type d -printf '%P\0' | xargs -0 -I {} touch -r '/tmp/tmp.ymKkcnSKic/{}' '/home/pmatos/roots/br-root.jsc32-mips/build/genimage.tmp/root/{}'" (stderr):
> ERROR: hdimage(sdcard.img): part rootfs size (62914560) too small for rootfs.ext4 (134217728)
> make[1]: *** [Makefile:808: target-post-image] Error 1
>
> Does anybody understand what this part rootfs size refers to? The
> rootfs.ext4 size if the 128M I set as BR2_TARGET_ROOTFS_EXT2_SIZE but
> unsure what the other number is, or what it means.
>
> Kind regards,
>
> Paulo Matos
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

It comes from "size = 60M" in board/ci20/genimage.cfg.

-- 
Carlos Santos <unixmania@gmail.com>
