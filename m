From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 12 Aug 2013 23:35:48 +0200
Subject: [Buildroot] rebuild dtb?
In-Reply-To: <CALupW3Cjyr6D_kGPVMGoX=C_0YbdmfJT8t7DREFLvki6Y1odzQ@mail.gmail.com>
References: <CALupW3Cjyr6D_kGPVMGoX=C_0YbdmfJT8t7DREFLvki6Y1odzQ@mail.gmail.com>
Message-ID: <52095534.2060303@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/08/13 01:22, Steve deRosier wrote:
> Hi all,
>
> I was wondering if there was a make target similar to linux-rebuild that
> would force a rebuild of the dtb?
>
> We're using an override to allow a live source tree of the kernel for our
> current kernel work. I'm doing some work on the device trees and I'd
> really like a way to just rebuild the dtb and attach it to the kernel
> image.  Alternately I've been using linux-rebuild and can continue to do so.
>
> However, I've noticed an issue with linux-rebuild with re: to the device
> tree.  I have to make a modification to a kernel source (doesn't seem to
> matter) to get it to rebuild + cat the dtb with the kernel.  Here's what
> I see:
>
> I modify the dts only, then do a `make O=<my output dir> linux-rebuild`
> and it does rebuild the dtb, but when I load the kernel on my target, my
> dts changes don't take effect.  It doesn't look like it cat'd the dtb
> with the kernel and created the image properly.
>
> I modify the dts, and I make a trivial change to a kernel file (in this
> case arch/arm/mach-at91/pm.c), it rebuilds the file, the dtb, and
> successfully does the cat of the kernel + dtb to make a new image.  When
> I deploy it on my target and test, my dts changes are evident.
>
> Thoughts/help?

  Seems like an issue with the kernel build system, not buildroot. If the 
.dtb is not rebuilt in the output directory 
(output/build/linux-*/arch/arm/boot/dts), then it's a kbuild problem. If 
the .dtb is rebuilt but buildroot doesn't append it to the image, then 
it's a buildroot problem.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
