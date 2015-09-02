From: Dinesh Guleria <din.gulu.er@gmail.com>
Date: Wed, 2 Sep 2015 16:36:51 +0530
Subject: [Buildroot] First rootfile system build using buildroot
In-Reply-To: <20150902033810.GS17874@tarshish>
References: <CAKpDV8uLvtaLFK=Oxd5vw-zpkzB9C+m0_hhmx-9meZSRViW12g@mail.gmail.com>
 <944894A3EB1D044A9003B2F944389BB20474C344F7@svr-wa-exch1.atg.lc>
 <CAKpDV8tYxteVo=nKwMih_Ub-dxCQM=xh2G-AC3riPevrMySrNw@mail.gmail.com>
 <944894A3EB1D044A9003B2F944389BB20474C3452F@svr-wa-exch1.atg.lc>
 <CAKpDV8stME3N6uU8n_DVUYp=sgLGr9RDk_563FCy8XQqRQSL5Q@mail.gmail.com>
 <944894A3EB1D044A9003B2F944389BB20474C34560@svr-wa-exch1.atg.lc>
 <944894A3EB1D044A9003B2F944389BB20474C34562@svr-wa-exch1.atg.lc>
 <CAKpDV8uny8GAJrEkEBmMdcboOrGuVQ4G09KRtL9yuvgH1XKE=Q@mail.gmail.com>
 <944894A3EB1D044A9003B2F944389BB20474C3458C@svr-wa-exch1.atg.lc>
 <CAKpDV8svFZsaBA_hZjpoM5SFdSohihmugGW_9jYps=zsNzG5Mw@mail.gmail.com>
 <20150902033810.GS17874@tarshish>
Message-ID: <CAKpDV8u0ojKAuOJMEzFOjd7dKx6k9Sm-fK8Z5xk7Y7_xdJPNyg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Baruch.

I have successfully compiled a linux rootfs.Now I am trying to compile a
linux kernel using buildroot.
My kernel settings are ;--
Kernel version : 4.0.4
kernel configuration : use an in-tree deconfig file

But i am getting following error, when make :--
linux/linux.mk:367: *** No kernel defconfig name specified, check your
BR2_LINUX_KERNEL_DEFCONFIG setting.  Stop.


What i got is Buildroot is not able to find the kernel configuration file.
But my kernel is not downloaded by the Buildroot till yet.
And kernel configuration file is generated after we perform "make
menuconfig" to kernel. How to generate kernel configuration file, in this
case ?

Already Thomas have some reply here, but i did not get answer to it.
http://lists.busybox.net/pipermail/buildroot/2013-April/070180.html

what is the diffrence betwen :--
BR2_LINUX_KERNEL_DEFCONFIG  & BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE
enviromental variable.


How to resolve this error ?

Please suggest.

Regards,
katoch

On Wed, Sep 2, 2015 at 9:08 AM, Baruch Siach <baruch@tkos.co.il> wrote:

> Hi Katoch,
>
> On Wed, Sep 02, 2015 at 05:59:37AM +0530, Dinesh Guleria wrote:
> > Now my root filesystem is build, please suggest can i run it using qemu ?
> >
> > Which version of qemu for ARM to use, any reference link which anyone on
> > list  may have used in past ?
>
> There is a list of tested qemu configurations at configs/qemu_*.
> Instructions
> for running them are in readme.txt files under board/qemu/.
>
> Hope this helps,
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150902/c4106b82/attachment.html>
