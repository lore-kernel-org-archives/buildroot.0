From: Dwi Sasongko Supriyadi <ruckuus@gmail.com>
Date: Wed, 27 Apr 2011 11:28:07 +0700
Subject: [Buildroot] Buildroot 2011.02 images won't load on Qemu with
	qemu_arm_versatile_defconfig
In-Reply-To: <87d3k8512b.fsf@macbook.be.48ers.dk>
References: <BANLkTi=r-0A6Fy8FNMq+Y398sjOd6_cbPA@mail.gmail.com>
	<87ipu15or2.fsf@macbook.be.48ers.dk>
	<BANLkTinw6H=Z01BRih6rDR3-LbOcSk37uw@mail.gmail.com>
	<87d3k8512b.fsf@macbook.be.48ers.dk>
Message-ID: <BANLkTi=0dPugw0sdqGeoeHn7BYFs9a_Umg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 27, 2011 at 1:18 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "Dwi" == Dwi Sasongko Supriyadi <ruckuus@gmail.com> writes:
>
> Hi,
>
>  Dwi> I tried to use versatile config from git, but there is still the
>  Dwi> same result.  Qemu stopped after compressing Linux.
>
>  Dwi> Please correct me if I am wrong, is following the versatile
>  Dwi> config difference between 2011.02 and buildroot from git correct?
>
> Yes, that's it. Getty on the first serial port and use 2.6.38.3 rather
> than 2.6.36.
>
>  Dwi> I am a little bit puzzled but also surprised knowing that only
>  Dwi> older kernel version can be used ... should this be known as Qemu
>  Dwi> issue?
>
>  Dwi> Using 2.6.27.58 with CS toolchain or BR toolchain the image result
>  Dwi> can be used flawlessly, but not with 2.6.36/37/38. I am worried
>  Dwi> also with the fact that my qemu gets segfault when missing -m
>  Dwi> parameter. I am running Ubuntu Lucid with Qemu version
>  Dwi> 0.12.3. Could you please confirm your Qemu version?
>
> This all sounds very odd. I use:
>
> $ qemu-system-arm -version
> QEMU PC emulator version 0.12.5 (Debian 0.12.5+dfsg-3), Copyright (c)
> 2003-2008 Fabrice Bellard
>
> So with the qemu_arm_versatile_defconfig without any changes and the
> qemu-system-arm arguments exactly as I said you don't get any output at
> all?
>
>
Yes I don't get any output at all using Qemu from Lucid Lynx

qemu --version
QEMU PC emulator version 0.12.3 (qemu-kvm-0.12.3), Copyright (c) 2003-2008
Fabrice Bellard

BUT,

Using Qemu 0.14.0 compiled from source, everything works fine. So, it seems
Ubuntu qemu-kvm-0.12.3 issue.

Thanks and regards,
DWI

-- 
Good software can't be measured by `wc -l software.c`
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110427/9afb0838/attachment.html>
