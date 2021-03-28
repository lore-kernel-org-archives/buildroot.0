From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 28 Mar 2021 22:28:27 +0200
Subject: [Buildroot] Buildroot post-image script error
In-Reply-To: <1616952718209-0.post@n4.nabble.com>
References: <1616952718209-0.post@n4.nabble.com>
Message-ID: <20210328222827.7e8c6976@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 28 Mar 2021 12:31:58 -0500 (CDT), lucavermei <lucavermei@gmail.com> wrote:

> Hi all,
> I am new to buildroot and I am trying to build a system for my beaglebone
> black wireless.
> The build exit with an error:
>
> >>>   Executing post-image script support/scripts/genimage.sh
> board/beaglebone/genimage.cfg:34: no sub-section title/index for 'config'
> INFO: cmd: "mkdir -p "/home/luca/buildroot/output/build/genimage.tmp""
> (stderr):
> INFO: cmd: "rm -rf "/home/luca/buildroot/output/build/genimage.tmp"/*"
> (stderr):
> INFO: cmd: "mkdir -p "/home/luca/buildroot/output/build/genimage.tmp""
> (stderr):
> INFO: cmd: "cp -a "/tmp/tmp.PeR17MSHjT"
> "/home/luca/buildroot/output/build/genimage.tmp/root"" (stderr):
> INFO: cmd: "find '/home/luca/buildroot/output/build/genimage.tmp/root'
> -depth -type d -printf '%P\0' | xargs -0 -I {} touch -r
> '/tmp/tmp.PeR17MSHjT/{}'
> '/home/luca/buildroot/output/build/genimage.tmp/root/{}'" (stderr):
> ERROR: file(am335x-evm.dtb):
> stat(/home/luca/buildroot/output/images/am335x-evm.dtb) failed: No such file
> or directory
> ERROR: vfat(boot.vfat): could not setup am335x-evm.dtb
> make[1]: *** [Makefile:836: target-post-image] Error 1
> make: *** [Makefile:84: _all] Error 2
>
> In my config I set the option build a device tree blob and In-tree device
> tree source file names "am335x-boneblack-wireless"
> If a do ls in /buildroot/output/images I get:
> am335x-boneblack-wireless.dtb  MLO  rootfs.tar  u-boot.img  uEnv.txt  zImage
>
> How can I fix the problem with the post image script?

Edit board/beaglebone/genimage.cfg to suit your customization (or change
to use your own file, see BR2_ROOTFS_POST_SCRIPT_ARGS in your config
file)...

Regards,
Peter

>
>
>
>
>
> --
> Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
