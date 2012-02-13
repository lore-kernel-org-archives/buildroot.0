From: Stephan Hoffmann <sho@relinux.de>
Date: Mon, 13 Feb 2012 19:06:17 +0100
Subject: [Buildroot] [PATCH] Adding Microblaze support to Buildroot
In-Reply-To: <87aa4nyxhh.fsf@macbook.be.48ers.dk>
References: <CAM+bi4sKSQ80WXdZscOThUX=t18C+vMWspKWB82NWNx49gsFWw@mail.gmail.com>
 <87aa4nyxhh.fsf@macbook.be.48ers.dk>
Message-ID: <4F395119.5060807@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 13.02.2012 08:59, schrieb Peter Korsgaard:
>>>>>> "Alvaro" == Alvaro Gamez <alvaro.gamez@hazent.com> writes:
> Hi,
>
>  Alvaro> I am also interested on Microblaze support, hence I rescued the
>  Alvaro> old patch from the archives, merged it against latest git
>  Alvaro> revision and published on github.com /agamez/buildroot
>
>  Alvaro> I attach the new patch, should apply cleanly to latest version
>  Alvaro> on git.
>
> Thanks.
>
>  Alvaro> Even though Stephan Hoffmann work is pretty good, I think the
>  Alvaro> path of the new files should be modified from
>  Alvaro> board/relinux/avnet_LX9MicroBoard/ to board/avnet/LX9MicroBoard/
>
> I agree.
That's perfectly O.K. for me.
>  Alvaro> +++ b/configs/spartan6lx9_mb_defconfig
>  Alvaro> @@ -0,0 +1,17 @@
>  Alvaro> +BR2_microblaze=y
>  Alvaro> +BR2_TOOLCHAIN_EXTERNAL=y
>  Alvaro> +BR2_TOOLCHAIN_EXTERNAL_PATH="/opt/microblazeel-unknown-linux-gnu/"
>  Alvaro> +BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="microblazeel-unknown-linux-gnu"
>
> Is this toolchain available somewhere so I can test this?
Unfortunatelly, at the time I submitted my patch, toolchain and u-boot
were only available for download from xilinx or avnet.

The toolchain (tgz archive, binary) is available at:

|git://git.xilinx.com/xldk/microblaze_v1.0_le.git|

Some more information can be found in the Xilinx Wiki:
http://xilinx.wikidot.com/microblaze-linux-le

I tried to build u-boot, but did not succeed, mostly because of lack of
time.

There are patches for gcc available in the internet, maybe someone can
try to build the toolchain using them. It would be a great benefit being
able to build a mmu-less toolchain for small systems. Unfortunatelly, I
don't have much time for this in the next few months.

That is also true for the qemu-config. I believe it is only a few lines
in some config file away, but I am not experienced with qemu. Someone
who knows qemu and device trees may manage it quickly.
> Having a defconfig which refers to something locally on a developer
> machine imho doesn't make much sense.
>
Of course.

Kind regards

Stephan


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120213/9b41d10f/attachment-0001.html>
