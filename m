From: Alex Bradbury <asb@asbradbury.org>
Date: Mon, 10 Sep 2012 14:59:30 +0100
Subject: [Buildroot] Uncompressed kernel image for ARM architecture
	(Raspberry)
In-Reply-To: <CAMPeO9yjDwyhqpA0nOwLcp25cponBsP_OC_J4T7+22Jj_OzoaA@mail.gmail.com>
References: <CAMPeO9yjDwyhqpA0nOwLcp25cponBsP_OC_J4T7+22Jj_OzoaA@mail.gmail.com>
Message-ID: <CA+wH296nnohHNWhtEBH1GG-bk4WWFNo4c6O21LVW_NQHreByQw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10 September 2012 14:01, David Sanchez Herrero
<david.krusty@gmail.com> wrote:
> Hi all,
>
> Is there a way to obtain uncompressed kernel image for ARM architecture?
>
> I'm trying to build a kernel and a root filesystem for Raspberry Pi from an
> internal buildroot toolchain with uClibc, but the only supported formats for
> the output kernel image are vmlinux, uImage and zImage.
>
> Downloading the kernel sources from the Raspberry Git repositories, and
> building them manually, an image file called "Image" is generated under
> ".arch/arm/boot/" folder, but this file doesn't exists if the building
> process of the same sources is made by Buildroot.
>
> Maybe using BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM?

This is a reasonable feature request, but for the case of the
Raspberry Pi although we used to have problems with booting compressed
kernels, they should now work fine and so you can happily use a zImage
for your kernel.img

Alex
