From: Spenser Gilliland <spenser@gillilanding.com>
Date: Sun, 1 Jun 2014 11:52:16 -0500
Subject: [Buildroot] [PATCH 1/1] configs: bump zedboard to 2014.1
In-Reply-To: <CALZVapm8jFJaoOjy2cGy0HNPGB4R7M8gfvr18i8xFv+JiuAjPQ@mail.gmail.com>
References: <CALZVapnO=eXG1utmqQM7TTyNbci91K2yYM4uRNQ5N5eQaFRs_A@mail.gmail.com>
 <CAEBucnAifQGsZVyi8z42vkyug31nH_UnvS1hM12+A0x4kd_ESQ@mail.gmail.com>
 <CALZVapm8jFJaoOjy2cGy0HNPGB4R7M8gfvr18i8xFv+JiuAjPQ@mail.gmail.com>
Message-ID: <CAEBucnAj-m1G0rvL1+uHSTUMh5dhsqFy0L87_zGTqi75v6H+VA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Javier,

On Jun 1, 2014 9:14 AM, "Javier Domingo Cansino" <javierdo1@gmail.com>
wrote:
>
> Hi Spenser,
>
> > You should not run gzip this will compress the uboot header which will
make
> > it impossible for uboot to load the rfs.
> >
> > You will also need to install the u-boot.img binary to the root of the
sd
> > card.
>
> Ok, just for future references and because I finally realized that the
> rootfs.cpio.uboot was indeed compressed thought file command didn't
> say so, this should be the final SD layout:
>
> cp output/images/uImage SD/uImage
> cp output/images/rootfs.cpio.uboot SD/uramdisk.image.gz
> cp output/images/boot.bin SD/boot.bin
> cp output/images/zynq-zed.dtb SD/devicetree.dtb
> cp output/images/u-boot.img SD/u-boot.img
>

Yes, this is correct.

> > The blue led will not come on in the current configuration.  This is
because
> > no bitfile is loaded. You will need to install a bitfile on the sdcard
and
> > load it with the fpga command in uboot or the xdevcfg device in Linux.
> Ok, I had such feeling and this asserts that feeling =)
>
> > Just for reference, the patch changes the initial boot loader from the
> > Xilinx fsbl based boot loader to the uboot spl loader.
>
> Yup, I read that, the problem was that I didn't get the previous
> configuration working, this makes easier for me to start now with a
> base working system =)

Xilinx isnt currently saying that they fully support this boot pathway but
it is functional and several xilinx devs have made patches to fix bugs and
improve support.

>
> I will be looking forward for your patch to get applied, to rebase
> mine and improve the docs :)

Sounds great.   If your willing to write docs, it may be interesting to
create a wiki page on wiki.xilinx.com that walks through the whole
process.  This would give the buildroot port some additional exposure.

>
> Javier Domingo Cansino

Thanks,
Spenser
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140601/d60f6c3e/attachment.html>
