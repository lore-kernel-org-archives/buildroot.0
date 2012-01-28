From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 28 Jan 2012 13:24:48 +0100
Subject: [Buildroot] Image created is not booting,
	waiting for infinite time
In-Reply-To: <BLU0-SMTP88C894F00679EB12CEC0A3D28F0@phx.gbl>
References: <BLU0-SMTP88C894F00679EB12CEC0A3D28F0@phx.gbl>
Message-ID: <CAHXCMMJctqz1xxSbJPA9+UJzLfUU6JwjzLLke9QVWmcSVi4hCQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> NOTE: As I was getting errors with u-boot, I omitted bootloaders (i 've not selected any of it).
> After compilation, I 've got zImage and rootfs.ext2 images.
> When I try to run the image
>
> $ qemu-system-arm -M versatilepb -m 128 -kernel ./output/images/zImage --nographic
> oss: Could not initialize DAC
> oss: Failed to open `/dev/dsp'
> oss: Reason: No such file or directory
> oss: Could not initialize DAC
> oss: Failed to open `/dev/dsp'
> oss: Reason: No such file or directory
> audio: Failed to create voice `lm4549.out'
> Uncompressing Linux... done, booting the kernel.
>
It looks like you did not provide any disk image[1] which can be used
by the kernel as a rootfs in the qemu command line.
Try to add '-hda ./output/images/rootfs.ext2' to the qemu command line.

[1] http://qemu.weilnetz.de/qemu-doc.html#sec_005finvocation


Regards,

Sam
