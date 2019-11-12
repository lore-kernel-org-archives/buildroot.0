From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 12 Nov 2019 20:15:51 +0100
Subject: [Buildroot] Linaro Toolchain for RPI and OABI Issues
In-Reply-To: <1573542699220-0.post@n4.nabble.com>
References: <1573542699220-0.post@n4.nabble.com>
Message-ID: <20191112201551.1f1f6190@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello rscr,

On Tue, 12 Nov 2019 01:11:39 -0600 (CST), rscr <rafacrespiramon@gmail.com> wrote:

> Hello,
>
> I am new on Buildroot and I am trying to build linux with buildroot for rpi
> zero w.
>
> I have successfully build a first version using the buildroot toolchain but
> now I would like to use the rpi's one.
> (https://github.com/raspberrypi/tools/tree/master/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64)
>
> My host is running Ubuntu 16.04 on a 64-btis system.
>
> The problem is that when building I get :
>
> "External toolchain uses the unsuported OABI"
>
> I am confused. I thought the rpi's toolchain is using the eabihf, is not?
>
> Find attached my _defconfig.
>
> Thanks in advance,
>
> Rafa cp4_defconfig.cp4_defconfig
> <http://buildroot-busybox.2317881.n4.nabble.com/file/t2824/cp4_defconfig.cp4_defconfig>

Could not reproduce your build problem using your given defconfig, did a fresh checkout of

	$ cd my_toolchain_patch
	$ git clone https://github.com/raspberrypi/tools.git

And adjusted

BR2_TOOLCHAIN_EXTERNAL_PATH="<my_toolchain_path>/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64"

Builds fine here (openSUSE Tumbleweed)

Regards,
Peter

>
>
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
