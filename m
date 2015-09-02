From: Dinesh Guleria <din.gulu.er@gmail.com>
Date: Wed, 2 Sep 2015 19:24:27 +0530
Subject: [Buildroot] First rootfile system build using buildroot
In-Reply-To: <20150902114729.GA18583@tarshish>
References: <CAKpDV8tYxteVo=nKwMih_Ub-dxCQM=xh2G-AC3riPevrMySrNw@mail.gmail.com>
 <944894A3EB1D044A9003B2F944389BB20474C3452F@svr-wa-exch1.atg.lc>
 <CAKpDV8stME3N6uU8n_DVUYp=sgLGr9RDk_563FCy8XQqRQSL5Q@mail.gmail.com>
 <944894A3EB1D044A9003B2F944389BB20474C34560@svr-wa-exch1.atg.lc>
 <944894A3EB1D044A9003B2F944389BB20474C34562@svr-wa-exch1.atg.lc>
 <CAKpDV8uny8GAJrEkEBmMdcboOrGuVQ4G09KRtL9yuvgH1XKE=Q@mail.gmail.com>
 <944894A3EB1D044A9003B2F944389BB20474C3458C@svr-wa-exch1.atg.lc>
 <CAKpDV8svFZsaBA_hZjpoM5SFdSohihmugGW_9jYps=zsNzG5Mw@mail.gmail.com>
 <20150902033810.GS17874@tarshish>
 <CAKpDV8u0ojKAuOJMEzFOjd7dKx6k9Sm-fK8Z5xk7Y7_xdJPNyg@mail.gmail.com>
 <20150902114729.GA18583@tarshish>
Message-ID: <CAKpDV8vpO_2UUWUBssE6hDCV=Jh3b1sAeY4=V-b6xEazzdJAPg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> You need to set
BR2_LINUX_KERNEL_DEFCONFIG (label: "Defconfig name") to the name of your
in-tree defconfig file.
Is this file an existing file or will be created at runtime ? If existing
then where does this in-tree deconfig file lies in the buildroot directory ?

Regards,
Katoch
Hi Katoch,

On Wed, Sep 02, 2015 at 04:36:51PM +0530, Dinesh Guleria wrote:
> I have successfully compiled a linux rootfs.Now I am trying to compile a
> linux kernel using buildroot.
> My kernel settings are ;--
> Kernel version : 4.0.4
> kernel configuration : use an in-tree deconfig file
>
> But i am getting following error, when make :--
> linux/linux.mk:367: *** No kernel defconfig name specified, check your
> BR2_LINUX_KERNEL_DEFCONFIG setting.  Stop.

This means that BR2_LINUX_KERNEL_DEFCONFIG is empty. You need to set
BR2_LINUX_KERNEL_DEFCONFIG (label: "Defconfig name") to the name of your
in-tree defconfig file.

baruch

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150902/bcd9e544/attachment.html>
