From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 12 Oct 2012 10:41:37 +0200
Subject: [Buildroot] post-buil script in chrooted
In-Reply-To: <20121012093032.7ef6b972@skate>
References: <5077A820.7050202@free.fr>
	<20121012093032.7ef6b972@skate>
Message-ID: <CAAXf6LVCr25_i_6CMR6DYs-5z1+bVuNNYEF4DedEe3j-6=4hqg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi David,

On Fri, Oct 12, 2012 at 9:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear David Bonnin,
>
> On Fri, 12 Oct 2012 07:18:24 +0200, David Bonnin wrote:
>
>> Few ask in finalise target:
>> 1- to do root task, i can only use permission: target in each
>> packages..........
>
> Not sure I understand this part.
>
>> CAN i use a "root script" in chrooted mode?
>> ROOTFS_POST_BUILD_SCRIPT is not executed chrooted in the target.
>
> No because it doesn't make sense. Buildroot is used in many cases for
> cross-compilation, so the development machine is x86 or x86_64 and the
> target filesystem contain ARM, PowerPC or MIPS binaries. So chrooting
> into it is not possible (unless we use Qemu or something like that, but
> it's not the idea of Buildroot, we want to do cross-compilation).

Maybe you can explain why you think chroot would be necessary. What
are you trying to accomplish?
If you need to add device nodes for example, there are other ways to
do it without needing to be root.

>
>> 2-
>> why rootfs targets are generated 2 times?   (in my case: rootfs.tar
>> and rootfs.ubifs)
>> Generate 1 time and then generate tar and UBIFS is quicker.....so why?
>
> Well, this is exactly what Buildroot is doing:
>
>  1) It generates your root filesystem in output/target
>
>  2) At the end of the build it uses the contents of output/target to
>     create the different root filesystem images you requested. So if
>     you requested a tarball image and an UBIFS image, it is going to
>     call tar inside fakeroot to create the tarball image using the
>     contents of output/target, and then mkfs.ubifs inside fakeroot to
>     create the UBIFS image using the contents of output/target.
>
> Hope this helps,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
