From: jiao shuaipeng <jiaoshuaipeng@outlook.com>
Date: Sat, 8 Aug 2020 12:34:26 +0000
Subject: [Buildroot] =?gb2312?b?u9i4tDogILvYuLQ6ICBvcGVuc3NoIHRvdGFseSBj?=
 =?gb2312?b?YW4ndCB1c2Ugb24gcmlzY3YvYXJtNjQgd2l0aCBsYXRlc3QgYnVpbGRyb290?=
In-Reply-To: <VI1PR07MB4590B28AA794D730FF2D330EAB490@VI1PR07MB4590.eurprd07.prod.outlook.com>
References: <VI1PR07MB4590527D56A9FCB9F72F5A1AAB480@VI1PR07MB4590.eurprd07.prod.outlook.com>
 <20200806171237.1ba34fc8@windsurf.home>
 <VI1PR07MB4590B24946F9A63C352677A2AB480@VI1PR07MB4590.eurprd07.prod.outlook.com>
 <VI1PR07MB459024DCDA64676698CAC4F9AB490@VI1PR07MB4590.eurprd07.prod.outlook.com>,
 <20200807120037.6448d81c@gmx.net>,
 <VI1PR07MB4590B28AA794D730FF2D330EAB490@VI1PR07MB4590.eurprd07.prod.outlook.com>
Message-ID: <VI1PR07MB45902F0F059972710FA1FBA3AB460@VI1PR07MB4590.eurprd07.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter ,Thomas,

thanks

I read some materials about syscall getrandom, then I know the story behind getrandom in the kernel mail list.

I can see "uninitialized urandom read" in my kernel log, but I ignore it before.

After I enable package haveged in the buildroot, sshd is still stuck when linux is booting up, but after about 3 minutes, the sshd is getting out from the stuck, then the command line prompt comes up.

Thanks,
Best Regards,
Joseph
________________________________
???: jiao shuaipeng <jiaoshuaipeng@outlook.com>
????: 2020?8?7? 18:08
???: Peter Seiderer <ps.report@gmx.net>
??: Thomas Petazzoni <thomas.petazzoni@bootlin.com>; buildroot at busybox.net <buildroot@busybox.net>; shuaipeng.jiao at montage-tech.com <shuaipeng.jiao@montage-tech.com>; Jiaoshuaipeng at yeah.net <Jiaoshuaipeng@yeah.net>
??: ??: [Buildroot] ??: openssh totaly can't use on riscv/arm64 with latest buildroot

Dear Peter,

Thanks a lot, I will have a try, if there are some results, I will give a feedback.

Best Regards,
Thanks
Joseph
________________________________
???: Peter Seiderer <ps.report@gmx.net>
????: 2020?8?7? 18:00
???: jiao shuaipeng <jiaoshuaipeng@outlook.com>
??: Thomas Petazzoni <thomas.petazzoni@bootlin.com>; buildroot at busybox.net <buildroot@busybox.net>; shuaipeng.jiao at montage-tech.com <shuaipeng.jiao@montage-tech.com>; Jiaoshuaipeng at yeah.net <Jiaoshuaipeng@yeah.net>
??: Re: [Buildroot] ??: openssh totaly can't use on riscv/arm64 with latest buildroot

Hello Joseph,

On Fri, 7 Aug 2020 02:14:36 +0000, jiao shuaipeng <jiaoshuaipeng@outlook.com> wrote:

> Dear All,
>
> Any one has ever used the openssh8.3 built by latest buildroot on arm64/riscv platform?

Yes, works without problems with the raspberrypi4_64_defconfig on RPi4 hardware...

>
> Dose the openssh need support/dependency from the linux kernel side ?

Strace of 'sshd --help' reveals a 'getrandom()' syscall..., I think
Thomas hint according 'lack of entropy' is the right one, try with
newer kernel or an additional entropy source (hardware random
generator on real hardware, or for qemu haveged or rng-tools or
something similar)...

Regards,
Peter

>
> Thanks a lot in advance.
>
> Joseph
> ________________________________
> ???: jiao shuaipeng <jiaoshuaipeng@outlook.com>
> ????: 2020?8?7? 0:28
> ???: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ??: buildroot at busybox.net <buildroot@busybox.net>; shuaipeng.jiao at montage-tech.com <shuaipeng.jiao@montage-tech.com>; Jiaoshuaipeng at yeah.net <Jiaoshuaipeng@yeah.net>
> ??: ??: [Buildroot] openssh totaly can't use on riscv/arm64 with latest buildroot
>
> Dear Thomas,
>
> Thanks for your reply.
>
> I have ever tried to run "sshd --help" after linux is booting up inside the qemu. I see the similar phenomenon, the program is stuck.
>
> So it should not "the lack of entropy in the random number generator ".
>
> Thanks
>
> ________________________________
> ???: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ????: 2020?8?6? 23:12
> ???: jiao shuaipeng <jiaoshuaipeng@outlook.com>
> ??: buildroot at busybox.net <buildroot@busybox.net>; shuaipeng.jiao at montage-tech.com <shuaipeng.jiao@montage-tech.com>; jiaoshuaipeng at yeah.net <jiaoshuaipeng@yeah.net>
> ??: Re: [Buildroot] openssh totaly can't use on riscv/arm64 with latest buildroot
>
> On Thu, 6 Aug 2020 14:31:33 +0000
> jiao shuaipeng <jiaoshuaipeng@outlook.com> wrote:
>
> > Any one ever use openssh8.3 on RISCV/ARM64 with latest buildroot commit ?
> >
> > We found the the binary of openssh can generated successfully with the buildroot.
> > But when we run the application sshd or "ssh-keygen -a", it will be stuck.
> > I have used the GDB to find root cause why the program is stuch, i see the stach frame is corrupted.
> >
> > we are using the config "qemu_aarch64_virt_defconfig" and "qemu_riscv32_virt_defconfig", and enable the openssh with "make menucofig". qemu version is 5.0.50.  linux kernel version is 5.1.12.
>
> Could this simply due to the lack of entropy in the random number
> generator ?
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200808/6d8eff5b/attachment.html>
